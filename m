Return-Path: <thornber@btconnect.com>
Date: Mon, 23 Apr 2001 15:01:40 +0100
Subject: Re: [linux-lvm] Split patch sets for beta[345]
Message-ID: <20010423150140.B1492@66bassett.freeserve.co.uk>
References: <20010423115850.A1188@66bassett.freeserve.co.uk> <200104231301.f3ND1OCL001586@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200104231301.f3ND1OCL001586@webber.adilger.int>; from adilger@turbolinux.com on Mon, Apr 23, 2001 at 07:01:24AM -0600
From: Joe Thornber <thornber@btconnect.com>
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

On Mon, Apr 23, 2001 at 07:01:24AM -0600, Andreas Dilger wrote:
> Joe writes:
> > > Of course, don't even think of submitting a patch which has the "set
> > > low bits on buffer pointer" for pv_move, or the whole flame-fest will
> > > start anew.
> > 
> > Yes, I need to talk to someone in authority about the new things I
> > need in the block layer.
> 
> AFAICS, we don't need anything new in the block layer, unless someone has
> strong objections to the fact we are queueing write buffers during a pv_move
> in the first place.  If you are considering 2.4 only, then you queue write
> requests, pass read requests through, and you don't need to set any flags
> anywhere.  2.4 does not have WRITEA at all.

I was talking more about snapshots.  pvmove is fine as things are.

> I'm not overly keen on how PE_UNLOCK flushes the queue afterwards (it keeps
> on getting the _pe_lock, rather than taking the whole list and flushing it
> in one go).

> I also don't like taking the _pe_lock before we even check
> if we are doing a WRITE, because of overhead.

Agreed, we could lift this out.

> I re-wrote this part to check if the PE is locked without _pe_lock,
> and then lock, recheck, and queue only if we really need the lock.

On a uniprocessor box your code is certainly better.  I just can't say
for sure on an SMP box or preemptive kernel.  Can somebody with more
knowledge please look at this ?

>  This IS the fast path for all I/O
> through LVM, so best to avoid getting a single global lock for ALL I/O!!!

If at all possible.

> If we test pe_lock_req.lock without the lock, it is no worse than
> any other I/O submitted a nanosecond before the PE_LOCK_UNLOCK ioctl
> is called.  It will not cause any problems if a write goes through at
> this point.

But locking an extent get's the semaphore, then flushes ... ohh, no it
doesn't.  OK your code is no worse than the existing code, we need to
think how likely this race condition is.

>  	pe_lock_req.lock = UNLOCK_PE;
> -	pe_lock_req.data.lv_dev = \
> -	pe_lock_req.data.pv_dev = \
> +	pe_lock_req.data.lv_dev = 0;
> +	pe_lock_req.data.pv_dev = 0;
>  	pe_lock_req.data.pv_offset = 0;

Please stop tidying other code in your patches, it isn't part of what
this patch is meant to do.  But I do prefer it without the '\'s and
already changed it in CVS a while ago.

> -static void _dequeue_io(struct buffer_head **bh, int *rw) {
> -	*bh = _pe_requests;
> -	*rw = WRITE;
> -	if(_pe_requests) {
> -		_pe_requests = _pe_requests->b_reqnext;
> -		(*bh)->b_reqnext = 0;
> +static void _dequeue_io(struct buffer_head *bh)
> +{
> +	while (bh) {
> +		struct buffer_head *next = bh->b_reqnext;
> +		bh->b_reqnext = 0;
> +		/* resubmit this buffer head */
> +		generic_make_request(WRITE, bh);
> +		bh = next;
>  	}
>  }

Please change the name of this function to _flush_io or something.  It
doesn't need the bh passed in, since it knows to use _pe_requests, I
want only _queue_io/(_dequeue_io|_flush_io) to use this variable.

When these changes are done this patch will be gladly accepted into CVS.

Thanks,

- Joe Thornber
