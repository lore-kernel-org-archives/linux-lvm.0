From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 11 Oct 2001 13:57:15 -0600
Subject: Re: [linux-lvm] [PATCH] fix oops when snapshots get full
Message-ID: <20011011135715.G8382@turbolinux.com>
References: <1373740000.1002822576@tiny>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1373740000.1002822576@tiny>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Oct 11, 2001  13:49 -0400, Chris Mason wrote:
> --- 0.21/drivers/md/lvm.c Sun, 07 Oct 2001 22:15:54 -0400 
> +++ 0.21(w)/drivers/md/lvm.c Mon, 08 Oct 2001 15:54:42 -0400 
> @@ -1142,7 +1142,8 @@
>  
>  	/* we must redo lvm_snapshot_remap_block in order to avoid a
>  	   race condition in the gap where no lock was held */
> -	if (!lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv) &&
> +	if (lv->lv_block_exception && 
> +	    !lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv) &&
>  	    !lvm_snapshot_COW(rdev, rsector, pe_start, rsector, vg, lv))
>  		lvm_write_COW_table_block(vg, lv);
>  
> @@ -1151,11 +1152,12 @@
>  
>  static inline void _remap_snapshot(kdev_t rdev, ulong rsector,
>  				   ulong pe_start, lv_t *lv, vg_t *vg) {
> -	int r;
> +	int r = 0;
>  
>  	/* check to see if this chunk is already in the snapshot */
>  	down_read(&lv->lv_lock);
> -	r = lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv);
> +	if (lv->lv_block_exception)
> +		r = lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv);
>  	up_read(&lv->lv_lock);

I was looking at this, and thought the following:

1) Shouldn't we just initialize r=1 in _remap_snapshot(), and then if
   lv->lv_block_exception is NULL we will not enter __remap_snapshot()
   at all?  That would remove the need to get the write semaphore for
   no reason.
2) Initially, I thought we could just "optimize" the checking of
   lv->lv_block_exception, but I supposed there are race conditions
   in dropping the read lock and getting the write lock, so I guess
   we still need to check lv->lv_block_exception in __remap_snapshot()
   also?
3) The alternative would be to check lv->lv_block_exception inside
   lvm_snapshot_remap_block() instead of in the callers (returning "1"
   if it is NULL, and we don't want to do remap).  This would avoid any
   problems in the future if someone else calls lvm_snapshot_remap_block()
   without checking lv_block_exception first.  Untested patch below which
   should be equivalent to your previous patch.

Cheers, Andreas
=========================================================================
diff -u -u -r1.7 lvm-snap.c
--- kernel/lvm-snap.c	2001/09/27 08:34:43	1.7
+++ kernel/lvm-snap.c	2001/10/11 19:55:02
@@ -157,6 +157,12 @@
 	list_add(&exception->hash, hash_table);
 }
 
+/*
+ * Determine if we already have a snapshot chunk for this block.
+ * Return: 1 if it the chunk already exists
+ *         0 if we need to COW this block and allocate a new chunk
+ *        -1 if the snapshot was disabled because it ran out of space
+ */
 int lvm_snapshot_remap_block(kdev_t * org_dev, unsigned long * org_sector,
 			     unsigned long pe_start, lv_t * lv)
 {
@@ -166,6 +172,9 @@
 	int chunk_size = lv->lv_chunk_size;
 	lv_block_exception_t * exception;
 
+	if (!lv->lv_block_exception)
+		return -1;
+
 	pe_off = pe_start % chunk_size;
 	pe_adjustment = (*org_sector-pe_off) % chunk_size;
 	__org_start = *org_sector - pe_adjustment;
diff -u -u -r1.46 lvm.c
--- kernel/lvm.c	2001/10/02 21:14:41	1.46
+++ kernel/lvm.c	2001/10/11 19:55:03
@@ -1365,10 +1359,8 @@
 		goto out;
 
 	if (lv->lv_access & LV_SNAPSHOT) { /* remap snapshot */
-		if (lv->lv_block_exception)
-			lvm_snapshot_remap_block(&rdev_map, &rsector_map,
-						 pe_start, lv);
-		else
+		if (lvm_snapshot_remap_block(&rdev_map, &rsector_map,
+					     pe_start, lv) < 0)
 			goto bad;
 
 	} else if (rw == WRITE || rw == WRITEA) { /* snapshot origin */
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
