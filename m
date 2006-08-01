Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k71Irx7H024700
	for <linux-lvm@redhat.com>; Tue, 1 Aug 2006 14:53:59 -0400
Received: from bubba.bobcatos.com (mail.bobcatos.com [206.103.106.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k71IrlUE026079
	for <linux-lvm@redhat.com>; Tue, 1 Aug 2006 14:53:53 -0400
Received: from bobcat.bobcatos.com (unknown [192.168.2.2])
	by bubba.bobcatos.com (Postfix) with ESMTP id 7CFE02057
	for <linux-lvm@redhat.com>; Tue,  1 Aug 2006 13:53:47 -0500 (CDT)
Date: Tue, 1 Aug 2006 13:53:47 -0500
From: Bob McClure Jr <bob@bobcatos.com>
Message-ID: <20060801185347.GA30874@bobcat.bobcatos.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Minor LVM bollixment - /dev/dm-xx doesn't contain a
	valid partition table
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Last week, my wife rebooted our web server with the reset button
(don't ask).  It booted ok and appears to be running fine, but now I
get this result from "fdisk -l"

Disk /dev/hda: 80.0 GB, 80060424192 bytes
255 heads, 63 sectors/track, 9733 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1          13      104391   83  Linux
/dev/hda2              14          26      104422+  83  Linux
/dev/hda3              27          39      104422+  83  Linux
/dev/hda4              40        9733    77867055   8e  Linux LVM

Disk /dev/dm-0: 8388 MB, 8388608000 bytes
255 heads, 63 sectors/track, 1019 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/dm-0 doesn't contain a valid partition table

Disk /dev/dm-1: 8388 MB, 8388608000 bytes
255 heads, 63 sectors/track, 1019 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/dm-1 doesn't contain a valid partition table

  .
  .
  .
  .

Disk /dev/dm-10: 8589 MB, 8589934592 bytes
255 heads, 63 sectors/track, 1044 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/dm-10 doesn't contain a valid partition table

Disk /dev/dm-11: 10.7 GB, 10737418240 bytes
255 heads, 63 sectors/track, 1305 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/dm-11 doesn't contain a valid partition table

The /dev/dm-nn correspond to the 12 logical volumes in that VG.

I checked dmesg and found this:

EXT3-fs: dm-0: orphan cleanup on readonly fs
ext3_orphan_cleanup: deleting unreferenced inode 1094899
ext3_orphan_cleanup: deleting unreferenced inode 227777
ext3_orphan_cleanup: deleting unreferenced inode 1078122
ext3_orphan_cleanup: deleting unreferenced inode 1466022
ext3_orphan_cleanup: deleting unreferenced inode 617737
ext3_orphan_cleanup: deleting unreferenced inode 617736
ext3_orphan_cleanup: deleting unreferenced inode 617735
ext3_orphan_cleanup: deleting unreferenced inode 617733
ext3_orphan_cleanup: deleting unreferenced inode 1239631
EXT3-fs: dm-0: 9 orphan inodes deleted
EXT3-fs: recovery complete.
EXT3-fs: mounted filesystem with ordered data mode.

There's nothing in /lost+found.  Several LVM tools I tried, including
vgck report nothing amiss.  vgscan, lvscan, vgdisplay all provide
normal output.

The system is FC4, updated nightly with yum.  lvm RPM is
lvm2-2.02.06-1.0.fc4.  A Google search didn't turn up anything useful.

As I noted, it's running fine, apparently, though, fdisk seems to
expect partition tables in /dev/dm-nn.  How do I fix this short of
setting up a new drive and copying everything over?

Cheers,
-- 
Bob McClure, Jr.             Bobcat Open Systems, Inc.
bob@bobcatos.com             http://www.bobcatos.com
Blessed is the nation whose God is the LORD. - Psalm 33:12
Righteousness exalts a nation. - Proverbs 14:34
