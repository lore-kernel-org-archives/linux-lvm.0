Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB9KG7r29765
	for <linux-lvm@redhat.com>; Thu, 9 Dec 2004 15:16:07 -0500
Received: from desire.voip.primustel.com (_postfix@[208.219.5.17])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iB9KFvjv024142
	for <linux-lvm@redhat.com>; Thu, 9 Dec 2004 15:15:58 -0500
Received: from male.ia.us.primus (male.cv.telegroup.com [10.40.40.244])
	by desire.voip.primustel.com (Postfix) with ESMTP id EDD0811C94
	for <linux-lvm@redhat.com>; Thu,  9 Dec 2004 20:15:54 +0000 (UTC)
Received: from benway.cv.telegroup.com (benway.cv.telegroup.com [10.40.41.175])
	by male.ia.us.primus (8.12.10/8.12.10) with ESMTP id iB9KD4xl029121
	for <linux-lvm@redhat.com>; Thu, 9 Dec 2004 14:13:04 -0600
From: Aran Cox <acox@ia.primustel.com>
Date: Thu, 09 Dec 2004 14:13:03 -0600
Message-Id: <1102623183.3579.113.camel@benway>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] some issues with pvmove
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

I've been working on lvmove, a frontend to pvmove that I've used in the
past with LVM1 systems to re-organize the layout of logical volumes in a
volume group.  I keep getting failures with pvmove that require
restoring metadata from backup.  

When trying to re-shuffle extents on a mostly full VG you quickly end up
with a very convoluted layout.  I think this is similar to what most
defrag type programs do.  In general it has to make things worse before
it can make it any better.  

In any case, I can usually work around failed pvmoves like the one that
follows by moving fewer extents in one move and then letting the program
continue on it's own.  Does the failed pvmove below indicate a bug or is
there some way I can predict when a pvmove would fail and avoid issuing
that one?  Am I running into some limit that is going to keep me from
re-organizing my lv layout?  Can I provide other information that would
be helpful to someone looking into this?

When I'm done cleaning up lvmove I'll post it to the list.  If nothing
else, it's a torture test for pvmove and the dm-mirror module.

FC3
kernel 2.6.9-1.667
  LVM version:     2.00.29 (2004-11-27)
  Library version: 1.00.19-ioctl (2004-07-03)
  Driver version:  4.1.0


pvmove --alloc anywhere /dev/hdb1:4192:4389-4391:4467:4488 /dev/hdb1:4120:4317-4319:4395:4416
  /dev/hdb1: Moved: 16.7%
  Volume group for uuid not found: qfgWQt1Ke30N30JZfcdUkvPXTPt0t6Y400000000000000000000000000000007
  Failed to suspend video2
  ABORTING: Segment progression failed.
  /dev/hdc1: Checksum error
  Couldn't read volume group metadata.
  /dev/hda3: Checksum error
  Couldn't read volume group metadata.
  /dev/hda4: Checksum error
  Couldn't read volume group metadata.
  /dev/hdb1: Checksum error
  Couldn't read volume group metadata.
  /dev/hdd1: Checksum error
  Couldn't read volume group metadata.
  Volume group for uuid not found: qfgWQt1Ke30N30JZfcdUkvPXTPt0t6Y400000000000000000000000000000007
  Failed to suspend video2
  Locking LVs to remove temporary mirror failed
  /dev/hdc1: Checksum error
  Couldn't read volume group metadata.
  /dev/hda3: Checksum error
  Couldn't read volume group metadata.
  /dev/hda4: Checksum error
  Couldn't read volume group metadata.
  /dev/hdb1: Checksum error
  Couldn't read volume group metadata.
  /dev/hdd1: Checksum error
  Couldn't read volume group metadata.
  Volume group for uuid not found: qfgWQt1Ke30N30JZfcdUkvPXTPt0t6Y4cvS4zAgUf4ocmVJUYX1nvir6u7Z4PMHv
  Suspension of temporary mirror LV failed
  Device '/dev/hdd1' has been left open.
  Device '/dev/hdc1' has been left open.
  Device '/dev/hdb1' has been left open.
  Device '/dev/hda3' has been left open.
  Device '/dev/hda4' has been left open.
command failed: 1280 at /home/spin/lvmove line 164.

This is the state of my VG before the attempted move:

    Finding all volume groups
    Finding volume group "main2"
  --- Volume group ---
  VG Name               main2
  System ID             cain1067664603
  Format                lvm2
  Metadata Areas        5
  Metadata Sequence No  1612
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                8
  Open LV               8
  Max PV                256
  Cur PV                5
  Act PV                5
  VG Size               269.77 GB
  PE Size               16.00 MB
  Total PE              17265
  Alloc PE / Size       16978 / 265.28 GB
  Free  PE / Size       287 / 4.48 GB
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
  Segments               1
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
  Segments               1
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
  Segments               1
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
  Segments               741
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
  Segments               7
  Allocation             normal
  Read ahead sectors     1024
  Block device           253:7
   
  --- Physical volumes ---
  PV Name               /dev/hdc1     
  PV UUID               58ZN9k-K75s-zVIN-pwlJ-1FGN-Wtps-qlo6Ok
  PV Status             allocatable
  Total PE / Free PE    2452 / 131
   
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
  Total PE / Free PE    7361 / 27
   
  PV Name               /dev/hdd1     
  PV UUID               fx1w8q-xvMl-BEXO-bGW6-BxI7-NzCG-H2YTSV
  PV Status             allocatable
  Total PE / Free PE    256 / 129
   


-- 
Aran Cox <acox@ia.primustel.com>
