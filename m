Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j85K2eV17028
	for <linux-lvm@redhat.com>; Mon, 5 Sep 2005 16:02:40 -0400
Received: from fe-6c.inet.it (fe-6c.inet.it [213.92.5.112])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j85K2cEO028411
	for <linux-lvm@redhat.com>; Mon, 5 Sep 2005 16:02:38 -0400
Message-ID: <431C5034.6040604@ngi.it>
Date: Mon, 05 Sep 2005 16:03:32 +0200
From: Bob Alexander <bob@ngi.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Please help with lvextend problems
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Trying to enlarge a LV after adding a new PV to the VG.

I get an horrible string of messages:

lvextend -L+400M /dev/vg1/lvusr
Extending logical volume lvusr to 3.09GB
Inconsistent length 66 71
PV segment pe_alloc_count mismatch: 1436 != 1520
PV segment VG free_count mismatch: 1570 != 1486
Internal error: PV segments corrupted in vg1

Am I toast ???

Here follows some additional data. Thank you
Bob Alexander

bob@t40:~$ uname -a
Linux t40 2.6.11.4T40237392G-RJA #1 Mon Mar 28 19:36:30 CEST 2005 i686 
GNU/Linux
t40:/home/bob# pvdisplay
   --- Physical volume ---
   PV Name               /dev/hda9
   VG Name               vg1
   PV Size               6.77 GB / not usable 0
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              1733
   Free PE               313
   Allocated PE          1420
   PV UUID               CSxEXj-LPQv-VAlv-gTxv-zLfa-2dZ4-MGN7T1

   --- Physical volume ---
   PV Name               /dev/hda8
   VG Name               vg1
   PV Size               4.97 GB / not usable 0
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              1273
   Free PE               1273
   Allocated PE          0
   PV UUID               FmDlz8-gBJ6-oH5X-Cg26-ZDdm-pTSh-obtzqG
t40:/home/bob# vgdisplay
   --- Volume group ---
   VG Name               vg1
   System ID
   Format                lvm2
   Metadata Areas        2
   Metadata Sequence No  19
   VG Access             read/write
   VG Status             resizable
   MAX LV                0
   Cur LV                5
   Open LV               5
   Max PV                0
   Cur PV                2
   Act PV                2
   VG Size               11.74 GB
   PE Size               4.00 MB
   Total PE              3006
   Alloc PE / Size       1420 / 5.55 GB
   Free  PE / Size       1586 / 6.20 GB
   VG UUID               sLbPHD-Fxe8-sMkh-pMk8-dvgK-2c8K-DKCEt8
t40:/home/bob# lvdisplay /dev/vg1/lvusr
   --- Logical volume ---
   LV Name                /dev/vg1/lvusr
   VG Name                vg1
   LV UUID                PeGQ6L-dqE6-KH7G-ErcU-pzAD-A6JM-ZEHM6x
   LV Write Access        read/write
   LV Status              available
   # open                 1
   LV Size                2.70 GB
   Current LE             690
   Segments               2
   Allocation             inherit
   Read ahead sectors     0
   Block device           254:1
