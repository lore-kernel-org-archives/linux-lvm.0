Message-Id: <m11ZIFi-000D4UC@londo.rhein-main.de>
From: Torsten Neumann <torsten@londo.rhein-main.de>
Subject: [linux-lvm] Problems with raid1 and LVM and initrd
Date: Thu, 7 Oct 1999 20:26:54 +0200 (MET DST)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM for Linux <linux-lvm@msede.com>

Hi,

I hope I get the problem description right, the fault machine is miles away.

I'm trying to setup LVM on top of a md-raid1 device, and then put my root
filesystem on it. Setting up raid1 was no problem, setting up LVM on top of
it - no problem. Setting up a second VG on other partitions - no problem.

Disk partitions looks something like
	/dev/sda1	/dev/sdb1	256 MB swap area
	/dev/sda2	/dev/sdb2	32  MB /boot for vmlinux and initrd
	/dev/sda3	/dev/sdb3	2048MB /dev/md0 -> vg00
	/dev/sda4	/dev/sdb4	rest   vg01

My linuxrc does something like this
	mount /proc
	insmod raid1
	ckraid --fix /etc/raid1.conf
	mdadd -ar
	insmod lvm
	vgscan
	vgchange -a y
	umount /proc

The problem is the vgscan call. It doesn't find vg00, it just finds vg01.
Inserting some debug code ( pvdisplay, pvscan, bash ) in the above it looks
to me that /dev/md0 is correctly initialized. But the lvm-commands just
returns error codes. The result is an error while booting the
real-root-device, since there are no drivers it couldn't boot. (init not
found)
( By the way does anybody know how to debug initrd ?  I wanted to make an 
"pvscan -d >foo" but how to I get the output out of ramdisk )

Booting from a third disk and execute the linuxrc script by hand works just
fine, all vg's are seen and useable.

Everythings works, execpt if I start it via initrd.

Any Ideas ?

Regards
	Torsten
