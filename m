Date: Tue, 7 Nov 2000 17:04:20 +0000
From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: [linux-lvm] Re: LVM 2.2 snapshot bug
Message-ID: <20001107170420.D12477@redhat.com>
References: <20001107142152.G1276@inspiron.random> <Pine.LNX.4.05.10011071550270.28283-100000@humbolt.nl.linux.org> <20001107174504.A5834@inspiron.suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001107174504.A5834@inspiron.suse.de>; from andrea@suse.de on Tue, Nov 07, 2000 at 05:45:04PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Arcangeli <andrea@suse.de>
Cc: Rik van Riel <riel@conectiva.com.br>, linux-lvm@msede.com, marcelo@conectiva.com.br, "Stephen C. Tweedie" <sct@redhat.com>

Hi,

On Tue, Nov 07, 2000 at 05:45:04PM +0100, Andrea Arcangeli wrote:
> On Tue, Nov 07, 2000 at 03:56:59PM +0100, Rik van Riel wrote:
> > That's a bit much to type in by hand ... and it's basically
> > kjournald being confused by all its writes failing on a RW
> > block device.
> 
> So ext3 will crash also if I/O errors happen during the log reply.  The Oopses
> seems due an _ext3_ bug (not due the missing ro_bits in the LVM snapshot)
> as far I can tell.

The current ext3 includes debugging code to trap invariants which the
filesystem expects to be guaranteed, and it's entirely possible that
their over-cautious checking is trapping on such failed writes.  Send
me an oops and I can deal with it.

> > Indeed this is the case. When the block device is read-write
> > (the is_read_only(blk_dev) is non-true) it tries to replay
> > the log, even for a read-only mounted FS.
> 
> Ok, I agree it's a minor LVM bug, but again I can't see how that minor bug can
> cause oopses and I think setting ro_bits won't fix the real bug but it will
> only hide it.

It's a major bug as far as ext3 is concerned, because filesystem
recovery is a critical prerequisite for mounting a filesystem, and
that requires write access.  ext3 has to be able to trust the ro bits
in order to know whether it is safe to perform recovery writes for a
mount, or whether the mount must be rejected because recovery cannot
take place.

Cheers,
 Stephen
