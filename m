Subject: Re: [linux-lvm] LVM2 beta2
Message-Id: <20020424183000.GA1681@fib011235813.fsnet.co.uk>
References: <20020424153354.GA627@fib011235813.fsnet.co.uk>
    <3CC6DAFE.5070007@st-peter.stw.uni-erlangen.de>
    <20020424171730.GA2145@chunk.voxel.net>
    <20020424172338.GA1351@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <20020424172338.GA1351@fib011235813.fsnet.co.uk>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Apr 24 13:29:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 24, 2002 at 06:23:38PM +0100, Joe Thornber wrote:
> On Wed, Apr 24, 2002 at 01:17:30PM -0400, Andres Salomon wrote:
> > I think things like stability and features are more important atm for
> > LVM2, than supporting linux 2.5 is..
> 
> Yes, I agree, 2.5 is definitely not my priority.  Yet the annoying
> thing is I did port the last beta to 2.5, but seem to have mislaid the
> patch since then :(  I'll keep looking.

Found it.  This is for beta1 of course and 2.5.[4-6]ish, but as you
can see the changes are pretty trivial ATM.

- Joe

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="01-dm-2.5-port"

--- /usr/src/linux/include/linux/device-mapper.h	Tue Jan 29 11:54:41 2002
+++ linux/include/linux/device-mapper.h	Wed Jan 30 14:18:32 2002
@@ -24,8 +24,8 @@
 typedef int (*dm_ctr_fn)(struct dm_table *t, offset_t b, offset_t l,
 			 int argc, char **argv, void **context);
 typedef void (*dm_dtr_fn)(struct dm_table *t, void *c);
-typedef int (*dm_map_fn)(struct buffer_head *bh, int rw, void *context);
-typedef int (*dm_err_fn)(struct buffer_head *bh, int rw, void *context);
+typedef int (*dm_map_fn)(struct bio *bio, void *context);
+typedef int (*dm_err_fn)(struct bio *bio, void *context);
 
 
 void dm_error(const char *message);
--- /usr/src/linux/drivers/md/dm.c	Tue Jan 29 11:54:41 2002
+++ linux/drivers/md/dm.c	Wed Jan 30 15:31:08 2002
@@ -25,10 +25,9 @@
 struct io_hook {
 	struct mapped_device *md;
 	struct target *target;
-	int rw;
 
-	void (*end_io)(struct buffer_head *bh, int uptodate);
-	void *context;
+	int (*end_io)(struct bio *bio, int uptodate);
+	void *context;		/* the original bi_private field */
 };
 
 static kmem_cache_t *_io_hook_cache;
@@ -50,7 +49,7 @@
 
 static devfs_handle_t _dev_dir;
 
-static int request(request_queue_t *q, int rw, struct buffer_head *bh);
+static int request(request_queue_t *q, struct bio *bio);
 static int dm_user_bmap(struct inode *inode, struct lv_bmap *lvb);
 
 /*
@@ -199,8 +198,12 @@
 	read_ahead[_major] = DEFAULT_READ_AHEAD;
 	blk_size[_major] = _block_size;
 	blksize_size[_major] = _blksize_size;
-	hardsect_size[_major] = _hardsect_size;
 
+	/*
+	 * FIXME: when the block splitting code goes into dm we
+	 * can loose this very low limit.
+	 */
+	blk_queue_max_sectors(BLK_DEFAULT_QUEUE(_major), 8);
 	blk_queue_make_request(BLK_DEFAULT_QUEUE(_major), request);
 
 	_dev_dir = devfs_mk_dir(0, DM_DIR, NULL);
@@ -218,10 +221,7 @@
 	if (devfs_unregister_blkdev(_major, _name) < 0)
 		DMERR("devfs_unregister_blkdev failed");
 
-	read_ahead[_major] = 0;
-	blk_size[_major] = NULL;
-	blksize_size[_major] = NULL;
-	hardsect_size[_major] = NULL;
+	blk_clear(_major);
 	_major = 0;
 
 	DMINFO("%s cleaned up", _version);
@@ -279,7 +279,7 @@
  */
 static int dm_blk_open(struct inode *inode, struct file *file)
 {
-	int minor = MINOR(inode->i_rdev);
+	int minor = minor(inode->i_rdev);
 	struct mapped_device *md;
 
 	md = dm_get_w(minor);
@@ -294,7 +294,7 @@
 
 static int dm_blk_close(struct inode *inode, struct file *file)
 {
-	int minor = MINOR(inode->i_rdev);
+	int minor = minor(inode->i_rdev);
 	struct mapped_device *md;
 
 	md = dm_get_w(minor);
@@ -317,7 +317,7 @@
 static int dm_blk_ioctl(struct inode *inode, struct file *file,
 			uint command, unsigned long a)
 {
-	int minor = MINOR(inode->i_rdev);
+	int minor = minor(inode->i_rdev);
 	long size;
 
 	if (minor >= MAX_DEVICES)
@@ -364,6 +364,9 @@
 	return 0;
 }
 
+/*
+ * FIXME: I think we need to get these from a mempool.
+ */
 static inline struct io_hook *alloc_io_hook(void)
 {
 	return kmem_cache_alloc(_io_hook_cache, GFP_NOIO);
@@ -392,12 +395,12 @@
 /*
  * Call a target's optional error function if an I/O failed.
  */
-static inline int call_err_fn(struct io_hook *ih, struct buffer_head *bh)
+static inline int call_err_fn(struct io_hook *ih, struct bio *bio)
 {
 	dm_err_fn err = ih->target->type->err;
 
 	if (err)
-		return err(bh, ih->rw, ih->target->private);
+		return err(bio, ih->target->private);
 
 	return 0;
 }
@@ -406,32 +409,33 @@
  * bh->b_end_io routine that decrements the pending count
  * and then calls the original bh->b_end_io fn.
  */
-static void dec_pending(struct buffer_head *bh, int uptodate)
+static int dec_pending(struct bio *bio, int uptodate)
 {
-	struct io_hook *ih = bh->b_private;
+	struct io_hook *ih = bio->bi_private;
 
-	if (!uptodate && call_err_fn(ih, bh))
-		return;
+	if (!uptodate && call_err_fn(ih, bio))
+		return 0;
 
 	if (atomic_dec_and_test(&ih->md->pending))
 		/* nudge anyone waiting on suspend queue */
 		wake_up(&ih->md->wait);
 
-	bh->b_end_io = ih->end_io;
-	bh->b_private = ih->context;
+	bio->bi_end_io = ih->end_io;
+	bio->bi_private = ih->context;
 	free_io_hook(ih);
 
-	bh->b_end_io(bh, uptodate);
+	bio->bi_end_io(bio, uptodate);
+	return 0;
 }
 
 /*
  * Add the bh to the list of deferred io.
  */
-static int queue_io(struct buffer_head *bh, int rw)
+static int queue_io(struct bio *bio)
 {
 	struct deferred_io *di = alloc_deferred();
 	struct mapped_device *md;
-	int minor = MINOR(bh->b_rdev);
+	int minor = minor(bio->bi_dev);
 
 	if (!di)
 		return -ENOMEM;
@@ -448,8 +452,7 @@
 		return 1;
 	}
 
-	di->bh = bh;
-	di->rw = rw;
+	di->bio = bio;
 	di->next = md->deferred;
 	md->deferred = di;
 
@@ -461,8 +464,7 @@
 /*
  * Do the bh mapping for a given leaf
  */
-static inline int __map_buffer(struct mapped_device *md,
-			       struct buffer_head *bh, int rw, int leaf)
+static inline int __map_buffer(struct mapped_device *md, struct bio *bio, int leaf)
 {
 	int r;
 	dm_map_fn fn;
@@ -474,23 +476,21 @@
 	context = ti->private;
 
 	ih = alloc_io_hook();
-
 	if (!ih)
 		return -1;
 
 	ih->md = md;
-	ih->rw = rw;
 	ih->target = ti;
-	ih->end_io = bh->b_end_io;
-	ih->context = bh->b_private;
+	ih->end_io = bio->bi_end_io;
+	ih->context = bio->bi_private;
 
-	r = fn(bh, rw, context);
+	r = fn(bio, context);
 
 	if (r > 0) {
 		/* hook the end io request fn */
 		atomic_inc(&md->pending);
-		bh->b_end_io = dec_pending;
-		bh->b_private = ih;
+		bio->bi_end_io = dec_pending;
+		bio->bi_private = ih;
 
 	} else if (r == 0)
 		/* we don't need to hook */
@@ -507,7 +507,7 @@
 /*
  * Search the btree for the correct target.
  */
-static inline int __find_node(struct dm_table *t, struct buffer_head *bh)
+static inline int __find_node(struct dm_table *t, struct bio *bio)
 {
 	int l, n = 0, k = 0;
 	offset_t *node;
@@ -517,21 +517,21 @@
 		node = get_node(t, l, n);
 
 		for (k = 0; k < KEYS_PER_NODE; k++)
-			if (node[k] >= bh->b_rsector)
+			if (node[k] >= bio->bi_sector)
 				break;
 	}
 
 	return (KEYS_PER_NODE * n) + k;
 }
 
-static int request(request_queue_t *q, int rw, struct buffer_head *bh)
+static int request(request_queue_t *q, struct bio *bio)
 {
 	struct mapped_device *md;
-	int r, minor = MINOR(bh->b_rdev);
+	int r, minor = minor(bio->bi_dev);
 
 	md = dm_get_r(minor);
 	if (!md) {
-		buffer_IO_error(bh);
+		bio_io_error(bio);
 		return 0;
 	}
 
@@ -542,10 +542,10 @@
 	while (md->suspended) {
 		dm_put_r(minor);
 
-		if (rw == READA)
+		if (bio_rw(bio) == READA)
 			goto bad_no_lock;
 
-		r = queue_io(bh, rw);
+		r = queue_io(bio);
 
 		if (r < 0)
 			goto bad_no_lock;
@@ -559,22 +559,22 @@
 		 */
 		md = dm_get_r(minor);
 		if (!md) {
-			buffer_IO_error(bh);
+			bio_io_error(bio);
 			return 0;
 		}
 	}
 
-	if (__map_buffer(md, bh, rw, __find_node(md->map, bh)) < 0)
+	if (__map_buffer(md, bio, __find_node(md->map, bio)) < 0)
 		goto bad;
 
 	dm_put_r(minor);
 	return 1;
 
-      bad:
+ bad:
 	dm_put_r(minor);
 
-      bad_no_lock:
-	buffer_IO_error(bh);
+ bad_no_lock:
+	bio_io_error(bio);
 	return 0;
 }
 
@@ -594,8 +594,8 @@
 		   kdev_t * r_dev, unsigned long *r_block)
 {
 	struct mapped_device *md;
-	struct buffer_head bh;
-	int minor = MINOR(dev), r;
+	struct bio bio;
+	int minor = minor(dev), r;
 	struct target *t;
 
 	md = dm_get_r(minor);
@@ -613,20 +613,20 @@
 	}
 
 	/* setup dummy bh */
-	memset(&bh, 0, sizeof(bh));
-	bh.b_blocknr = block;
-	bh.b_dev = bh.b_rdev = dev;
-	bh.b_size = _blksize_size[minor];
-	bh.b_rsector = block * (bh.b_size >> 9);
+	memset(&bio, 0, sizeof(bio));
+	bio.bi_dev = dev;
+	bio.bi_size = _block_size[minor(bio.bi_dev)];
+	bio.bi_sector = block * bio_sectors(&bio);
+	bio.bi_rw = READ;
 
 	/* find target */
-	t = md->map->targets + __find_node(md->map, &bh);
+	t = md->map->targets + __find_node(md->map, &bio);
 
 	/* do the mapping */
-	r = t->type->map(&bh, READ, t->private);
+	r = t->type->map(&bio, t->private);
 
-	*r_dev = bh.b_rdev;
-	*r_block = bh.b_rsector / (bh.b_size >> 9);
+	*r_dev = bio.bi_dev;
+	*r_block = bio.bi_sector / bio_sectors(&bio);
 
 	dm_put_r(minor);
 	return r;
@@ -716,7 +716,7 @@
 	}
 
 	_devs[minor] = md;
-	md->dev = MKDEV(_major, minor);
+	md->dev = mk_kdev(_major, minor);
 	md->name[0] = '\0';
 	md->suspended = 0;
 
@@ -729,7 +729,7 @@
 {
 	md->devfs_entry =
 	    devfs_register(_dev_dir, md->name, DEVFS_FL_CURRENT_OWNER,
-			   MAJOR(md->dev), MINOR(md->dev),
+			   major(md->dev), minor(md->dev),
 			   S_IFBLK | S_IRUSR | S_IWUSR | S_IRGRP,
 			   &dm_blk_dops, NULL);
 
@@ -765,7 +765,7 @@
  */
 static int __bind(struct mapped_device *md, struct dm_table *t)
 {
-	int minor = MINOR(md->dev);
+	int minor = minor(md->dev);
 
 	md->map = t;
 
@@ -788,7 +788,7 @@
 
 static void __unbind(struct mapped_device *md)
 {
-	int minor = MINOR(md->dev);
+	int minor = minor(md->dev);
 
 	dm_table_destroy(md->map);
 	md->map = NULL;
@@ -810,7 +810,7 @@
 	md = dm_get_name_r(name);
 
 	if (md) {
-		dm_put_r(MINOR(md->dev));
+		dm_put_r(minor(md->dev));
 		DMWARN("device name already in use");
 		return -1;
 	}
@@ -837,7 +837,7 @@
 		spin_unlock(&_create_lock);
 		return -ENXIO;
 	}
-	minor = MINOR(md->dev);
+	minor = minor(md->dev);
 
 	/* FIXME: move name allocation into alloc_dev */
 	strcpy(md->name, name);
@@ -881,7 +881,7 @@
 		spin_unlock(&_create_lock);
 		return -ENXIO;
 	}
-	minor = MINOR(md->dev);
+	minor = minor(md->dev);
 
 	r = __unregister_device(md);
 	if (r)
@@ -915,7 +915,7 @@
 	if (r)
 		return r;
 
-	minor = MINOR(md->dev);
+	minor = minor(md->dev);
 	_devs[minor] = NULL;
 	__unbind(md);
 	kfree(md);
@@ -944,7 +944,7 @@
 
 	while (c) {
 		n = c->next;
-		generic_make_request(c->rw, c->bh);
+		generic_make_request(c->bio);
 		free_deferred(c);
 		c = n;
 	}
@@ -981,7 +981,7 @@
  */
 int dm_suspend(struct mapped_device *md)
 {
-	int minor = MINOR(md->dev);
+	int minor = minor(md->dev);
 	DECLARE_WAITQUEUE(wait, current);
 
 	if (md->suspended)
@@ -1016,7 +1016,7 @@
 
 int dm_resume(struct mapped_device *md)
 {
-	int minor = MINOR(md->dev);
+	int minor = minor(md->dev);
 	struct deferred_io *def;
 
 	if (!md->suspended || !md->map->num_targets)
--- /usr/src/linux/drivers/md/dm.h	Tue Jan 29 11:56:42 2002
+++ linux/drivers/md/dm.h	Wed Jan 30 14:21:44 2002
@@ -47,8 +47,7 @@
  * I/O that had to be deferred while we were suspended
  */
 struct deferred_io {
-	int rw;
-	struct buffer_head *bh;
+	struct bio *bio;
 	struct deferred_io *next;
 };
 
--- /usr/src/linux/drivers/md/dm-target.c	Tue Jan 29 11:54:41 2002
+++ linux/drivers/md/dm-target.c	Wed Jan 30 14:29:30 2002
@@ -7,6 +7,7 @@
 #include "dm.h"
 
 #include <linux/kmod.h>
+#include <linux/bio.h>
 
 struct tt_internal {
 	struct target_type tt;
@@ -213,9 +214,9 @@
 	return;
 }
 
-static int io_err_map(struct buffer_head *bh, int rw, void *context)
+static int io_err_map(struct bio *bio, void *context)
 {
-	buffer_IO_error(bh);
+	bio_io_error(bio);
 	return 0;
 }
 
--- /usr/src/linux/drivers/md/dm-table.c	Tue Jan 29 11:54:41 2002
+++ linux/drivers/md/dm-table.c	Wed Jan 30 14:28:14 2002
@@ -219,7 +219,7 @@
 
 	list_for_each(tmp, l) {
 		struct dm_dev *dd = list_entry(tmp, struct dm_dev, list);
-		if (dd->dev == dev)
+		if (kdev_same(dd->dev, dev))
 			return dd;
 	}
 
@@ -267,7 +267,7 @@
 	int *sizes;
 	offset_t dev_size;
 
-	if (!(sizes = blk_size[MAJOR(dev)]) || !(dev_size = sizes[MINOR(dev)]))
+	if (!(sizes = blk_size[major(dev)]) || !(dev_size = sizes[minor(dev)]))
 		/* we don't know the device details,
 		 * so give the benefit of the doubt */
 		return 1;
--- /usr/src/linux/drivers/md/dm-linear.c	Tue Jan 29 11:54:41 2002
+++ linux/drivers/md/dm-linear.c	Wed Jan 30 15:50:00 2002
@@ -67,12 +67,12 @@
 	kfree(c);
 }
 
-static int linear_map(struct buffer_head *bh, int rw, void *context)
+static int linear_map(struct bio *bio, void *context)
 {
 	struct linear_c *lc = (struct linear_c *) context;
 
-	bh->b_rdev = lc->dev->dev;
-	bh->b_rsector = bh->b_rsector + lc->delta;
+	bio->bi_dev = lc->dev->dev;
+	bio->bi_sector = bio->bi_sector + lc->delta;
 
 	return 1;
 }
--- /usr/src/linux/drivers/md/dm-ioctl.c	Tue Jan 29 11:54:41 2002
+++ linux/drivers/md/dm-ioctl.c	Wed Jan 30 14:09:35 2002
@@ -173,7 +173,7 @@
 	md  = dm_get_name_r(name);
 	if (!md)
 		goto out;
-	minor = MINOR(md->dev);
+	minor = minor(md->dev);
 
 	param.flags |= DM_EXISTS_FLAG;
 	if (md->suspended)
@@ -213,7 +213,7 @@
 	}
 
 	minor = (param->flags & DM_PERSISTENT_DEV_FLAG) ?
-		MINOR(to_kdev_t(param->dev)) : -1;
+		minor(to_kdev_t(param->dev)) : -1;
 
 	r = dm_create(param->name, minor, t);
 	if (r) {
@@ -226,7 +226,7 @@
 		/* shouldn't get here */
 		return 0;
 
-	minor = MINOR(md->dev);
+	minor = minor(md->dev);
 	dm_set_ro(md, (param->flags & DM_READONLY_FLAG) ? 1 : 0);
 	dm_put_w(minor);
 
@@ -243,7 +243,7 @@
 	if (!md)
 		return -ENXIO;
 
-	minor = MINOR(md->dev);
+	minor = minor(md->dev);
 	r = dm_destroy(md);
 	dm_put_w(minor);
 
@@ -259,7 +259,7 @@
 	if (!md)
 		return -ENXIO;
 
-	minor = MINOR(md->dev);
+	minor = minor(md->dev);
 	r = (param->flags & DM_SUSPEND_FLAG) ?
 	     dm_suspend(md) : dm_resume(md);
 	dm_put_w(minor);
@@ -289,7 +289,7 @@
 		return -ENXIO;
 	}
 
-	minor = MINOR(md->dev);
+	minor = minor(md->dev);
 
 	r = dm_swap_table(md, t);
 	if (r) {
--- /usr/src/linux/drivers/md/dm-stripe.c	Tue Jan 29 11:54:41 2002
+++ linux/drivers/md/dm-stripe.c	Wed Jan 30 14:29:48 2002
@@ -82,7 +82,7 @@
 		return -EINVAL;
 	}
 
-	chunk_size =simple_strtoul(argv[1], &end, 10);
+	chunk_size = simple_strtoul(argv[1], &end, 10);
 	if (*end) {
 		*context = "dm-stripe: Invalid chunk_size";
 		return -EINVAL;
@@ -156,18 +156,18 @@
 	kfree(sc);
 }
 
-static int stripe_map(struct buffer_head *bh, int rw, void *context)
+static int stripe_map(struct bio *bio, void *context)
 {
 	struct stripe_c *sc = (struct stripe_c *) context;
 
-	offset_t offset = bh->b_rsector - sc->logical_start;
+	offset_t offset = bio->bi_sector - sc->logical_start;
 	uint32_t chunk = (uint32_t) (offset >> sc->chunk_shift);
 	uint32_t stripe = chunk % sc->stripes;	/* 32bit modulus */
 	chunk = chunk / sc->stripes;
 
-	bh->b_rdev = sc->stripe[stripe].dev->dev;
-	bh->b_rsector = sc->stripe[stripe].physical_start +
-	    (chunk << sc->chunk_shift) + (offset & sc->chunk_mask);
+	bio->bi_dev = sc->stripe[stripe].dev->dev;
+	bio->bi_sector = sc->stripe[stripe].physical_start +
+		(chunk << sc->chunk_shift) + (offset & sc->chunk_mask);
 	return 1;
 }
 

--6c2NcOVqGQ03X4Wi--
