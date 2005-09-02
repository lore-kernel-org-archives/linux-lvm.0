Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8315RV06116
	for <linux-lvm@redhat.com>; Fri, 2 Sep 2005 21:05:27 -0400
Received: from postfix1-c.free.fr (postfix1-c.free.fr [213.228.0.79])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8315LD1011474
	for <linux-lvm@redhat.com>; Fri, 2 Sep 2005 21:05:21 -0400
Received: from postfix4-1.free.fr (postfix4-1.free.fr [213.228.0.62])
	by postfix1-c.free.fr (Postfix) with ESMTP id 677461181784
	for <linux-lvm@redhat.com>; Sat,  3 Sep 2005 01:54:44 +0200 (CEST)
Received: from [192.168.0.20] (unknown [81.56.186.147])
	by postfix4-1.free.fr (Postfix) with ESMTP id 4791C3159AE
	for <linux-lvm@redhat.com>; Sat,  3 Sep 2005 01:54:41 +0200 (CEST)
From: e-Jah <e-Jah@ejahworld.net>
Date: Sat, 03 Sep 2005 01:54:40 +0200
Message-Id: <1125705280.10227.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Big problem with my LVM
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

Hi all,

I have a big problem with my LVM, let me explain you it:
I had a lv of a vg, this vg was composed of 2 pv and i had an
ext3 partition on this lvm.
Today i reinstalled my system on a new hard drive and i used the partman
tool of debian, it detected me the 2 disks as lvm, then i simply create
a vg with this 2 disque, and a lv with all the space. After i said: "do
nothing" to put myself the entry to mount it in fstab.
Now i can't mount it, and fdisk don't detect any partition on this drive
Testdisk found nothing too.
I have the old informations about the lvm, is it possible to come back
in the old situation with them (or have you got a better solution ) ?

Thank you very much.

(sorry for my english ^^)

My actual configuration (who doesn't work):

[root@ici]/home/ejah #pvdisplay
  --- Physical volume ---
  PV Name               /dev/hde1
  VG Name               donnees
  PV Size               115,04 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              29449
  Free PE               0
  Allocated PE          29449
  PV UUID               it2W5v-3hKi-DKCC-2eqw-C11U-GWoY-U7pO4v

  --- Physical volume ---
  PV Name               /dev/hdg1
  VG Name               donnees
  PV Size               189,91 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              48618
  Free PE               0
  Allocated PE          48618
  PV UUID               6g9FOv-qeVO-00bW-B8TV-kL3t-D2XD-M09u0H


[root@ici]/home/ejah # vgdisplay
  --- Volume group ---
  VG Name               donnees
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               304,95 GB
  PE Size               4,00 MB
  Total PE              78067
  Alloc PE / Size       78067 / 304,95 GB
  Free  PE / Size       0 / 0
  VG UUID               CgCalc-mWD8-NwYs-Y79z-1A4V-MpY6-YkXQB0

[root@ici]/home/ejah # lvdisplay
  --- Logical volume ---
  LV Name                /dev/donnees/donnees
  VG Name                donnees
  LV UUID                mCFZue-m7Bf-LBju-BCjU-Xo7G-7GE7-dT2QeQ
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                304,95 GB
  Current LE             78067
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:0


-- 
Guillaume aKa e-Jah
