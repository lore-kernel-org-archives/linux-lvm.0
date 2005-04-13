Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3D7wHO01674
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 03:58:17 -0400
Received: from pd2mo3so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3D7wFUG001284
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 03:58:16 -0400
Received: from pd5mr3so.prod.shaw.ca
	(pd5mr3so-qfe3.prod.shaw.ca [10.0.141.144]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0IEV006R1KRCGAD0@l-daemon> for linux-lvm@redhat.com; Wed,
	13 Apr 2005 01:57:12 -0600 (MDT)
Received: from pn2ml6so.prod.shaw.ca ([10.0.121.150])
	by pd5mr3so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0IEV0038RKRCFU30@pd5mr3so.prod.shaw.ca> for
	linux-lvm@redhat.com; Wed, 13 Apr 2005 01:57:12 -0600 (MDT)
Received: from [192.168.1.124]
	(S01060050ba84447c.vc.shawcable.net [24.86.200.241])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0IEV00AJPKRBA0@l-daemon> for linux-lvm@redhat.com; Wed,
	13 Apr 2005 01:57:12 -0600 (MDT)
Date: Wed, 13 Apr 2005 00:57:22 -0700
From: Terry Rigby <t-rigby@shaw.ca>
Message-id: <200504130057.22236.t-rigby@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
Subject: [linux-lvm] Can not write to volume
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

Tonight I noticed an inability to write to my LVM volume.  I see the following 
errors in syslog

Apr 13 00:45:18 localhost kernel: ReiserFS: warning: is_tree_node: node level 
65535 does not match to the expected one 1
Apr 13 00:45:18 localhost kernel: ReiserFS: dm-0: warning: vs-5150: 
search_by_key: invalid format found in block 43843584. Fsck?

I am unsure as to what info might be relevant here so I will paste some 
hopefully without being too long winded.  Is it recommended to run a fsck on 
this?  How might I fix the issue?  

fileserver:/storage/tv/recordings# df -h |grep storage
/dev/mapper/4474-storage
                      242G  210G   33G  87% /storage

fileserver:/storage/tv/recordings# pvscan
  PV /dev/hda2   VG 4474   lvm2 [18.18 GB / 0    free]
  PV /dev/hdc    VG 4474   lvm2 [74.53 GB / 0    free]
  PV /dev/hdb    VG 4474   lvm2 [74.53 GB / 0    free]
  PV /dev/hdd    VG 4474   lvm2 [74.53 GB / 0    free]
  Total: 4 [241.77 GB] / in use: 4 [241.77 GB] / in no VG: 0 [0   ]

fileserver:/storage/tv/recordings# pvdisplay
  --- Physical volume ---
  PV Name               /dev/hda2
  VG Name               4474
  PV Size               18.18 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              4655
  Free PE               0
  Allocated PE          4655
  PV UUID               hxeJjE-AgPR-letG-U0rH-FlDP-hOu9-o7UH7e

  --- Physical volume ---
  PV Name               /dev/hdc
  VG Name               4474
  PV Size               74.53 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              19079
  Free PE               0
  Allocated PE          19079
  PV UUID               KMzdEO-aigL-KoHL-2ZED-SgWf-CsoW-7qEWQP

  --- Physical volume ---
  PV Name               /dev/hdb
  VG Name               4474
  PV Size               74.53 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              19079
  Free PE               0
  Allocated PE          19079
  PV UUID               2MKTrn-jv8Y-hUPU-8W6m-Uur1-ItpE-Abq3w4

  --- Physical volume ---
  PV Name               /dev/hdd
  VG Name               4474
  PV Size               74.53 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              19079
  Free PE               0
  Allocated PE          19079
  PV UUID               ISBKAD-7SQt-B9Bo-ppng-G5Q6-Iu3D-uABjz7

fileserver:/storage/tv/recordings# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "4474" using metadata type lvm2

fileserver:/storage/tv/recordings# vgdisplay
  --- Volume group ---
  VG Name               4474
  System ID
  Format                lvm2
  Metadata Areas        4
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                4
  Act PV                4
  VG Size               241.77 GB
  PE Size               4.00 MB
  Total PE              61892
  Alloc PE / Size       61892 / 241.77 GB
  Free  PE / Size       0 / 0
  VG UUID               lIoGSW-jLzj-HDN6-1mdY-0yqV-bily-BU9xzF
