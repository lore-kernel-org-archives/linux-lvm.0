Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101262008.f0QK8F715746@webber.adilger.net>
Date: Fri, 26 Jan 2001 13:08:15 -0700 (MST)
Subject: [linux-lvm] Re: [lvm-devel] Keeping swap in the middle of the disk
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
To: Linux LVM mailing list <linux-lvm@sistina.com>

Chris Wilson writes:
> I've just bought a pair of 46 gig UDMA 100 IDE disks and I'd like to
> stripe data across them for speed. I'd also like to have some swap
> space. Naturally I'd like this too to be fast, the linux kernel already
> stripes data across swap partitions with the same priority - so problem
> solved, one partition on each drive. Now the problem - in order to keep
> seek times down for the swap partitions, it's got to sit in the middle of
> the disk (so average distance from the disk-head to the swap partition is
> low).

If you are expecting to swap a lot on this system, you are tuning for the
wrong thing.  To improve performance far more than "correct swap placement",
you should get more RAM instead.

> Each disk is partitioned as follows:

>  hda1     hda2      hda3     hda4
> <32 meg> <22 gig> <256 meg> <22 gig>

So what you do is:

    pvcreate /dev/hd[ac][234]

then create 1 or 2 volume groups.  You may want 2 VGs because you can't
have different PE sizes within a single VG, and for small partitions
you may end up losing a fair percent of disk space if you make the PEs
large enough for your other partitions.  So continuing:

    vgcreate -s 1M vgswap /dev/hd[ac]3
    vgcreate -s 32M vgdata /dev/hd[ac][24]

    lvcreate -n lvswap1 -l <approx 255 PEs, see pvdisplay > vgswap /dev/hda3
    lvcreate -n lvswap2 -l <approx 255 PEs, see pvdisplay > vgswap /dev/hdc3

Let the kernel do the swap striping.  This way you have some flexibility
in case you have too much swap space you can remove one of the swaps, or
if you need more, you can add it in (can't do that with LVM without
adding #disks == #stipes to the swap LV or performance will again suck).

    lvcreate -n lvbig -i 2 -I 64k -L <whatever> vgdata /dev/hd[ac]2

I would suggest NOT creating the whole thing as a single LV and putting
a filesystem on it.  That _severely_ limits your flexibility, and chances
are you don't need 88GB of space all at once anyways.  When you need more
space, simply extend the LV and resize the filesystem.  Reiserfs can do
that while it is mounted.  You could also create another LV+filesystem and
mount it somewhere else, which is usually more convenient.  Don't get stuck
in the old "DOS partition" mindframe where you need to set everything
up at the beginning.  With LVM you can change your mind if you want, and
you don't have to "use" all of your PEs when you start, save some for later.

You should specify the stripes to be on separate disks, like above,
otherwise your performance will suck really badly.  I'm not sure you
will get a performance gain even with striping.  You may also want to
run bonnie++ with and without striping, and try different stripe sizes
(maybe up to 256k) and to see what is good.  If you reported your
performance back to us, it would be even better.

    lvextend -n lvbig -i 2 -I 64k -L <whatever> vgdata /dev/hd[ac]4

If you DO want to make a huge 88GB filesystem (against all common sense),
you should do it in 2 steps (filling the first two partitions, and then
moving on to the second partitions) so that you are sure the stripes
are across disks, instead of across partitions in the same disk.  I'm not
sure whether the LVM user tools check this (or even can).

> The two drives are hda and hdc. I'd hoped it might be possible to create a
> Logical Volume from hda2 and hda4, and one from hdc2 and hdc4. Then use
> them as Physical Volumes to create an 88gig Logical Volume for my reiser
> filesystem.

There is no reason whatsoever to make an LV into a PV.  You would just be
adding more overhead to the system.  You can use the PEs from a PV in any
way you want (although the current LVM doesn't let you specify this very
well).  In AIX, you can give a "map" to lvcreate and it will use only
specific PEs, so you wouldn't need to do the hokey partitioning to get swap
in the middle of the disk.

> My options after trying quite a few things and typing to 'roadrunner
> lewis@sistina.com' on IRC appear to be:
> - Move the swap partition to one end of the disk and live with higher seek
> times.

Probably the easiest.  You don't want to be swapping anyways.

> - Not bother striping across the two disks

Probably won't help anyways.

> - Stripe across all 4 partitions [sloooow...]

Yuck.

> - Use MD to do linear append of hda2, hda4 and hdc2, hdc4 then use LVM
>   with the md0 and md1.

I think MD will also let you do append + stripe, but I'm not sure.  If
you are just going to create a huge 88GB filesystem, you may as well not
be using LVM.

> Please someone tell me there's another way!!! Surely this isn't such an
> unreasonable request?

Yes, no.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
