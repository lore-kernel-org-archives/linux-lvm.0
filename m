Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200106040340.f543eKBD005168@webber.adilger.int>
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
In-Reply-To: <20010602191624.E21442@linux.interlinx.bc.ca> "from Brian J. Murrell
 at Jun 2, 2001 07:16:24 pm"
Date: Sun, 3 Jun 2001 21:40:20 -0600 (MDT)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Brian Murrell writes:
> I would like to migrate my system disk to using LVM, completely --
> boot and root filesystems (as well as others).  I have 0.9.1beta7 as
> well as the lilo patch posted previous to this list.
> 
> I edited my /etc/lilo.conf on the new root filesystem to change the
> following:
> 
> ...
> -boot=/dev/hda
> +boot=/dev/hdc
> ...
> image=/boot/vmlinuz
>         label=linux
> -       root=/dev/hda5
> +       root=/dev/system/boot
> +       initrd=/boot/initrd-lvm-2.4.5-1.1mdk.gz
>         read-only
> 
> However when I chroot to the root filesystem on the new disk and run
> the lilo command I get the following:
> 
> # lilo
> Warning: /dev/hdc is not on the first disk
> Fatal: This version of LVM does not support boot LVs

That's because LVM 0.9.1b7 is broken w.r.t. LILO.  It worked for a while
between b4 and b6.  I've been meaning to supply a patch for this (I can
even check it into CVS directly now ;-) but have not had a chance to do so.
For now, use the below patch.

Basically, the LILO patch does a "test" mapping on the given device, with
two blocks within a single PE a fixed distance apart.  If the mapped
blocks do not return the same difference, then LVM is broken (as you see
in your case).

Initially, this was done because LV_BMAP would take blocks as input values
and return sectors as output values, which somewhat screwed up LILO.  At
the time, the LV_BMAP ioctl was totally broken anyways (i.e. it would
crash you machine if you tried to use it), so I didn't have any quandries
about changing the interface to be more sane (i.e. block numbers for both
input and output).

> One other thing that has occurred to me is that the PV that underlies
> the VG was named as /dev/hdc1.  I have a suspicion that I will not be
> able to simply move that drive from the secondary IDE bus to the
> primary IDE bus as it will then be known as /dev/sda1.  Is this
> correct?

You must have a very strange system if your IDE drive will be known as
/dev/sda1 (maybe IDE-SCSI)?  In any case, yes I think that this will
screw up your boot sector.  What you can try is the "disk=" parameter
in your lilo.conf, saying /dev/hdc has BIOS number 0x80, so that when
you shuffle your disks the boot sector will be correct.

> P.S.  I also have horrible nightsweats of trying to boot an LVM box from
> "emergency" boot media (diskettes, CDROM, etc.).  :-)

I put a (non-LVM) rescue boot partition on my disk which has basically
everything from /bin, /sbin, and some /lib/lib*, /lib/modules/<kernel>.
This is basically self-contained, and after I got it to work I have left
it totally alone to avoid breaking it just in time to have a boot problem.

Cheers, Andreas
========================================================================
diff -u -u -r1.18 lvm.c
--- kernel/lvm.c	2001/05/17 09:10:36	1.18
+++ kernel/lvm.c	2001/05/25 19:03:04
@@ -1174,6 +1181,7 @@
 	bh.b_blocknr = block;
 	bh.b_dev = bh.b_rdev = inode->i_rdev;
 	bh.b_size = lvm_get_blksize(bh.b_dev);
+	bh.b_rsector = block * (bh.b_size >> 9);
 	if ((err=lvm_map(&bh, READ)) < 0)  {
 		printk("lvm map failed: %d\n", err);
 		return -EINVAL;
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
