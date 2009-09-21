Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8LM8bXE030870
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 18:08:37 -0400
Received: from relay03.mail-hub.dodo.com.au (relay03.mail-hub.dodo.com.au
	[123.2.6.238])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8LM8PPZ012884
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 18:08:25 -0400
Received: from 123-2-156-143.static.dsl.dodo.com.au ([123.2.156.143]
	helo=fc11-64.localdomain)
	by relay03.mail-hub.dodo.com.au with esmtp (Exim 4.68)
	(envelope-from <whobedobe@dodo.com.au>) id 1Mpr3Q-0000pz-Un
	for linux-lvm@redhat.com; Tue, 22 Sep 2009 08:08:23 +1000
From: Hugh <whobedobe@dodo.com.au>
Date: Tue, 22 Sep 2009 08:08:16 +1000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <200909220808.16458.whobedobe@dodo.com.au>
Subject: [linux-lvm] grow lv bug
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
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

This seems to be a bug with lvm. Unable to grow the logical volume.
I have the space. pvextend succeeded, vgextend succeeded but lvextend, 
lvresize fail.

Where can I report this and get some support?

Following is a transcript of my attempt to solve this problem. I've remove the 
sda stuff as it has no problems.

[root@fc11-64 ~]# pvs -v
    Scanning for physical volume names
  PV         VG         Fmt  Attr PSize  PFree  DevSize PV UUID                               
  /dev/sdb2  VolGroup00 lvm2 a-   67.91G 20.00G  47.93G eCuGyH-jV7L-Tgdg-JyYW-
sWK1-ehZY-OLw0WS
[root@fc11-64 ~]# pvscan
  PV /dev/sdb2   VG VolGroup00   lvm2 [67.91 GB / 20.00 GB free]
  PV /dev/sda2   VG vg_fc1164    lvm2 [99.80 GB / 0    free]
  Total: 2 [167.71 GB] / in use: 2 [167.71 GB] / in no VG: 0 [0   ]

[root@fc11-64 ~]# parted -l
Model: VMware, VMware Virtual S (scsi)
Disk /dev/sdb: 73.0GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos

Number  Start   End     Size    Type     File system  Flags
 1      32.3kB  74.0MB  74.0MB  primary  ext3         boot 
 2      74.0MB  51.5GB  51.5GB  primary               lvm  
Model: Linux device-mapper (dm)
Disk /dev/mapper/VolGroup00-LogVol00: 49.3GB
Sector size (logical/physical): 512B/512B
Partition Table: loop

Number  Start  End     Size    File system  Flags
 1      0.00B  49.3GB  49.3GB  ext3              


Model: Linux device-mapper (dm)
Disk /dev/mapper/VolGroup00-LogVol01: 2114MB
Sector size (logical/physical): 512B/512B
Partition Table: loop

Number  Start  End     Size    File system  Flags
 1      0.00B  2114MB  2114MB  linux-swap        


[root@fc11-64 ~]# rpm -q kernel
kernel-2.6.29.6-217.2.8.fc11.x86_64
[root@fc11-64 ~]# rpm -qa | grep lvm
lvm2-2.02.48-2.fc11.x86_64
system-config-lvm-1.1.9-1.fc11.noarch


[root@fc11-64 ~]# lvresize -v -d -L 65.9375G 
/dev/VolGroup00/LogVol00
Finding volume group VolGroup00
Archiving volume group "VolGroup00" metadata (seqno 5).
Extending logical volume LogVol00 to 65.94 GB
Found volume group "VolGroup00"
Found volume group "VolGroup00"
Loading VolGroup00-LogVol00 table
device-mapper: reload ioctl failed: Invalid argument
Failed to suspend LogVol00
Creating volume group backup "/etc/lvm/backup/VolGroup00" 
(seqno 6).

[root@fc11-64 ~]# lvextend -v -d -L 65.9375G 
/dev/VolGroup00/LogVol00
Finding volume group VolGroup00
Archiving volume group "VolGroup00" metadata (seqno 5).
Extending logical volume LogVol00 to 65.94 GB
Found volume group "VolGroup00"
Found volume group "VolGroup00"
Loading VolGroup00-LogVol00 table
device-mapper: reload ioctl failed: Invalid argument
Failed to suspend LogVol00
Creating volume group backup "/etc/lvm/backup/VolGroup00" 
(seqno 6).


Running Logical Volume Manager gui and attempting to extend the 
volume results in the same error.

[root@fc11-64 ~]# pvdisplay
--- Physical volume ---
PV Name /dev/sdb2
VG Name VolGroup00
PV Size 67.93 GB / not usable 24.13 MB
Allocatable yes
PE Size (KByte) 32768
Total PE 2173
Free PE 640
Allocated PE 1533
PV UUID eCuGyH-jV7L-Tgdg-JyYW-sWK1-ehZY-OLw0WS

[root@fc11-64 ~]# vgdisplay
--- Volume group ---
VG Name VolGroup00
System ID
Format lvm2
Metadata Areas 1
Metadata Sequence No 5
VG Access read/write
VG Status resizable
MAX LV 0
Cur LV 2
Open LV 0
Max PV 0
Cur PV 1
Act PV 1
VG Size 67.91 GB
PE Size 32.00 MB
Total PE 2173
Alloc PE / Size 1533 / 47.91 GB
Free PE / Size 640 / 20.00 GB
VG UUID 7I9mBS-xzMJ-L1fC-7IT4-ckJq-g8r3-pv333k

[root@fc11-64 ~]# lvdisplay
--- Logical volume ---
LV Name /dev/VolGroup00/LogVol01
VG Name VolGroup00
LV UUID ph5nOV-3cyI-fFNV-WlyQ-rDI8-dTsY-5FcWn2
LV Write Access read/write
LV Status available
# open 0
LV Size 1.97 GB
Current LE 63
Segments 1
Allocation inherit
Read ahead sectors auto
- currently set to 256
Block device 253:2

--- Logical volume ---
LV Name /dev/VolGroup00/LogVol00
VG Name VolGroup00
LV UUID ZGiTvh-XhRo-sLk5-bkJX-U30G-xkCD-rYszvt
LV Write Access read/write
LV Status available
# open 0
LV Size 45.94 GB
Current LE 1470
Segments 1
Allocation inherit
Read ahead sectors auto
- currently set to 256
Block device 253:3
</cut>


[root@fc11-64 ~]# tail -3 /var/log/messages
Sep 10 20:55:46 fc11-64 kernel: device-mapper: table: device 8:18 
too small for target
Sep 10 20:55:46 fc11-64 kernel: device-mapper: table: 253:3: 
linear: dm-linear: Device lookup failed
Sep 10 20:55:46 fc11-64 kernel: device-mapper: ioctl: error adding 
target to table

[root@fc11-64 ~]# fdisk -l
Disk /dev/sdb: 73.0 GB, 73014444032 bytes
255 heads, 63 sectors/track, 8876 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0xd426be2d

Device Boot Start End Blocks Id System
/dev/sdb1 * 1 9 72261 83 Linux
/dev/sdb2 10 6266 50259352+ 8e Linux LVM

Disk /dev/dm-0: 102.9 GB, 102965968896 bytes
255 heads, 63 sectors/track, 12518 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x00000000

Disk /dev/dm-0 doesn't contain a valid partition table

Disk /dev/dm-1: 4194 MB, 4194304000 bytes
255 heads, 63 sectors/track, 509 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x00000000

Disk /dev/dm-1 doesn't contain a valid partition table

Disk /dev/dm-2: 2113 MB, 2113929216 bytes
255 heads, 63 sectors/track, 257 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x00000000

Disk /dev/dm-2 doesn't contain a valid partition table

Disk /dev/dm-3: 49.3 GB, 49325015040 bytes
255 heads, 63 sectors/track, 5996 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x00000000

Disk /dev/dm-3 doesn't contain a valid partition table


All I can see is the log message, but it doesn't help me to solve the problem 
and the error message seems to be wrong. Where can I report this bug?

Thanks Hugh.
