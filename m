Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011301948.eAUJm6k01893@webber.adilger.net>
Subject: Re: [linux-lvm] LVM 0.9 snapshot and ext3
In-Reply-To: <20001130094630.E3027@redhat.com> "from Stephen C. Tweedie at Nov
 30, 2000 09:46:30 am"
Date: Thu, 30 Nov 2000 12:48:06 -0700 (MST)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Stephen C. Tweedie" <sct@redhat.com>
Cc: Andreas Dilger <adilger@turbolinux.com>, linux-lvm@sistina.com, jweber@valinux.com, "Heinz J. Mauelshagen" <mauelshagen@sistina.com>

Stephen writes:
> So, is somebody else doing a read?  It could be ext3, conceivably, if
> we had had an IO error previously on the buffer and the BH_uptodate
> flag had been cleared: a subsequent access to the buffer by another
> process would try to reread the buffer off disk, locking it
> temporarily.

Considering that there was the "Bad lvm_map in ll_rw_block" message just
before the oops, this would lead to the situation you are talking about.
In ll_rw_block the error path at "sorry:" clears BH_Dirty and BH_Uptodate,
and calls b_end_io() but does not necessarily unlock the buffer?

Looking at the code more closely, I see that I may have introduced a bug
here, because I didn't understand what was going on:

- in lvm_map() we call lvm_snapshot_COW() and lvm_write_COW_table(), set "ret"
- we return the last "ret" value to ll_rw_block()
- ll_rw_block() fails if the lvm_map() return value is non-zero

Really, the lvm_map() call should NOT return an error if the snapshot write
fails, because it needs to write the primary LV in this case.  The
snapshot LV may fill up, and then be removed, but this should not affect
the I/O on the primary LV.  There should only be an error if the primary
LV mapping fails, which will only happen on an inactive or R/O LV, or if
we try to write past the end of the LV.

*** Stephen, in case of ANY error inside lvm_map() should it unlock the buffer?
    What do the low-level drivers do on an error?  ll_rw_block() will already
    call b_end_io for us at "sorry:", but it still clearly causes a problem for
    ext3.  This bug with the snapshots has only brought forth the *real* issue
    of what to in case any of the other errors in lvm_map() happens.


The simple fix for this problem is to remove "ret" from lvm_map, and always
returning "0" at the end.  The first patch does this.  The second part cleans
up a few other error return values, to follow the normal kernel "-ve is error"
standard, and remove a bunch of needless gotos.  It is based on my reorg
of lvm_map, so if the first patch (the one that should "hide" this bug)
fails for you, just manually delete the 4 cases of "ret" in that function.

Cheers, Andreas
===========================================================================

--- lvm.c.orig	Sun Nov 19 20:35:44 2000
+++ lvm.c	Thu Nov 30 12:17:17 2000
@@ -1597,7 +1597,6 @@
 static int lvm_map(struct buffer_head *bh, int rw)
 {
 	int minor = MINOR(bh->b_dev);
-	int ret = 0;
 	ulong index;
 	ulong pe_start;
 	ulong size = bh->b_size >> 9;
@@ -1715,11 +1716,15 @@
 			if (lvm_snapshot_remap_block(&rdev_tmp, &rsector_tmp,
 						     pe_start, lv_ptr))
 				continue;
-			/* create a new mapping */
-			if (!(ret = lvm_snapshot_COW(rdev_map, rsector_map,
-						     pe_start, rsector_map,
-						     lv_ptr)))
-				ret = lvm_write_COW_table_block(vg_this,lv_ptr);
+			/*
+			 * Create a new mapping for this chunk.  If it fails,
+			 * it will remove the snapshot, but this should not
+			 * return the error to ll_rw_block(), which would stop
+			 * the I/O on the primary LV copy.
+			 */
+			if (!lvm_snapshot_COW(rdev_map, rsector_map,
+					      pe_start, rsector_map, lv_ptr))
+				(void)lvm_write_COW_table_block(vg_this,lv_ptr);
 		}
 		up(&lv->lv_snapshot_org->lv_snapshot_sem);
 	} else {	/* snapshot logical volume */
@@ -1740,7 +1740,7 @@
 	bh->b_rdev = rdev_map;
 	bh->b_rsector = rsector_map;
 
-	return ret;
+	return 0;
 } /* lvm_map() */
 
 
===========================================================================
--- lvm.c.orig	Sun Nov 19 20:35:44 2000
+++ lvm.c	Thu Nov 30 12:17:17 2000
@@ -2708,7 +2685,7 @@
 			up(&lv_ptr->lv_snapshot_org->lv_snapshot_sem);
 			vfree(lvbe_old);
 			vfree(lvs_hash_table_old);
-			return 1;
+			return -ENOMEM;
 		}
 
 		for (e = 0; e < lv_ptr->lv_remap_ptr; e++)
--- lvm-snap.c.orig	Tue Nov 14 05:52:45 2000
+++ lvm-snap.c	Thu Nov 30 11:52:57 2000
@@ -295,7 +305,10 @@
 	if (brw_kiovec(WRITE, 1, &iobuf, snap_phys_dev,
 		       blocks, blksize_snap, 0) != blksize_snap)
 #endif
-		goto fail_raw_write;
+	{
+		reason = "write error";
+		goto error;
+	}
 
 
 	/* initialization of next COW exception table block with zeroes */
@@ -323,7 +336,10 @@
 		if (brw_kiovec(WRITE, 1, &iobuf, snap_phys_dev,
 			       blocks, blksize_snap, 0) != blksize_snap)
 #endif
-			goto fail_raw_write;
+		{
+			reason = "write error";
+			goto error;
+		}
 	}
 
 
@@ -334,13 +350,9 @@
 	return 0;
 
 	/* slow path */
- out:
+ error:
 	lvm_drop_snapshot(lv_snap, reason);
-	return 1;
+	return -1;
-
- fail_raw_write:
-	reason = "write error";
-	goto out;
 }
 
 /*
@@ -366,8 +378,10 @@
 	int max_sectors, nr_sectors;
 
 	/* check if we are out of snapshot space */
-	if (idx >= lv_snap->lv_remap_end)
-		goto fail_out_of_space;
+	if (idx >= lv_snap->lv_remap_end) {
+		reason = "out of space";
+		goto error;
+	}
 
 	/* calculate physical boundaries of source chunk */
 	pe_off = org_pe_start % chunk_size;
@@ -401,8 +415,10 @@
 	min_blksize = min(blksize_org, blksize_snap);
 	max_sectors = KIO_MAX_SECTORS * (min_blksize>>9);
 
-	if (chunk_size % (max_blksize>>9))
-		goto fail_blksize;
+	if (chunk_size % (max_blksize>>9)) {
+		reason = "block size error";
+		goto error;
+	}
 
 	while (chunk_size)
 	{
@@ -420,7 +436,10 @@
 		if (brw_kiovec(READ, 1, &iobuf, org_phys_dev,
 			       blocks, blksize_org, 0) != (nr_sectors<<9))
 #endif
-			goto fail_raw_read;
+		{
+			reason = "read error";
+			goto error;
+		}
 
 		lvm_snapshot_prepare_blocks(blocks, snap_start,
 					    nr_sectors, blksize_snap);
@@ -431,7 +450,10 @@
 		if (brw_kiovec(WRITE, 1, &iobuf, snap_phys_dev,
 			       blocks, blksize_snap, 0) != (nr_sectors<<9))
 #endif
-			goto fail_raw_write;
+		{
+			reason = "write error";
+			goto error;
+		}
 	}
 
 #ifdef DEBUG_SNAPSHOT
@@ -455,22 +477,9 @@
 	return 0;
 
 	/* slow path */
- out:
+ error:
 	lvm_drop_snapshot(lv_snap, reason);
-	return 1;
+	return -1;
-
- fail_out_of_space:
-	reason = "out of space";
-	goto out;
- fail_raw_read:
-	reason = "read error";
-	goto out;
- fail_raw_write:
-	reason = "write error";
-	goto out;
- fail_blksize:
-	reason = "blocksize error";
-	goto out;
 }
 
 int lvm_snapshot_alloc_iobuf_pages(struct kiobuf * iobuf, int sectors)
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
