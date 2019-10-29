From: Heming Zhao <heming.zhao@suse.com>
Date: Tue, 29 Oct 2019 05:07:30 +0000
Message-ID: <324885c4-a211-fb11-8315-979935391820@suse.com>
References: <ae72bf0f-2776-0bdc-7e4a-dc229cac481a@suse.com>
	<20191023213101.gpkorwubuobm5w5y@reti>
	<a3738d0e-cfba-af45-afd2-a08ca1819c83@suse.com>
	<20191028154313.ibspu6qwqqsq54cc@reti>
In-Reply-To: <20191028154313.ibspu6qwqqsq54cc@reti>
Content-Language: en-US
Content-ID: <3E762BD25E35E143BC2D16D2727ECB1B@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] resend patch - bcache may mistakenly write data to
 another disk when writes error
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Joe
	Thornber <thornber@redhat.com>
Cc: David Teigland <teigland@redhat.com>

Hello Joe,

Please check my comments for your commit 2938b4dcc & 6b0d969b

1. b->ref_count is non-zero, and write error happens, the data never release?
    (no place to call _unlink_block & _free_block)

2. when dev_write_bytes failed, call dev_unset_last_byte with "fd=-1" is wrong.

3. I still think below error handling should be added.
    Below base on stable-2.02, but the core idea is same, should access the return value of io_submit & io_getevents.
    
```
static bool _async_issue(struct io_engine *ioe, enum dir d, int fd,
    ... ...
     if (r < 0) {
         _cb_free(e->cbs, cb);
+       ((struct block *)context)->error = r; <== assign errno & print warning
+       log_warn("io_submit <%c> off %llu bytes %llu return %d:%s",
+           (d == DIR_READ) ? 'R' : 'W', (long long unsigned)offset,
+           (long long unsigned)nbytes, r, strerror(-r));
         return false;
     }

static void _issue_low_level(struct block *b, enum dir d)
    ... ...
     dm_list_move(&cache->io_pending, &b->list);
  
     if (!cache->engine->issue(cache->engine, d, b->fd, sb, se, b->data, b)) {
-       /* FIXME: if io_submit() set an errno, return that instead of EIO? */
-       _complete_io(b, -EIO);
+       _complete_io(b, b->error); <=== this pass the right errno to caller.
         return;
     }
  }
  
-static void _wait_all(struct bcache *cache)
+static bool _wait_all(struct bcache *cache) <=== change to return error
  {
+   bool ret = true;
     while (!dm_list_empty(&cache->io_pending))
-       _wait_io(cache);
+       ret = _wait_io(cache);
+   return ret;
  }
  
-static void _wait_specific(struct block *b)
+static bool _wait_specific(struct block *b) <=== change to return error
  {
+   bool ret = true;
     while (_test_flags(b, BF_IO_PENDING))
-       _wait_io(b->cache);
+       ret = _wait_io(b->cache);
+   return ret;
  }

  bool bcache_flush(struct bcache *cache) <==== add more error handling
  {
+   bool write_ret = true, wait_ret = true;
  
     ... ...
         _issue_write(b);
+       if (b->error) write_ret = false;
     }
  
-   _wait_all(cache);
+   wait_ret = _wait_all(cache);
  
-   return dm_list_empty(&cache->errored);
+   if (write_ret == false || wait_ret == false ||
+           !dm_list_empty(&cache->errored))
+       return false;
+   else
+       return true;
  }
```

Thanks,
zhm

On 10/28/19 11:43 PM, Joe Thornber wrote:
> On Thu, Oct 24, 2019 at 03:06:18AM +0000, Heming Zhao wrote:
>> First fail is in bcache_flush, then bcache_invalidate_fd does nothing because the data
>> in cache->errored, which not belongs to dirty & clean list. Then the data mistakenly
>> move from cache->errored into cache->dirty by "bcache_get => _lookup_or_read_block"
>> (because the data holds BF_DIRTY flag).
> 
> I just pushed a couple of patches that will hopefully fix this issue for you:
> 
> commit 6b0d969b2a85ba69046afa26af4d7bcddddbccd5 (HEAD -> master, origin/master, origin/HEAD, 2019-10-11-bcache-purge)
> Author: Joe Thornber <ejt@redhat.com>
> Date:   Mon Oct 28 15:01:47 2019 +0000
> 
>      [label] Use bcache_abort_fd() to ensure blocks are no longer in the cache.
>      
>      The return value from bcache_invalidate_fd() was not being checked.
>      
>      So I've introduced a little function, _invalidate_fd() that always
>      calls bcache_abort_fd() if the write fails.
> 
> commit 2938b4dcca0a1df661758abfab7f402ea7aab018
> Author: Joe Thornber <ejt@redhat.com>
> Date:   Mon Oct 28 14:29:47 2019 +0000
> 
>      [bcache] add bcache_abort()
>      
>      This gives us a way to cope with write failures.
> 
> 
> 
> 
> Also there are big changes to bcache coming, that remove file descriptors from
> the interface completely.  See the branch 2019-09-05-add-io-manager for more info
> (bcache has been renamed io_manager).
> 
> - Joe
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
