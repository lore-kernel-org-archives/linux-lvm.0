Message-ID: <000d01be63c1$e243e190$6630aec1@trpc.dkfz-heidelberg.de>
From: "Tobias Reber" <tobias.reber@dkfz-heidelberg.de>
Subject: Re: [linux-lvm] booting with lvm
Date: Mon, 1 Mar 1999 09:59:58 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Rolf,
I can boot with 2.0.36. I have put all the lilo files onto a
vfat-filesystem. From there I can boot. Is it a typo or did you comment out
all your disk-driver modules. Do you have the drivers in your kernel? Also,
you have to have /dev files in your ramdisk, so that vgscan can find the
disks. As you may have already noticed from this list, a logical volume
cannot boot, nor can it contain any files lilo needs during boot. However,
the / filesystem works fine with lvm.
You should remove the comments from the devfs mount and the commands that
install the disk drivers. Also I suggest to load the disk drivers before lvm
Tobias
-----Original Message-----
From: Rolf Jakob <rjakob@duffy1.franken.de>
To: linux-lvm@msede.com <linux-lvm@msede.com>
Date: Monday, March 01, 1999 8:51 AM
Subject: [linux-lvm] booting with lvm


>Hello,
>
>In this mailing list I've read, it should be possible to boot
>linux with an initrd off a lv, but it failed here. What is wrong ?
>
>I try to boot Linux 2.2.1 with lvm and devfs patch using initrd
>(LVM 0.5alpha).
>The PC is a 486/100 VLB with two SCSI adapters (aic7xxx) and 5 disks.
>
>What I have done :
>
>I installed SuSE Linux 6.0 on the first SCSI disk and installed lilo
>in the MBR (see below). This one is bootable and serves as a rescue system.
>
>Disk 3 and 4 are part of the volume group "rootvg" with the lv "lvol2".
>This lv contains a copy of the SuSE installation. (There is another lv
>"bootlv" I tried to use for the kernel image and the initrd, but lilo
>does not accept ramdisk images on a lv.)
>
>Another normal partition on disk 1 contains the kernel and a ramdisk
>image for initrd.
>This looks like :
>empty directories "dev", "etc" and "mnt"
>a "lib" with all needed modules
>a "bin" and "sbin" with statically linked binaries (cp,ls,rm,sh,insmod,
>rmmod,modprobe,mount,umount,vgscan,vgchange)
>a linuxrc script :
>#!/bin/sh
>
>#/sbin/mount -t devfs none /dev
>
>/sbin/modprobe lvm
>#/sbin/modprobe ide-disk
>#/sbin/modprobe sd
>
>/sbin/vgscan
>/sbin/vgchange -a y
>
>echo "Content of rootvg :"
>/bin/ls -l /dev/rootvg
>
>echo "Copy LVM data to root volume"
>/sbin/mount /dev/rootvg/lvol2 /mnt && \
>/bin/cp -a /etc/lvm* /mnt/etc/
>/sbin/umount /mnt
>
>The ramdisk image is created using a file and the loop mount command,
>compressed with gzip and named ramdisk.image.gz.
>
>The file systems plus a devfs are mounted on the rescue file system under
>/ro, so that it looks like :
>/dev/sd/c1b0t0u0p1 on / type ext2 (rw)
>proc on /proc type proc (rw)
>/dev/rootvg/lvol2 on /ro type ext2 (rw)
>/dev/sd/c1b0t0u0p2 on /ro/boot type ext2 (rw)
>none on /ro/dev type devfs (rw)
>
>On the root file system I want to use (/dev/rootvg/lvol2, currently
>under /ro) I created the following /etc/lilo.conf :
># LILO Konfigurations-Datei
>boot=/dev/sd/c1b0t0u0
>compact       # faster, but won't work on all systems.
>read-only
>prompt
>timeout=100
>vga = normal    # force sane state
>#
># Linux on lv
>image=/boot/zImage.i
>initrd=/boot/ramdisk.image.gz
>append="devfs=nocompat root=/dev/rootvg/lvol2"
>root = /dev/rootvg/lvol2
>label = i
>#
># rescue system
>image = /boot/zImage
>append="devfs=nocompat root=/dev/sd/c1b0t0u0p1"
>root = /dev/sd/c1b0t0u0p1
>label = l
>#
>
>I installed lilo using lilo -r /ro and rebooted.
>
>The script linuxrc is working fine, but as soon as the kernel tries to
>mount the root file system after linuxrc exits, the following error is
>displayed :
>VFS: Cannot open root device "/dev/rootvg/lvol2" or 00:00
>Please append a correct "root=" boot option.
>Kernel Panic: VFS: Unable to mount root fs on 00:00
>
>It seems the kernel cannot handle a lv as a root filesystem. Is there a
>way to do that (yet) ?
>
>Many thanks in advance,
>Rolf
>--
>Rolf Jakob at home (rjakob@duffy1.franken.de)
>WWW : http://www.franken.de/users/duffy1/rjakob
>
