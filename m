Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9UIaBDp028773
	for <linux-lvm@redhat.com>; Tue, 30 Oct 2007 14:36:11 -0400
Received: from luther.localdomain (eshfire.ESH.Uni-Linz.AC.AT [193.171.36.5])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9UIa6f0016743
	for <linux-lvm@redhat.com>; Tue, 30 Oct 2007 14:36:06 -0400
Received: from [193.171.36.121] (eshfire.ESH.Uni-Linz.AC.AT [193.171.36.5])
	by luther.localdomain (Postfix) with ESMTP id 407A91384C
	for <linux-lvm@redhat.com>; Wed, 31 Oct 2007 03:49:30 +0100 (CET)
Message-ID: <47277994.3020803@esh.jku.at>
Date: Tue, 30 Oct 2007 19:36:04 +0100
From: Christian <bernth@esh.jku.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 Problem Can't resize locked LV lv
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

Hi,

I am using LVM2 for some time now and haven't had any troubles.
But this week one of the hard disks, the one I added approx. one month 
ago, started to report read/write errors.
I bought a new one and followed the steps of an LVM how-to found on this 
website 
(http://charlesnadeau.blogspot.com/2006/10/howto-replaceupgrade-disk-part-of-lvm2_04.html).

The first steps worked fine. Even shrinking the reiser file system was 
no problem.
But when I tried to pvmove /dev/hdb1 /dev/hdf1, I am getting the error 
message: Can't resize locked LV lv.

As there is no available information about what this error message 
actually means nor how to resolve it, I hope someone on this list might 
be able to help me.

Thank you very much in advance.

Cheers Christian

PS: this is my current configuration. where hdb1 is the failing hdd, and 
hdf1 the new one.

vgdisplay -v
    Finding all volume groups
    Finding volume group "vg"
  --- Volume group ---
  VG Name               vg
  System ID
  Format                lvm2
  Metadata Areas        6
  Metadata Sequence No  10
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                6
  Act PV                6
  VG Size               1.37 TB
  PE Size               4.00 MB
  Total PE              359489
  Alloc PE / Size       264102 / 1.01 TB
  Free  PE / Size       95387 / 372.61 GB
  VG UUID               bf1tJ5-X79X-Uy02-iilF-XEM8-u2GK-6lFhQZ

  --- Logical volume ---
  LV Name                /dev/vg/lv
  VG Name                vg
  LV UUID                oyJf6j-xKtk-qtQv-LLE3-wy4I-9qC3-9VLPr0
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                1.01 TB
  Current LE             264102
  Segments               5
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

  --- Physical volumes ---
  PV Name               /dev/hda3
  PV UUID               IKxWRX-hzHO-fra9-vm8O-JyVp-FyM8-trMXlw
  PV Status             allocatable
  Total PE / Free PE    25632 / 0

  PV Name               /dev/hde1
  PV UUID               wM0a1a-mT0y-2M2s-9CVH-1CYJ-sNGV-sdjrkJ
  PV Status             allocatable
  Total PE / Free PE    47694 / 0

  PV Name               /dev/hdg1
  PV UUID               oeAOVW-D4qq-24QO-PiH0-WyYh-y8lP-rqL3r9
  PV Status             allocatable
  Total PE / Free PE    76310 / 0

  PV Name               /dev/hdh1
  PV UUID               o58ymK-u6zC-J63r-w98A-cPPw-JcMN-FXWQUi
  PV Status             allocatable
  Total PE / Free PE    76310 / 0

  PV Name               /dev/hdb1
  PV UUID               uLgbrb-aNFy-8nsE-X7Aa-q0mp-n8AY-46FqSc
  PV Status             allocatable
  Total PE / Free PE    38156 / 0

  PV Name               /dev/hdf1
  PV UUID               uKsPbR-CNjT-IWTr-edSp-VmrO-CgtL-rxm0M2
  PV Status             allocatable
  Total PE / Free PE    95387 / 95387
