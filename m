Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104232126.f3NLQk43002106@webber.adilger.int>
Subject: Re: [linux-lvm] Split patch sets for beta[345]
In-Reply-To: <20010423150140.B1492@66bassett.freeserve.co.uk>
 "from Joe Thornber at Apr 23, 2001 03:01:40 pm"
Date: Mon, 23 Apr 2001 15:26:46 -0600 (MDT)
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

Joe, you write:
> Andreas writes:
> > If we test pe_lock_req.lock without the lock, it is no worse than
> > any other I/O submitted a nanosecond before the PE_LOCK_UNLOCK ioctl
> > is called.  It will not cause any problems if a write goes through at
> > this point.
> 
> But locking an extent get's the semaphore, then flushes ... ohh, no it
> doesn't.  OK your code is no worse than the existing code, we need to
> think how likely this race condition is.

I don't think it is necessarily a race at all.  Consider:
- write I/O is submitted while we are in UNLOCK_PE
- pvmove LOCK_PEs the extent where that write I/O is being done
- pvmove proceeds to copy the entire existing PE to the new PE in user space

There is no problem with the write I/O because the buffer it is using
HAS to be uptodate for it to be written, so pvmove doing a read on this
buffer will get the uptodate buffer back...  or not.  Argh!  pvmove is
doing the read I/O on the underlying PV device and not the LV device
(so it does not go through the lvm_map() code at all).  This would
mean (AFAIK about the Linux buffer cache) that we are working with two
different copies of the same physical data (they are hashed by device
number and block offset or something like that).

This same problem happens when you change data in /dev/hda1, but read it
from /dev/hda - it is not guaranteed to be consistent.  Maybe we need to
call fsync_dev() at the time we set LOCK_PE?  Oh, just checked that and
we already do call fsync_dev().

In that case, my previous patch is still OK because the I/O is submitted
before PE_LOCK is set so it will be flushed to disk before pvmove reads
it.  Checking for UNLOCK_PE before getting _pe_lock is fine, because there
is only ever a single transition from UNLOCK_PE to LOCK_PE before the
queue is flushed again when we set UNLOCK_PE again.  Holding _pe_lock to
find UNLOCK_PE does not affect the outcome of the operation, because we
would just drop _pe_lock again without touching _pe_requests.

> Please stop tidying other code in your patches, it isn't part of what
> this patch is meant to do.  But I do prefer it without the '\'s and
> already changed it in CVS a while ago.

I actually figured it was at least somewhat related to this area, so
I left it in.  However, I did a CVS update just before I generated the
patch, so your change isn't in CVS AFAICS.  No big deal either way.

> > -static void _dequeue_io(struct buffer_head **bh, int *rw) {
> > -	*bh = _pe_requests;
> > -	*rw = WRITE;
> > -	if(_pe_requests) {
> > -		_pe_requests = _pe_requests->b_reqnext;
> > -		(*bh)->b_reqnext = 0;
> > +static void _dequeue_io(struct buffer_head *bh)
> > +{
> > +	while (bh) {
> > +		struct buffer_head *next = bh->b_reqnext;
> > +		bh->b_reqnext = 0;
> > +		/* resubmit this buffer head */
> > +		generic_make_request(WRITE, bh);
> > +		bh = next;
> >  	}
> >  }
> 
> Please change the name of this function to _flush_io or something.  It
> doesn't need the bh passed in, since it knows to use _pe_requests, I
> want only _queue_io/(_dequeue_io|_flush_io) to use this variable.

I was going to do as you ask, but then I saw that we either need to
call _dequeue_io from UNLOCK_PE with the _pe_lock held (because we are
modifying _pe_requests), or have a race that a new PE has been locked and
a new write I/O from this PE has already been queued before we re-get
_pe_lock, so we can't safely flush the whole queue without the lock
(which is what I intended here - we don't want lock contention while
flushing the old queue and queueing new requests at the same time).  The
other alternative is to move the whole handling of pe_lock_req from
UNLOCK_PE into "_flush_io", but this is less clear, IMHO.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
