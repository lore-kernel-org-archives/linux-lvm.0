Date: Tue, 7 Nov 2000 20:51:37 +0100
From: Andrea Arcangeli <andrea@suse.de>
Subject: [linux-lvm] Re: LVM 2.2 snapshot bug
Message-ID: <20001107205137.A7093@inspiron.suse.de>
References: <20001107142152.G1276@inspiron.random> <Pine.LNX.4.05.10011071550270.28283-100000@humbolt.nl.linux.org> <20001107174504.A5834@inspiron.suse.de> <20001107170420.D12477@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001107170420.D12477@redhat.com>; from sct@redhat.com on Tue, Nov 07, 2000 at 05:04:20PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Stephen C. Tweedie" <sct@redhat.com>
Cc: Rik van Riel <riel@conectiva.com.br>, linux-lvm@msede.com, marcelo@conectiva.com.br

On Tue, Nov 07, 2000 at 05:04:20PM +0000, Stephen C. Tweedie wrote:
> The current ext3 includes debugging code to trap invariants which the
> filesystem expects to be guaranteed, and it's entirely possible that
> their over-cautious checking is trapping on such failed writes.  Send
> me an oops and I can deal with it.

I don't have the Oops (I asked for it too) but Rik should have it.

> > > Indeed this is the case. When the block device is read-write
> > > (the is_read_only(blk_dev) is non-true) it tries to replay
> > > the log, even for a read-only mounted FS.
> > 
> > Ok, I agree it's a minor LVM bug, but again I can't see how that minor bug can
> > cause oopses and I think setting ro_bits won't fix the real bug but it will
> > only hide it.
> 
> It's a major bug as far as ext3 is concerned, because filesystem
> recovery is a critical prerequisite for mounting a filesystem, and
> that requires write access.  ext3 has to be able to trust the ro bits
> in order to know whether it is safe to perform recovery writes for a
> mount, or whether the mount must be rejected because recovery cannot
> take place.

Stephen, the floppy device is doing exactly the same thing of LVM.
I don't think it's a major bug. The _only_ downside of the bug is that
it will generate I/O errors when you try to write to the device via
ll_rw_block (no oopses, no corruption), and those I/O errors will happen
anyways in real world too with real harddisk so we must able to cope with them
regardless.

The bug that hurted Rik is ext3 that is not able to deal with I/O error
properly during recovery and if you fix that, then LVM snapshot not setting
ro_bits will be a minor problem IMHO.

Infact I'm not even sure if it worth to have LVM snapshot to set ro_bits
given it will soon become a writeable snapshot (so that we can do recovery
on it too :).

Andrea
