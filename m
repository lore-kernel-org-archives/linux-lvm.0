Date: Thu, 13 Sep 2001 09:18:47 +0200 (CEST)
From: "A.R. (Tom) Peters" <tpeters@xs4all.nl>
Message-ID: <Pine.LNX.4.21.0109130913590.994-100000@tompth.localdomain>
MIME-Version: 1.0
Subject: [linux-lvm] How to boot with LVM?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I bought a 30 GB HD, and decided to put it under the LVM and put
ReiserFS on it.  I managed to initialize it fine, and it now has a base
Debian install on it, but I cannot manage to boot from it.

You cannot boot from a LV; therefore I made a small (16 MB) ext2
partition with a kernel and an initrd.  My intended root FS is on a LV,
and you need to jump through some hoops to get the kernel mount it on /
: that is documented in the LVM-HOWTO and FAQ that comes with the LVM
tools.  Use of initrd is documented in
/usr/src/linux/Documents/initrd.txt .  Finally, the Bootdisk-HOWTO
helps.

I use LVM tools 1.0.1-rc2, and a 2.4.10-pre7 kernel, patched with the
patches of the LVM tools; no .rej there.  I compiled the LVM binaries
with liblvm-10 statically linked, because otherwise the executables in
the initrd had problems with finding the .so (I think I know what was
going on, but won't go into that now).  Therefore I have to make a
Ramdisk of 5MB instead of the default 4 MB.

My new HD is /dev/hdd, and is the 3rd HD in the system: this allows me
to still use my computer to read docs and send you this message.  So for
now I do not want to put a bootloader on the disk because the hardware
config is going to change: instead I use a boot floppy with GRUB.

LVM has a utility script lvmcreate_initrd to make an initrd suitable to
prepare for mounting a LV on / .

The system boots with the floppy; the correct kernel is loaded from the
ext2 partition, as well as the initrd; the LVM tools on the initrd are
executed and seem to work properly.

PROBLEM: subsequently the kernel panics because it still cannot mount a
root.

I got a GRUB bootdisk that works.  /grub/menu.lst :
title  Linux24
root (hd2,4)
kernel /vmlinuz-2.4.10-pre7 root=/dev/SYSDISK/Root ramdisk_size=5120
# If I specify root=/dev/ram0 then I get a shell on the rudimentary
initrd system.
initrd /initrd-lvm-2.4.10-pre7.gz

On initrd:

etc/fstab:
/dev/ram        /               ext2    defaults        0   0
proc            /proc           proc    defaults        0   0

linuxrc:
#!/bin/sh
/bin/mount /proc
/sbin/vgscan
/sbin/vgchange -a y
/bin/umount /proc

devices:
# ls -l dev/SYSDISK/
total 0
brw-rw----    1 root     disk      58,   2 Sep 11 19:23 Opt
brw-rw----    1 root     disk      58,   0 Sep 11 19:23 Root
brw-rw----    1 root     disk      58,   4 Sep 11 19:23 Scratch
brw-rw----    1 root     disk      58,   1 Sep 11 19:23 Usr
brw-rw----    1 root     disk      58,   3 Sep 11 19:23 Var
crw-r-----    1 root     disk     109,   0 Sep 11 19:23 group

Kernel:
# rdev vmlinuz-2.4.10-pre7
Root device /dev/ram0   # Root device /dev/SYSDISK/Root
			  (-> 0x3a00) does not make a difference
# rdev -R vmlinuz-2.4.10-pre7
Root flags 0    # i.e. mount ro
# rdev -r vmlinuz-2.4.10-pre7
Ramsize 49152   # i.e. offset=0; bit14=1: load ramdisk; bit15=1: 
                #   prompt before loading rootfs - this never happens!

What am I supposed to change?  The kernel initrd.txt has a long and
complicated story on using pivot_root to switch rootfs, but apparently
the LVM linuxrc relies on the deprecated method that does this
automatically.

Any advice welcome.

--
#>!$!%(@^%#%*(&(#@#*$^@^$##*#@&(%)@**$!(&!^(#((#&%!)%*@)(&$($$%(@#)&*!^$)^@*^@)

	Tom "thriving on chaos" Peters
		NL-1062 KD nr 149	tel.    +31-204080204
 			Amsterdam	e-mail  tpeters@xs4all.nl
