Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4BGZQO20034
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 12:35:26 -0400
Received: from snefru.openlib.org (netec.wustl.edu [128.252.177.195])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4BGZLWm005009
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 12:35:21 -0400
Received: from krichel by snefru.openlib.org with local (Exim 4.50)
	id 1DVuFZ-0003kM-HL
	for linux-lvm@redhat.com; Wed, 11 May 2005 11:39:57 -0500
Date: Wed, 11 May 2005 11:39:57 -0500
From: Thomas Krichel <krichel@openlib.org>
Message-ID: <20050511163957.GA14252@openlib.org>
References: <20050510173249.GJ2445@openlib.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050510173249.GJ2445@openlib.org>
Subject: [linux-lvm] Re: ide / debian
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
To: Linux LVM <linux-lvm@redhat.com>

  Thomas Krichel writes

> I want to combine hdb hdc and hdd to one logical volume.
> Each is 80G. All had a single partition. I have a 2.6.8 kernel. 
> I  run the latest Debian testing version of lvm2.

  I played on and found:

  * OS sees all three disks
  * I can pvcreate all disks
  * pvscan does not find hdc

  In command language, starting from scratch

fafner:~# pvscan
  No matching physical volumes found
fafner:~# pvdisplay
fafner:~# fdisk -l /dev/hdb

Disk /dev/hdb: 80.0 GB, 80026361856 bytes
255 heads, 63 sectors/track, 9729 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/hdb doesn't contain a valid partition table
fafner:~# fdisk -l /dev/hdc

Disk /dev/hdc: 80.0 GB, 80026361856 bytes
255 heads, 63 sectors/track, 9729 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/hdc doesn't contain a valid partition table
fafner:~# fdisk -l /dev/hdd

Disk /dev/hdd: 80.0 GB, 80026361856 bytes
16 heads, 63 sectors/track, 155061 cylinders
Units = cylinders of 1008 * 512 = 516096 bytes

Disk /dev/hdd doesn't contain a valid partition table
fafner:~# pvcreate /dev/hdb ; pvcreate /dev/hdc ; pvcreate /dev/hdd  ;
  Physical volume "/dev/hdb" successfully created
  Physical volume "/dev/hdc" successfully created
  Physical volume "/dev/hdd" successfully created
fafner:~# pvdisplay
  --- NEW Physical volume ---
  PV Name               /dev/hdc
  VG Name
  PV Size               74.53 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               E725Ui-iBDc-r5uf-6vKi-L4Yw-9yzV-aJ2blr

  --- NEW Physical volume ---
  PV Name               /dev/hdb
  VG Name
  PV Size               74.53 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               TAfTgW-0In0-TZzF-mZoy-RsG5-v0DS-IHBvu1

  --- NEW Physical volume ---
  PV Name               /dev/hdd
  VG Name
  PV Size               74.53 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               mecykK-bBKE-0wCP-W7jZ-b0g2-O697-xW4zPS

fafner:~# pvscan
  PV /dev/hdb         lvm2 [74.53 GB]
  PV /dev/hdd         lvm2 [74.53 GB]
  Total: 2 [149.06 GB] / in use: 0 [0   ] / in no VG: 2 [149.06 GB]
fafner:~# vgcreate vg1 /dev/hdb /dev/hdc /dev/hdd
  Volume group "vg1" successfully created
fafner:~# vgscan
  Reading all physical volumes.  This may take a while...
  Couldn't find device with uuid 'E725Ui-iBDc-r5uf-6vKi-L4Yw-9yzV-aJ2blr'.
  Couldn't find all physical volumes for volume group vg1.
  Couldn't find device with uuid 'E725Ui-iBDc-r5uf-6vKi-L4Yw-9yzV-aJ2blr'.
  Couldn't find all physical volumes for volume group vg1.
  Volume group "vg1" not found

  Any advice would be much welcome!


  Cheers,

  Thomas Krichel                      mailto:krichel@openlib.org
                                 http://openlib.org/home/krichel
                             RePEc:per:1965-06-05:thomas_krichel
