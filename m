Message-Id: <m11ZHs9-000D4UC@londo.rhein-main.de>
From: Torsten Neumann <torsten@londo.rhein-main.de>
Subject: [linux-lvm] Problems with e2fsadm
Date: Thu, 7 Oct 1999 20:02:33 +0200 (MET DST)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM for Linux <linux-lvm@msede.com>

Hi,

I'm having some problems with e2fsadm when using 4096 as blocksize for my
ext2 filesystem. e.g
	lvcreate -L 100 -n /dev/vg00/lvoltest vg00
	mke2fs -b 4096 /dev/vg00/lvoltest
	e2fsadm -L 200 /dev/vg00/lvoltest
gives something like
	...
	lvextend -- logical volume "/dev/vg00/lvoltest" successfully extended

	ext2_resize_fs: your container (i.e. the file or partition the
					filesystem) is in is not big enough for a filesystem of
					204800 blocks (it's only 51200 blocks)

If using resize2fs instead of ext2resize I got the similiar message

	The containing partition (or device) is only 51200 blocks.
	You requested a new size of 204800 blocks.

Extending ext2 Filesystems on non logical volumes (/dev/sd...) works fine
even if using 4096 as blocksize.
Looking at the ext2resize code it seems to me that ext2resize is doing the
right thing, therefor my guess is that there is some bug in the lvm code.
Looking at LVM I find in tools/lib/liblvm.h
	#define BLOCK_SIZE 1024
but I don't understand if this has something to do with the above problem.
BLOCK_SIZE seems to be used in vg_setup_for_extend to check if there is room
for extending. But I don't see what it has to do with the wrong result of
the llseek call in ext2resize.

Maybe here is someone smarter then me and could tell me what's going wrong.
Would be nice if resizing works for all blocksizes.

Regards,
	Torsten
