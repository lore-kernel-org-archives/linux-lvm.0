From: Heming Zhao <heming.zhao@suse.com>
Date: Wed, 16 Oct 2019 08:50:54 +0000
Message-ID: <6346d4bf-a063-4a6b-f2b7-9b62a25a4267@suse.com>
References: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
	<6b055125-2e06-df7d-89fa-6c347404a9cd@suse.com>
	<20191011151405.GA31912@redhat.com>
	<4139435d-c8fc-71c3-6066-ebfc882e9511@suse.com>
	<d8f2f0af-0b54-76ca-6a44-adabc73f1a08@suse.com>
	<bf4a79f3-3604-9981-b6f2-5ad702c8d09a@suse.com>
In-Reply-To: <bf4a79f3-3604-9981-b6f2-5ad702c8d09a@suse.com>
Content-Language: en-US
Content-ID: <843FD60C26639E4F9D7E23D6FCACEFCC@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvresize will cause a meta-data corruption with
 error message "Error writing device at 4096 length 512"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: David Teigland <teigland@redhat.com>
Cc: Gang He <GHe@suse.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello list,

the reason: customer "pvresize -vvvvvv -dddddd /dev/disk/by-id/scsi-360060e80072a660000302a660000f111", the disk scsi-360060e80072a660000302a660000f747 overwrite was found.

from our user's log. the fc68 disk was opened as fd 18, it related buffer (fc68's PV header) was written 8 times:
```
/dev/disk/by-id/scsi-360060e80072a670000302a670000fc68 <== first error
/dev/disk/by-id/scsi-360060e80072a670000302a670000fc67 <== 2nd time write fc68's pv header, but failed
/dev/disk/by-id/scsi-360060e80072a670000302a670000fc66 <== 3th time write failed.
/dev/disk/by-id/scsi-360060e80072a660000302a660000fa08-part1
/dev/disk/by-id/scsi-360060e80072a660000302a660000f74c
/dev/disk/by-id/scsi-360060e80072a660000302a660000f74a
/dev/disk/by-id/scsi-360060e80072a660000302a660000f749
/dev/disk/by-id/scsi-360060e80072a660000302a660000f747 <=== last error, but write fc68's data successfully.
```

when the last error on f747, the write to fd 18 is successfully:
```
#label/label.c:629           Scanning 1 devices for VG info
#label/label.c:665           Scanning submitted 1 reads
#device/bcache.c:1063    zhm _lookup_or_read_block 1063 flags: 0x0 b: 0x555e778b26a0
#label/label.c:674           Scan failed to read /dev/disk/by-id/scsi-360060e80072a660000302a660000f747 error 0.
#device/bcache.c:1363    zhm bcache_invalidate_fd 1363 cache->dirty fd: 18
#device/bcache.c:1372    zhm bcache_invalidate_fd 1372 cache->clean fd: 18
#label/label.c:764           Scanned devices: read errors 1 process errors 0 failed 1
```
At above, the line '#device/bcache.c:1363' will trigger write action & successfully.

And another important thing is the first fd 18's data write error, the data in cache->errored, it was not saved in dirty list & clean list. So first fc68 write error (by calling bcache_invalidate_fd) won't clean this data.

Then happened below 6 read error. (the error of fc67, fc66, fa08-par1, f74c, f74a, f749 are same):
```
#toollib.c:4377          Processing PVs in VG vgautdbtest02_db03
#locking/locking.c:331           Dropping cache for vgautdbtest02_db03.
#misc/lvm-flock.c:202         Locking /run/lvm/lock/V_vgautdbtest02_db03 WB
#misc/lvm-flock.c:100           _do_flock /run/lvm/lock/V_vgautdbtest02_db03:aux WB
#misc/lvm-flock.c:100           _do_flock /run/lvm/lock/V_vgautdbtest02_db03 WB
#misc/lvm-flock.c:47            _undo_flock /run/lvm/lock/V_vgautdbtest02_db03:aux
#metadata/metadata.c:3778        Reading VG vgautdbtest02_db03 fgItp1-1M8x-6qVT-84ND-Fpwa-mFYf-or2sow
#metadata/metadata.c:3874          Rescanning devices for vgautdbtest02_db03
#cache/lvmcache.c:751           lvmcache has no info for vgname "vgautdbtest02_db03" with VGID fgItp11M8x6qVT84NDFpwamFYfor2sow.
#device/bcache.c:1372    zhm bcache_invalidate_fd 1372 cache->clean fd: 49
#label/label.c:629           Scanning 1 devices for VG info
#label/label.c:665           Scanning submitted 1 reads
#device/bcache.c:1063    zhm _lookup_or_read_block 1063 flags: 0x0 b: 0x555e778b26a0
#label/label.c:674           Scan failed to read /dev/disk/by-id/scsi-360060e80072a660000302a660000f749 error 0.
#device/bcache.c:1363    zhm bcache_invalidate_fd 1363 cache->dirty fd: 18
#device/bcache.c:337     zhm _async_wait 337 ev->res: 18446744073709551495 errno: 0
#device/bcache.c:875     zhm _complete_io 875 fd: 18 error: -121
#label/label.c:764           Scanned devices: read errors 1 process errors 0 failed 1
```

why disk f749's fd is 49, but finally disk f749's fd is 18?

with following steps, f749 got fd 18 which was fc68's closed fd before.
```
lvmcache_label_rescan_vg
  label_scan_devs_rw
  {
      //clean already exist bcache & closed current fd
      dm_list_iterate_items(devl, devs) {
         if (_in_bcache(devl->dev)) {
             bcache_invalidate_fd(scan_bcache, devl->dev->bcache_fd); <== invalidate current bcache
             _scan_dev_close(devl->dev); <=== closed current fd 49
         }

      _scan_list(cmd, f, devs, NULL); <== will open new fd (reuse just closed errored fd 18).
  }
```
in _scan_list, it will open disk with last failed fd 18. then use this fd 18 to search hash table. then got the last errored bcache data (with PV metadata).

With following flow, the cache->errored move into cache->dirty list.
```
bcache_get
  _lookup_or_read_block
  {
    b = _hash_lookup() <=== fetch just closed errored fd 18.
    if (b) {
      ... ...
      _unlink_block(b); <=== unlink from cache->errored
      ... ...
    }
    if (b) {
      _link_block(b); <== legacy fd 18 has FG_DIRTY, it will trigger move to cache->dirty.
    }
  }
```

with fd 18's data in cache->dirty, when calling bcache_invalidate_fd, it will trigger _issue_write() to write out this PV header to another disk. if happen write error (like this log showed 7 times error), pv header data first saved in cache->errored, then move to cache->dirty under calling bcache_get. this error won't disappear until the write successfully.

the line "#device/bcache.c:1063" show, the bcache always fetch/reuse last errored fd 18 (fc68 first opened).
fc67, fc66, fa08-par1, f74c, f74a, f749 try to write disk but failed, on the 8th write (by disk f747) the write successfully. so the lvm metadata of f747 disk had been changed.


and for the write error -121, I need time to dig out. kernel message reported below info when lvm wrote error:
```
kernel: [ 714.139133] print_req_error: critical target error, dev sddz, sector 2048
kernel: [ 714.139144] print_req_error: critical target error, dev dm-54, sector 2048
```

at last, please ignore my previous patches. they are not complete. the function bcache_invalidate_fd should be fix.
I had send my lastest fix to our customer, and wait for feedback.

Thanks,
zhm

On 10/14/19 11:13 AM, Heming Zhao wrote:
> For the issue in bcache_flush, it's related with cache->errored.
> 
> I give my fix. I believe there should have better solution than my.
> 
> Solution:
> To keep cache->errored, but this list only use to save error data,
> and the error data never resend.
> So bcache_flush check the cache->errored, when the errored list is not empty,
> bcache_flush return false, it will trigger caller/upper to do the clean jobs.
> 
> ```
> commit 17e959c0ba58edc67b6caa7669444ecffa40a16f (HEAD -> master)
> Author: Zhao Heming <heming.zhao@suse.com>
> Date:   Mon Oct 14 10:57:54 2019 +0800
> 
>       The fd in cache->errored may already be closed before calling bcache_flush,
>       so bcache_flush shouldn't rewrite data in cache->errored. Currently
>       solution is return error to caller when cache->errored is not empty, and
>       caller should do all the clean jobs.
>       
>       Signed-off-by: Zhao Heming <heming.zhao@suse.com>
> 
> diff --git a/lib/device/bcache.c b/lib/device/bcache.c
> index cfe01bac2f..2eb3f0ee34 100644
> --- a/lib/device/bcache.c
> +++ b/lib/device/bcache.c
> @@ -897,16 +897,20 @@ static bool _wait_io(struct bcache *cache)
>     * High level IO handling
>     *--------------------------------------------------------------*/
>    
> -static void _wait_all(struct bcache *cache)
> +static bool _wait_all(struct bcache *cache)
>    {
> +       bool ret = true;
>           while (!dm_list_empty(&cache->io_pending))
> -               _wait_io(cache);
> +               ret = _wait_io(cache);
> +       return ret;
>    }
>    
> -static void _wait_specific(struct block *b)
> +static bool _wait_specific(struct block *b)
>    {
> +       bool ret = true;
>           while (_test_flags(b, BF_IO_PENDING))
> -               _wait_io(b->cache);
> +               ret = _wait_io(b->cache);
> +       return ret;
>    }
>    
>    static unsigned _writeback(struct bcache *cache, unsigned count)
> @@ -1262,10 +1266,7 @@ void bcache_put(struct block *b)
>    
>    bool bcache_flush(struct bcache *cache)
>    {
> -       // Only dirty data is on the errored list, since bad read blocks get
> -       // recycled straight away.  So we put these back on the dirty list, and
> -       // try and rewrite everything.
> -       dm_list_splice(&cache->dirty, &cache->errored);
> +       bool ret = true;
>    
>           while (!dm_list_empty(&cache->dirty)) {
>                   struct block *b = dm_list_item(_list_pop(&cache->dirty), struct block);
> @@ -1275,11 +1276,18 @@ bool bcache_flush(struct bcache *cache)
>                   }
>    
>                   _issue_write(b);
> +               if (b->error) ret = false;
>           }
>    
> -       _wait_all(cache);
> +       ret = _wait_all(cache);
>    
> -       return dm_list_empty(&cache->errored);
> +       // merge the errored list to dirty, return false to trigger caller to
> +       // clean them.
> +       if (!dm_list_empty(&cache->errored)) {
> +               dm_list_splice(&cache->dirty, &cache->errored);
> +               ret = false;
> +       }
> +       return ret;
>    }
>    
>    //----------------------------------------------------------------
> ```
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
