Date: Wed, 8 Nov 2000 11:10:28 +0000
From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: [linux-lvm] Re: LVM 2.2 snapshot bug
Message-ID: <20001108111028.F11411@redhat.com>
References: <20001107142152.G1276@inspiron.random> <Pine.LNX.4.05.10011071550270.28283-100000@humbolt.nl.linux.org> <20001107174504.A5834@inspiron.suse.de> <20001107170420.D12477@redhat.com> <20001107205137.A7093@inspiron.suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001107205137.A7093@inspiron.suse.de>; from andrea@suse.de on Tue, Nov 07, 2000 at 08:51:37PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Arcangeli <andrea@suse.de>
Cc: "Stephen C. Tweedie" <sct@redhat.com>, Rik van Riel <riel@conectiva.com.br>, linux-lvm@msede.com, marcelo@conectiva.com.br

Hi,

On Tue, Nov 07, 2000 at 08:51:37PM +0100, Andrea Arcangeli wrote:
> On Tue, Nov 07, 2000 at 05:04:20PM +0000, Stephen C. Tweedie wrote:
> > It's a major bug as far as ext3 is concerned, because filesystem
> > recovery is a critical prerequisite for mounting a filesystem, and
> > that requires write access.  ext3 has to be able to trust the ro bits
> > in order to know whether it is safe to perform recovery writes for a
> > mount, or whether the mount must be rejected because recovery cannot
> > take place.
> 
> Stephen, the floppy device is doing exactly the same thing of LVM.

"floppy.c has this bug so it's OK for a major storage infrastructure
device to have the same bug."  Hmm!

> I don't think it's a major bug. The _only_ downside of the bug is that
> it will generate I/O errors when you try to write to the device via
> ll_rw_block (no oopses, no corruption)

Worse --- it's the difference between having the kernel tell the user
"sorry, this operation is not possible" and saying "sure, fine"
followed by a thousand IO errors in the syslog when the user tries to
mount the ext3 filesystem.  Journal recovery can generate several
megabytes of write requests, and each request is going to fail
noisily (failing writes silently during recovery is not an option).

Cheers,
 Stephen
