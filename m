Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6MDgma21831
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 09:42:48 -0400
Received: from ms-smtp-01-eri0.southeast.rr.com
	(ms-smtp-01-lbl.southeast.rr.com [24.25.9.100])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6MDggXn017277
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 09:42:42 -0400
Received: from ZACK2 (rdu163-116-062.nc.rr.com [24.163.116.62])
	by ms-smtp-01-eri0.southeast.rr.com (8.12.10/8.12.7) with ESMTP id
	i6MDgcPg011024
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 09:42:40 -0400 (EDT)
Message-ID: <001701c46ff1$cdcecc60$6b02a8c0@ZACK2>
From: "Zachary Hamm" <zhamm@nc.rr.com>
Date: Thu, 22 Jul 2004 09:42:58 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2
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
To: linux-lvm@redhat.com


Hello, I'm running Fedora Core 2 on a Dell Poweredge 1750 with three 36G
SCSI drives setup with two volumes, /boot and /, setup with software RAID 1
with online spare.  This was setup at install, which reported no errors.
I've done a yum update as well.

The problem is that only one of the to volume groups is recognized and
mirrored (/boot), as apparently vgscan does not like the the large drives
(which aren't that large...).   Any help is appreciated.

Zack




fstab:  (the rootvg is supposed to be /dev/md1)
-----------------
/dev/rootvg/LogVol00    /                       ext3    defaults        1 1
/dev/md0                /boot                   ext3    defaults        1 2
----------------

/var/log/lvm2.log:
-----------------------
commands/toolcontext.c:139   Logging initialised at Wed Jul 21 14:49:57 2004

commands/toolcontext.c:158   Set umask to 0077
lvmdiskscan.c:67 lvmdiskscan  /dev/sda  [       33.92 GB]
lvmdiskscan.c:67 lvmdiskscan  /dev/md0  [      101.75 MB]
lvmdiskscan.c:67 lvmdiskscan  /dev/md1  [       32.81 GB] LVM physical
volume
lvmdiskscan.c:67 lvmdiskscan  /dev/sda2 [        1.00 GB]
lvmdiskscan.c:67 lvmdiskscan  /dev/sdb  [       33.92 GB] LVM physical
volume
lvmdiskscan.c:67 lvmdiskscan  /dev/sdb2 [        1.00 GB]
lvmdiskscan.c:67 lvmdiskscan  /dev/sdc  [       33.92 GB] LVM physical
volume
lvmdiskscan.c:67 lvmdiskscan  /dev/sdc2 [        1.00 GB]
lvmdiskscan.c:137 lvmdiskscan  1 disk
lvmdiskscan.c:139 lvmdiskscan  4 partitions
lvmdiskscan.c:142 lvmdiskscan  2 LVM physical volume whole disks
lvmdiskscan.c:144 lvmdiskscan  1 LVM physical volume
commands/toolcontext.c:139   Logging initialised at Wed Jul 21 14:50:24 2004

commands/toolcontext.c:158   Set umask to 0077
commands/toolcontext.c:139   Logging initialised at Wed Jul 21 14:50:36 2004

commands/toolcontext.c:158   Set umask to 0077
vgscan.c:51 vgscan  Wiping cache of LVM-capable devices
vgscan.c:54 vgscan  Wiping internal cache
vgscan.c:57 vgscan  Reading all physical volumes.  This may take a while...
toollib.c:414 vgscan  Finding all volume groups
toollib.c:330 vgscan  Finding volume group "vg00"
device/dev-io.c:79 vgscan  Read size too large: 3191341056
format1/disk-rep.c:364 vgscan  Failed to read extents from /dev/sdb
device/dev-io.c:79 vgscan  Read size too large: 3191341056
format1/disk-rep.c:364 vgscan  Failed to read extents from /dev/sdb
device/dev-io.c:79 vgscan  Read size too large: 3191341056
format1/disk-rep.c:364 vgscan  Failed to read extents from /dev/sdc
vgscan.c:22 vgscan  Volume group "vg00" not found
toollib.c:330 vgscan  Finding volume group "rootvg"
vgscan.c:37 vgscan  Found volume group "rootvg" using metadata type lvm2

Output of lvscan and pvscan:
-----------------------
# lvscan
    Logging initialised at Thu Jul 22 09:40:45 2004

    Set umask to 0077
lvscan    Finding all logical volumes
lvscan  Read size too large: 3191341056
lvscan  Failed to read extents from /dev/sdb
lvscan  Read size too large: 3191341056
lvscan  Failed to read extents from /dev/sdb
lvscan  Read size too large: 3191341056
lvscan  Failed to read extents from /dev/sdc
lvscan  Volume group "vg00" not found
lvscan  ACTIVE            '/dev/rootvg/LogVol00' [32.80 GB] next free
(default)

# pvscan
    Logging initialised at Thu Jul 22 09:40:49 2004

    Set umask to 0077
pvscan    Wiping cache of LVM-capable devices
pvscan    Wiping internal cache
pvscan    Walking through all physical volumes
pvscan  Read size too large: 3191341056
pvscan  Failed to read extents from /dev/sdb
pvscan  Read size too large: 3191341056
pvscan  Failed to read extents from /dev/sdb
pvscan  Read size too large: 3191341056
pvscan  Failed to read extents from /dev/sdc
pvscan  PV /dev/md1   VG rootvg   lvm2 [32.81 GB / 8.00 MB free]
pvscan  Total: 1 [32.81 GB] / in use: 1 [32.81 GB] / in no VG: 0 [0   ]
