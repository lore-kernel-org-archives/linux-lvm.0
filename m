Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1IFGYi19922
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 10:16:35 -0500
Received: from pandorra.able-towers.com (pandorra.able-towers.com [212.46.65.50])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1IFGYb15748
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 10:16:34 -0500
Received: from url.org (pandorra.able-towers.com [212.46.65.50])
	by pandorra.able-towers.com (8.11.6/8.11.6) with SMTP id i1IFEgP03082
	for linux-lvm@redhat.com; Wed, 18 Feb 2004 15:15:54 GMT
From: sk@url.org
Message-Id: <200402181515.i1IFEgP03082@pandorra.able-towers.com>
Subject: [linux-lvm] Lost VG after reboot. Seeking assistance for recovery
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 18 10:31:18 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Good evening everybody.

I have been using LVM to manage my storage for quite some time now, without any trouble. Recently i started getting io errors on one Volume. I decided to unmount the Volume to run an fsck.

Linux wouldn't let me umount the Volume, kept complaining it was still in use. After failing to figure out what had still open files on the device (using fuser and lsof) i decided to "lazy" umount it.
That worked fine, and i was able to run the fsck.

The check finished, fixed a couple lost Inodes. The usual.

But after the check linux decided not to let me remount the Volume either - neither into its original location, nor a different one.

I rebooted.

After the reboot Linux dropped me into a Filesystem Recovery shell, as vgscan failed upon boot.

I removed the entry for the Volume from fstab, and rebooted (I was lacking some kernel modules trying to use pvdisplay so i thought it was best to attempt a recovery on a fully running system).

Since then i upgraded to latest lvmtools (1.0.9 as of this writing).

I neglected from changing any more things, as the data for me is important, and i cannot afford a loss of this data at this time.

The current state of things is shown below:

[root@terra dev]# fdisk -l

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
[root@terra dev]# 

[root@terra dev]# lvmdiskscan 
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
lvmdiskscan -- /dev/hdb1  [     115.04 GB] Primary  LVM partition [0x8E]u
lvmdiskscan -- 6 disks
lvmdiskscan -- 4 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 6 partitions
lvmdiskscan -- 2 LVM physical volume partitions

[root@terra dev]# cat /proc/lvm/global
LVM module LVM version 1.0.5+(22/07/2002)

Total:  1 VG  4 PVs  1 LV (1 LV open 1 times)

Global: 595218 bytes malloced   IOP version: 10   23:10:56 active

VG:  Volume01  [4 PV, 1 LV/1 open]  PE Size: 4096 KB
  Usage [KB/PE]: 150978560 /36860 total  150974464 /36859 used  4096 /1 free
  PVs: [AA] hde                    4214784 /1029     4214784 /1029           0 /0     
       [AA] hdf                   26677248 /6513    26677248 /6513           0 /0     
       [AA] hdg                   60043264 /14659   60043264 /14659          0 /0     
       [AA] hdh                   60043264 /14659   60039168 /14658       4096 /1     
    LV:  [AWDL  ] LogVol01                 150974464 /36859    1x open
[root@terra dev]# 

[root@terra dev]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdg"  of VG "Volume01" [57.26 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdh"  of VG "Volume01" [57.26 GB / 4 MB free]
pvscan -- ACTIVE   PV "/dev/hde"  of VG "Volume01" [4.02 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdf"  of VG "Volume01" [25.44 GB / 0 free]
pvscan -- inactive PV "/dev/hda5"  is associated to unknown VG "Volume00" (run vgscan)
pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "Volume00" (run vgscan)
pvscan -- total: 6 [358 GB] / in use: 6 [358 GB] / in no VG: 0 [0]

[root@terra dev]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "Volume01"
vgscan -- only found 25329 of 54776 LEs for LV /dev/Volume00/LogVol00 (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "Volume00" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups

[root@terra dev]# 
[root@terra dev]# lvscan
lvscan -- ACTIVE            "/dev/Volume01/LogVol01" [143.98 GB]
lvscan -- 1 logical volumes with 143.98 GB total in 1 volume group
lvscan -- 1 active logical volumes

[root@terra dev]# 


[root@terra dev]# pvdisplay -vv /dev/hda5 /dev/hdb1
pvdisplay -- checking physical volume name "/dev/hda5"
pvdisplay -- reading data of physical volume "/dev/hda5" from disk
pvdisplay -- creating physical volume device number from name "/dev/hda5"
pvdisplay -- checking physical volume activity
pvdisplay -- checking physical volume consistency
--- Physical volume ---
PV Name               /dev/hda5
VG Name               Volume00
PV Size               98.95 GB [207511542 secs] / NOT usable 4.25 MB [LVM: 226 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              25329
Free PE               0
Allocated PE          25329
PV UUID               6V7qTZ-LnPJ-YqL2-6tp3-DrhY-SrZT-QhVlqg

pvdisplay -- "/etc/lvmtab.d/Volume00" doesn't exist

pvdisplay -- checking physical volume name "/dev/hdb1"
pvdisplay -- reading data of physical volume "/dev/hdb1" from disk
pvdisplay -- creating physical volume device number from name "/dev/hdb1"
pvdisplay -- checking physical volume activity
pvdisplay -- checking physical volume consistency
--- Physical volume ---
PV Name               /dev/hdb1
VG Name               Volume00
PV Size               115.04 GB [241248042 secs] / NOT usable 4.25 MB [LVM: 243 KB]
PV#                   2
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              29448
Free PE               1
Allocated PE          29447
PV UUID               4a1ocQ-4Ko5-lJCO-HsYj-j6BH-LbiG-2Kv4l7

pvdisplay -- "/etc/lvmtab.d/Volume00" doesn't exist


I would be extremely happy to receive any kind of help towards retrieval of the data on Volume00, wether in full, or in parts.

Thank you for taking your time reading this

Regards Stefan P Knecht
