From: sk@url.org
Message-Id: <200312231848.hBNIm3XR002052@chaos.able-towers.com>
Subject: [linux-lvm] Lost VG Configuration after fsck and reboot. Data recovery badly needed. Please help if you can
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
Date: Mon Dec 29 07:51:18 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello

I have had lvm running for quite some time and it was all running smoothly.

Lately i have occasionally gotten some i/o errors retrieving data off my Volumes,
so i decided to run an fsck. After unmounting the Volume, fsck ran fine, and 
fixed a couple Inodes. The usual. Once it has finished i was unable to mount the 
volume, linux kept complainig that "/dev/Volume00/LogVol00 already mounted, or /data is busy".
As i was unable to determine the reason for this (after checking fuser and who output to make
sure no process was still accessing /data/*), i rebooted the box.

That's when the hassle began to become intruiging. 
Linux complained that it couldn't mount the Volume, and dropped me into a Filesystem recovery
shell. 

And the system state i was left with then, is what i'm stuck with as of now....

I am unable to mounnt the volume, not to mention access my data.

I have not changed the system, or otherwise tampererd with the lvm installation, as i have one
other Volume on the system, which is still stable and well.

Below i have included the information i was able to gather:

[root@terra root]# fdisk -l
 
Disk /dev/hdg: 61.4 GB, 61492838400 bytes
16 heads, 63 sectors/track, 119150 cylinders
Units = cylinders of 1008 * 512 = 516096 bytes
 
Disk /dev/hdg doesn't contain a valid partition table
 
Disk /dev/hdh: 61.4 GB, 61492838400 bytes
16 heads, 63 sectors/track, 119150 cylinders
Units = cylinders of 1008 * 512 = 516096 bytes
 
Disk /dev/hdh doesn't contain a valid partition table
 
Disk /dev/hde: 4320 MB, 4320862208 bytes
15 heads, 63 sectors/track, 8930 cylinders
Units = cylinders of 945 * 512 = 483840 bytes
 
Disk /dev/hde doesn't contain a valid partition table
 
Disk /dev/hdf: 27.3 GB, 27325218816 bytes
16 heads, 63 sectors/track, 52946 cylinders
Units = cylinders of 1008 * 512 = 516096 bytes
 
Disk /dev/hdf doesn't contain a valid partition table
 
Disk /dev/hda: 123.5 GB, 123522416640 bytes
255 heads, 63 sectors/track, 15017 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
 
   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1       500   4016218+  83  Linux
/dev/hda2           501      2000  12048750   83  Linux
/dev/hda3          2001      2100    803250   82  Linux swap
/dev/hda4          2101     15017 103755802+   f  Win95 Ext'd (LBA)
/dev/hda5          2101     15017 103755771   8e  Linux LVM
 
Disk /dev/hdb: 123.5 GB, 123522416640 bytes
255 heads, 63 sectors/track, 15017 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
 
   Device Boot    Start       End    Blocks   Id  System
/dev/hdb1   *         1     15017 120624021   8e  Linux LVM

[root@terra root]# lvscan
lvscan -- ACTIVE            "/dev/Volume01/LogVol01" [143.98 GB]
lvscan -- 1 logical volumes with 143.98 GB total in 1 volume group
lvscan -- 1 active logical volumes
 

[root@terra root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdg"  of VG "Volume01" [57.26 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdh"  of VG "Volume01" [57.26 GB / 4 MB free]
pvscan -- ACTIVE   PV "/dev/hde"  of VG "Volume01" [4.02 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdf"  of VG "Volume01" [25.44 GB / 0 free]
pvscan -- inactive PV "/dev/hda5"  is associated to unknown VG "Volume00" (run vgscan)
pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "Volume00" (run vgscan)
pvscan -- total: 6 [358 GB] / in use: 6 [358 GB] / in no VG: 0 [0]
 

[root@terra root]# cat /proc/lvm/global
LVM module LVM version 1.0.5+(22/07/2002)
 
Total:  1 VG  4 PVs  1 LV (1 LV open 1 times)
 
Global: 595217 bytes malloced   IOP version: 10   1:44:17 active
 
VG:  Volume01  [4 PV, 1 LV/1 open]  PE Size: 4096 KB
  Usage [KB/PE]: 150978560 /36860 total  150974464 /36859 used  4096 /1 free
  PVs: [AA] hde                    4214784 /1029     4214784 /1029           0 /0
       [AA] hdf                   26677248 /6513    26677248 /6513           0 /0
       [AA] hdg                   60043264 /14659   60043264 /14659          0 /0
       [AA] hdh                   60043264 /14659   60039168 /14658       4096 /1
    LV:  [AWDL  ] LogVol01                 150974464 /36859    1x open

[root@terra root]# uname -a
Linux terra 2.4.20-8 #1 Thu Mar 13 17:54:28 EST 2003 i686 i686 i386 GNU/Linux

[root@terra root]# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/hdg   [      57.27 GB] USED LVM whole disk
lvmdiskscan -- /dev/hdh   [      57.27 GB] USED LVM whole disk
lvmdiskscan -- /dev/hde   [       4.02 GB] USED LVM whole disk
lvmdiskscan -- /dev/hdf   [      25.45 GB] USED LVM whole disk
lvmdiskscan -- /dev/hda1  [       3.83 GB] Primary  LINUX native partition [0x83]
lvmdiskscan -- /dev/hda2  [      11.49 GB] Primary  LINUX native partition [0x83]
lvmdiskscan -- /dev/hda3  [     784.42 MB] Primary  LINUX swap partition [0x82]
lvmdiskscan -- /dev/hda4  [      98.95 GB] Primary  Windows98 extended partition [0x0F]
lvmdiskscan -- /dev/hda5  [      98.95 GB] Extended LVM partition [0x8E]
lvmdiskscan -- /dev/hdb1  [     115.04 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- 6 disks
lvmdiskscan -- 4 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 6 partitions
lvmdiskscan -- 2 LVM physical volume partitions
 

[root@terra root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "Volume01"
vgscan -- only found 25329 of 54776 LEs for LV /dev/Volume00/LogVol00 (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "Volume00" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups
 
[root@terra root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "Volume01"
vgscan -- only found 25329 of 54776 LEs for LV /dev/Volume00/LogVol00 (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "Volume00" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups
 
(sorry for putting this twice, but this is a telnet session to sendmail, from here the only way for 
me to send mail so i cannot erase it easily :) )

Anyhow, i think this lays out my problem... and i would be so very happy to receive any hint
on how to get access to that data back.

I thank you in advance for your time,

regards Stefan P Knecht
