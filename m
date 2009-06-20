Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5KKkFfQ006619
	for <linux-lvm@redhat.com>; Sat, 20 Jun 2009 16:46:15 -0400
Received: from mail.bercot.org (ks358108.kimsufi.com [91.121.151.81])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5KKk2K0017657
	for <linux-lvm@redhat.com>; Sat, 20 Jun 2009 16:46:02 -0400
Received: from david.huperie (localhost.localdomain [127.0.0.1])
	by mail.bercot.org (Postfix) with ESMTP id B048465966
	for <linux-lvm@redhat.com>; Sat, 20 Jun 2009 22:33:31 +0200 (CEST)
Date: Sat, 20 Jun 2009 22:46:04 +0200
From: David BERCOT <debian@bercot.org>
Message-ID: <20090620224604.337760fb@david.huperie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Power cut -> partition bug -> LVM problem...
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

Hi,

Two days ago, I had a power cut (only one second, but...) on my Debian
server and, when it restarted, it could not mount LVM volumes...
I have a boot partition and all the other ressources are on LVM.

I've booted on a live CD and it seems that my fourth disk had lost its
partition table.
With some tools, I think I have restored the partition table (but I'm
not sure). I used :
sfdisk /dev/sdd < backup_sfdisk
It seems OK except I have "Disk identifier: 0x00000000".

Here are the results of some commands :

# fdisk
Disk /dev/sda: 400.0 GB, 400088457216 bytes
255 heads, 63 sectors/track, 48641 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x0009efa1

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          30      240943+  83  Linux
/dev/sda2              31       48641   390467857+   5  Extended
/dev/sda5              31       48641   390467826   8e  Linux LVM

Disk /dev/sdb: 400.0 GB, 400088457216 bytes
255 heads, 63 sectors/track, 48641 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0xace22e9e

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1       48641   390708801    5  Extended
/dev/sdb5               1       48641   390708769+  8e  Linux LVM

Disk /dev/sdc: 400.0 GB, 400088457216 bytes
255 heads, 63 sectors/track, 48641 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0xcfcecfce

   Device Boot      Start         End      Blocks   Id  System
/dev/sdc1               1       48641   390708801    5  Extended
/dev/sdc5               1       48641   390708769+  8e  Linux LVM

Disk /dev/sdd: 640.1 GB, 640135028736 bytes
255 heads, 63 sectors/track, 77825 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x00000000

   Device Boot      Start         End      Blocks   Id  System
/dev/sdd1               1       77825   625129281    5  Extended
/dev/sdd5               1       77825   625129249+  8e  Linux LVM

# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sda5
  VG Name               VG_Wilco
  PV Size               372.38 GB / not usable 4.24 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              95328
  Free PE               0
  Allocated PE          95328
  PV UUID               dyVLCp-3kAD-wneq-VxVh-Nyr5-q6mn-wf6kjT
   
  --- Physical volume ---
  PV Name               /dev/sdb5
  VG Name               VG_Wilco
  PV Size               372.61 GB / not usable 3.53 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              95387
  Free PE               0
  Allocated PE          95387
  PV UUID               ZEmHeZ-0DnH-VsvK-m9ju-7fdd-z2UH-5kTp4X
   
  --- Physical volume ---
  PV Name               /dev/sdc5
  VG Name               VG_Wilco
  PV Size               372.61 GB / not usable 3.53 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              95387
  Free PE               0
  Allocated PE          95387
  PV UUID               kgMwfG-ugM6-dFeK-8358-EoZO-RuIJ-S0FqVv
   
  --- Physical volume ---
  PV Name               unknown device
  VG Name               VG_Wilco
  PV Size               596.17 GB / not usable 344.00 KB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              152620
  Free PE               0
  Allocated PE          152620
  PV UUID               U3KSpz-6Yf6-QX03-erXL-AnPg-qxF9-1TTFXM
   
# pvscan
  PV /dev/sda5        VG VG_Wilco   lvm2 [372.38 GB / 0    free]
  PV /dev/sdb5        VG VG_Wilco   lvm2 [372.61 GB / 0    free]
  PV /dev/sdc5        VG VG_Wilco   lvm2 [372.61 GB / 0    free]
  PV unknown device   VG VG_Wilco   lvm2 [596.17 GB / 0    free]
  Total: 4 [1.67 TB] / in use: 4 [1.67 TB] / in no VG: 0 [0   ]

# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "VG_Wilco" using metadata type lvm2

I've modified /etc/lvm/backup/VG_Wilco to put /dev/sdd5 instead
of "unknown device" and then, I've tried :
# vgcfgrestore /etc/lvm/backup/VG_Wilco VG_Wilco
Could not find device with uuid "U3KSpz-6Yf6-QX03-erXL-AnPg-qxF9-1TTFXM"
Segmentation fault

Do you know if I can hope to restore my data ?
Do you have any clue ?

Thank you.

David.
