Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9TDhVV11899
	for <linux-lvm@redhat.com>; Sat, 29 Oct 2005 09:43:31 -0400
Received: from smtp1.golden.net (smtp.golden.net [199.166.210.31])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9TDhKNd030196
	for <linux-lvm@redhat.com>; Sat, 29 Oct 2005 09:43:25 -0400
Received: from node-202.tor.pppoe.execulink.com ([216.59.240.202]
	helo=[192.168.1.100]) by smtp1.golden.net with esmtp (Exim 4.50)
	id 1EVqzJ-000277-LV
	for linux-lvm@redhat.com; Sat, 29 Oct 2005 09:43:13 -0400
Message-ID: <43637D84.2000209@golden.net>
Date: Sat, 29 Oct 2005 09:47:48 -0400
From: German Trejo <germant@golden.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] No Volume name
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

I am getting warning message "Incorrect metadata area header checksum" 
LVM How to ask for a file on /etc/lvm/archive,  I don't have any 
VolumeGroupName_XXXXX.vg file;  seems like my system works fine, but I 
have the concern about this warning message. Do any of you have some 
idea how to fix this problem? Following are some outputs to fdisk and 
LVM commands

[root@localhost ~]# fdisk -l
Disk /dev/hda: 40.0 GB, 40020664320 bytes
255 heads, 63 sectors/track, 4865 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1        4864    39070048+   7  HPFS/NTFS

Disk /dev/hdb: 40.0 GB, 40020664320 bytes
255 heads, 63 sectors/track, 4865 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hdb1   *           1          13      104391   83  Linux
/dev/hdb2              14         242     1839442+  82  Linux swap / Solaris
/dev/hdb3             243        4865    37134247+  83  Linux
[root@localhost ~]# lvmdiskscan
  /dev/hda1 [       37.26 GB]
  /dev/hdb1 [      101.94 MB]
  Incorrect metadata area header checksum
  /dev/hdb2 [        1.75 GB] LVM physical volume
  /dev/hdb3 [       35.41 GB]
  0 disks
  3 partitions
  0 LVM physical volume whole disks
  1 LVM physical volume
[root@localhost ~]# pvdisplay
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  --- NEW Physical volume ---
  PV Name               /dev/hdb2
  VG Name
  PV Size               37.17 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               0SmZ7P-44BI-Ls4s-lR2V-Q4Bo-Ah0p-CxWUYe

[root@localhost ~]# lvs
  Incorrect metadata area header checksum
[root@localhost ~]# lvscan
  Incorrect metadata area header checksum
[root@localhost ~]# pvscan
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  PV /dev/hdb2         lvm2 [37.17 GB]
  Total: 1 [37.17 GB] / in use: 0 [0   ] / in no VG: 1 [37.17 GB]
[root@localhost ~]# vgck
  Incorrect metadata area header checksum
[root@localhost ~]# vgdisplay
  Incorrect metadata area header checksum
[root@localhost ~]# vgscan
  Reading all physical volumes.  This may take a while...
  Incorrect metadata area header checksum
[root@localhost ~]#
