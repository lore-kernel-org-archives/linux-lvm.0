From: Andreas Dilger <adilger@home.com>
Message-Id: <199912221602.JAA22165@webber.adilger.net>
Subject: Re: [linux-lvm] booting w/o initrd
Date: Wed, 22 Dec 1999 09:02:53 -0700 (MST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Ulf writes:
> Imagine a LV lying in some VG of your PV.
> This LV has to be allocated in a continuous range of PEs, especially it
> must not cross the border between two disks.  With these requirements
> fullfilled, the LV could be described completely by the number of
> the its beginning sector on the disk and its length in sectors.

This is what IBM also needs for its "boot LV".  It is required that the
BLV is contiguous on one disk.  Normally, it only needs to be 1 PP in size,
but it can sometimes grow to 2 PPs in size.  I think Linux should have
enough space in 4/8 MB for a boot partition considering Tom's root/boot
disk has a whole system on 1.8MB floppy...

> But what if ... you want to resize the root?

> Even when booting via initrd, you cannot resize the root while it is
> mounted.

Actually, it IS possible to resize mounted ext2 filesystems with my
online resize tools (LVM is required, of course).  Have a look at:
http://www-mddsp.enel.ucalgary.ca/People/adilger/online-ext2/

for more information.

Good luck on your project.  I think this is a much better solution than
using initrd, since it is more like a normal system.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
