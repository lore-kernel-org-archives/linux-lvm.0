Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104231301.f3ND1OCL001586@webber.adilger.int>
Subject: Re: [linux-lvm] Split patch sets for beta[345]
In-Reply-To: <20010423115850.A1188@66bassett.freeserve.co.uk>
 "from Joe Thornber at Apr 23, 2001 11:58:50 am"
Date: Mon, 23 Apr 2001 07:01:24 -0600 (MDT)
MIME-Version: 1.0
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

Joe writes:
> > Of course, don't even think of submitting a patch which has the "set
> > low bits on buffer pointer" for pv_move, or the whole flame-fest will
> > start anew.
> 
> Yes, I need to talk to someone in authority about the new things I
> need in the block layer.

AFAICS, we don't need anything new in the block layer, unless someone has
strong objections to the fact we are queueing write buffers during a pv_move
in the first place.  If you are considering 2.4 only, then you queue write
requests, pass read requests through, and you don't need to set any flags
anywhere.  2.4 does not have WRITEA at all.

I'm not overly keen on how PE_UNLOCK flushes the queue afterwards (it keeps
on getting the _pe_lock, rather than taking the whole list and flushing it
in one go).  I also don't like taking the _pe_lock before we even check
if we are doing a WRITE, because of overhead.  I re-wrote this part to
check if the PE is locked without _pe_lock, and then lock, recheck, and
queue only if we really need the lock.  This IS the fast path for all I/O
through LVM, so best to avoid getting a single global lock for ALL I/O!!!

If we test pe_lock_req.lock without the lock, it is no worse than
any other I/O submitted a nanosecond before the PE_LOCK_UNLOCK ioctl
is called.  It will not cause any problems if a write goes through at
this point.

Cheers, Andreas
=========================================================================
diff -u -u -r1.7.2.96 lvm.c
--- kernel/lvm.c	2001/04/11 19:08:58	1.7.2.96
+++ kernel/lvm.c	2001/04/23 12:47:26
@@ -599,8 +592,8 @@
 	lvm_lock = lvm_snapshot_lock = SPIN_LOCK_UNLOCKED;
 
 	pe_lock_req.lock = UNLOCK_PE;
-	pe_lock_req.data.lv_dev = \
-	pe_lock_req.data.pv_dev = \
+	pe_lock_req.data.lv_dev = 0;
+	pe_lock_req.data.pv_dev = 0;
 	pe_lock_req.data.pv_offset = 0;
 
 	/* Initialize VG pointers */
@@ -1267,29 +1271,30 @@
 		      rsector_map, stripe_length, stripe_index);
 	}
 
-	/* handle physical extents on the move */
-	down(&_pe_lock);
-	if((pe_lock_req.lock == LOCK_PE) &&
-	   (rdev_map == pe_lock_req.data.pv_dev) &&
-	   (rsector_map >= pe_lock_req.data.pv_offset) &&
-	   (rsector_map < (pe_lock_req.data.pv_offset + vg_this->pe_size)) &&
-#if LINUX_VERSION_CODE >= KERNEL_VERSION ( 2, 4, 0)
-	   (rw == WRITE)) {
-#else
-	   ((rw == WRITE) || (rw == WRITEA))) {
-#endif
-		_queue_io(bh, rw);
-		up(&_pe_lock);
-		up(&lv->lv_snapshot_sem);
-		return 0;
-	}
-	up(&_pe_lock);
+	/*
+	 * Queue writes to physical extents on the move until move completes.
+	 * Don't get _pe_lock until there is a reasonable expectation that
+	 * we need to queue this request, because this is in the fast path.
+	 */
+	if (rw == WRITE || rw == WRITEA) {
+		if (pe_lock_req.lock == LOCK_PE) {
+			down(&_pe_lock);
+			if ((pe_lock_req.lock == LOCK_PE) &&
+			    (rdev_map == pe_lock_req.data.pv_dev) &&
+			    (rsector_map >= pe_lock_req.data.pv_offset) &&
+			    (rsector_map < (pe_lock_req.data.pv_offset +
+					    vg_this->pe_size))) {
+				_queue_io(bh, rw);
+				up(&_pe_lock);
+				up(&lv->lv_snapshot_sem);
+				return 0;
+			}
+			up(&_pe_lock);
+		}
 
-	/* statistic */
-	if (rw == WRITE || rw == WRITEA)
-		lv->lv_current_pe[index].writes++;
-	else
-		lv->lv_current_pe[index].reads++;
+		lv->lv_current_pe[index].writes++;	/* statistic */
+	} else
+		lv->lv_current_pe[index].reads++;	/* statistic */
 
 	/* snapshot volume exception handling on physical device
            address base */
@@ -1430,7 +1435,6 @@
 {
 	pe_lock_req_t new_lock;
 	struct buffer_head *bh;
-	int rw;
 	uint p;
 
 	if (vg_ptr == NULL) return -ENXIO;
@@ -1439,9 +1443,6 @@
 
 	switch (new_lock.lock) {
 	case LOCK_PE:
-		if(pe_lock_req.lock == LOCK_PE)
-			return -EBUSY;
-
 		for (p = 0; p < vg_ptr->pv_max; p++) {
 			if (vg_ptr->pv[p] != NULL &&
 			    new_lock.data.pv_dev == vg_ptr->pv[p]->pv_dev)
@@ -1449,16 +1450,18 @@
 		}
 		if (p == vg_ptr->pv_max) return -ENXIO;
 
-		pe_lock_req = new_lock;
-
-		down(&_pe_lock);
-		pe_lock_req.lock = UNLOCK_PE;
-		up(&_pe_lock);
-
 		fsync_dev(pe_lock_req.data.lv_dev);
 
 		down(&_pe_lock);
+		if (pe_lock_req.lock == LOCK_PE) {
+			up(&_pe_lock);
+			return -EBUSY;
+		}
+		/* Should we do to_kdev_t() on the pv_dev and lv_dev??? */
 		pe_lock_req.lock = LOCK_PE;
+		pe_lock_req.data.lv_dev = new_lock_req.data.lv_dev;
+		pe_lock_req.data.pv_dev = new_lock_req.data.pv_dev;
+		pe_lock_req.data.pv_offset = new_lock_req.data.pv_offset;
 		up(&_pe_lock);
 		break;
 
@@ -1468,17 +1471,12 @@
 		pe_lock_req.data.lv_dev = 0;
 		pe_lock_req.data.pv_dev = 0;
 		pe_lock_req.data.pv_offset = 0;
-		_dequeue_io(&bh, &rw);
+		bh = _pe_requests;
+		_pe_requests = 0;
 		up(&_pe_lock);
 
 		/* handle all deferred io for this PE */
-		while(bh) {
-			/* resubmit this buffer head */
-			generic_make_request(rw, bh);
-			down(&_pe_lock);
-			_dequeue_io(&bh, &rw);
-			up(&_pe_lock);
-		}
+		_dequeue_io(bh);
 		break;
 
 	default:
@@ -2814,12 +2836,14 @@
 	_pe_requests = bh;
 }
 
-static void _dequeue_io(struct buffer_head **bh, int *rw) {
-	*bh = _pe_requests;
-	*rw = WRITE;
-	if(_pe_requests) {
-		_pe_requests = _pe_requests->b_reqnext;
-		(*bh)->b_reqnext = 0;
+static void _dequeue_io(struct buffer_head *bh)
+{
+	while (bh) {
+		struct buffer_head *next = bh->b_reqnext;
+		bh->b_reqnext = 0;
+		/* resubmit this buffer head */
+		generic_make_request(WRITE, bh);
+		bh = next;
 	}
 }
 
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
