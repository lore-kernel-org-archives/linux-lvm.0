Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1J2Cii22217
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 21:12:44 -0500
From: Miquel van Smoorenburg <miquels@cistron.nl>
Message-ID: <20040219021159.GE30621@drinkel.cistron.nl>
References: <20040216131609.GA21974@cistron.nl> <20040216133047.GA9330@suse.de> <20040217145716.GE30438@traveler.cistron.net> <20040218235243.GA30621@drinkel.cistron.nl> <20040218172622.52914567.akpm@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20040218172622.52914567.akpm@osdl.org> (from akpm@osdl.org on Thu, Feb 19, 2004 at 02:26:22 +0100)
Subject: [linux-lvm] Re: IO scheduler, queue depth, nr_requests
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
Date: Thu Feb 19 09:08:46 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: Miquel van Smoorenburg <miquels@cistron.nl>, axboe@suse.demiquels@cistron.nl, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, thornber@redhat.com

On Thu, 19 Feb 2004 02:26:22, Andrew Morton wrote:
> Miquel van Smoorenburg <miquels@cistron.nl> wrote:
> >
> > On Tue, 17 Feb 2004 15:57:16, Miquel van Smoorenburg wrote:
> > > For some reason, when using LVM, write requests get queued out
> > > of order to the 3ware controller, which results in quite a bit
> > > of seeking and thus performance loss.
> > [..]
> > > Okay I repeated some earlier tests, and I added some debug code in
> > > several places.
> > > 
> > > I added logging to tw_scsi_queue() in the 3ware driver to log the
> > > start sector and length of each request. It logs something like:
> > > 3wdbg: id 119, lba = 0x2330bc33, num_sectors = 256
> > > 
> > > With a perl script, I can check if the requests are sent to the
> > > host in order. That outputs something like this:
> > > 
> > > Consecutive: start 1180906348, length 7936 sec (3968 KB), requests: 31
> > > Consecutive: start 1180906340, length 8 sec (4 KB), requests: 1
> > > Consecutive: start 1180914292, length 7936 sec (3968 KB), requests: 31
> > > Consecutive: start 1180914284, length 8 sec (4 KB), requests: 1
> > > Consecutive: start 1180922236, length 7936 sec (3968 KB), requests: 31
> > > Consecutive: start 1180922228, length 8 sec (4 KB), requests: 1
> > > Consecutive: start 1180930180, length 7936 sec (3968 KB), requests: 31
> 
> 3968 / 31 = 128 exactly.  I think when you say "requests: 31" you are
> actually referring to a single request which has 31 128k BIOs in it, yes?

No, I'm actually referring to a struct request. I'm logging this in the
SCSI layer, in scsi_request_fn(), just after elv_next_request(). I have
in fact logged all the bio's submitted to __make_request, and the output
of the elevator from elv_next_request(). The bio's are submitted sequentially,
the resulting requests aren't. But this is because nr_requests is 128, while
the 3ware device has a queue of 254 entries (no tagging though). Upping
nr_requests to 512 makes this go away ..

That shouldn't be necessary though. I only see this with LVM over 3ware-raid5,
not on the 3ware-raid5 array directly (/dev/sda1). And it gets less troublesome
with a lot of debugging (unless I set nr_requests lower again), which points
to a timing issue.


> > > See, 31 requests in order, then one request "backwards", then 31 in order, etc.
> > 
> > I found out what causes this. It's get_request_wait().
> > 
> > When the request queue is full, and a new request needs to be created,
> > __make_request() blocks in get_request_wait().
> > 
> > Another process wakes up first (pdflush / process submitting I/O itself /
> > xfsdatad / etc) and sends the next bio's to __make_request().
> > In the mean time some free requests have become available, and the bios
> > are merged into a new request. Those requests are submitted to the device.
> > 
> > Then, get_request_wait() returns but the bio is not mergeable anymore -
> > and that results in a backwards seek, severely limiting the I/O rate.
> > 
> > Wouldn't it be better to allow the request allocation and queue the
> > request, and /then/ put the process to sleep ? The queue will grow larger
> > than nr_requests, but it does that anyway.
> 
> That would help, but is a bit kludgy.

Patch that does exactly this (it's probably butt-ugly, but it proves the
point) below.

> What _should_ have happened was:
> 
> a) The queue gets plugged
> 
> b) The maximal-sized 31-bio request is queued
> 
> c) The 4k request gets inserted *before* the 3968k request
> 
> d) The queue gets unplugged, and both requests stream smoothly.
> 
> (And this assumes that the queue was initially empty.  ALmost certainly
> that was not the case).

The thing is, the bio's are submitted perfectly sequentially. It's just that
every so often a request (with just its initial bio) gets stuck for a while.
Because the bio's after it are merged and sent to the device, it's not
possible to merge that stuck request later on when it gets unstuck, because
the other bio's have already left the building so to speak.

I'm not using MD at all, and I tried all elevators. All the same results,
so I stayed with elevator=noop because it's so much easier to understand ;)

This proof-of-concept patch fixes things:

ll_rw_blk.c.patch

(Hmm, 03:11, time to go to bed. I'm happy I finally found this though!)

--- linux-2.6.3/drivers/block/ll_rw_blk.c.ORIG	2004-02-04 04:43:10.000000000 +0100
+++ linux-2.6.3/drivers/block/ll_rw_blk.c	2004-02-19 02:51:06.000000000 +0100
@@ -1545,7 +1545,8 @@
 /*
  * Get a free request, queue_lock must not be held
  */
-static struct request *get_request(request_queue_t *q, int rw, int gfp_mask)
+static struct request *get_request(request_queue_t *q, int rw,
+					int gfp_mask, int *qfull)
 {
 	struct request *rq = NULL;
 	struct request_list *rl = &q->rq;
@@ -1569,10 +1570,15 @@
 			&& !ioc_batching(ioc) && !elv_may_queue(q, rw)) {
 		/*
 		 * The queue is full and the allocating process is not a
-		 * "batcher", and not exempted by the IO scheduler
+		 * "batcher", and not exempted by the IO scheduler.
+		 * If "qfull" is a valid pointer, set it to 1 to return
+		 * this info to the caller so that it can sleep.
 		 */
-		spin_unlock_irq(q->queue_lock);
-		goto out;
+		if (qfull == NULL) {
+			spin_unlock_irq(q->queue_lock);
+			goto out;
+		} else
+			*qfull = 1;
 	}
 
 	rl->count[rw]++;
@@ -1627,7 +1633,7 @@
  * No available requests for this queue, unplug the device and wait for some
  * requests to become available.
  */
-static struct request *get_request_wait(request_queue_t *q, int rw)
+static struct request *get_request_wait(request_queue_t *q, int rw, int wantreq)
 {
 	DEFINE_WAIT(wait);
 	struct request *rq;
@@ -1639,7 +1645,7 @@
 		prepare_to_wait_exclusive(&rl->wait[rw], &wait,
 				TASK_UNINTERRUPTIBLE);
 
-		rq = get_request(q, rw, GFP_NOIO);
+		rq = wantreq ? get_request(q, rw, GFP_NOIO, NULL) : NULL;
 
 		if (!rq) {
 			struct io_context *ioc;
@@ -1657,7 +1663,7 @@
 			put_io_context(ioc);
 		}
 		finish_wait(&rl->wait[rw], &wait);
-	} while (!rq);
+	} while (!rq && wantreq);
 
 	return rq;
 }
@@ -1669,9 +1675,9 @@
 	BUG_ON(rw != READ && rw != WRITE);
 
 	if (gfp_mask & __GFP_WAIT)
-		rq = get_request_wait(q, rw);
+		rq = get_request_wait(q, rw, 1);
 	else
-		rq = get_request(q, rw, gfp_mask);
+		rq = get_request(q, rw, gfp_mask, NULL);
 
 	return rq;
 }
@@ -2002,6 +2008,7 @@
 	struct request *req, *freereq = NULL;
 	int el_ret, rw, nr_sectors, cur_nr_sectors, barrier, ra;
 	sector_t sector;
+	int qfull;
 
 	sector = bio->bi_sector;
 	nr_sectors = bio_sectors(bio);
@@ -2023,6 +2030,7 @@
 	ra = bio->bi_rw & (1 << BIO_RW_AHEAD);
 
 again:
+	qfull = 0;
 	spin_lock_irq(q->queue_lock);
 
 	if (elv_queue_empty(q)) {
@@ -2096,14 +2104,15 @@
 		freereq = NULL;
 	} else {
 		spin_unlock_irq(q->queue_lock);
-		if ((freereq = get_request(q, rw, GFP_ATOMIC)) == NULL) {
+		freereq = get_request(q, rw, GFP_ATOMIC, ra ? NULL : &qfull);
+		if (freereq == NULL) {
 			/*
 			 * READA bit set
 			 */
 			if (ra)
 				goto end_io;
 	
-			freereq = get_request_wait(q, rw);
+			freereq = get_request_wait(q, rw, 1);
 		}
 		goto again;
 	}
@@ -2141,6 +2150,13 @@
 	req->start_time = jiffies;
 
 	add_request(q, req);
+
+	if (qfull) {
+		spin_unlock_irq(q->queue_lock);
+		get_request_wait(q, rw, 0);
+		spin_lock_irq(q->queue_lock);
+	}
+
 out:
 	if (freereq)
 		__blk_put_request(q, freereq);
