From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199910172117.PAA28130@webber.adilger.net>
Subject: [linux-lvm] Re: ext2 online resizer available
Date: Sun, 17 Oct 1999 15:17:23 -0600 (MDT)
In-Reply-To: <199910172057.WAA20340@wsdw01.win.tue.nl> from "Guest section DW" at Oct 17, 99 10:57:13 pm
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Guest section DW <dwguest@win.tue.nl>
Cc: Linux LVM mailing list <linux-lvm@msede.com>, Linux FS development list <linux-fsdevel@vger.rutgers.edu>

Andries writes:
> Such things are possible these days.
> Find a recent kernel and a recent util-linux (source) distribution.
> In the fdisk directory you'll find tiny utilities addpart.c and delpart.c
> that will add and remove partitions on a disk that is otherwise in use.

The issue isn't being able to add and remove other partitions on a disk,
but rather to change the size of the underlying partition for a filesystem
that is currently mounted.  I tried again with util-linux-2.9g, but the
kernel still thinks the partition is the old size.  I will have to look
into this to see if it is possible to update the kernel partition info
for the mounted partition with an IOCTL.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
