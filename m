Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5BGPC029498
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 12:25:12 -0400
Subject: Re: [linux-lvm] Running vgscan while swap on LVM is already active
References: <m2n03a6wxk.fsf@isnogud.escape.de>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 11 Jun 2004 18:24:21 +0200
In-Reply-To: <m2n03a6wxk.fsf@isnogud.escape.de>;
	from Urs Thuermann on 11 Jun 2004 15:33:59 +0200
Message-ID: <m2pt86qczu.fsf@isnogud.escape.de>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

OK, following up to myself.  I've done some experiments to understand
what's going on in the kernel.  For those interested, here is what
I've just learned:

Urs Thuermann <urs@isnogud.escape.de> writes:

> But is the active swap space somehow tied to the device node
> /dev/vg0/swap in the file system?  I thought this is not the case.
> And even if it is, this behavior still suprises me because it the
> device node is recreated with the same device number and even inode
> number.

This wasn't quite correct.  When running vgscan while /dev/vg0/swap is
active, the device node has of course the same major/minor device
number after the vgscan but a new inode number.  So it seems that the
kernel keeps the inode of the device node open as long as the device
is used as swap.  vgscan unlinks /dev/vg0/swap, but the inode isn't
removed since it's still open.  Then vgscan recreates /dev/vg0/swap
but on a different inode.  This is why I get

isnogud:root# swapon -s
Filename                        Type            Size    Used    Priority
/dev/vg0/swap (deleted)         partition       262136  0       -2

like lsof on deleted files.  Another experiment also shows this:  I
mounted a newly creates file system to /mnt, created a device node for
my swap space on it and turn swap on on it:

   $ mkfs /dev/vg0/foo
   $ mount /dev/vg0/foo /mnt
   $ cp -a /dev/vg0/swap /mnt/s
   $ swapon /mnt/s

Then I can't unmount /mnt since it's busy because the kernel holds an
open inode on /mnt.  I first have to swapoff

   $ swapoff
   $ umount /mnt

This is different from mounting a file system, where the kernel
doesn't seem to keep the inode of the block device open.  You can
unmount the file system holding the device node while the device is
still being mounted and also vgscan can unlink and recreate the device
node with the same inode number because the inode isn't busy.
Therefore, you can still unlink LVs after vgscan but not run swapoff
on an LV after vgscan.

BTW, is there a way to see all open inodes in the kernel?  I haven't
found anything in the /proc FS.  lsof shows open inodes held by
processes but obviously the kernel itself can also have open inodes.


urs
