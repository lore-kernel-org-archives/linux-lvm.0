From: Miquel van Smoorenburg <miquels@cistron.nl>
Message-ID: <20040303211624.GA11008@cistron.nl>
References: <cistron.200403011400.51008.kevcorry@us.ibm.com> <20040302130137.GA9941@cistron.nl> <200403020826.52448.kevcorry@us.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200403020826.52448.kevcorry@us.ibm.com>
Subject: [linux-lvm] [PATCH] dm-rwlock.patch (Re: 2.6.4-rc1-mm1: queue-congestion-dm-implementation patch)
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
Date: Wed Mar  3 16:15:16 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Corry <kevcorry@us.ibm.com>
Cc: linux-lvm@redhat.com, Andrew Morton <akpm@osdl.org>, Joe Thornber <thornber@redhat.com>, miquels@cistron.nl

According to Kevin Corry:
> On Tuesday 02 March 2004 7:01 am, Miquel van Smoorenburg wrote:
> > According to Kevin Corry:
> > > The queue-congestion-dm-implementation patch in 2.6.4-rc1-mm1 (included
> > > below) allows a DM device to query the lower-level device(s) during the
> > > queue-congestion APIs. However, it must wait on an internal semaphore
> > > (md->lock) before passing the call down to the lower-level devices. The
> > > problem is that the higher-level caller is holding a spinlock at the same
> > > time. Here is one such stack-trace I have been seeing:
> > >
> > > Debug: sleeping function called from invalid context at include/linux/
> > > rwsem.h:43
> > > in_atomic():1, irqs_disabled():0
> > > Call Trace:
> > >  [<c012456b>] __might_sleep+0xab/0xd0
> > >  [<c03a0771>] dm_any_congested+0x21/0x60
> >
> > Is there any way to reproduce this? I turned on spinlock and
> > sleep-spinlock debugging and did lots of I/O but I don't see it.
> 
> I didn't really do anything special to hit this.

*Hits forehead* I had preemption turned off on my machine so I
didn't see it.

I posted a patch in the wrong thread earlier today, and the patch also
wasn't so good. This should be better, but I'll let Joe be the
judge of that. At least it survived my testing.

-=-=-

This patch converts the lock in struct mapped_device to an rwlock_t
instead of a rw_semaphore. No blocking functions are called when
the lock is held. dm_request builds a list of bio's under the lock
which are fed to generic_make_request outside of the lock.

Functions called by userland ioctls are protected by a new
semaphore. Before anything is done with a mapped_device, I/O to
the device is blocked (DMF_BLOCK_IO) and the device is suspended.

dm_any_congested() runs under the lock, and returns the congested
bits if I/O is blocked.

--- linux-2.6.4-rc1-mm2/drivers/md/dm.c.ORIG	2004-03-03 15:08:58.000000000 +0100
+++ linux-2.6.4-rc1-mm2/drivers/md/dm.c	2004-03-03 21:43:02.000000000 +0100
@@ -35,7 +35,8 @@
 #define DMF_SUSPENDED 1
 
 struct mapped_device {
-	struct rw_semaphore lock;
+	rwlock_t lock;
+	struct semaphore sem;
 	atomic_t holders;
 
 	unsigned long flags;
@@ -189,16 +190,16 @@
  */
 static int queue_io(struct mapped_device *md, struct bio *bio)
 {
-	down_write(&md->lock);
+	write_lock(&md->lock);
 
 	if (!test_bit(DMF_BLOCK_IO, &md->flags)) {
-		up_write(&md->lock);
+		write_unlock(&md->lock);
 		return 1;
 	}
 
 	bio_list_add(&md->deferred, bio);
 
-	up_write(&md->lock);
+	write_unlock(&md->lock);
 	return 0;		/* deferred successfully */
 }
 
@@ -263,7 +264,7 @@
 	return len;
 }
 
-static void __map_bio(struct dm_target *ti, struct bio *clone, struct dm_io *io)
+static int __map_bio(struct dm_target *ti, struct bio *clone, struct dm_io *io)
 {
 	int r;
 
@@ -282,13 +283,12 @@
 	 */
 	atomic_inc(&io->io_count);
 	r = ti->type->map(ti, clone);
-	if (r > 0)
-		/* the bio has been remapped so dispatch it */
-		generic_make_request(clone);
-
-	else if (r < 0)
+	
+	if (r < 0)
 		/* error the io and bail out */
 		dec_pending(io, -EIO);
+
+	return r;
 }
 
 struct clone_info {
@@ -343,7 +343,7 @@
 	return clone;
 }
 
-static void __clone_and_map(struct clone_info *ci)
+static void __clone_and_map(struct clone_info *ci, struct bio_list *bl)
 {
 	struct bio *clone, *bio = ci->bio;
 	struct dm_target *ti = dm_table_find_target(ci->md->map, ci->sector);
@@ -356,7 +356,8 @@
 		 */
 		clone = clone_bio(bio, ci->sector, ci->idx,
 				  bio->bi_vcnt - ci->idx, ci->sector_count);
-		__map_bio(ti, clone, ci->io);
+		if (__map_bio(ti, clone, ci->io) > 0)
+			bio_list_add(bl, clone);
 		ci->sector_count = 0;
 
 	} else if (to_sector(bio->bi_io_vec[ci->idx].bv_len) <= max) {
@@ -379,7 +380,8 @@
 		}
 
 		clone = clone_bio(bio, ci->sector, ci->idx, i - ci->idx, len);
-		__map_bio(ti, clone, ci->io);
+		if (__map_bio(ti, clone, ci->io) > 0)
+			bio_list_add(bl, clone);
 
 		ci->sector += len;
 		ci->sector_count -= len;
@@ -394,7 +396,8 @@
 
 		clone = split_bvec(bio, ci->sector, ci->idx,
 				   bv->bv_offset, max);
-		__map_bio(ti, clone, ci->io);
+		if (__map_bio(ti, clone, ci->io) > 0)
+			bio_list_add(bl, clone);
 
 		ci->sector += max;
 		ci->sector_count -= max;
@@ -403,7 +406,8 @@
 		len = to_sector(bv->bv_len) - max;
 		clone = split_bvec(bio, ci->sector, ci->idx,
 				   bv->bv_offset + to_bytes(max), len);
-		__map_bio(ti, clone, ci->io);
+		if (__map_bio(ti, clone, ci->io) > 0)
+			bio_list_add(bl, clone);
 
 		ci->sector += len;
 		ci->sector_count -= len;
@@ -414,7 +418,8 @@
 /*
  * Split the bio into several clones.
  */
-static void __split_bio(struct mapped_device *md, struct bio *bio)
+static void __split_bio(struct mapped_device *md, struct bio *bio,
+						struct bio_list *bl)
 {
 	struct clone_info ci;
 
@@ -431,7 +436,7 @@
 
 	atomic_inc(&md->pending);
 	while (ci.sector_count)
-		__clone_and_map(&ci);
+		__clone_and_map(&ci, bl);
 
 	/* drop the extra reference count */
 	dec_pending(ci.io, 0);
@@ -442,6 +447,21 @@
 
 
 /*
+ * Requeue the deferred bios by calling generic_make_request.
+ */
+static void flush_deferred_io(struct bio *c)
+{
+	struct bio *n;
+
+	while (c) {
+		n = c->bi_next;
+		c->bi_next = NULL;
+		generic_make_request(c);
+		c = n;
+	}
+}
+
+/*
  * The request function that just remaps the bio built up by
  * dm_merge_bvec.
  */
@@ -449,15 +469,18 @@
 {
 	int r;
 	struct mapped_device *md = q->queuedata;
+	struct bio_list list;
+
+	list.head = list.tail = NULL;
 
-	down_read(&md->lock);
+	read_lock(&md->lock);
 
 	/*
 	 * If we're suspended we have to queue
 	 * this io for later.
 	 */
 	while (test_bit(DMF_BLOCK_IO, &md->flags)) {
-		up_read(&md->lock);
+		read_unlock(&md->lock);
 
 		if (bio_rw(bio) == READA) {
 			bio_io_error(bio, bio->bi_size);
@@ -476,7 +499,7 @@
 		 * We're in a while loop, because someone could suspend
 		 * before we get to the following read lock.
 		 */
-		down_read(&md->lock);
+		read_lock(&md->lock);
 	}
 
 	if (!md->map) {
@@ -484,8 +507,15 @@
 		return 0;
 	}
 
-	__split_bio(md, bio);
-	up_read(&md->lock);
+	__split_bio(md, bio, &list);
+	read_unlock(&md->lock);
+
+	/*
+	 *	Submit the bio's outside of md->lock.
+	 */
+	bio = bio_list_get(&list);
+	flush_deferred_io(bio);
+
 	return 0;
 }
 
@@ -494,9 +524,12 @@
 	int r;
 	struct mapped_device *md = congested_data;
 
-	down_read(&md->lock);
-	r = dm_table_any_congested(md->map, bdi_bits);
-	up_read(&md->lock);
+	read_lock(&md->lock);
+	if (!test_bit(DMF_BLOCK_IO, &md->flags))
+		r = dm_table_any_congested(md->map, bdi_bits);
+	else
+		r = bdi_bits;
+	read_unlock(&md->lock);
 
 	return r;
 }
@@ -571,7 +604,8 @@
 		goto bad1;
 
 	memset(md, 0, sizeof(*md));
-	init_rwsem(&md->lock);
+	rwlock_init(&md->lock);
+	sema_init(&md->sem, 1);
 	atomic_set(&md->holders, 1);
 
 	md->queue = blk_alloc_queue(GFP_KERNEL);
@@ -634,10 +668,10 @@
 {
 	struct mapped_device *md = (struct mapped_device *) context;
 
-	down_write(&md->lock);
+	write_lock(&md->lock);
 	md->event_nr++;
 	wake_up_interruptible(&md->eventq);
-	up_write(&md->lock);
+	write_unlock(&md->lock);
 }
 
 static void __set_size(struct gendisk *disk, sector_t size)
@@ -724,42 +758,26 @@
 }
 
 /*
- * Requeue the deferred bios by calling generic_make_request.
- */
-static void flush_deferred_io(struct bio *c)
-{
-	struct bio *n;
-
-	while (c) {
-		n = c->bi_next;
-		c->bi_next = NULL;
-		generic_make_request(c);
-		c = n;
-	}
-}
-
-/*
  * Swap in a new table (destroying old one).
  */
 int dm_swap_table(struct mapped_device *md, struct dm_table *table)
 {
 	int r;
 
-	down_write(&md->lock);
+	down(&md->sem);
 
 	/* device must be suspended */
 	if (!test_bit(DMF_SUSPENDED, &md->flags)) {
-		up_write(&md->lock);
+		up(&md->sem);
 		return -EPERM;
 	}
 
 	__unbind(md);
 	r = __bind(md, table);
-	if (r)
-		return r;
 
-	up_write(&md->lock);
-	return 0;
+	up(&md->sem);
+
+	return r;
 }
 
 /*
@@ -773,20 +791,23 @@
 {
 	DECLARE_WAITQUEUE(wait, current);
 
-	down_write(&md->lock);
+	down(&md->sem);
+	write_lock(&md->lock);
 
 	/*
 	 * First we set the BLOCK_IO flag so no more ios will be
 	 * mapped.
 	 */
 	if (test_bit(DMF_BLOCK_IO, &md->flags)) {
-		up_write(&md->lock);
+		write_unlock(&md->lock);
+		up(&md->sem);
 		return -EINVAL;
 	}
 
 	set_bit(DMF_BLOCK_IO, &md->flags);
 	add_wait_queue(&md->wait, &wait);
-	up_write(&md->lock);
+	write_unlock(&md->lock);
+	up(&md->sem);
 
 	/*
 	 * Then we wait for the already mapped ios to
@@ -803,12 +824,14 @@
 	}
 	set_current_state(TASK_RUNNING);
 
-	down_write(&md->lock);
+	down(&md->sem);
+	write_lock(&md->lock);
 	remove_wait_queue(&md->wait, &wait);
 	set_bit(DMF_SUSPENDED, &md->flags);
+	write_unlock(&md->lock);
 	if (md->map)
 		dm_table_suspend_targets(md->map);
-	up_write(&md->lock);
+	up(&md->sem);
 
 	return 0;
 }
@@ -817,11 +840,11 @@
 {
 	struct bio *def;
 
-	down_write(&md->lock);
+	down(&md->sem);
 	if (!md->map ||
 	    !test_bit(DMF_SUSPENDED, &md->flags) ||
 	    !dm_table_get_size(md->map)) {
-		up_write(&md->lock);
+		write_unlock(&md->lock);
 		return -EINVAL;
 	}
 
@@ -829,7 +852,7 @@
 	clear_bit(DMF_SUSPENDED, &md->flags);
 	clear_bit(DMF_BLOCK_IO, &md->flags);
 	def = bio_list_get(&md->deferred);
-	up_write(&md->lock);
+	up(&md->sem);
 
 	flush_deferred_io(def);
 	blk_run_queues();
@@ -844,9 +867,9 @@
 {
 	uint32_t r;
 
-	down_read(&md->lock);
+	read_lock(&md->lock);
 	r = md->event_nr;
-	up_read(&md->lock);
+	read_unlock(&md->lock);
 
 	return r;
 }
@@ -854,23 +877,23 @@
 int dm_add_wait_queue(struct mapped_device *md, wait_queue_t *wq,
 		      uint32_t event_nr)
 {
-	down_write(&md->lock);
+	write_lock(&md->lock);
 	if (event_nr != md->event_nr) {
-		up_write(&md->lock);
+		write_unlock(&md->lock);
 		return 1;
 	}
 
 	add_wait_queue(&md->eventq, wq);
-	up_write(&md->lock);
+	write_unlock(&md->lock);
 
 	return 0;
 }
 
 void dm_remove_wait_queue(struct mapped_device *md, wait_queue_t *wq)
 {
-	down_write(&md->lock);
+	write_lock(&md->lock);
 	remove_wait_queue(&md->eventq, wq);
-	up_write(&md->lock);
+	write_unlock(&md->lock);
 }
 
 /*
@@ -886,11 +909,11 @@
 {
 	struct dm_table *t;
 
-	down_read(&md->lock);
+	read_lock(&md->lock);
 	t = md->map;
 	if (t)
 		dm_table_get(t);
-	up_read(&md->lock);
+	read_unlock(&md->lock);
 
 	return t;
 }
