From: Heming Zhao <heming.zhao@suse.com>
Date: Mon, 28 Oct 2019 08:38:42 +0000
Message-ID: <d6151490-3567-ecdb-c62d-66931cb8ab29@suse.com>
References: <ae72bf0f-2776-0bdc-7e4a-dc229cac481a@suse.com>
	<20191023213101.gpkorwubuobm5w5y@reti>
	<178233ee-a3dc-2cda-c611-a73307a6050a@suse.com>
In-Reply-To: <178233ee-a3dc-2cda-c611-a73307a6050a@suse.com>
Content-Language: en-US
Content-ID: <2AD0ECB5D92445419056C2D6302E768F@namprd18.prod.outlook.com>
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
To: Joe Thornber <thornber@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: David Teigland <teigland@redhat.com>

Hello Joe & list,

This is v2 patch.

v1 patch overwrites some correct code in lib/label/label.c label_scan_pvscan_all().
```
     while ((dev = dev_iter_get(iter))) {
-       if (!(devl = dm_zalloc(sizeof(*devl)))) {
-           log_error("Failed to allocated device list.");
-           dev_iter_destroy(iter);
+       if (!(devl = dm_zalloc(sizeof(*devl))))
             return 0;
-       }
```

------ v2 patch ------
 From a4b53d6fd670c3046784b9cce3925ec5d187b138 Mon Sep 17 00:00:00 2001
From: Zhao Heming <heming.zhao@suse.com>
Date: Mon, 28 Oct 2019 16:31:01 +0800
Subject: [PATCH] bcache: fix mistakenly write data to another disk when writes
  error

When bcache write data error, the errored fd and its data is saved in
cache->errored, then this fd is closed. Later lvm will reuse this
closed fd to new opened devs, but the fd related data still in
cache->errored and flags with BF_DIRTY. It make the data may mistakenly
write to another disk.

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
  .gitignore                    |  2 +-
  lib/cache/lvmcache.c          |  2 +-
  lib/device/bcache.c           | 46 ++++++++++++++++++++++++++++++-------------
  lib/format_text/format-text.c | 11 ++++-------
  lib/label/label.c             | 22 ++++++++++++---------
  lib/metadata/mirror.c         |  1 -
  6 files changed, 51 insertions(+), 33 deletions(-)

diff --git a/.gitignore b/.gitignore
index f51bb67fca..57bb007005 100644
--- a/.gitignore
+++ b/.gitignore
@@ -28,7 +28,7 @@ make.tmpl
  /config.log
  /config.status
  /configure.scan
-/cscope.out
+/cscope.*
  /tags
  /tmp/
  
diff --git a/lib/cache/lvmcache.c b/lib/cache/lvmcache.c
index 9890325d2e..9c6e8032d6 100644
--- a/lib/cache/lvmcache.c
+++ b/lib/cache/lvmcache.c
@@ -1429,7 +1429,7 @@ int lvmcache_label_rescan_vg(struct cmd_context *cmd, const char *vgname, const
   * incorrectly placed PVs should have been moved from the orphan vginfo
   * onto their correct vginfo's, and the orphan vginfo should (in theory)
   * represent only real orphan PVs.  (Note: if lvmcache_label_scan is run
- * after vg_read udpates to lvmcache state, then the lvmcache will be
+ * after vg_read updates to lvmcache state, then the lvmcache will be
   * incorrect again, so do not run lvmcache_label_scan during the
   * processing phase.)
   *
diff --git a/lib/device/bcache.c b/lib/device/bcache.c
index d487ca2a77..1959b333ba 100644
--- a/lib/device/bcache.c
+++ b/lib/device/bcache.c
@@ -293,6 +293,10 @@ static bool _async_issue(struct io_engine *ioe, enum dir d, int fd,
  
  	if (r < 0) {
  		_cb_free(e->cbs, cb);
+		((struct block *)context)->error = r;
+		log_warn("io_submit <%c> off %llu bytes %llu return %d:%s",
+			(d == DIR_READ) ? 'R' : 'W', (long long unsigned)offset,
+			(long long unsigned)nbytes, r, strerror(-r));
  		return false;
  	}
  
@@ -869,7 +873,7 @@ static void _complete_io(void *context, int err)
  
  	if (b->error) {
  		dm_list_add(&cache->errored, &b->list);
-
+		log_warn("_complete_io fd: %d error: %d", b->fd, err);
  	} else {
  		_clear_flags(b, BF_DIRTY);
  		_link_block(b);
@@ -896,8 +900,7 @@ static void _issue_low_level(struct block *b, enum dir d)
  	dm_list_move(&cache->io_pending, &b->list);
  
  	if (!cache->engine->issue(cache->engine, d, b->fd, sb, se, b->data, b)) {
-		/* FIXME: if io_submit() set an errno, return that instead of EIO? */
-		_complete_io(b, -EIO);
+		_complete_io(b, b->error);
  		return;
  	}
  }
@@ -921,16 +924,20 @@ static bool _wait_io(struct bcache *cache)
   * High level IO handling
   *--------------------------------------------------------------*/
  
-static void _wait_all(struct bcache *cache)
+static bool _wait_all(struct bcache *cache)
  {
+	bool ret = true;
  	while (!dm_list_empty(&cache->io_pending))
-		_wait_io(cache);
+		ret = _wait_io(cache);
+	return ret;
  }
  
-static void _wait_specific(struct block *b)
+static bool _wait_specific(struct block *b)
  {
+	bool ret = true;
  	while (_test_flags(b, BF_IO_PENDING))
-		_wait_io(b->cache);
+		ret = _wait_io(b->cache);
+	return ret;
  }
  
  static unsigned _writeback(struct bcache *cache, unsigned count)
@@ -1125,7 +1132,7 @@ struct bcache *bcache_create(sector_t block_sectors, unsigned nr_cache_blocks,
  	unsigned max_io = engine->max_io(engine);
  	long pgsize = sysconf(_SC_PAGESIZE);
  
-	if ((pgsize = sysconf(_SC_PAGESIZE)) < 0) {
+	if (pgsize < 0) {
  		log_warn("bcache cannot read pagesize.");
  		return NULL;
  	}
@@ -1290,10 +1297,7 @@ void bcache_put(struct block *b)
  
  bool bcache_flush(struct bcache *cache)
  {
-	// Only dirty data is on the errored list, since bad read blocks get
-	// recycled straight away.  So we put these back on the dirty list, and
-	// try and rewrite everything.
-	dm_list_splice(&cache->dirty, &cache->errored);
+	bool write_ret = true, wait_ret = true;
  
  	while (!dm_list_empty(&cache->dirty)) {
  		struct block *b = dm_list_item(_list_pop(&cache->dirty), struct block);
@@ -1303,11 +1307,16 @@ bool bcache_flush(struct bcache *cache)
  		}
  
  		_issue_write(b);
+		if (b->error) write_ret = false;
  	}
  
-	_wait_all(cache);
+	wait_ret = _wait_all(cache);
  
-	return dm_list_empty(&cache->errored);
+	if (write_ret == false || wait_ret == false ||
+			!dm_list_empty(&cache->errored))
+		return false;
+	else
+		return true;
  }
  
  /*
@@ -1352,6 +1361,15 @@ bool bcache_invalidate_fd(struct bcache *cache, int fd)
  	struct block *b, *tmp;
  	bool r = true;
  
+	// clean cache->errored list
+	dm_list_iterate_items_safe (b, tmp, &cache->errored) {
+		b->flags = 0;
+		b->index = 0;
+		b->ref_count = 0;
+		b->error = 0;
+		_recycle_block(cache, b);
+	}
+
  	// Start writing back any dirty blocks on this fd.
  	dm_list_iterate_items_safe (b, tmp, &cache->dirty)
  		if (b->fd == fd)
diff --git a/lib/format_text/format-text.c b/lib/format_text/format-text.c
index 6eea07fe46..86e2caaad6 100644
--- a/lib/format_text/format-text.c
+++ b/lib/format_text/format-text.c
@@ -402,8 +402,7 @@ static int _raw_write_mda_header(const struct format_type *fmt,
  	dev_set_last_byte(dev, start_byte + MDA_HEADER_SIZE);
  
  	if (!dev_write_bytes(dev, start_byte, MDA_HEADER_SIZE, mdah)) {
-		dev_unset_last_byte(dev);
-		log_error("Failed to write mda header to %s fd %d", dev_name(dev), dev->bcache_fd);
+		log_error("Failed to write mda header to %s", dev_name(dev));
  		return 0;
  	}
  	dev_unset_last_byte(dev);
@@ -690,8 +689,7 @@ static int _vg_write_raw(struct format_instance *fid, struct volume_group *vg,
  	if (!dev_write_bytes(mdac->area.dev, mdac->area.start + mdac->rlocn.offset,
  		                (size_t) (mdac->rlocn.size - new_wrap),
  		                fidtc->raw_metadata_buf)) {
-		log_error("Failed to write metadata to %s fd %d", dev_name(mdac->area.dev), mdac->area.dev->bcache_fd);
-		dev_unset_last_byte(mdac->area.dev);
+		log_error("Failed to write metadata to %s", dev_name(mdac->area.dev));
  		goto out;
  	}
  
@@ -704,8 +702,7 @@ static int _vg_write_raw(struct format_instance *fid, struct volume_group *vg,
  		if (!dev_write_bytes(mdac->area.dev, mdac->area.start + MDA_HEADER_SIZE,
  			                (size_t) new_wrap,
  			                fidtc->raw_metadata_buf + mdac->rlocn.size - new_wrap)) {
-			log_error("Failed to write metadata wrap to %s fd %d", dev_name(mdac->area.dev), mdac->area.dev->bcache_fd);
-			dev_unset_last_byte(mdac->area.dev);
+			log_error("Failed to write metadata wrap to %s", dev_name(mdac->area.dev));
  			goto out;
  		}
  	}
@@ -723,7 +720,7 @@ static int _vg_write_raw(struct format_instance *fid, struct volume_group *vg,
  
  	r = 1;
  
-      out:
+out:
  	if (!r) {
  		dm_free(fidtc->raw_metadata_buf);
  		fidtc->raw_metadata_buf = NULL;
diff --git a/lib/label/label.c b/lib/label/label.c
index e4a106854f..904dd23395 100644
--- a/lib/label/label.c
+++ b/lib/label/label.c
@@ -216,7 +216,7 @@ int label_write(struct device *dev, struct label *label)
  
  	if (!dev_write_bytes(dev, offset, LABEL_SIZE, buf)) {
  		log_debug_devs("Failed to write label to %s", dev_name(dev));
-		r = 0;
+		return 0;
  	}
  
  	dev_unset_last_byte(dev);
@@ -621,7 +621,6 @@ static int _scan_list(struct cmd_context *cmd, struct dev_filter *f,
  	int submit_count;
  	int scan_failed;
  	int is_lvm_device;
-	int error;
  	int ret;
  
  	dm_list_init(&wait_devs);
@@ -668,12 +667,12 @@ static int _scan_list(struct cmd_context *cmd, struct dev_filter *f,
  
  	dm_list_iterate_items_safe(devl, devl2, &wait_devs) {
  		bb = NULL;
-		error = 0;
  		scan_failed = 0;
  		is_lvm_device = 0;
  
  		if (!bcache_get(scan_bcache, devl->dev->bcache_fd, 0, 0, &bb)) {
-			log_debug_devs("Scan failed to read %s error %d.", dev_name(devl->dev), error);
+			log_debug_devs("Scan failed to read %s fd: %d bb %p error %d.",
+					dev_name(devl->dev), devl->dev->bcache_fd, bb, bb ? bb->error : 0);
  			scan_failed = 1;
  			scan_read_errors++;
  			scan_failed_count++;
@@ -1358,7 +1357,8 @@ bool dev_write_bytes(struct device *dev, uint64_t start, size_t len, void *data)
  
  	if (!scan_bcache) {
  		/* Should not happen */
-		log_error("dev_write bcache not set up %s", dev_name(dev));
+		log_error("dev_write bcache not set up %s fd: %d", dev_name(dev),
+					dev->bcache_fd);
  		return false;
  	}
  
@@ -1383,15 +1383,19 @@ bool dev_write_bytes(struct device *dev, uint64_t start, size_t len, void *data)
  	}
  
  	if (!bcache_write_bytes(scan_bcache, dev->bcache_fd, start, len, data)) {
-		log_error("Error writing device %s at %llu length %u.",
-			  dev_name(dev), (unsigned long long)start, (uint32_t)len);
+		log_error("Error writing device %s at %llu length %u fd %d.",
+				dev_name(dev), (unsigned long long)start, (uint32_t)len,
+				dev->bcache_fd);
+		dev_unset_last_byte(dev);
  		label_scan_invalidate(dev);
  		return false;
  	}
  
  	if (!bcache_flush(scan_bcache)) {
-		log_error("Error writing device %s at %llu length %u.",
-			  dev_name(dev), (unsigned long long)start, (uint32_t)len);
+		log_error("Error writing device %s at %llu length %u fd %d.",
+				dev_name(dev), (unsigned long long)start, (uint32_t)len,
+				dev->bcache_fd);
+		dev_unset_last_byte(dev);
  		label_scan_invalidate(dev);
  		return false;
  	}
diff --git a/lib/metadata/mirror.c b/lib/metadata/mirror.c
index cd8ce1e9e1..9792df7eac 100644
--- a/lib/metadata/mirror.c
+++ b/lib/metadata/mirror.c
@@ -305,7 +305,6 @@ static int _write_log_header(struct cmd_context *cmd, struct logical_volume *lv)
  	dev_set_last_byte(dev, sizeof(log_header));
  
  	if (!dev_write_bytes(dev, UINT64_C(0), sizeof(log_header), &log_header)) {
-		dev_unset_last_byte(dev);
  		log_error("Failed to write log header to %s.", name);
  		return 0;
  	}
-- 
2.16.4

------------

Thanks.

On 10/24/19 11:13 AM, Heming Zhao wrote:
> Hello Joe,
> 
> Please see my comments in below. Thanks.
> (+joe, pls ignore previous mail. It is very wired: in last mail, Thunderbird reply all not include joe.)
> 
> On 10/24/19 5:31 AM, Joe Thornber wrote:
>> On Tue, Oct 22, 2019 at 09:47:32AM +0000, Heming Zhao wrote:
>>> Hello List & David,
>>>
>>> This patch is responsible for legacy mail:
>>> [linux-lvm] pvresize will cause a meta-data corruption with error message "Error writing device at 4096 length 512"
>>>
>>> I had send it to our customer, the code ran as expected. I think this code is enough to fix this issue.
>>>
>>> Thanks
>>> zhm
>>>
>>> ------(patch for branch stable-2.02) ----------
>>>    From d0d77d0bdad6136c792c9664444d73dd47b809cb Mon Sep 17 00:00:00 2001
>>> From: Zhao Heming <heming.zhao@suse.com>
>>> Date: Tue, 22 Oct 2019 17:22:17 +0800
>>> Subject: [PATCH] bcache may mistakenly write data to another disk when writes
>>>     error
>>>
>>> When bcache write data error, the errored fd and its data is saved in
>>> cache->errored, then this fd is closed. Later lvm will reuse this
>>> closed fd to new opened devs, but the fd related data still in
>>> cache->errored and flags with BF_DIRTY. It make the data may mistakenly
>>> write to another disk.
>>
>> I think real issue here is that the flush fails, and the error path for that
>> calls invalidate dev, which also fails, but that return value is not checked.
>> The fd is subsequently closed, and reopened with data still in the cache.
>>
> First fail is in bcache_flush, then bcache_invalidate_fd does nothing because the data
> in cache->errored, which not belongs to dirty & clean list. Then the data mistakenly
> move from cache->errored into cache->dirty by "bcache_get => _lookup_or_read_block"
> (because the data holds BF_DIRTY flag).
> 
>> So I think the correct fix is to have a variant of invalidate, that doesn't
>> bother retrying the IO, and just throws away the dirty data.  bcache_abort()?
>> This should be called when the flush() fails.
>>
> Currently lvm2 calls bcache_invalidate_fd when flush fails. So I add abort action
> in invalidate(). You can see the handle errored list codes in invalidate(). It's
> not necessary to add a new func bcache_abort().
> 
> So IMO both bcache_flush &  bcache_invalidate_fd have bug.
> - bcache_flush should do more error/fail check.
> - invalidate should do abort job.
> 
> BTW, yesterday I found my patch a mistake, it overwrites some correct code. And I
> only sent it to David with V2 patch.
> 
>> - Joe
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
