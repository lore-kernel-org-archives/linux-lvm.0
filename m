Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jADN6DV09681
	for <linux-lvm@redhat.com>; Sun, 13 Nov 2005 18:06:13 -0500
Received: from fri.itea.ntnu.no (fri.itea.ntnu.no [129.241.7.60])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jADN60Ag015156
	for <linux-lvm@redhat.com>; Sun, 13 Nov 2005 18:06:06 -0500
Received: from localhost (localhost [127.0.0.1])
	by fri.itea.ntnu.no (Postfix) with ESMTP id 1E34B804F
	for <linux-lvm@redhat.com>; Mon, 14 Nov 2005 00:05:55 +0100 (CET)
Received: from spock.photic.net (s253b.studby.ntnu.no [129.241.139.253])
	by fri.itea.ntnu.no (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon, 14 Nov 2005 00:05:54 +0100 (CET)
Received: from localhost (unknown [127.0.0.1])
	by spock.photic.net (Postfix) with ESMTP id AF3C223C2D
	for <linux-lvm@redhat.com>; Sun, 13 Nov 2005 23:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by spock.photic.net (Postfix) with ESMTP id 821D823C2D
	for <linux-lvm@redhat.com>; Mon, 14 Nov 2005 00:05:54 +0100 (CET)
Date: Mon, 14 Nov 2005 00:05:54 +0100 (CET)
From: Jian Xu <jian@photic.net>
Message-ID: <Pine.LNX.4.63.0511132355020.15673@spock.photic.net>
MIME-Version: 1.0
Subject: [linux-lvm] LVM2 crash - unable to get the volume group up and
	running again
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

My LVM2 volume just stopped working out of the blue. I added a new disk to 
the volume group a while ago and added it to a logical volume, and used 
xfs_growfs to extend the partition.

All off a sudden a few weeks later, it stopped working. Upon reboot I get
this error message:

device-mapper: device /dev/hdd1 too small for target
device-mapper: dm-linear: Device lookup failed
device-mapper: error adding target to table

I have alot of important data on these disks, are there any way to get the 
volume up running again, or get some data back from any of the individual 
disks? The problems seems to be on the /dev/hdd disk. I've tried searcing 
in google, but havent found anything specific about a problem like mine.


I run gentoo with the 2.6.13-gentoo-r5 kernel.

   LVM version:     2.01.09 (2005-04-04)
   Library version: 1.01.03 (2005-06-13)
   Driver version:  4.4.0

   device-mapper: 4.4.0-ioctl (2005-01-12) initialised: dm-devel@redhat.com


# pvscan
   PV /dev/hda4   VG vg   lvm2 [101.94 GB / 0    free]
   PV /dev/hdb1   VG vg   lvm2 [111.79 GB / 0    free]
   PV /dev/hdc1   VG vg   lvm2 [186.30 GB / 0    free]
   PV /dev/hdd1   VG vg   lvm2 [186.31 GB / 0    free]
   PV /dev/hdh1   VG vg   lvm2 [186.31 GB / 0    free]
   PV /dev/hdg1   VG vg   lvm2 [186.31 GB / 0    free]
   PV /dev/hde    VG vg   lvm2 [232.88 GB / 0    free]
   Total: 7 [1.16 TB] / in use: 7 [1.16 TB] / in no VG: 0 [0   ]

# vgscan
   Reading all physical volumes.  This may take a while...
   Found volume group "vg" using metadata type lvm2

pvscan and vgscan appears to run fine, but when I try to activate the 
volumegroup, I get the following error:

# vgchange -ay
   device-mapper ioctl cmd 9 failed: Invalid argument
   Couldn't load device 'vg-public'.
   1 logical volume(s) in volume group "vg" now active

(and when I do this, the device-mapper also logs the 3 error lines I 
pasted earlier in this mail again)


Below are the outpots that pvs, vgdisplay and pvdisplay give me

# pvs
   PV         VG   Fmt  Attr PSize   PFree
   /dev/hda4  vg   lvm2 a-   101.94G    0
   /dev/hdb1  vg   lvm2 a-   111.79G    0
   /dev/hdc1  vg   lvm2 a-   186.30G    0
   /dev/hdd1  vg   lvm2 a-   186.31G    0
   /dev/hde   vg   lvm2 a-   232.88G    0
   /dev/hdg1  vg   lvm2 a-   186.31G    0
   /dev/hdh1  vg   lvm2 a-   186.31G    0


# vgdisplay
   --- Volume group ---
   VG Name               vg
   System ID
   Format                lvm2
   Metadata Areas        7
   Metadata Sequence No  37
   VG Access             read/write
   VG Status             resizable
   MAX LV                7
   Cur LV                1
   Open LV               0
   Max PV                255
   Cur PV                7
   Act PV                7
   VG Size               1.16 TB
   PE Size               4.00 MB
   Total PE              305111
   Alloc PE / Size       305111 / 1.16 TB
   Free  PE / Size       0 / 0
   VG UUID               LQ6EXt-RBjK-qqBB-tf7M-vXwL-pHZR-uGN63q

# vgdisplay
   --- Volume group ---
   VG Name               vg
   System ID
   Format                lvm2
   Metadata Areas        7
   Metadata Sequence No  37
   VG Access             read/write
   VG Status             resizable
   MAX LV                7
   Cur LV                1
   Open LV               0
   Max PV                255
   Cur PV                7
   Act PV                7
   VG Size               1.16 TB
   PE Size               4.00 MB
   Total PE              305111
   Alloc PE / Size       305111 / 1.16 TB
   Free  PE / Size       0 / 0
   VG UUID               LQ6EXt-RBjK-qqBB-tf7M-vXwL-pHZR-uGN63q

exillion jian # pvdisplay
   --- Physical volume ---
   PV Name               /dev/hda4
   VG Name               vg
   PV Size               101.94 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              26097
   Free PE               0
   Allocated PE          26097
   PV UUID               rN48fI-G7jz-BR60-tIDi-Bh9Z-jNGu-OY8xLg

   --- Physical volume ---
   PV Name               /dev/hdb1
   VG Name               vg
   PV Size               111.79 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              28617
   Free PE               0
   Allocated PE          28617
   PV UUID               bZWnTI-vk9p-LFv6-ZsNB-d5Kb-5oNz-6oxr4U

   --- Physical volume ---
   PV Name               /dev/hdc1
   VG Name               vg
   PV Size               186.30 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              47694
   Free PE               0
   Allocated PE          47694
   PV UUID               tXAjzt-nKR5-nZ42-g2Md-bfQH-PGta-w54Zjm

   --- Physical volume ---
   PV Name               /dev/hdd1
   VG Name               vg
   PV Size               186.31 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              47695
   Free PE               0
   Allocated PE          47695
   PV UUID               P67tnA-CUSV-41XG-RkTY-JfVd-0Zvw-nXY5T9

   --- Physical volume ---
   PV Name               /dev/hdh1
   VG Name               vg
   PV Size               186.31 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              47695
   Free PE               0
   Allocated PE          47695
   PV UUID               ux9OP1-oXdK-I5Kk-Ua0i-hlKk-Qayr-lMEddZ

   --- Physical volume ---
   PV Name               /dev/hdg1
   VG Name               vg
   PV Size               186.31 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              47695
   Free PE               0
   Allocated PE          47695
   PV UUID               EDySOS-lUhE-Z7mp-fiGq-HGm0-rN2k-RXO7cO

   --- Physical volume ---
   PV Name               /dev/hde
   VG Name               vg
   PV Size               232.88 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              59618
   Free PE               0
   Allocated PE          59618
   PV UUID               8lQNTw-923u-WoOB-wQn9-Zbnw-rZ1c-pDR3d3


-- 
Jian Xu
