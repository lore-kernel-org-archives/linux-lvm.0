Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k16Gj7102884
	for <linux-lvm@redhat.com>; Mon, 6 Feb 2006 11:45:07 -0500
Received: from outmx015.isp.belgacom.be (outmx015.isp.belgacom.be
	[195.238.4.87])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k16Gj03M025235
	for <linux-lvm@redhat.com>; Mon, 6 Feb 2006 11:45:00 -0500
Received: from outmx015.isp.belgacom.be (localhost [127.0.0.1])
	by outmx015.isp.belgacom.be (8.12.11/8.12.11/Skynet-OUT-2.22) with
	ESMTP id k16GijRe003653
	for <linux-lvm@redhat.com>; Mon, 6 Feb 2006 17:44:45 +0100
	(envelope-from <thomas.berton@kreno.be>)
Received: from [192.168.1.99] (178-105.244.81.adsl.skynet.be [81.244.105.178])
	by outmx015.isp.belgacom.be (8.12.11/8.12.11/Skynet-OUT-2.22) with
	ESMTP id k16Gifb4003600
	for <linux-lvm@redhat.com>; Mon, 6 Feb 2006 17:44:42 +0100
	(envelope-from <thomas.berton@kreno.be>)
Message-ID: <43E77D22.1070200@kreno.be>
Date: Mon, 06 Feb 2006 17:45:22 +0100
From: Thomas Berton <thomas.berton@kreno.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] problem with lvm after migration to another debian
	system
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

Hello,
I'm encountering some problems migrating my lvm system to a new debian 
system.
I must say I had to play around with pvcreate and vgcfgrestore to get 
/dev/hdb recognized again on the new system but after fixing that issue 
I'm stuck with following problem:
Booting the new system with the lvm disks it seems that the 
device-mapper is having troubles putting together the lvm device:

output from dmesg:
device-mapper: 4.1.0-ioctl (2003-12-10) initialised: dm@uk.sistina.com
device-mapper: device /dev/hdc too small for target
device-mapper: : dm-linear: Device lookup failed

device-mapper: error adding target to table

Starting the lvm service gives the following:
storage:~# /etc/init.d/lvm start
Setting up LVM Volume Groups...
  Reading all physical volumes.  This may take a while...
  Found volume group "storage" using metadata type lvm2
  /dev/storage: opendir failed: No such file or directory
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'storage-storage1'.
  1 logical volume(s) in volume group "storage" now active
storage:~#

Nevertheless other lvm commands seem to display correct information 
about the lvm.
Below is the output from pvscan, lvscan, lvmdiskscan, pvdisplay and 
vgdisplay.
The lvm is appearing in the /dev/mapper folder, but no link is made in 
the /dev folder btw.
Mounting the lvm fails, gives the error of bad superblock (ext3 filesystem).
The lvm has been created using the full disks and not working on partitions.
I'm hoping someone on this list can help me out or give me some pointers 
on how to continue and getting my lvm mountable again.
Thx in advance,
Thomas.

storage:~# pvscan
  PV /dev/hda   VG storage   lvm2 [279.46 GB / 0    free]
  PV /dev/hdc   VG storage   lvm2 [189.92 GB / 0    free]
  PV /dev/hdb   VG storage   lvm2 [279.46 GB / 0    free]
  Total: 3 [748.84 GB] / in use: 3 [748.84 GB] / in no VG: 0 [0   ]
storage:~#

storage:~# lvscan
  ACTIVE            '/dev/storage/storage1' [748.84 GB] inherit
storage:~#

storage:~# lvmdiskscan
  /dev/hda  [      279.46 GB] LVM physical volume
  /dev/hdc  [      189.92 GB] LVM physical volume
  /dev/sda1 [       18.63 GB]
  /dev/sda2 [      957.00 MB]
  /dev/sda3 [        4.66 GB]
  /dev/sda5 [      956.97 MB]
  /dev/sda6 [        2.80 GB]
  /dev/hdb  [      279.46 GB] LVM physical volume
  0 disks
  5 partitions
  3 LVM physical volume whole disks
  0 LVM physical volumes
storage:~#

storage:~# pvdisplay
  --- Physical volume ---
  PV Name               /dev/hda
  VG Name               storage
  PV Size               279.46 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              71541
  Free PE               0
  Allocated PE          71541
  PV UUID               ZDOYsq-1rGU-bngq-QVZu-DqvG-I7AO-r7Rnl5

  --- Physical volume ---
  PV Name               /dev/hdc
  VG Name               storage
  PV Size               189.92 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              48620
  Free PE               0
  Allocated PE          48620
  PV UUID               VT7Lkj-n4V1-G8mV-a6GF-kspp-Zs61-3YzXD3

  --- Physical volume ---
  PV Name               /dev/hdb
  VG Name               storage
  PV Size               279.46 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              71541
  Free PE               0
  Allocated PE          71541
  PV UUID               jJqtAX-XxMz-nIEC-2ast-7y40-XPFG-rN0Rzz
storage:~#

storage:~# vgdisplay
  --- Volume group ---
  VG Name               storage
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  12
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               748.84 GB
  PE Size               4.00 MB
  Total PE              191702
  Alloc PE / Size       191702 / 748.84 GB
  Free  PE / Size       0 / 0
  VG UUID               59Yxut-UcZa-MBUS-KH8Y-5wZP-Eh1x-1E33Wl

storage:~#
