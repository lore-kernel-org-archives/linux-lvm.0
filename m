Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6SAJeD7020396
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 06:19:40 -0400
Received: from mail.informatik.uni-luebeck.de (cs3.informatik.uni-luebeck.de
	[141.83.143.73])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6SAJY04025036
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 06:19:34 -0400
Received: from [85.233.16.196] (ip-196-16.travedsl.de [85.233.16.196])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.informatik.uni-luebeck.de (Postfix) with ESMTP id 1FA1820150
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 12:19:27 +0200 (CEST)
Message-ID: <44C9E4BD.9070204@forouher.de>
Date: Fri, 28 Jul 2006 12:19:41 +0200
From: Dariush Forouher <dariush@forouher.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Strange pvmove problem
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

Hi!

I'm trying to move PEs away from two PVs (because I want to remove the
disks from the system), but pvmove always fails:

# pvmove /dev/hdd1 /dev/sda3
    Wiping cache of LVM-capable devices
    Finding volume group "LVM"
    Archiving volume group "LVM" metadata (seqno 51).
    Creating logical volume pvmove0
    Moving 3468 extents of logical volume LVM/data
    Found volume group "LVM"
    Updating volume group metadata
    Creating volume group backup "/etc/lvm/backup/LVM" (seqno 52).
    Found volume group "LVM"
    Found volume group "LVM"
    Suspending LVM-data (253:1)
    Found volume group "LVM"
    Creating LVM-pvmove0
    Loading LVM-pvmove0 table
  device-mapper: reload ioctl failed: Invalid argument
  ABORTING: Temporary mirror activation failed.  Run pvmove --abort.
    Found volume group "LVM"
    Loading LVM-pvmove0 table
  device-mapper: reload ioctl failed: Invalid argument
    Loading LVM-data table
  device-mapper: reload ioctl failed: Invalid argument


After that the system remains in an unstable state. All [vg|pv|lv]*
commands hang and the LV becomes unaccessible too.

After rebooting and excecuting "pvmove" without any arguments the VG
becomes accessible again and I'm back where I started (without any PE
moved). Trying to move data from another PV makes no difference.

The system's running with Debian Testing and Kernel 2.6.16.16.

Can anyone please help me finding out whats causing this?

ciao
Dariush

# pvdisplay
File descriptor 3 left open
File descriptor 4 left open
File descriptor 6 left open
File descriptor 8 left open
  --- Physical volume ---
  PV Name               /dev/hda3
  VG Name               LVM
  PV Size               129.48 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              33147
  Free PE               33147
  Allocated PE          0
  PV UUID               uc4kn4-xMQ7-M4vw-1thl-OcCF-LIV9-aeRTn0

  --- Physical volume ---
  PV Name               /dev/hdd1
  VG Name               LVM
  PV Size               37.27 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              9541
  Free PE               6073
  Allocated PE          3468
  PV UUID               tNzm5d-ClTt-0vJ6-ZQA9-0eYQ-IwKy-tbxV6o

  --- Physical volume ---
  PV Name               /dev/sda3
  VG Name               LVM
  PV Size               214.19 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              54833
  Free PE               54734
  Allocated PE          99
  PV UUID               CfA2kz-5Gt8-Zshc-3Eou-fscj-1Lfn-xOEQSY

  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               LVM
  PV Size               232.88 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              59618
  Free PE               0
  Allocated PE          59618
  PV UUID               L6S26w-zr8S-t0RN-si42-zWEd-rJA5-Ms0JIb

# vgdisplay
File descriptor 3 left open
File descriptor 4 left open
File descriptor 6 left open
File descriptor 8 left open
  --- Volume group ---
  VG Name               LVM
  System ID
  Format                lvm2
  Metadata Areas        4
  Metadata Sequence No  55
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                4
  Act PV                4
  VG Size               613.82 GB
  PE Size               4.00 MB
  Total PE              157139
  Alloc PE / Size       63185 / 246.82 GB
  Free  PE / Size       93954 / 367.01 GB
  VG UUID               GoVzA8-HPSg-FNhr-6fM3-Fo94-k2IG-462F9E

# lvdisplay
File descriptor 3 left open
File descriptor 4 left open
File descriptor 6 left open
File descriptor 8 left open
  --- Logical volume ---
  LV Name                /dev/LVM/data
  VG Name                LVM
  LV UUID                zscrIa-BwvW-rktv-3L5P-QP67-BkfG-ri3NZL
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                246.82 GB
  Current LE             63185
  Segments               3
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1
