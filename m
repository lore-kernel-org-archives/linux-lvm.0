From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011132237.eADMbH729119@webber.adilger.net>
Subject: Re: [linux-lvm] Removing a PV
In-Reply-To: <Pine.BSO.4.21.0011131545220.14526-100000@loonybin.loonybin.net>
 "from Rob Foehl at Nov 13, 2000 03:58:37 pm"
Date: Mon, 13 Nov 2000 15:37:16 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Foehl <rob@loonybin.net>
Cc: Luca Berra <bluca@comedia.it>, linux-lvm@msede.com

Rob Foehl writes:
> I'd assumed that was the correct command sequence, but does lvreduce
> ensure that the filesystem won't be damaged? Ie. does it only remove LE's
> from the end of the LV, or what?

Yes, the LEs are logically numbered, so they are always added to and removed
from the end of the device.  That makes it much easier on the filesystem
because it doesn't need to ever deal with the blocks at the start of the
filesystem changing.  However, since they are "logical" blocks, they
can be physically moved between disks without affecting the filesystem.

As for removing a disk with a filesystem from an existing VG - you have
to realize that there is still LVM information at the start of the disk
even if you remove it from the VG, so you will not be able to use it as-is
on another system.

Rather than doing an lvreduce/pvmove/vgreduce (as previously suggested),
you should do a pvmove to move all of the LEs from the desired filesystem
into a single PV (it may already be this way) and also move all of the
undesired LEs from this PV onto other PVs in the VG (use pvdisplay -v and
lvdisplay -v to find out the layout).  Then use vgsplit to create two
new VGs - the new one being the single filesystem/disk you want to move.
You can then export the VG from the current system and import it to the
new system.

If you are not going to use LVM on the new system, then simply pvmove all
of the LEs from one of your disks and vgreduce this PV from the VG.  Then
use fdisk to make a new partition on the disk, and dd to copy from the
old LV to the new partition.  This way you will also have a backup of the
data should anything go wrong (which you should probably have on tape as
well).

Cheers, Andreas


> On Mon, 13 Nov 2000, Luca Berra wrote:
> 
> > On Mon, Nov 13, 2000 at 01:12:23PM -0500, Rob Foehl wrote:
> > > If I want to completely pull a drive that belongs to a VG with an ext2
> > > formatted LV in it, what's the correct procedure to avoid mangling the
> > > filesystem? I currently have a 130 gig partition spread over six
> > > drives.. about 74 gigs is in use, and I wanted to remove a single 20 gig
> > > drive from the volume.. I'm assuming I should shrink the filesystem by
> > > around 30 gigs or so (to be safe), then somehow also shrink the LV and
> > > move any used PEs on the 20 gig drive in question onto freed space on
> > > other drives.. Any suggestions would be greatly appreciated.
> > 
> > ext2resize/resize2fs
> > lvreduce
> > pvmove
> > vgreduce
> > 
> > 
> > -- 
> > Luca Berra -- bluca@comedia.it
> >     Communication Media & Services S.r.l.
> > 
> 
> 


-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
