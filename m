Message-Id: <m10GpgQ-000GjZC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: [linux-lvm] booting with lvm
Date: Sat, 27 Feb 1999 20:45:53 +0100 (MET)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hello,

In this mailing list I've read, it should be possible to boot
linux with an initrd off a lv, but it failed here. What is wrong ?

I try to boot Linux 2.2.1 with lvm and devfs patch using initrd
(LVM 0.5alpha).
The PC is a 486/100 VLB with two SCSI adapters (aic7xxx) and 5 disks.

What I have done :

I installed SuSE Linux 6.0 on the first SCSI disk and installed lilo
in the MBR (see below). This one is bootable and serves as a rescue system.

Disk 3 and 4 are part of the volume group "rootvg" with the lv "lvol2".
This lv contains a copy of the SuSE installation. (There is another lv
"bootlv" I tried to use for the kernel image and the initrd, but lilo
does not accept ramdisk images on a lv.)

Another normal partition on disk 1 contains the kernel and a ramdisk
image for initrd.
This looks like :
empty directories "dev", "etc" and "mnt"
a "lib" with all needed modules
a "bin" and "sbin" with statically linked binaries (cp,ls,rm,sh,insmod,
rmmod,modprobe,mount,umount,vgscan,vgchange)
a linuxrc script :
#!/bin/sh

#/sbin/mount -t devfs none /dev

/sbin/modprobe lvm
#/sbin/modprobe ide-disk
#/sbin/modprobe sd

/sbin/vgscan
/sbin/vgchange -a y

echo "Content of rootvg :"
/bin/ls -l /dev/rootvg

echo "Copy LVM data to root volume"
/sbin/mount /dev/rootvg/lvol2 /mnt && \
/bin/cp -a /etc/lvm* /mnt/etc/
/sbin/umount /mnt

The ramdisk image is created using a file and the loop mount command,
compressed with gzip and named ramdisk.image.gz.

The file systems plus a devfs are mounted on the rescue file system under
/ro, so that it looks like :
/dev/sd/c1b0t0u0p1 on / type ext2 (rw)
proc on /proc type proc (rw)
/dev/rootvg/lvol2 on /ro type ext2 (rw)
/dev/sd/c1b0t0u0p2 on /ro/boot type ext2 (rw)
none on /ro/dev type devfs (rw)

On the root file system I want to use (/dev/rootvg/lvol2, currently
under /ro) I created the following /etc/lilo.conf :
# LILO Konfigurations-Datei
boot=/dev/sd/c1b0t0u0
compact       # faster, but won't work on all systems.
read-only
prompt
timeout=100
vga = normal    # force sane state
#
# Linux on lv
image=/boot/zImage.i
initrd=/boot/ramdisk.image.gz
append="devfs=nocompat root=/dev/rootvg/lvol2"
root = /dev/rootvg/lvol2
label = i
#
# rescue system
image = /boot/zImage
append="devfs=nocompat root=/dev/sd/c1b0t0u0p1"
root = /dev/sd/c1b0t0u0p1
label = l
#

I installed lilo using lilo -r /ro and rebooted.

The script linuxrc is working fine, but as soon as the kernel tries to
mount the root file system after linuxrc exits, the following error is
displayed :
VFS: Cannot open root device "/dev/rootvg/lvol2" or 00:00
Please append a correct "root=" boot option.
Kernel Panic: VFS: Unable to mount root fs on 00:00

It seems the kernel cannot handle a lv as a root filesystem. Is there a
way to do that (yet) ?

Many thanks in advance,
Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob
