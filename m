Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101262152.f0QLqkn16024@webber.adilger.net>
Subject: Re: [linux-lvm] Re: [lvm-devel] Keeping swap in the middle of the disk
In-Reply-To: <Pine.SOL.4.21.0101262055260.19267-100000@green.csi.cam.ac.uk> from
 Chris Wilson at "Jan 26, 2001 09:05:52 pm"
Date: Fri, 26 Jan 2001 14:52:46 -0700 (MST)
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <cdw22@hermes.cam.ac.uk>
Cc: Linux LVM mailing list <linux-lvm@sistina.com>

Chris Wilson writes:
> On Fri, 26 Jan 2001, Andreas Dilger wrote:
> > If you are expecting to swap a lot on this system, you are tuning for the
> > wrong thing.  To improve performance far more than "correct swap placement",
> > you should get more RAM instead.
> 
> I'm expecting to swap very rarely, but when I do possibly quite a lot. I
> can't really justify more ram (but point taken).

OK, seems fair, but you should probably just stick the swap at the beginning
and save a lot of effort.  I doubt the optimization would help performance
much anyways - once you start swapping heavily, you are mostly dead...

> >     lvcreate -n lvbig -i 2 -I 64k -L <whatever> vgdata /dev/hd[ac]2
> 
> All sounds very sensible up to here.

I'm glad you think so.

> > I would suggest NOT creating the whole thing as a single LV and putting
> > a filesystem on it.
> > 
> > You should specify the stripes to be on separate disks, like above,
> 
> But if I do want to have one big 88GB filesystem (which I do) then there
> doesn't seem to be a way to prevent it striping /dev/hda2 and /dev/hda4.

The point is that you don't want to have your filesystem blocks look like:

hda2 hda4 hda2 hda4 hda2 hda4   hdc2 hdc4 hdc2 hdc4 hdc2 hdc4.....

(i.e. alternate blocks striped between the two PVs on the same disk).
That would cause a lot of seeking.  It is OK if it looks like:

hda2 hdc2 hda2 hdc2 hda2 hdc2   hdc4 hda4 hdc4 hda4 hdc4 hda4.....

because this is basically the same as if you had a single large disk.

> > you should do it in 2 steps (filling the first two partitions, and then
> > moving on to the second partitions) so that you are sure the stripes
> > are across disks, instead of across partitions in the same disk.  I'm not
> > sure whether the LVM user tools check this (or even can).
> 
> Okay, but as soon as I start deleting some of the data in the first 46gig
> and replacing it then we're back with the striping across two partitions
> on the same disk problem aren't we?

But that's OK, because it is no different than if you had just two larger
PVs and the data was striped across both of them.  Any sane filesystem
(ext2 at least) works very hard to keep related inodes/bitmaps/file data
on the same part of the disk (i.e. little fragmentation).  The fact that
you have data on different parts of the disk is natural and unavoidable.

What you REALLY don't want is that the fs thinks block X, X+1, X+2, X+3
are close to each other, when in fact they alternate between opposite ends
of the disk.

However, striping is only really useful if you are doing large sequential
reads or writes (few seeks).  If you are doing random I/O, you are
probably better off NOT striping the disk, because then the disk heads
can be on opposite ends of the disk, rather than always locked together.

If you do some I/O testing you will be able to see whether striping will
actually speed up I/O on your system or not.  Don't just speculate.

> > There is no reason whatsoever to make an LV into a PV.  You would just be
> > adding more overhead to the system.
> 
> True, I'd be adding more overhead to the system. But I'd also be
> preventing the possibility of trying to stripe across two partitions on
> the same disk.

As long as you create your LV correctly, then it will behave as if you
had done this, but without the overhead.  Force the creation of the LV
on PVs /dev/hd[ac]2 first, until they are full (they should both fill
at the same time if they are the same size).  Then extend the LV to
/dev/hd[ac]4 next.  This will give you the correct behaviour.  This is
why lvcreate lets you specify the PVs to create on.  Otherwise (I suspect)
it would allocate the striped PEs in PV order, which would be hda2 and hda4.

It is difficult for LVM to verify if the PVs in a stripe are different
disks, because some devices have many minors per disk (partitions),
and some have a single disk per minor.  Some have mutliple disks for a
single minor (MD, hw RAID).  The sysadmin should know what's up.

> I will be creating a huge 88GB and would like to use LVM rather than MD
> (so that I've got the option of adding another pair of drives and
> generating a 172GB filesystem [I imagine you're 'yucking' as you read
> this! sorry!]).

I don't mind what you do.  If you really need 88GB of space, great.  If
you want to extend it to 172GB, even better.  What I was cautioning
against is just creating the whole thing at the start, when you don't
really need it.  That is a DOSism that I got away from when I worked
with LVM a lot on AIX and HPUX.  We almost always had spare PEs around
for when you just _had_ to increase /var or /tmp or /home or whatever,
and can't add a disk.

Also, reiserfs isn't perfect (as you would know if you've been reading the
reiserfs mailing list recently), so the larger the filesystem the longer
it will take to check.  Journalling is no protection against code errors.
At least with smaller filesystems a blowup should only ruin one filesystem.

> I'd still be interested to hear whether anyone has
> sucessfully used a /dev/md0 as PV for LVM?

I think Luca Berra (on this list) is doing so.  You needed some patches
for the LVM user tools to do this, but I think they are in LVM beta3.
However, MD is not worth it for striping (which LVM can do), only for RAID1
or RAID5.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
