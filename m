Message-ID: <C6B0A1AF05B7A04E9D8E784173AE3D20163010@ausx2kmpc104.aus.amer.dell.com>
From: Taylor_Carpenter@Dell.com
Subject: RE: [linux-lvm] not enough free/allocatable physical extents to
 e xtend logical vo lume
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Jul 30 00:32:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> From: AJ Lewis [mailto:lewis@sistina.com]
> 
> I'm guessing you're trying to extend by too large a size.  Use 
> pvdisplay on /dev/sde1 and note the number of physical extents free.  
> Then try passing that to e2fsadm with the '-l' flag instead 
> of passing 
> 33.91G with the '-L' flag.

I had already removed the disk from the group so it was not showing anything
except size with pvdisplay.
 
> This is just a guess though.  It's pretty  hard to tell without all the
commands you ran and the output 
> they gave you.


I only ran the commands listed on http://tldp.org/HOWTO/LVM-HOWTO/x802.html.
I will go ahead and do the process again and show the output from each
command.




[root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdb1" of VG "Scratch" [33.91 GB / 240 MB free]
pvscan -- ACTIVE   PV "/dev/sdc1" of VG "Scratch" [33.91 GB / 240 MB free]
pvscan -- ACTIVE   PV "/dev/sdd1" of VG "Scratch" [33.91 GB / 240 MB free]
pvscan -- total: 3 [101.74 GB] / in use: 3 [101.74 GB] / in no VG: 0 [0]

[root]# fdisk -l /dev/sde

Disk /dev/sde: 36.4 GB, 36420075008 bytes
255 heads, 63 sectors/track, 4427 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sde1             1      4427  35559846   8e  Linux LVM


[root]# pvcreate /dev/sde1
pvcreate -- physical volume "/dev/sde1" successfully created


[root]# vgextend Scratch /dev/sde1
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
vgextend -- doing automatic backup of volume group "Scratch"
vgextend -- volume group "Scratch" successfully extended

[root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdb1" of VG "Scratch" [33.91 GB / 240 MB free]
pvscan -- ACTIVE   PV "/dev/sdc1" of VG "Scratch" [33.91 GB / 240 MB free]
pvscan -- ACTIVE   PV "/dev/sdd1" of VG "Scratch" [33.91 GB / 240 MB free]
pvscan -- ACTIVE   PV "/dev/sde1" of VG "Scratch" [33.91 GB / 33.91 GB free]
pvscan -- total: 4 [135.65 GB] / in use: 4 [135.65 GB] / in no VG: 0 [0]


[root]# pvdisplay /dev/sde1
--- Physical volume ---
PV Name               /dev/sde1
VG Name               Scratch
PV Size               33.91 GB [71119692 secs] / NOT usable 4.19 MB [LVM:
161 KB]
PV#                   4
PV Status             NOT available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              8680
Free PE               8680
Allocated PE          0
PV UUID               x4xXPp-UXDb-fBfO-tnpb-E4HT-q8qJ-p5X6HT


[root]# umount /scratch/

I don't have ext2resize so I will use the default resize2fs

[root]# e2fsadm /dev/Scratch/Scratch -L+10G
e2fsadm -- rounding up size to stripe boundary size
e2fsck 1.32 (09-Nov-2002)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/Scratch/Scratch: 5030/103552 files (2.7% non-contiguous),
18886811/26480640 blocks
lvextend -- extending logical volume "/dev/Scratch/Scratch" to 111.02 GB
lvextend -- please enter physical volumes to extend contiguous logical
volume

Looks like I am getting a different error now.  I will try to use lvextend
directly.  I try -L first.



[root]# lvextend -L +10G /dev/Scratch/Scratch /dev/sde1
lvextend -- rounding size to stripe boundary size
lvextend -- extending logical volume "/dev/Scratch/Scratch" to 111.02 GB
lvextend -- not enough free/allocatable physical extents to extend logical
volume "/dev/Scratch/Scratch"


I will try -l now.  Here is a disk already in the group.  It is an identical
disk.


[root]# pvdisplay /dev/sdd1
--- Physical volume ---
PV Name               /dev/sdd1
VG Name               Scratch
PV Size               33.91 GB [71119692 secs] / NOT usable 4.19 MB [LVM:
161 KB]
PV#                   3
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              8680
Free PE               60
Allocated PE          8620
PV UUID               S02n1R-lmdI-CU75-hMVp-gwxl-PAwk-dQiNP5


I will use its allocated extent size for the new one

lvextend -l +8620 /dev/Scratch/Scratch /dev/sde1
lvextend -- rounding size to stripe boundary size
lvextend -- extending logical volume "/dev/Scratch/Scratch" to 134.70 GB
lvextend -- not enough free/allocatable physical extents to extend logical
volume "/dev/Scratch/Scratch"

[root]# pvdisplay /dev/sde1
--- Physical volume ---
PV Name               /dev/sde1
VG Name               Scratch
PV Size               33.91 GB [71119692 secs] / NOT usable 4.19 MB [LVM:
161 KB]
PV#                   4
PV Status             NOT available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              8680
Free PE               8680
Allocated PE          0
PV UUID               x4xXPp-UXDb-fBfO-tnpb-E4HT-q8qJ-p5X6HT

[root]# lvextend -l +7000 /dev/Scratch/Scratch /dev/sde1
lvextend -- rounding size to stripe boundary size
lvextend -- extending logical volume "/dev/Scratch/Scratch" to 128.37 GB
lvextend -- not enough free/allocatable physical extents to extend logical
volume "/dev/Scratch/Scratch"

The volume is using striping.  Is there some issue with that?  Do I have to
do some other steps to add the new disk so it is available?
