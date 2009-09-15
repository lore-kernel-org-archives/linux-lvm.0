Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8FBc7s8004617
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 07:38:07 -0400
Received: from relay04.mail-hub.dodo.com.au (relay04.mail-hub.dodo.com.au
	[123.2.6.239])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8FBbrGp005110
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 07:37:54 -0400
Received: from 123-2-156-143.static.dsl.dodo.com.au ([123.2.156.143]
	helo=fc11-64.localdomain)
	by relay04.mail-hub.dodo.com.au with esmtp (Exim 4.68)
	(envelope-from <whobedobe@dodo.com.au>) id 1MnWLw-0005Pn-TT
	for linux-lvm@redhat.com; Tue, 15 Sep 2009 21:37:52 +1000
From: Hugh <whobedobe@dodo.com.au>
Date: Tue, 15 Sep 2009 21:37:44 +1000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <200909152137.44474.whobedobe@dodo.com.au>
Subject: [linux-lvm] I've tried to get some support on this list about lvm
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

but I've had no responses.
I'm sure I've discovered a bug but nobody has answered my 
question of offered any advice or requested any further 
information.
Please look at my problem and see if there is anything which might 
help me.
This is the url: 
http://forums.fedoraforum.org/showthread.php?p=1263530

I'll post it here too so that if for some reason you can't access the 
forum:

 device-mapper: reload ioctl failed: Invalid argument Failed to 
suspend LogVol00
I hope this is the right forum.
I've read hundreds of threads on this problem but they seem to be 
intermittent and the resolution has been using a different kernel 
version.
I'm using the latest kernel but I still have this problem
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
</cut>

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
</cut>

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
</cut>

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

Disk /dev/sda: 107.3 GB, 107374182400 bytes
255 heads, 63 sectors/track, 13054 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x000d4599

Device Boot Start End Blocks Id System
/dev/sda1 * 1 26 204800 83 Linux
Partition 1 does not end on cylinder boundary.
/dev/sda2 26 13054 104651423+ 8e Linux LVM

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



Anybody know what the problem is?
TIA,
Hugh
