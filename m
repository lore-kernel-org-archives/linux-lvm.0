From: Andreas Dilger <adilger@home.com>
Message-Id: <200002051705.KAA04027@webber.adilger.net>
Subject: Re: [linux-lvm] LVM release
In-Reply-To: <Pine.LNX.4.10.10002050100330.12631-100000@morannon.kdi.com> from
 "Dominic J. Eidson" at "Feb 5, 2000 01:01:45 am"
Date: Sat, 5 Feb 2000 10:05:52 -0700 (MST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Dominic J. Eidson" <sauron@the-infinite.org>
Cc: tbreuel@parc.xerox.com, Linux LVM mailing list <linux-lvm@msede.com>

Dominic writes:
>  -- The main selling point of LVM on IBM systems was that
>     it allowed resizing file systems while they were on-line;
>     with ext2, that doesn't seem to be possible. So, if they
>     have to be unmounted anyway, why not use GNU parted?
>     Are there plans for on-line resizable file systems
>     in Linux?

The resizing of the JFS filesystems and LVM are actually separate
functions, in both AIX and Linux.  LVM will only resize the "partition"
(LV), while it is up to the filesystem to resize itself.  In AIX, if
you select resizing of the LV (smitty chlv), only the LV will grow and
you will have wasted a bunch of space.  If you select resizing of the
filesystem (smitty chjfs) it will do the resize of the LV first for you,
and then resize the filesystem.

You CAN resize mounted ext2 partitions with a kernel patch to the ext2
sources, and some user space tools to help you along.  The kernel patch
is at http://www-mddsp.enel.ucalgary.ca/People/adilger/online-ext2/, and
user-space tools (ext2online and ext2prepate) are part of ext2resize,
which is part of the GNU parted you refer to above.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
