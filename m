Date: Wed, 8 Nov 2000 00:04:50 +0100 (CET)
From: Rik van Riel <riel@conectiva.com.br>
Subject: [linux-lvm] Re: LVM 2.2 snapshot bug
In-Reply-To: <20001107174504.A5834@inspiron.suse.de>
Message-ID: <Pine.LNX.4.05.10011080001260.12418-100000@humbolt.nl.linux.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Arcangeli <andrea@suse.de>
Cc: linux-lvm@msede.com, marcelo@conectiva.com.br, "Stephen C. Tweedie" <sct@redhat.com>

On Tue, 7 Nov 2000, Andrea Arcangeli wrote:
> On Tue, Nov 07, 2000 at 03:56:59PM +0100, Rik van Riel wrote:
> > That's a bit much to type in by hand ... and it's basically
> > kjournald being confused by all its writes failing on a RW
> > block device.
> 
> So ext3 will crash also if I/O errors happen during the log reply.  
> The Oopses seems due an _ext3_ bug (not due the missing ro_bits in the
> LVM snapshot) as far I can tell.

I haven't checked yet if LVM actually returns an error
to ext3 or if it just silently (well, except for the
syslog noise) discards the data :)

> > Indeed this is the case. When the block device is read-write
> > (the is_read_only(blk_dev) is non-true) it tries to replay
> > the log, even for a read-only mounted FS.
> 
> Ok, I agree it's a minor LVM bug, but again I can't see how that minor
> bug can cause oopses and I think setting ro_bits won't fix the real
> bug but it will only hide it.

Exposing a read-only device as read-write to the users
will cause a bit of confusion, yes :)

> BTW, LVM also internally checks for the LV_WRITE bitflag during
> open(2) so any attempt to open the snapshot RW will fail return
> -EACCESS as expected.

Indeed, I saw this in my syslog...

> > It's with the LVM from the Conectiva kernel RPM, which
> > uses the source code from your 2.2 LVM driver.
> 
> OK.
> 
> I will fix the is_read_only thing for the snapshot but you should make
> sure the bug that is oopsing your machine gets fixed too :).

*nod*

Though I guess Stephen's decision to do log replay on
read-only mounted filesystems on read-write block
devices is certainly a defendable decision. Btw, don't
the reiserfs people do the same?

regards,

Rik
--
The Internet is not a network of computers. It is a network
of people. That is its real strength.

http://www.conectiva.com/		http://www.surriel.com/
