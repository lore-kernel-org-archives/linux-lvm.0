Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB6HVFr26674
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 12:31:15 -0500
Received: from delirium.voip.primustel.com ([209.227.165.143])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB6HVD1O000816
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 12:31:13 -0500
Received: from male.ia.us.primus (male.cv.telegroup.com [10.40.40.244])
	by delirium.voip.primustel.com (Postfix) with ESMTP id 59021EEA3
	for <linux-lvm@redhat.com>; Mon,  6 Dec 2004 16:30:55 +0000 (UTC)
Received: from benway.cv.telegroup.com (benway.cv.telegroup.com [10.40.41.175])
	by male.ia.us.primus (8.12.10/8.12.10) with ESMTP id iB6GSGxl027162
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 10:28:17 -0600
From: Aran Cox <acox@ia.primustel.com>
Date: Mon, 06 Dec 2004 10:28:16 -0600
Message-Id: <1102350496.3579.49.camel@benway>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Huge memory allocation...
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I upgraded from FC1 to FC3 yesterday and had some LVM issues.
Basically, vgscan would exit with an error and thus vgchange wouldn't
get run at all.  I upgraded to the latest lvm2 utilities and although
the error messages are the same the utilities don't exit with an error
any more.  Still, I think something is wrong with my volume group.  One
of the disks used to be in another system with LVM.  I now use a
partition on that disk, possibly instead of the whole disk, I don't
really recall how I had it set up.  Could there be metadata lurking on
that disk that confuses the utilities?  Below is the output from
vgdisplay.  It's correct when it says VG desire doesn't exist.  I've
tried removing it anyway but can't seem to get rid of the phantom VG
desire.  

Thanks,
Aran

Password:
    Finding all volume groups
    Finding volume group "desire"
  Huge memory allocation (size 2628255764) rejected - metadata
corruption?
  Out of memory.  Requested 2628255764 bytes.
  Failed to read extents from /dev/hdb
  Huge memory allocation (size 2628255764) rejected - metadata
corruption?
  Out of memory.  Requested 2628255764 bytes.
  Failed to read extents from /dev/hdb
  Volume group "desire" doesn't exist
    Finding volume group "main2"
  --- Volume group ---
  VG Name               main2
  System ID             cain1067664603
  Format                lvm2
  Metadata Areas        4
  Metadata Sequence No  6
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                8
  Open LV               8
  Max PV                256
  Cur PV                4
  Act PV                4
  VG Size               265.77 GB
  PE Size               16.00 MB
  Total PE              17009
  Alloc PE / Size       16978 / 265.28 GB
  Free  PE / Size       31 / 496.00 MB
  VG UUID               qfgWQt-1Ke3-0N30-JZfc-dUkv-PXTP-t0t6Y4

  --- Logical volume ---
  LV Name                /dev/main2/swap
  VG Name                main2
  LV UUID                000000-0000-0000-0000-0000-0000-000000
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                2.00 GB
  Current LE             128
  Segments               1
  Allocation             normal
  Read ahead sectors     1024
  Block device           253:0

  --- Logical volume ---
  LV Name                /dev/main2/home
  VG Name                main2
  LV UUID                000000-0000-0000-0000-0000-0000-000001
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                10.61 GB
  Current LE             679
  Segments               1
  Allocation             normal
  Read ahead sectors     1024
  Block device           253:1

  --- Logical volume ---
  LV Name                /dev/main2/usr
  VG Name                main2
  LV UUID                000000-0000-0000-0000-0000-0000-000002
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                4.94 GB
  Current LE             316
  Segments               3
  Allocation             normal
  Read ahead sectors     1024
  Block device           253:2

  --- Logical volume ---
  LV Name                /dev/main2/var
  VG Name                main2
  LV UUID                000000-0000-0000-0000-0000-0000-000003
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.00 GB
  Current LE             64
  Segments               2
  Allocation             normal
  Read ahead sectors     1024
  Block device           253:3

  --- Logical volume ---
  LV Name                /dev/main2/log
  VG Name                main2
  LV UUID                000000-0000-0000-0000-0000-0000-000004
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                512.00 MB
  Current LE             32
  Segments               1
  Allocation             normal
  Read ahead sectors     1024
  Block device           253:4

  --- Logical volume ---
  LV Name                /dev/main2/imap
  VG Name                main2
  LV UUID                000000-0000-0000-0000-0000-0000-000006
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                3.17 GB
  Current LE             203
  Segments               4
  Allocation             normal
  Read ahead sectors     1024
  Block device           253:5

  --- Logical volume ---
  LV Name                /dev/main2/video2
  VG Name                main2
  LV UUID                000000-0000-0000-0000-0000-0000-000007
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                239.06 GB
  Current LE             15300
  Segments               8
  Allocation             normal
  Read ahead sectors     0
  Block device           253:6

  --- Logical volume ---
  LV Name                /dev/main2/squid
  VG Name                main2
  LV UUID                000000-0000-0000-0000-0000-0000-000009
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                4.00 GB
  Current LE             256
  Segments               2
  Allocation             normal
  Read ahead sectors     1024
  Block device           253:7

  --- Physical volumes ---
  PV Name               /dev/hdc1
  PV UUID               58ZN9k-K75s-zVIN-pwlJ-1FGN-Wtps-qlo6Ok
  PV Status             allocatable
  Total PE / Free PE    2452 / 0

  PV Name               /dev/hda3
  PV UUID               q3c32q-CeGr-EVR3-bo5k-kh6x-Jvkg-BkzFVy
  PV Status             allocatable
  Total PE / Free PE    2324 / 0

  PV Name               /dev/hda4
  PV UUID               3jnAEZ-fFNz-cY0Y-53Cy-KMQJ-HJgK-7XQamL
  PV Status             allocatable
  Total PE / Free PE    4872 / 0

  PV Name               /dev/hdb1
  PV UUID               GILY4s-NXCh-p72w-3mqI-795b-VJiM-zCHdLy
  PV Status             allocatable
  Total PE / Free PE    7361 / 31


-- 
Aran Cox <acox@ia.primustel.com>
