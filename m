Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9U35wQJ016185
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 23:05:58 -0400
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9U35eqi019607
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 23:05:41 -0400
Received: from mira.localnet ([96.252.93.182]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSB00AGO4L3WD40@vms173005.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 29 Oct 2009 22:05:32 -0500 (CDT)
Message-id: <4AEA57F6.1040909@mattgillen.net>
Date: Thu, 29 Oct 2009 23:05:26 -0400
From: Matthew Gillen <me@mattgillen.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] missing device that isn't missing
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
To: linux-lvm@redhat.com

I've got a strange problem: fresh install of Fedora 11 x86_64, with three
disks (wiped them all for the install).  sda has 2 partitions (/boot is
one), sdb and sdc each have one partition.

After booting, the root filesystem works, but the lvm system is complaining
that it can't find the device that is supposed to be /dev/sda2.  So I can't
do any lvm operations:
---------------------------------
# pvscan
  Couldn't find device with uuid 'xeGSsL-9YAf-13lC-Uy4y-L3en-8YdG-Pxo8Uh'.
  PV unknown device   VG vg_xxx        lvm2 [136.63 GB / 126.88 GB free]
  PV /dev/sdb1        VG vg_xxx        lvm2 [136.73 GB / 97.66 GB free]
  PV /dev/sdc1                           lvm2 [136.73 GB]
  Total: 3 [410.09 GB] / in use: 2 [273.36 GB] / in no VG: 1 [136.73 GB]
---------------------------------

The partition table on sda appears to have an anomaly:
---------------------------------
# fdisk -l /dev/sda

Disk /dev/sda: 146.8 GB, 146815733760 bytes
255 heads, 63 sectors/track, 17849 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x00000080

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          26      204800   83  Linux
Partition 1 does not end on cylinder boundary.
/dev/sda2              26       17849   143167261   8e  Linux LVM
---------------------------------
# fdisk -l /dev/sdb

Disk /dev/sdb: 146.8 GB, 146815733760 bytes
255 heads, 63 sectors/track, 17849 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x00000081

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1       17849   143372061   8e  Linux LVM
---------------------------------

The system is working, but I can't add more LVs to the VG until this gets
fixed.  I can't remove the device either:
---------------------------------
# vgreduce vg_xxx /dev/sda2
  Couldn't find device with uuid 'xeGSsL-9YAf-13lC-Uy4y-L3en-8YdG-Pxo8Uh'.
  Physical Volume "/dev/sda2" not found in Volume Group "vg_xxx"
# pvmove /dev/sda2
  No physical volume label read from /dev/sda2
  Physical volume /dev/sda2 not found
---------------------------------
# pvdisplay
  Couldn't find device with uuid 'xeGSsL-9YAf-13lC-Uy4y-L3en-8YdG-Pxo8Uh'.
  Couldn't find device with uuid 'xeGSsL-9YAf-13lC-Uy4y-L3en-8YdG-Pxo8Uh'.
  --- Physical volume ---
  PV Name               unknown device
  VG Name               vg_xxx
  PV Size               136.63 GB / not usable 1.83 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              34977
  Free PE               32481
  Allocated PE          2496
  PV UUID               xeGSsL-9YAf-13lC-Uy4y-L3en-8YdG-Pxo8Uh

  Couldn't find device with uuid 'xeGSsL-9YAf-13lC-Uy4y-L3en-8YdG-Pxo8Uh'.
  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               vg_xxx
  PV Size               136.73 GB / not usable 3.78 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              35002
  Free PE               25002
  Allocated PE          10000
  PV UUID               KEO2PO-W0YO-xnl1-c6wc-VtFe-EDRK-4UkLFS

  "/dev/sdc1" is a new physical volume of "136.73 GB"
  --- NEW Physical volume ---
  PV Name               /dev/sdc1
  VG Name
  PV Size               136.73 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               VNK8oq-Ydrf-WsI5-tvR9-QhLy-ZOgm-tt6A7l
---------------------------------

I even tried the 'dangerous' operation here:
http://tldp.org/HOWTO/LVM-HOWTO/recovermetadata.html, but to no avail:
---------------------------------
# pvcreate --uuid "xeGSsL-9YAf-13lC-Uy4y-L3en-8YdG-Pxo8Uh"  --restorefile
/etc/lvm/archive/vg_xxx_00000.vg /dev/sda2
  Couldn't find device with uuid 'xeGSsL-9YAf-13lC-Uy4y-L3en-8YdG-Pxo8Uh'.
  Physical extents end beyond end of device /dev/sda2!
  /dev/sda2: Format-specific setup of physical volume failed.
  Failed to setup physical volume "/dev/sda2"
---------------------------------

It looks like some of the extents on my "unknown device" are used, so just
removing it by force would most likely render my system unusable.  My best
guess is that the 'cylinder boundary' issue with the partition table is to
blame, so in the morning I'm going to just fdisk manually to ensure that the
partitions are better aligned, and just re-install.

If anyone has a crazy / dangerous suggestion, I'll try it (I've nothing to
lose, except re-install time, and it looks like I'll be paying that price
anyway).  But you'll have to post before about 9am eastern ;-)

Matt
