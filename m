Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1OFwxi23445
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 10:58:59 -0500
From: Miquel van Smoorenburg <miquels@cistron.net>
Message-ID: <20040224155817.GE27488@traveler.cistron.net>
References: <20040219101915.GJ27190@suse.de> <20040219205907.GE32263@drinkel.cistron.nl> <40353E30.6000105@cyberone.com.au> <20040219235303.GI32263@drinkel.cistron.nl> <40355F03.9030207@cyberone.com.au> <20040219172656.77c887cf.akpm@osdl.org> <40356599.3080001@cyberone.com.au> <20040219183218.2b3c4706.akpm@osdl.org> <20040220144042.GC20917@traveler.cistron.net> <20040220145717.GX27190@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20040220145717.GX27190@suse.de> (from axboe@suse.de on Fri, Feb 20, 2004 at 15:57:17 +0100)
Subject: [linux-lvm] Queue congestion: passing down vs passing up [PATCH]
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
Date: Tue Feb 24 12:54:11 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@suse.de>
Cc: linux-lvm@sistina.com

[weeded out the enormous Cc: list]

On 2004.02.20 15:57, Jens Axboe wrote:
> On Fri, Feb 20 2004, Miquel van Smoorenburg wrote:
> > > > Even if it isn't happening
> > > > a lot, and something isn't bust it might be a good idea to
> > > > do this.
> > > 
> > > Seems OK from a quick check.  pdflush will block in get_request_wait()
> > > occasionally, but not at all often.  Perhaps we could move the
> > > write_congested test into the mpage_writepages() inner loop but it hardly
> > > seems worth the risk.
> > > 
> > > Maybe things are different on Miquel's clockwork controller.
> > 
> > I haven't tested it yet because of the "This patch isn't actually so good"
> > comment, but I found another explanation.
> > 
> > >  drivers/block/ll_rw_blk.c |    2 ++
> > >  fs/fs-writeback.c         |    2 ++
> > >  2 files changed, 4 insertions(+)
> > 
> > *Lightbulb on* .. I just read fs-writeback.c. As I said, this happens
> > with an LVM device. Could it be that because LVM and the actual device
> > have different struct request_queue's things go awry ?
> > 
> > In fs-writeback.c, your're looking at the LVM device (and its
> > request_queue, and its backing_dev_info). In__make_request, you're
> > looking at the SCSI device.
> 
> In principle, the lvm/md queues themselves will never be congested. But
> the underlying queues can be, of course.
> 
> Now this approach is _much_ better, imo. I don't particularly care very
> much for how you solved it, though, I'd much rather just see both
> setting and testing passed down (and kill the ->aux as well).

I just sent a patch to linux-lvm / Joe Thornber that does this. It adds a
void *request_queue to the struct backing_dev_info, and a congestion_fn
to the request_queue_t struct. bdi_{read,write}_congested got moved to
ll_rw_blk.c. dm.c sets the congestion_fn to an internal function that
checks the congestion of all the underlying block devices.

See https://www.redhat.com/archives/linux-lvm/2004-February/msg00203.html
for the actual patch.

So that's testing being passed down.

The setting you cannot pass down - you need to pass it "up". I implemented that
too, added a list of "parent queues" to the request_queue, and a function so
that for example dm can register its queue as "parent" of an underlying device.

It needs to be a list, since different partitions on one device can be members
of different meta-devices.

When the congestion functions in ll_rw_blk.c are called, if a queue is congested,
that info is also passed "up" to all of the "parent" queues. backing_dev_info
uses a counter instead of a bit to mark read/write as congested.
Perhaps it would be better to call a function (congestion_fn).

I think that we only need one of the two - either testing being passed down
or setting being passed up. The first one is the easiest. The second one
keeps the struct backing_dev_info clean (no request_queue pointer).

What would you prefer ?

For reference, a first cut at the "passing up queue congestion" is below.

Mike.

queue-parent.patch

--- linux-2.6.3.orig/include/linux/backing-dev.h	2004-02-04 04:43:38.000000000 +0100
+++ linux-2.6.3-queue_parent/include/linux/backing-dev.h	2004-02-23 16:17:53.000000000 +0100
@@ -24,6 +24,8 @@
 	unsigned long ra_pages;	/* max readahead in PAGE_CACHE_SIZE units */
 	unsigned long state;	/* Always use atomic bitops on this */
 	int memory_backed;	/* Cannot clean pages with writepage */
+	int read_congested;	/* Write queue or child write queue congested */
+	int write_congested;	/* Read queue or child read queue congested */
 };
 
 extern struct backing_dev_info default_backing_dev_info;
@@ -34,12 +36,12 @@
 
 static inline int bdi_read_congested(struct backing_dev_info *bdi)
 {
-	return test_bit(BDI_read_congested, &bdi->state);
+	return bdi->read_congested;
 }
 
 static inline int bdi_write_congested(struct backing_dev_info *bdi)
 {
-	return test_bit(BDI_write_congested, &bdi->state);
+	return bdi->write_congested;
 }
 
 #endif		/* _LINUX_BACKING_DEV_H */
--- linux-2.6.3.orig/include/linux/blkdev.h	2004-02-22 13:52:17.000000000 +0100
+++ linux-2.6.3-queue_parent/include/linux/blkdev.h	2004-02-24 15:02:49.000000000 +0100
@@ -267,6 +267,11 @@
 	atomic_t refcnt;		/* map can be shared */
 };
 
+struct rqueue_list {
+	struct list_head	rqueue_list_head;
+	struct request_queue	*rqueue;
+};
+
 struct request_queue
 {
 	/*
@@ -301,6 +306,8 @@
 
 	struct backing_dev_info	backing_dev_info;
 
+	struct list_head	parents;
+
 	/*
 	 * The queue owner gets to use this for whatever they like.
 	 * ll_rw_blk doesn't touch it.
@@ -514,6 +521,8 @@
 extern void __blk_stop_queue(request_queue_t *q);
 extern void blk_run_queue(request_queue_t *q);
 extern void blk_queue_activity_fn(request_queue_t *, activity_fn *, void *);
+extern int blk_queue_add_parent(request_queue_t *q, request_queue_t *parent);
+extern void blk_queue_remove_parent(request_queue_t *q, request_queue_t *parent);
 
 static inline request_queue_t *bdev_get_queue(struct block_device *bdev)
 {
--- linux-2.6.3.orig/drivers/block/ll_rw_blk.c	2004-02-04 04:43:10.000000000 +0100
+++ linux-2.6.3-queue_parent/drivers/block/ll_rw_blk.c	2004-02-24 16:50:20.000000000 +0100
@@ -93,9 +93,31 @@
 }
 
 /*
- * A queue has just exitted congestion.  Note this in the global counter of
- * congested queues, and wake up anyone who was waiting for requests to be
- * put back.
+ * Increment/decrement the congestion counter of this queue
+ * and recurse over the parent queues.
+ */
+static void set_queues_congested(request_queue_t *q, int rw, int how)
+{
+	struct rqueue_list *p;
+	struct list_head *l;
+
+	if (rw == WRITE)
+		q->backing_dev_info.write_congested += how;
+	else
+		q->backing_dev_info.read_congested += how;
+
+	__list_for_each(l, &q->parents) {
+		p = list_entry(l, struct rqueue_list, rqueue_list_head);
+		spin_lock(p->rqueue->queue_lock);
+		set_queues_congested(p->rqueue, rw, how);
+		spin_unlock(p->rqueue->queue_lock);
+	}
+}
+
+/*
+ * A queue has just exitted congestion. Flag that in the queue's
+ * VM-visible state flags, and wake up anyone who was waiting
+ * for requests to be put back.
  */
 static void clear_queue_congested(request_queue_t *q, int rw)
 {
@@ -103,23 +125,91 @@
 	wait_queue_head_t *wqh = &congestion_wqh[rw];
 
 	bit = (rw == WRITE) ? BDI_write_congested : BDI_read_congested;
-	clear_bit(bit, &q->backing_dev_info.state);
+	if (!test_and_clear_bit(bit, &q->backing_dev_info.state))
+		return;
+	set_queues_congested(q, rw, -1);
 	if (waitqueue_active(wqh))
 		wake_up(wqh);
 }
 
 /*
- * A queue has just entered congestion.  Flag that in the queue's VM-visible
- * state flags and increment the global gounter of congested queues.
+ * A queue has just entered congestion. Flag that in the queue's
+ * VM-visible state flags.
  */
 static void set_queue_congested(request_queue_t *q, int rw)
 {
 	enum bdi_state bit;
 
 	bit = (rw == WRITE) ? BDI_write_congested : BDI_read_congested;
-	set_bit(bit, &q->backing_dev_info.state);
+	if (test_and_set_bit(bit, &q->backing_dev_info.state))
+		return;
+	set_queues_congested(q, rw, 1);
+}
+
+/**
+ * blk_queue_add_parent - add a queue to the list of parents.
+ * @q:		this queue
+ * @parent:	parent queue
+ *
+ * Adds a queue to the list of parents. Locks both queues.
+ */
+int blk_queue_add_parent(request_queue_t *q, request_queue_t *parent)
+{
+	struct rqueue_list	*r;
+
+	r = kmalloc(sizeof(*r), GFP_KERNEL);
+	if (!r)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&r->rqueue_list_head);
+	r->rqueue = parent;
+
+	spin_lock(q->queue_lock);
+	spin_lock(parent->queue_lock);
+	list_add_tail(&r->rqueue_list_head, &q->parents);
+	parent->backing_dev_info.read_congested +=
+		q->backing_dev_info.read_congested;
+	parent->backing_dev_info.write_congested +=
+		q->backing_dev_info.write_congested;
+	spin_unlock(parent->queue_lock);
+	spin_unlock(q->queue_lock);
+
+	return 0;
 }
 
+EXPORT_SYMBOL(blk_queue_add_parent);
+
+/**
+ * blk_queue_remove_parent - remove a queue from the list of parents.
+ * @q:		this queue
+ * @parent:	parent queue
+ *
+ * Removes a queue from the list of parents. Locks both queues.
+ */
+void blk_queue_remove_parent(request_queue_t *q, request_queue_t *parent)
+{
+	struct list_head	*l;
+	struct rqueue_list	*r;
+
+	spin_lock(q->queue_lock);
+	__list_for_each(l, &q->parents) {
+		r = list_entry(l, struct rqueue_list, rqueue_list_head);
+		if (r->rqueue == parent) {
+			spin_lock(parent->queue_lock);
+			parent->backing_dev_info.read_congested -=
+				q->backing_dev_info.read_congested;
+			parent->backing_dev_info.write_congested -=
+				q->backing_dev_info.write_congested;
+			spin_unlock(parent->queue_lock);
+			list_del(l);
+			kfree(r);
+			break;
+		}
+	}
+	spin_unlock(q->queue_lock);
+}
+
+EXPORT_SYMBOL(blk_queue_remove_parent);
+
 /**
  * blk_get_backing_dev_info - get the address of a queue's backing_dev_info
  * @bdev:	device
@@ -1372,6 +1462,7 @@
 	memset(q, 0, sizeof(*q));
 	init_timer(&q->unplug_timer);
 	atomic_set(&q->refcnt, 1);
+	INIT_LIST_HEAD(&q->parents);
 	return q;
 }
 
@@ -2813,8 +2904,11 @@
 queue_requests_store(struct request_queue *q, const char *page, size_t count)
 {
 	struct request_list *rl = &q->rq;
+	int ret;
+
+	spin_lock(q->queue_lock);
 
-	int ret = queue_var_store(&q->nr_requests, page, count);
+	ret = queue_var_store(&q->nr_requests, page, count);
 	if (q->nr_requests < BLKDEV_MIN_RQ)
 		q->nr_requests = BLKDEV_MIN_RQ;
 
@@ -2841,6 +2935,9 @@
 		blk_clear_queue_full(q, WRITE);
 		wake_up(&rl->wait[WRITE]);
 	}
+
+	spin_unlock(q->queue_lock);
+
 	return ret;
 }
 
--- linux-2.6.3.orig/drivers/md/dm.h	2004-02-04 04:43:45.000000000 +0100
+++ linux-2.6.3-queue_parent/drivers/md/dm.h	2004-02-23 21:32:40.000000000 +0100
@@ -110,6 +110,8 @@
 struct dm_target *dm_table_get_target(struct dm_table *t, unsigned int index);
 struct dm_target *dm_table_find_target(struct dm_table *t, sector_t sector);
 void dm_table_set_restrictions(struct dm_table *t, struct request_queue *q);
+void dm_table_add_parent(struct dm_table *t, struct request_queue *q);
+void dm_table_remove_parent(struct dm_table *t, struct request_queue *q);
 unsigned int dm_table_get_num_targets(struct dm_table *t);
 struct list_head *dm_table_get_devices(struct dm_table *t);
 int dm_table_get_mode(struct dm_table *t);
--- linux-2.6.3.orig/drivers/md/dm-table.c	2004-02-04 04:44:59.000000000 +0100
+++ linux-2.6.3-queue_parent/drivers/md/dm-table.c	2004-02-24 15:17:06.000000000 +0100
@@ -818,6 +818,30 @@
 	q->seg_boundary_mask = t->limits.seg_boundary_mask;
 }
 
+void dm_table_add_parent(struct dm_table *t, struct request_queue *q)
+{
+	struct list_head *d, *devices;
+
+	devices = dm_table_get_devices(t);
+	for (d = devices->next; d != devices; d = d->next) {
+		struct dm_dev *dd = list_entry(d, struct dm_dev, list);
+		request_queue_t *bq = bdev_get_queue(dd->bdev);
+		blk_queue_add_parent(bq, q);
+	}
+}
+
+void dm_table_remove_parent(struct dm_table *t, struct request_queue *q)
+{
+	struct list_head *d, *devices;
+
+	devices = dm_table_get_devices(t);
+	for (d = devices->next; d != devices; d = d->next) {
+		struct dm_dev *dd = list_entry(d, struct dm_dev, list);
+		request_queue_t *bq = bdev_get_queue(dd->bdev);
+		blk_queue_remove_parent(bq, q);
+	}
+}
+
 unsigned int dm_table_get_num_targets(struct dm_table *t)
 {
 	return t->num_targets;
--- linux-2.6.3.orig/drivers/md/dm.c	2004-02-22 13:52:15.000000000 +0100
+++ linux-2.6.3-queue_parent/drivers/md/dm.c	2004-02-24 16:35:32.000000000 +0100
@@ -41,6 +41,7 @@
 struct mapped_device {
 	struct rw_semaphore lock;
 	atomic_t holders;
+	spinlock_t queue_lock;
 
 	unsigned long flags;
 
@@ -600,7 +601,7 @@
 	memset(md, 0, sizeof(*md));
 	init_rwsem(&md->lock);
 	atomic_set(&md->holders, 1);
-
+	md->queue_lock = SPIN_LOCK_UNLOCKED;
 	md->queue = blk_alloc_queue(GFP_KERNEL);
 	if (!md->queue) {
 		kfree(md);
@@ -608,6 +609,7 @@
 	}
 
 	md->queue->queuedata = md;
+	md->queue->queue_lock = &md->queue_lock;
 	blk_queue_make_request(md->queue, dm_request);
 
 	md->io_pool = mempool_create(MIN_IOS, mempool_alloc_slab,
@@ -695,6 +697,7 @@
 
 	dm_table_get(t);
 	dm_table_set_restrictions(t, q);
+	dm_table_add_parent(t, q);
 	return 0;
 }
 
@@ -704,6 +707,7 @@
 		return;
 
 	dm_table_event_callback(md->map, NULL, NULL);
+	dm_table_remove_parent(md->map, md->queue);
 	dm_table_put(md->map);
 	md->map = NULL;
 }
