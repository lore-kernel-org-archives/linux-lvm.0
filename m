Return-Path: <wigren@home.se>
Message-ID: <3A76F94A.711D56ED@home.se>
Date: Tue, 30 Jan 2001 18:26:34 +0100
From: Per Wigren <wigren@home.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvextend segfault
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, lvm-bugs@sistina.com

Linux-LVM-Bug@sistina.com, as told in the README, doesn't work so I send
it here instead.
I'm not on the list so please CC wigren@home.se!

I created a VG with only /dev/hdd1. Then I try to extend that VG with
/dev/hdc1, but lvextend segfaults.
Still, vgdisplay says it's there, but "VG Size: 42.95 GB", which is the
size of /dev/hdd1 ONLY.... /dev/hdc1 is 29 GB so it should say "72
GB"...
They trying to remove /dev/hdc1 from the VG it says it doesn't belong to

VG??!!!

Please help!

I think this is best explained with an example:

stormie:/usr/src/temp/LVM/0.9.1_beta3# vgextend -v vg02 /dev/hdc1
vgextend -- locking logical volume manager
vgextend -- checking volume group name "vg02"
vgextend -- checking volume group "vg02" existence
vgextend -- checking for inactivity of volume group
vgextend -- reading data of volume group "vg02" from lvmtab
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
vgextend -- reading data for all physical volumes from disk(s)
vgextend -- extending VGDA structures of volume group "vg02"
vgextend -- volume group "vg02" will be extended by 1 new physical
volumes
vgextend -- extending volume group "vg02" by physical volume "/dev/hdc1"

in kernel
Segmentation fault
stormie:/usr/src/temp/LVM/0.9.1_beta3# vgdisplay -v vg02
--- Volume group ---
VG Name               vg02
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                2
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                4
Act PV                4
VG Size               42.95 GB
PE Size               4 MB
Total PE              10994
Alloc PE / Size       6681 / 26.1 GB
Free  PE / Size       4313 / 16.85 GB
VG UUID               z2W4tI-xK3w-dE2Q-DUYl-CrHN-3KzM-zyBXA5

--- Logical volume ---
LV Name                /dev/vg02/music
VG Name                vg02
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                1.1 GB
Current LE             281
Allocated LE           281
Allocation             next free
Read ahead sectors     120
Block device           58:0

--- Logical volume ---
LV Name                /dev/vg02/temp
VG Name                vg02
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                25 GB
Current LE             6400
Allocated LE           6400
Allocation             next free
Read ahead sectors     120
Block device           58:1


--- Physical volumes ---
PV Name (#)           /dev/hdc1 (2)
PV Status             available / allocatable
Total PE / Free PE    7328 / 7328

PV Name (#)           /dev/hdd1 (1)
PV Status             available / allocatable
Total PE / Free PE    10994 / 4313

stormie:/usr/src/temp/LVM/0.9.1_beta3# vgreduce -v vg02 /dev/hdc1
vgreduce -- locking logical volume manager
vgreduce -- checking volume group name "vg02"
vgreduce -- checking volume group "vg02" existence
vgreduce -- checking volume group "vg02" activity
vgreduce -- reading data of volume group "vg02" from disk(s)
vgreduce -- reducing VGDA structures of volume group "vg02"
vgreduce -- physical volume "/dev/hdc1" doesn't belong to volume group
"vg02"
stormie:/usr/src/temp/LVM/0.9.1_beta3#


I use kernel 2.4.0ac12 and 0.9.1beta3 of the lvm-tools.

Best regards
Per Wigren
