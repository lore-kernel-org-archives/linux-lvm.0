Date: Tue, 7 Nov 2000 17:45:04 +0100
From: Andrea Arcangeli <andrea@suse.de>
Subject: [linux-lvm] Re: LVM 2.2 snapshot bug
Message-ID: <20001107174504.A5834@inspiron.suse.de>
References: <20001107142152.G1276@inspiron.random> <Pine.LNX.4.05.10011071550270.28283-100000@humbolt.nl.linux.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.05.10011071550270.28283-100000@humbolt.nl.linux.org>; from riel@conectiva.com.br on Tue, Nov 07, 2000 at 03:56:59PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@conectiva.com.br>
Cc: linux-lvm@msede.com, marcelo@conectiva.com.br, "Stephen C. Tweedie" <sct@redhat.com>

On Tue, Nov 07, 2000 at 03:56:59PM +0100, Rik van Riel wrote:
> That's a bit much to type in by hand ... and it's basically
> kjournald being confused by all its writes failing on a RW
> block device.

So ext3 will crash also if I/O errors happen during the log reply.  The Oopses
seems due an _ext3_ bug (not due the missing ro_bits in the LVM snapshot)
as far I can tell.

> Indeed this is the case. When the block device is read-write
> (the is_read_only(blk_dev) is non-true) it tries to replay
> the log, even for a read-only mounted FS.

Ok, I agree it's a minor LVM bug, but again I can't see how that minor bug can
cause oopses and I think setting ro_bits won't fix the real bug but it will
only hide it.

BTW, LVM also internally checks for the LV_WRITE bitflag during open(2) so any
attempt to open the snapshot RW will fail return -EACCESS as expected.

> It's with the LVM from the Conectiva kernel RPM, which
> uses the source code from your 2.2 LVM driver.

OK.

I will fix the is_read_only thing for the snapshot but you should make sure the
bug that is oopsing your machine gets fixed too :).

Andrea
