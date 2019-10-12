From: Heming Zhao <heming.zhao@suse.com>
Date: Sat, 12 Oct 2019 06:34:33 +0000
Message-ID: <4139435d-c8fc-71c3-6066-ebfc882e9511@suse.com>
References: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
	<6b055125-2e06-df7d-89fa-6c347404a9cd@suse.com>
	<20191011151405.GA31912@redhat.com>
In-Reply-To: <20191011151405.GA31912@redhat.com>
Content-Language: en-US
Content-ID: <1DA40C1FAC09FF438D6C3B2267A7D12B@namprd18.prod.outlook.com>
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

Hello David,

Thank you for your reply.

For these days analysis code, I found below codes can be enhanced.
(code changes base on git master branch.)

---------------
commit 3768196011fb01e4016510bfab9eef0c7bdc04f5 (HEAD -> master)
Author: Zhao Heming <heming.zhao@suse.com>
Date:   Sat Oct 12 14:28:06 2019 +0800

     fix typo in lib/cache/lvmcache.c
     enhance error handling in bcache
     fix constant var 'error' in _scan_list
     fix gcc warning in _lvconvert_split_cache_single
     
     Signed-off-by: Zhao Heming <heming.zhao@suse.com>

diff --git a/lib/cache/lvmcache.c b/lib/cache/lvmcache.c
index f6e792459b..499f9437cb 100644
--- a/lib/cache/lvmcache.c
+++ b/lib/cache/lvmcache.c
@@ -939,7 +939,7 @@ int lvmcache_label_rescan_vg_rw(struct cmd_context *cmd, const char *vgname, con
   * incorrectly placed PVs should have been moved from the orphan vginfo
   * onto their correct vginfo's, and the orphan vginfo should (in theory)
   * represent only real orphan PVs.  (Note: if lvmcache_label_scan is run
- * after vg_read udpates to lvmcache state, then the lvmcache will be
+ * after vg_read updates to lvmcache state, then the lvmcache will be
   * incorrect again, so do not run lvmcache_label_scan during the
   * processing phase.)
   *
diff --git a/lib/device/bcache.c b/lib/device/bcache.c
index d100419770..cfe01bac2f 100644
--- a/lib/device/bcache.c
+++ b/lib/device/bcache.c
@@ -292,6 +292,10 @@ static bool _async_issue(struct io_engine *ioe, enum dir d, int fd,
         } while (r == -EAGAIN);
  
         if (r < 0) {
+               ((struct block *)context)->error = r;
+               log_warn("io_submit <%c> off %llu bytes %llu return %d:%s",
+                               (d == DIR_READ) ? 'R' : 'W', (long long unsigned)offset,
+                               (long long unsigned)nbytes, r, strerror(-r));
                 _cb_free(e->cbs, cb);
                 return false;
         }
@@ -842,7 +846,7 @@ static void _complete_io(void *context, int err)
  
         if (b->error) {
                 dm_list_add(&cache->errored, &b->list);
-
+               log_warn("fd: %d error: %d", b->fd, err);
         } else {
                 _clear_flags(b, BF_DIRTY);
                 _link_block(b);
@@ -869,8 +873,7 @@ static void _issue_low_level(struct block *b, enum dir d)
         dm_list_move(&cache->io_pending, &b->list);
  
         if (!cache->engine->issue(cache->engine, d, b->fd, sb, se, b->data, b)) {
-               /* FIXME: if io_submit() set an errno, return that instead of EIO? */
-               _complete_io(b, -EIO);
+               _complete_io(b, b->error);
                 return;
         }
  }
diff --git a/lib/label/label.c b/lib/label/label.c
index dc4d32d151..60ad387219 100644
--- a/lib/label/label.c
+++ b/lib/label/label.c
@@ -647,7 +647,6 @@ static int _scan_list(struct cmd_context *cmd, struct dev_filter *f,
         int submit_count;
         int scan_failed;
         int is_lvm_device;
-       int error;
         int ret;
  
         dm_list_init(&wait_devs);
@@ -694,12 +693,12 @@ static int _scan_list(struct cmd_context *cmd, struct dev_filter *f,
  
         dm_list_iterate_items_safe(devl, devl2, &wait_devs) {
                 bb = NULL;
-               error = 0;
                 scan_failed = 0;
                 is_lvm_device = 0;
  
                 if (!bcache_get(scan_bcache, devl->dev->bcache_fd, 0, 0, &bb)) {
-                       log_debug_devs("Scan failed to read %s error %d.", dev_name(devl->dev), error);
+                       log_debug_devs("Scan failed to read %s error %d.",
+                                                       dev_name(devl->dev), bb ? bb->error : 0);
                         scan_failed = 1;
                         scan_read_errors++;
                         scan_failed_count++;
diff --git a/tools/lvconvert.c b/tools/lvconvert.c
index 60ab956614..4939e5ec7d 100644
--- a/tools/lvconvert.c
+++ b/tools/lvconvert.c
@@ -4676,7 +4676,7 @@ static int _lvconvert_split_cache_single(struct cmd_context *cmd,
         struct logical_volume *lv_main = NULL;
         struct logical_volume *lv_fast = NULL;
         struct lv_segment *seg;
-       int ret;
+       int ret = 0;
  
         if (lv_is_writecache(lv)) {
                 lv_main = lv;

---
Thanks
zhm

On 10/11/19 11:14 PM, David Teigland wrote:
> On Fri, Oct 11, 2019 at 08:11:29AM +0000, Heming Zhao wrote:
> 
>> I analyze this issue for some days. It looks a new bug.
> 
> Yes, thanks for the thorough analysis.
> 
>> In user machine, this write action was failed, the PV header data (first
>> 4K) save in bcache (cache->errored list), and then write (by
>> bcache_flush) to another disk (f748).
> 
> It looks like we need to get rid of cache->errored completely.
> 
>> If dev_write_bytes failed, the bcache never clean last_byte. and the fd
>> is closed at same time, but cache->errored still have errored fd's data.
>> later lvm open new disk, the fd may reuse the old-errored fd number,
>> error data will be written when later lvm call bcache_flush.
> 
> That's a bad bug.
> 
>> 2> duplicated pv header.
>>      as <1> description, fc68 metadata was overwritten to f748.
>>      this cause by lvm bug (I said in <1>).
>>
>> 3> device not correct
>>      I don't know why the disk scsi-360060e80072a670000302a670000fc68 has below wrong metadata:
>>
>> pre_pvr/scsi-360060e80072a670000302a670000fc68
>> (please also read the comments in below metadata area.)
>> ```
>>       vgpocdbcdb1_r2 {
>>           id = "PWd17E-xxx-oANHbq"
>>           seqno = 20
>>           format = "lvm2"
>>           status = ["RESIZEABLE", "READ", "WRITE"]
>>           flags = []
>>           extent_size = 65536
>>           max_lv = 0
>>           max_pv = 0
>>           metadata_copies = 0
>>           
>>           physical_volumes {
>>               
>>               pv0 {
>>                   id = "3KTOW5-xxxx-8g0Rf2"
>>                   device = "/dev/disk/by-id/scsi-360060e80072a660000302a660000f768"
>>                                                                       Wrong!! ^^^^^
>>                            I don't know why there is f768, please ask customer
>>                   status = ["ALLOCATABLE"]
>>                   flags = []
>>                   dev_size = 860160
>>                   pe_start = 2048
>>                   pe_count = 13
>>               }
>>           }
>> ```
>>      fc68 => f768  the 'c' (b1100) change to '7' (b0111).
>>      maybe disk bit overturn, maybe lvm has bug. I don't know & have no idea.
> 
> Is scsi-360060e80072a660000302a660000f768 the correct device for
> PVID 3KTOW5...?  If so, then it's consistent.  If not, then I suspect
> this is a result of duplicating the PVID on multiple devices above.
> 
> 
>> On 9/11/19 5:17 PM, Gang He wrote:
>>> Hello List,
>>>
>>> Our user encountered a meta-data corruption problem, when run pvresize command after upgrading to LVM2 v2.02.180 from v2.02.120.
>>>
>>> The details are as below,
>>> we have following environment:
>>> - Storage: HP XP7 (SAN) - LUN's are presented to ESX via RDM
>>> - VMWare ESXi 6.5
>>> - SLES 12 SP 4 Guest
>>>
>>> Resize happened this way (is our standard way since years) - however - this is our first resize after upgrading SLES 12 SP3 to SLES 12 SP4 - until this upgrade, we
>>> never had a problem like this:
>>> - split continous access on storage box, resize lun on XP7
>>> - recreate ca on XP7
>>> - scan on ESX
>>> - rescan-scsi-bus.sh -s on SLES VM
>>> - pvresize  ( at this step the error happened)
>>>
>>> huns1vdb01:~ # pvresize /dev/disk/by-id/scsi-360060e80072a660000302a6600003274
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
