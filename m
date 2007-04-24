Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3ONNhlE029080
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 19:23:43 -0400
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3ONNfDp032119
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 19:23:41 -0400
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.6) with ESMTP id l3ONNVV12310
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 16:23:35 -0700 (PDT)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.13.8/8.13.8) with ESMTP id l3ONNVa5030011
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 16:23:31 -0700
Received: (from ray5147@localhost)
	by leoray.esri.com (8.13.8/8.13.8/Submit) id l3ONNVMo030010
	for linux-lvm@redhat.com; Tue, 24 Apr 2007 16:23:31 -0700
Date: Tue, 24 Apr 2007 16:23:31 -0700
From: Ray Van Dolson <rvandolson@esri.com>
Message-ID: <20070424232330.GA29984@esri.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Large LVM leading to e2fsck segfault
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
To: linux-lvm@redhat.com

Hello everyone -- got a CentOS 4.4 (x86_64) machine running a ~9TB LVM.
We initially had problems with the LVM under 32-bit CentOS 4 so we
upgraded to 64-bit CentOS.  The LVM was originally created under the
32-bit environment however.

# uname -a
Linux rmanbackup 2.6.9-42.0.10.ELsmp #1 SMP Tue Feb 27 09:40:21 EST 2007 x86_64 x86_64 x86_64 GNU/Linux

It worked fine for a few days, but we began seeing errors such as the
following:

Apr 23 12:19:59 rmanbackup kernel: attempt to access beyond end of device
Apr 23 12:19:59 rmanbackup kernel: dm-0: rw=0, want=34359738368, limit=20507254784
Apr 23 12:19:59 rmanbackup kernel: attempt to access beyond end of device
Apr 23 12:19:59 rmanbackup kernel: dm-0: rw=0, want=34359738368, limit=20507254784

Sure enough:

# blockdev --getsize /dev/backup0/backup 
20507254784

Also, when attempting to run e2fsck on the (unmounted) LVM:

# rpm -q e2fsprogs
e2fsprogs-1.35-12.4.EL4

# gdb e2fsck
GNU gdb Red Hat Linux (6.3.0.0-1.132.EL4rh)
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "x86_64-redhat-linux-gnu"...Using host
libthread_db library "/lib64/tls/libthread_db.so.1".

(gdb) r -f /dev/backup0/backup
Starting program: /sbin/e2fsck -f /dev/backup0/backup
warning: shared library handler failed to enable breakpoint
e2fsck 1.35 (28-Feb-2004)
Pass 1: Checking inodes, blocks, and sizes

Program received signal SIGSEGV, Segmentation fault.
ext2fs_test_bit (nr=0, addr=0x2a987d6010) at bitops.c:64
64              return ((mask & *ADDR) != 0);
(gdb) bt
#0  ext2fs_test_bit (nr=0, addr=0x2a987d6010) at bitops.c:64
#1  0x000000000040670c in e2fsck_pass1 (ctx=0x5ae700) at ../lib/ext2fs/bitops.h:493
#2  0x0000000000403102 in e2fsck_run (ctx=0x5ae700) at e2fsck.c:193
#3  0x0000000000401e50 in main (argc=Variable "argc" is not available.) at unix.c:1075
#4  0x0000000000421161 in __libc_start_main ()
#5  0x000000000040018a in _start ()
#6  0x0000007fbffffa58 in ?? ()
#7  0x0000000000000000 in ?? ()

Likely this is related to the error we're seeing in /var/log/messages
above?  I see mention of the ext2fs_test_bit() function in the lkml
archives.  Here for example:

  http://www.archivum.info/linux.kernel/2006-03/msg09063.html

I would imagine RH would be using this patch?

Here is some other information that may be useful:

# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sdi2             30233928   1750124  26947992   7% /
/dev/sdi1               194442     20268    164135  11% /boot
none                    512344         0    512344   0% /dev/shm
/dev/sdi4              5969156    203748   5462184   4% /var
leoray:/leoray1      234443424  42961184 179381024  20%
/net/leoray/leoray1
/dev/mapper/backup0-backup
                     10252629796   6309412 10194570344   1% /backup

# lvdisplay 
  --- Logical volume ---
  LV Name                /dev/backup0/backup
  VG Name                backup0
  LV UUID                3bfDP2-S7N4-MNJU-xDV6-s3nz-zALq-2cEsyA
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                9.55 TB
  Current LE             2503327
  Segments               8
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

# pvscan 
  PV /dev/sda1   VG backup0   lvm2 [1.36 TB / 0    free]
  PV /dev/sdb1   VG backup0   lvm2 [931.29 GB / 0    free]
  PV /dev/sdc1   VG backup0   lvm2 [1.36 TB / 0    free]
  PV /dev/sdd1   VG backup0   lvm2 [931.29 GB / 0    free]
  PV /dev/sde1   VG backup0   lvm2 [931.29 GB / 0    free]
  PV /dev/sdf1   VG backup0   lvm2 [1.36 TB / 0    free]
  PV /dev/sdg1   VG backup0   lvm2 [1.36 TB / 0    free]
  PV /dev/sdh1   VG backup0   lvm2 [1.36 TB / 0    free]
  Total: 8 [9.55 TB] / in use: 8 [9.55 TB] / in no VG: 0 [0   ]

Any suggestions?  Not sure where to start.

Ray
