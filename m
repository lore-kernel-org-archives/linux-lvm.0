From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009112113.e8BLDSj27926@webber.adilger.net>
Subject: Re: [linux-lvm] LVM, partitions, RAID, and the Grand Scheme of Things
 TM
In-Reply-To: <39BA3D62.E21B13E1@gnu.org> "from Andrew Clausen at Sep 10, 2000
 00:38:42 am"
Date: Mon, 11 Sep 2000 15:13:27 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: parted@gnu.org
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Andrew Clausen writes:
> One thing: there is non-trivial interaction between the file system
> and partition table handling (not with LVM), when resizing the start
> of a partition.  Some resizers (including ext2resize, and reiserfs's
> resizer) can't resize the start, and use the partition as the
> address space.

When using LVM its not important to be able to move the beginning of
the filesystem, since you can always change the physical LE locations
without changing the filesystem itself.

What _is_ interesting, if you live in an LVM-centric world, is being
able to move the start of the filesystem a small amount into the
partition (after shrinking the end) so that you can turn the partition
into an PV/LV.  After such a conversion, you could do any normal LVM
handling of the LV/filesystem (e.g. shrink, grow, migrate).

It may just be easy enough to write a generic tool to shift the partition
contents X blocks via copying (after using an fs-specific tool to shrink
the end of the fs), and then handle the creation of the PV header,
and adding an LV of the appropriate size that covers the whole partition.
This is only really useful if you don't have enough space to duplicate
the whole partition.  Otherwise, you are just as well off creating a new
LV of the appropriate size, doing a raw copy of the filesystem to the new
LV, and deleting the old partition and/or turning it into a PV.

> So, having /sbin/resize.* isn't as elegant as it looks.  Were
> you suggesting have resize.* deal with partition table stuff?

Not at all.  The resize.* programs are filesystem specific, and only
resize from the end of the partition.  I suppose that they could be
generalized to accept an additional parameter (at the end) to give
the new start of the partition, e.g. "resize.ext2 /dev/hda1 [size] [start]"

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
