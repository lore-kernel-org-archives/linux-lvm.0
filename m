Message-Id: <3C4EDF1A.3000409@cgg.com>
From: Guillaume Duquesnay <gduquesnay@cgg.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] VG lost, no lvmconf => Help !
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
Date: Wed Jan 23 10:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Here's my startup config :
on a single SCSI disk :
- linux 2.4.17 was booting on an lvm partiton, VG main, with LV : root, 
usr, boot, and  var.
- an old linux system, 2.4.17 also, but classical ext2-based.

The LVM linux system was created by copying the root partitions of the 
ext2 system (as described in the LVM doc). Everything was working great 
with the LVM-based system, but i kept the old ext2 system as a rescue 
linux. Then, I did a vgextend to a remaining PV to my VG, and it boot 
and works already.

Problems arrived when i tried to add a SCSI CD burner : lvm didn't find 
the PVs, nor the VG, causing a kernel panic at boot time, and so did the 
ext2 linux. I was unable to fix that problem (SCSI id checked, ...), i 
removed that SCSI device, and then only the ext2 system did boot again. 
My vg was no longer detected.

So, here's where i am : under the ext2 system, i have no lvmtab for my 
VG, neither a recent main.conf, and my vg is no more detected, so i 
cannot recover my vg with vgcfgrestore. I did scan the 2 LVM PVs, and 
they are ok.
So my question is :
is there a way to recover my VG with the datas contained in the PVs ?

info :

The system is a Linux-2.4.17 based kernel, with lvm-1.0.1-1

Here's my log :

////////------pvscan-------
# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sda1"  is associated to an unknown VG (run 
vgscan)
pvscan -- inactive PV "/dev/sda3"  is associated to an unknown VG (run 
vgscan)
pvscan -- total: 2 [5.39 GB] / in use: 2 [5.39 GB] / in no VG: 0 [0]

///////------lvmdiskscan-------
-]# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/sda1 [       3.99 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/sda2 [       2.60 GB] Primary  LINUX native 
partition [0x83]lvmdiskscan -- /dev/sda3 [       1.39 GB] Primary  LVM 
partition [0x8E]
lvmdiskscan -- /dev/sda4 [     494.19 MB] Primary  LINUX swap partition 
[0x82]
lvmdiskscan -- 1 disk
lvmdiskscan -- 0 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 4 partitions
lvmdiskscan -- 2 LVM physical volume partitions

///////------vgscan--------
]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

///////------vgdisplay-----
]# vgdisplay
vgdisplay -- no volume groups found


///////------pvdata-------
]# pvdata -v -V -L /dev/sda1 | grep -v empty
--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                4
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               5.38 GB
PE Size               4.00 MB
Total PE              1376
Alloc PE / Size       1277 / 4.99 GB
Free  PE / Size       99 / 396.00 MB
VG UUID               ML3C0g-bpt6-2He5-AK6f-5DNt-2LVV-bEm05U

--- List of logical volumes ---

--- Logical volume ---
LV Name                /dev/main/boot
VG Name                main
LV Write Access        read/write
LV Status              NOT available
LV #                   1
# open                 0
LV Size                40.00 MB
Current LE             10
Allocated LE           10
Allocation             next free
Read ahead sectors     120
Block device           58:0
read_ahead: 120

--- Logical volume ---
LV Name                /dev/main/root
VG Name                main
LV Write Access        read/write
LV Status              NOT available
LV #                   2
# open                 0
LV Size                1.00 GB
Current LE             256
Allocated LE           256
Allocation             next free
Read ahead sectors     120
Block device           58:1
read_ahead: 120

--- Logical volume ---
LV Name                /dev/main/usr
VG Name                main
LV Write Access        read/write
LV Status              NOT available
LV #                   3
# open                 0
LV Size                3.00 GB
Current LE             768
Allocated LE           768
Allocation             next free
Read ahead sectors     120
Block device           58:2
read_ahead: 120

--- Logical volume ---
LV Name                /dev/main/var
VG Name                main
LV Write Access        read/write
LV Status              NOT available
LV #                   4
# open                 0
LV Size                972.00 MB
Current LE             243
Allocated LE           243
Allocation             next free
Read ahead sectors     120
Block device           58:3
read_ahead: 120

pvdata -- logical volume struct at offset   4 is empty
....

and i have the same for /dev/sda3

///////////----------------

So, how can i use this stuff to recreate a good VG info and make my 
system back ?
Many thanks,

Guillaume
