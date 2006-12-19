Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBJCZqIM006926
	for <linux-lvm@redhat.com>; Tue, 19 Dec 2006 07:35:52 -0500
Received: from excu-mxob-2.symantec.com (excu-mxob-2.symantec.com
	[198.6.49.23])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBJCZoff021833
	for <linux-lvm@redhat.com>; Tue, 19 Dec 2006 07:35:50 -0500
Received: from excu-mxob-2.symantec.com (unknown [127.0.0.1])
	by excu-mxob-2.symantec.com (Symantec Mail Security) with ESMTP id
	3B3CF40337
	for <linux-lvm@redhat.com>; Tue, 19 Dec 2006 04:35:45 -0800 (PST)
Received: from cup2opsmtapin01.ges.symantec.com
	(cup2opsmtapin01.ges.symantec.com [155.64.1.114])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by excu-mxob-2.symantec.com (Symantec Mail Security) with ESMTP id
	0AFDB40224
	for <linux-lvm@redhat.com>; Tue, 19 Dec 2006 04:35:45 -0800 (PST)
Received: from svl1xchecnpin01.veritas.com ([10.137.18.178]
	helo=SVL1XCHECNPIN01.enterprise.veritas.com)
	by cup2opsmtapin01.ges.symantec.com with esmtp (Exim 4.52)
	id 1GweC8-0001QM-Mt
	for linux-lvm@redhat.com; Tue, 19 Dec 2006 04:35:44 -0800
Message-ID: <4587DCE0.2040104@symantec.com>
Date: Tue, 19 Dec 2006 18:06:48 +0530
From: sudhakar kasina <sudhakar_kasina@symantec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Linux ppc64:lvm command 'pvmove' is not getting
 completed when more than 4 extends are moved
Reply-To: sudhakar_kasina@symantec.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Cc: krishnasuri <krishna_narayanam@symantec.com>, Peter Kettle <peterk@veritas.com>

Hi Linux-Lvm

I am facing a problem with pvmove command of LVM on RHEL4U3  on PPC64 
architecture.
pvmove command is never exiting when I try to issue move for more than 4 
extents.
Is this a bug with RHEL on PPC64??
If not is there any work around ??

I have posted this issue in RH issue tracker #109657 
Summary:  Linux ppc64:lvm command 'pvmove' is not getting completed when 
more than 4 extends are moved


 pvmove --alloc     anywhere     /dev/sdb3:0-4     /dev/sdb3:256-267
  /dev/sdb3: Moved: 80.0%
  /dev/sdb3: Moved: 80.0%
  /dev/sdb3: Moved: 80.0%
  /dev/sdb3: Moved: 80.0%

The above message is displayed for infinitely and pvmove never completes.
This happens for moving 5 or more than 5 extents.
pvmove is successful for 4 or below 4 extents movement.

Configuration
================

OS : RHEL4 UP3
Architecture : PPC64
uname -a : Linux lopgod04.vxindia.veritas.com 2.6.9-34.ELv #1 SMP Mon 
Sep 25 13:31:34 BST 2006 ppc64 ppc64 ppc64 GNU/Linux
Internal disk of size 73GB (sdb)  : using sdb3 for the LVM operations

I am using sdb which is not boot disk ( I have sda as boot disk in my setup)

fdisk -l /dev/sdb
 
Disk /dev/sdb: 73.4 GB, 73407488000 bytes
128 heads, 32 sectors/track, 35003 cylinders
Units = cylinders of 4096 * 512 = 2097152 bytes
 
   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1   *           1           1         172+  41  PPC PReP Boot
Partition 1 does not end on cylinder boundary.
/dev/sdb2               7        2007     4098048   82  Linux swap
/dev/sdb3            2010        6778     9766912   83  Linux
/dev/sdb4            6800       11568     9766912    5  Extended

Steps that caused the above problem
========================================

1. Created partition on /dev/sdb named /dev/sdb3 or size 10G  between 
2010 and 6778 as above

2.  pvcreate /dev/sdb3
    vgcreate  lopvg4 /dev/sdb3
    lvcreate -L 5G -n loplv4 lopvg4
   
3. lvdisplay --map
 
 --- Logical volume ---
  LV Name                /dev/lopvg4/loplv4
  VG Name                lopvg4
  LV UUID                62ZATJ-IMKa-xmOk-kmOG-f5LG-Dle8-1Ksaur
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                5.00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0
    
  --- Segments ---
  Logical extent 0 to 1279:
    Type                linear
    Physical volume     /dev/sdb3
    Physical extents    0 to 1279


 4.  Moving 5 extents using pvmove


 pvmove --alloc anywhere /dev/sdb3:0-4 /dev/sdb3:1290-1294
  /dev/sdb3: Moved: 80.0%
  /dev/sdb3: Moved: 80.0%
  /dev/sdb3: Moved: 80.0%

    The above message is displayed for infinitely and pvmove never 
completes.
    This happens only for moving 4 or above 4 number of extents ..

5. pvmode is successful for moving 4 or less extents as below  

   pvmove --alloc anywhere /dev/sdb3:0-3 /dev/sdb3:1290-1293
  /dev/sdb3: Moved: 100.0%

  lvdisplay --map
  --- Logical volume ---
  LV Name                /dev/lopvg4/loplv4
  VG Name                lopvg4
  LV UUID                62ZATJ-IMKa-xmOk-kmOG-f5LG-Dle8-1Ksaur
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                5.00 GB
  Current LE             1280
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0
    
  --- Segments ---
  Logical extent 0 to 3:
    Type                linear
    Physical volume     /dev/sdb3
    Physical extents    1290 to 1293
    
  Logical extent 4 to 1279:
    Type                linear
    Physical volume     /dev/sdb3
    Physical extents    4 to 1279

Thanks and Regards
Sudhakar Kasina
Symantec Corporation (Veritas)
Pune - India
