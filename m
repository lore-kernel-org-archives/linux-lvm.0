Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011291018.eATAI6K21538@webber.adilger.net>
Subject: Re: [linux-lvm] LVM 0.9 snapshot and ext3
In-Reply-To: <200011290701.eAT71p902650@webber.adilger.net> "from Andreas Dilger
 at Nov 29, 2000 00:01:51 am"
Date: Wed, 29 Nov 2000 03:18:06 -0700 (MST)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: jweber@valinux.com, "Stephen C. Tweedie" <sct@redhat.com>, "Heinz J. Mauelshagen" <mauelshagen@sistina.com>

I previously wrote:
> Basically, the oops is from an assertion (debugging check) in the ext3
> journal code testing for a condition that _shouldn't_ happen.  In this case
> "!buffer_locked(bh_in)", so it is getting a locked buffer (in the middle of
> I/O) when it doesn't expect it.  The ext3 0.0.5b code (which you are using)
> should have been able to handle basic I/O failures and such, but this
> looks a bit unusual.
> 
> Maybe LVM isn't cleaning up the buffer properly when it runs out of space
> in the snapshot...

Judging by the assertion (the buffer is still locked), and the fact that
this flag BH_Lock is what's set when a buffer is being written, and
cleared by wait_on_buffer(), LVM may need to be waiting on it's snapshot
I/Os to complete if it will later destroy the snapshot...

Looking at lvm_snapshot_COW(), there are a few places it may need to wait -
after the kiovec READ before we start the WRITE (so that the data in the
blocks is correct)...  Since the WRITE is to blocks _outside_ where ext3
is writing them, it may well be that the READ is still going on for the
blocks in the ext3 (original) LV (and are locked) at the time the snapshot
LV is full, and hence ext3 oops (speculation here).

> Also, I haven't really dug into LVM snapshots much,
> but shouldn't all the remapping be done on the read-only copy?  Do LVM
> snapshots store the modified blocks in the original LV, and the old (frozen)
> blocks in the snapshot LV, or vice versa?  If ext3 is writing to the
> original LV, it should never run out of space.  At most, the read-only
> copy (which will not be ext3) should disappear - I'm not sure what LVM
> does in this case.

As an aside, I had trouble reading the lvm_map() function because of the
many nested if cases and the many uses of {rsector,rdev}_tmp, so I have
re-done it and attached a patch.  It _should_ be 100% identical to the
existing code operation (mostly reversing tests and early exits).  We
now have:

{rsector,rdev}_org = original values
{rsector,rdev}_map = mapped values
{rsector,rdev}_tmp = junk values only used to see if chunk already mapped

Some questionalble areas:
- the old code saves {rsector,rdev}_tmp before lvm_snapshot_remap_block(),
  but these are only changed if the blocks are already mapped (ret = 1, a
  case we don't care about), so no need to keep these for anything, right?
- calling lvm_snapshot_COW() you pass rsector_tmp and rsector_sav for the
  org_phys_sector and org_virt_sector, yet they should always be identical
  if we get this far (per above), since lvm_snapshot_remap_block() will not
  have changed rsector_tmp (org_sector) if ret=0

Cheers, Andreas
===========================================================================

--- lvm.c.orig	Sun Nov 19 20:35:44 2000
+++ lvm.c	Wed Nov 29 02:30:06 2000
@@ -1601,10 +1601,10 @@
 	ulong index;
 	ulong pe_start;
 	ulong size = bh->b_size >> 9;
-	ulong rsector_tmp = bh->b_blocknr * size;
-	ulong rsector_sav;
-	kdev_t rdev_tmp = bh->b_dev;
-	kdev_t rdev_sav;
+	ulong rsector_org = bh->b_blocknr * size;
+	ulong rsector_map;
+	kdev_t rdev_org = bh->b_dev;
+	kdev_t rdev_map;
 	vg_t *vg_this = vg[VG_BLK(minor)];
 	lv_t *lv = vg_this->lv[LV_BLK(minor)];
 
@@ -1619,91 +1619,66 @@
 	if ((rw == WRITE || rw == WRITEA) &&
 	    !(lv->lv_access & LV_WRITE)) {
 		printk(KERN_CRIT
-		    "%s - lvm_map: ll_rw_blk write for readonly LV %s\n",
+		       "%s - lvm_map: ll_rw_blk write for readonly LV %s\n",
 		       lvm_name, lv->lv_name);
 		return -1;
 	}
 #ifdef DEBUG_MAP
 	printk(KERN_DEBUG
-	       "%s - lvm_map minor:%d  *rdev: %02d:%02d  *rsector: %lu  "
-	       "size:%lu\n",
-	       lvm_name, minor,
-	       MAJOR(rdev_tmp),
-	       MINOR(rdev_tmp),
-	       rsector_tmp, size);
+	       "%s - lvm_map minor:%d  *rdev: %s  *rsector: %lu  size:%lu\n",
+	       lvm_name, minor, kdevname(rdev_org), rsector_org, size);
 #endif
 
-	if (rsector_tmp + size > lv->lv_size) {
+	if (rsector_org + size > lv->lv_size) {
 		printk(KERN_ALERT
-		       "%s - lvm_map access beyond end of device; *rsector: "
-                       "%lu or size: %lu wrong for minor: %2d\n",
-                       lvm_name, rsector_tmp, size, minor);
+		       "%s - lvm_map access beyond end of device; *rsector: %lu"
+		       " or lv_size: %lu wrong for minor: %2d\n",
+		       lvm_name, rsector_org, size, minor);
 		return -1;
 	}
-	rsector_sav = rsector_tmp;
-	rdev_sav = rdev_tmp;
 
 lvm_second_remap:
-	/* linear mapping */
-	if (lv->lv_stripes < 2) {
+	if (lv->lv_stripes < 2) {	/* linear mapping */
 		/* get the index */
-		index = rsector_tmp / vg_this->pe_size;
+		index = rsector_org / vg_this->pe_size;
 		pe_start = lv->lv_current_pe[index].pe;
-		rsector_tmp = lv->lv_current_pe[index].pe +
-		    (rsector_tmp % vg_this->pe_size);
-		rdev_tmp = lv->lv_current_pe[index].dev;
+		rsector_map = lv->lv_current_pe[index].pe +
+		    (rsector_org % vg_this->pe_size);
+		rdev_map = lv->lv_current_pe[index].dev;
 
-#ifdef DEBUG_MAP
-		printk(KERN_DEBUG
-		       "lv_current_pe[%ld].pe: %ld  rdev: %02d:%02d  rsector:%ld\n",
-		       index,
-		       lv->lv_current_pe[index].pe,
-		       MAJOR(rdev_tmp),
-		       MINOR(rdev_tmp),
-		       rsector_tmp);
-#endif
-
-		/* striped mapping */
-	} else {
+	} else {			/* striped mapping */
 		ulong stripe_index;
 		ulong stripe_length;
 
 		stripe_length = vg_this->pe_size * lv->lv_stripes;
-		stripe_index = (rsector_tmp % stripe_length) / lv->lv_stripesize;
-		index = rsector_tmp / stripe_length +
+		stripe_index = (rsector_org % stripe_length) /lv->lv_stripesize;
+		index = rsector_org / stripe_length +
 		    (stripe_index % lv->lv_stripes) *
 		    (lv->lv_allocated_le / lv->lv_stripes);
 		pe_start = lv->lv_current_pe[index].pe;
-		rsector_tmp = lv->lv_current_pe[index].pe +
-		    (rsector_tmp % stripe_length) -
+		rsector_map = lv->lv_current_pe[index].pe +
+		    (rsector_org % stripe_length) -
 		    (stripe_index % lv->lv_stripes) * lv->lv_stripesize -
 		    stripe_index / lv->lv_stripes *
 		    (lv->lv_stripes - 1) * lv->lv_stripesize;
-		rdev_tmp = lv->lv_current_pe[index].dev;
+		rdev_map = lv->lv_current_pe[index].dev;
 	}
 
 #ifdef DEBUG_MAP
 	printk(KERN_DEBUG
-	     "lv_current_pe[%ld].pe: %ld  rdev: %02d:%02d  rsector:%ld\n"
+	       "lv_current_pe[%ld].pe: %ld  rdev: %s  rsector:%ld\n"
 	       "stripe_length: %ld  stripe_index: %ld\n",
-	       index,
-	       lv->lv_current_pe[index].pe,
-	       MAJOR(rdev_tmp),
-	       MINOR(rdev_tmp),
-	       rsector_tmp,
-	       stripe_length,
-	       stripe_index);
+	       index, lv->lv_current_pe[index].pe, kdevname(rdev_map),
+	       rsector_map, stripe_length, stripe_index);
 #endif
 
 	/* handle physical extents on the move */
 	if (pe_lock_req.lock == LOCK_PE) {
-		if (rdev_tmp == pe_lock_req.data.pv_dev &&
-		    rsector_tmp >= pe_lock_req.data.pv_offset &&
-		    rsector_tmp < (pe_lock_req.data.pv_offset +
+		if (rdev_map == pe_lock_req.data.pv_dev &&
+		    rsector_map >= pe_lock_req.data.pv_offset &&
+		    rsector_map < (pe_lock_req.data.pv_offset +
 				   vg_this->pe_size)) {
 			sleep_on(&lvm_map_wait);
-			rsector_tmp = rsector_sav;
-			rdev_tmp = rdev_sav;
 			goto lvm_second_remap;
 		}
 	}
@@ -1713,54 +1688,53 @@
 	else
 		lv->lv_current_pe[index].reads++;
 
-	/* snapshot volume exception handling on physical device address base */
-	if (lv->lv_access & (LV_SNAPSHOT|LV_SNAPSHOT_ORG)) {
-		/* original logical volume */
-		if (lv->lv_access & LV_SNAPSHOT_ORG) {
-			if (rw == WRITE || rw == WRITEA)
-			{
-				lv_t *lv_ptr;
-
-				/* start with first snapshot and loop thrugh all of them */
-				for (lv_ptr = lv->lv_snapshot_next;
-				     lv_ptr != NULL;
-				     lv_ptr = lv_ptr->lv_snapshot_next) {
-					/* Check for inactive snapshot */
-					if (!(lv_ptr->lv_status & LV_ACTIVE)) continue;
-					down(&lv->lv_snapshot_org->lv_snapshot_sem);
-					/* do we still have exception storage for this snapshot free? */
-					if (lv_ptr->lv_block_exception != NULL) {
-						rdev_sav = rdev_tmp;
-						rsector_sav = rsector_tmp;
-						if (!lvm_snapshot_remap_block(&rdev_tmp,
-									      &rsector_tmp,
-									      pe_start,
-									      lv_ptr)) {
-							/* create a new mapping */
-							if (!(ret = lvm_snapshot_COW(rdev_tmp,
-									       	     rsector_tmp,
-									             pe_start,
-									             rsector_sav,
-									             lv_ptr)))
-								ret = lvm_write_COW_table_block(vg_this,
-												lv_ptr);
-						}
-						rdev_tmp = rdev_sav;
-						rsector_tmp = rsector_sav;
-					}
-					up(&lv->lv_snapshot_org->lv_snapshot_sem);
-				}
-			}
-		} else {
-			/* remap snapshot logical volume */
-			down(&lv->lv_snapshot_sem);
-			if (lv->lv_block_exception != NULL)
-				lvm_snapshot_remap_block(&rdev_tmp, &rsector_tmp, pe_start, lv);
-			up(&lv->lv_snapshot_sem);
+	/* if not a snapshot volume, no need to do any more remapping */
+	if (!(lv->lv_access & (LV_SNAPSHOT|LV_SNAPSHOT_ORG)))
+		goto done;
+
+	if (lv->lv_access & LV_SNAPSHOT_ORG) { /* original logical volume */
+		lv_t *lv_ptr;
+
+		/* we don't need remapping if we aren't changing the block */
+		if (rw != WRITE && rw != WRITEA)
+			goto done;
+
+		/* start with first snapshot, loop through them all */
+		down(&lv->lv_snapshot_org->lv_snapshot_sem);
+		for (lv_ptr = lv->lv_snapshot_next; lv_ptr != NULL;
+		     lv_ptr = lv_ptr->lv_snapshot_next) {
+			unsigned long rsector_tmp = rsector_map;
+			kdev_t rdev_tmp = rdev_map;
+			/* is this snapshot inactive? */
+			if (!(lv_ptr->lv_status & LV_ACTIVE))
+				continue;
+			/* are we out of space for this snapshot? */
+			if (lv_ptr->lv_block_exception == NULL)
+				continue;
+			/* is this chunk already mapped in this snapshot? */
+			if (lvm_snapshot_remap_block(&rdev_tmp, &rsector_tmp,
+						     pe_start, lv_ptr))
+				continue;
+			/* create a new mapping for this chunk */
+			if (!(ret = lvm_snapshot_COW(rdev_map, rsector_map,
+						     pe_start, rsector_map,
+						     lv_ptr)))
+				ret = lvm_write_COW_table_block(vg_this,lv_ptr);
 		}
+		up(&lv->lv_snapshot_org->lv_snapshot_sem);
+	} else {	/* snapshot logical volume */
+		/* remap to snapshot logical volume if a copy of this chunk
+		 * exists in the snapshot, otherwise use original chunk */
+		down(&lv->lv_snapshot_sem);
+		if (lv->lv_block_exception != NULL)
+			lvm_snapshot_remap_block(&rdev_map, &rsector_map,
+						 pe_start, lv);
+		up(&lv->lv_snapshot_sem);
 	}
-	bh->b_rdev = rdev_tmp;
-	bh->b_rsector = rsector_tmp;
+
+done:
+	bh->b_rdev = rdev_map;
+	bh->b_rsector = rsector_map;
 
 	return ret;
 } /* lvm_map() */
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
