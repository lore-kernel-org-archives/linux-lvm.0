Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1O0Lwi15052
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2004 19:21:58 -0500
From: Miquel van Smoorenburg <miquels@cistron.nl>
Message-ID: <20040224002116.GA6965@drinkel.cistron.nl>
References: <20040223163106.GA22231@cistron.nl> <20040223203731.GA14731@reti>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20040223203731.GA14731@reti> (from thornber@redhat.com on Mon, Feb 23, 2004 at 21:37:31 +0100)
Subject: [linux-lvm] Re: dm, dm_table, request_queue
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 23 19:20:12 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Joe Thornber <thornber@redhat.com>
Cc: Miquel van Smoorenburg <miquels@cistron.nl>, linux-lvm@sistina.com

On Mon, 23 Feb 2004 21:37:31, Joe Thornber wrote:
> On Mon, Feb 23, 2004 at 05:31:08PM +0100, Miquel van Smoorenburg wrote:
> > And, in general, do you feel this is the correct solution ?
> 
> No, I'm going to do what Jens Axboe suggested and add a congestion
> function into the request_queue itself.

Okay, but that means that we need to add a request_queue pointer to
the struct backing_dev_info. My impression was that Jens didn't like
that either.

> dm will therefore provide its
> own congestion function that takes the targets into account.  I think
> this is the opposite of what you're suggesting, devices look downwards
> to their children devices rather than up to their parents.

That was what I suggested, and I also implemented it this night. It
works, but it is quite complicated - more so than the other way around.
It does keep the simplicity in struct backing_dev_info, that's readable
directly without calling indirect functions.

All in all, I think that the first approach is the simplest and
therefor the best.

So how does this look:

queue_congestion_fn.patch

--- linux-2.6.3.orig/include/linux/backing-dev.h	2004-02-04 04:43:38.000000000 +0100
+++ linux-2.6.3/include/linux/backing-dev.h	2004-02-24 00:56:46.000000000 +0100
@@ -24,6 +24,7 @@
 	unsigned long ra_pages;	/* max readahead in PAGE_CACHE_SIZE units */
 	unsigned long state;	/* Always use atomic bitops on this */
 	int memory_backed;	/* Cannot clean pages with writepage */
+	void *request_queue;	/* Request queue (if this device has one) */
 };
 
 extern struct backing_dev_info default_backing_dev_info;
@@ -32,14 +33,7 @@
 int writeback_in_progress(struct backing_dev_info *bdi);
 void writeback_release(struct backing_dev_info *bdi);
 
-static inline int bdi_read_congested(struct backing_dev_info *bdi)
-{
-	return test_bit(BDI_read_congested, &bdi->state);
-}
-
-static inline int bdi_write_congested(struct backing_dev_info *bdi)
-{
-	return test_bit(BDI_write_congested, &bdi->state);
-}
+extern int bdi_read_congested(struct backing_dev_info *bdi);
+extern int bdi_write_congested(struct backing_dev_info *bdi);
 
 #endif		/* _LINUX_BACKING_DEV_H */
--- linux-2.6.3.orig/include/linux/blkdev.h	2004-02-22 13:52:17.000000000 +0100
+++ linux-2.6.3/include/linux/blkdev.h	2004-02-24 00:59:29.000000000 +0100
@@ -244,6 +244,7 @@
 typedef int (make_request_fn) (request_queue_t *q, struct bio *bio);
 typedef int (prep_rq_fn) (request_queue_t *, struct request *);
 typedef void (unplug_fn) (void *q);
+typedef int (congested_fn) (request_queue_t *, int rw);
 
 struct bio_vec;
 typedef int (merge_bvec_fn) (request_queue_t *, struct bio *, struct bio_vec *);
@@ -290,6 +291,7 @@
 	unplug_fn		*unplug_fn;
 	merge_bvec_fn		*merge_bvec_fn;
 	activity_fn		*activity_fn;
+	congested_fn		*congested_fn;
 
 	/*
 	 * Auto-unplugging state
@@ -514,6 +516,7 @@
 extern void __blk_stop_queue(request_queue_t *q);
 extern void blk_run_queue(request_queue_t *q);
 extern void blk_queue_activity_fn(request_queue_t *, activity_fn *, void *);
+extern void blk_queue_congested_fn(request_queue_t *, congested_fn *);
 
 static inline request_queue_t *bdev_get_queue(struct block_device *bdev)
 {
--- linux-2.6.3.orig/drivers/block/ll_rw_blk.c	2004-02-04 04:43:10.000000000 +0100
+++ linux-2.6.3/drivers/block/ll_rw_blk.c	2004-02-24 01:14:12.000000000 +0100
@@ -147,6 +147,35 @@
 
 EXPORT_SYMBOL(blk_queue_activity_fn);
 
+void blk_queue_congested_fn(request_queue_t *q, congested_fn *fn)
+{
+	q->congested_fn = fn;
+}
+
+EXPORT_SYMBOL(blk_queue_congested_fn);
+
+int bdi_read_congested(struct backing_dev_info *bdi)
+{
+	request_queue_t *q = bdi->request_queue;
+
+	if (!q || !q->congested_fn)
+		return test_bit(BDI_read_congested, &bdi->state);
+	return q->congested_fn(q, READ);
+}
+
+EXPORT_SYMBOL(bdi_read_congested);
+
+int bdi_write_congested(struct backing_dev_info *bdi)
+{
+	request_queue_t *q = bdi->request_queue;
+
+	if (!q || !q->congested_fn)
+		return test_bit(BDI_write_congested, &bdi->state);
+	return q->congested_fn(q, WRITE);
+}
+
+EXPORT_SYMBOL(bdi_write_congested);
+
 /**
  * blk_queue_prep_rq - set a prepare_request function for queue
  * @q:		queue
@@ -1372,6 +1401,7 @@
 	memset(q, 0, sizeof(*q));
 	init_timer(&q->unplug_timer);
 	atomic_set(&q->refcnt, 1);
+	q->backing_dev_info.request_queue = q;
 	return q;
 }
 
--- linux-2.6.3.orig/drivers/md/dm.h	2004-02-04 04:43:45.000000000 +0100
+++ linux-2.6.3/drivers/md/dm.h	2004-02-24 00:23:58.000000000 +0100
@@ -115,6 +115,7 @@
 int dm_table_get_mode(struct dm_table *t);
 void dm_table_suspend_targets(struct dm_table *t);
 void dm_table_resume_targets(struct dm_table *t);
+int dm_table_any_congested(struct dm_table *t, int rw);
 
 /*-----------------------------------------------------------------
  * A registry of target types.
--- linux-2.6.3.orig/drivers/md/dm-table.c	2004-02-04 04:44:59.000000000 +0100
+++ linux-2.6.3/drivers/md/dm-table.c	2004-02-24 00:45:46.000000000 +0100
@@ -13,6 +13,7 @@
 #include <linux/ctype.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/backing-dev.h>
 #include <asm/atomic.h>
 
 #define MAX_DEPTH 16
@@ -857,6 +858,23 @@
 	}
 }
 
+int dm_table_any_congested(struct dm_table *t, int rw)
+{
+	struct list_head *d, *devices;
+	int r = 0;
+
+	devices = dm_table_get_devices(t);
+	for (d = devices->next; d != devices; d = d->next) {
+		struct dm_dev *dd = list_entry(d, struct dm_dev, list);
+		request_queue_t *q = bdev_get_queue(dd->bdev);
+		if (rw == WRITE)
+			r |= bdi_write_congested(&q->backing_dev_info);
+		else
+			r |= bdi_read_congested(&q->backing_dev_info);
+	}
+
+	return r;
+}
 
 EXPORT_SYMBOL(dm_get_device);
 EXPORT_SYMBOL(dm_put_device);
--- linux-2.6.3.orig/drivers/md/dm.c	2004-02-22 13:52:15.000000000 +0100
+++ linux-2.6.3/drivers/md/dm.c	2004-02-24 01:00:13.000000000 +0100
@@ -526,6 +526,18 @@
 	return 0;
 }
 
+static int dm_any_congested(struct request_queue *q, int rw)
+{
+	int r;
+	struct mapped_device *md = q->queuedata;
+
+	down_read(&md->lock);
+	r = dm_table_any_congested(md->map, rw);
+	up_read(&md->lock);
+
+	return r;
+}
+
 /*-----------------------------------------------------------------
  * A bitset is used to keep track of allocated minor numbers.
  *---------------------------------------------------------------*/
@@ -608,6 +620,7 @@
 	}
 
 	md->queue->queuedata = md;
+	blk_queue_congested_fn(md->queue, dm_any_congested);
 	blk_queue_make_request(md->queue, dm_request);
 
 	md->io_pool = mempool_create(MIN_IOS, mempool_alloc_slab,
