Return-Path: <thornber@btconnect.com>
Date: Tue, 24 Apr 2001 08:48:33 +0100
Subject: Re: [linux-lvm] Split patch sets for beta[345]
Message-ID: <20010424084832.A730@66bassett.freeserve.co.uk>
References: <20010423150140.B1492@66bassett.freeserve.co.uk> <200104232126.f3NLQk43002106@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200104232126.f3NLQk43002106@webber.adilger.int>; from adilger@turbolinux.com on Mon, Apr 23, 2001 at 03:26:46PM -0600
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

On Mon, Apr 23, 2001 at 03:26:46PM -0600, Andreas Dilger wrote:
> Joe, you write:
> > Please change the name of this function to _flush_io or something.  It
> > doesn't need the bh passed in, since it knows to use _pe_requests, I
> > want only _queue_io/(_dequeue_io|_flush_io) to use this variable.
> 
> I was going to do as you ask, but then I saw that we either need to
> call _dequeue_io from UNLOCK_PE with the _pe_lock held (because we are
> modifying _pe_requests), or have a race that a new PE has been locked and
> a new write I/O from this PE has already been queued before we re-get
> _pe_lock, so we can't safely flush the whole queue without the lock
> (which is what I intended here - we don't want lock contention while
> flushing the old queue and queueing new requests at the same time).  The
> other alternative is to move the whole handling of pe_lock_req from
> UNLOCK_PE into "_flush_io", but this is less clear, IMHO.

I went through a similar thought process, which is why the locking
around an individual queue items went back in.  Does locking and
unlocking this semaphore really give that much of a performance hit ?
Remember that this isn't a main path for IO, in fact performance is
going to be sucky at this point because we're doing a pvmove (until we
put code in to throttle pvmoves).

I really do want how the queuing is done abstracted away behind
_queue_io/_dequeue_io, so all references to _pe_requests must stay in
these.

- Joe
