Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6RNHMa06865
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 19:17:22 -0400
Received: from server.echohome.org (s233-64-29-217.try.wideopenwest.com
	[64.233.217.29])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6RNHFXn005832
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 19:17:16 -0400
Received: from echo (echo.echohome.org [192.168.2.254])
	by server.echohome.org (8.12.8/8.12.8) with ESMTP id i6RNHArq001992
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 19:17:10 -0400
From: "Erik Ch. Ohrnberger" <Erik@echohome.org>
Subject: RE: [linux-lvm] pvscan fails 
Date: Tue, 27 Jul 2004 19:17:10 -0400
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA1z/y+RiMjUG0rnE3+S6yhMKAAAAQAAAAQZxya94dvkqtUf+cYXluYwEAAAAA@EchoHome.org>
MIME-Version: 1.0
In-Reply-To: <4106E0D6.10D6AA3D@yahoo.de>
Content-Transfer-Encoding: 8bit
Reply-To: Erik@echohome.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Frank,
	Sounds like you and me are in similar situations.  I lost my
partition tables on a reboot - no idea why, and I'd also like to recover my
data (I've not written to the disks, other than to restore the partician
tables).  Below is a summary of my experiences.  I ended up using a borrowed
R-Studio and only recovered 38 GB of 170 GB or so.  I'd like to be able to
recover more if possible.

	Erik.
==================================
...LVM Recovery
Well, I've slowly been coming to grips with recovering with what to me is a
pretty serious hard disk calamity.
 
I rebooted my Linux system, as it was up and running for 48 days or so, and
it just seemed to be time to do it.  When the system came back up, many of
the hard disk partician tables were lost, and it wouldn't boot.
 
After much research on the Internet, I found that a partician table could be
re-written and all the data in the file system maintained.  I also found a
tool, TestDisk at http://www.cgsecurity.org by Christophe GRENIER
<grenier@cgsecurity.org>, which seemed to do a good job of sniffing out
partician tables from the remaining file system data.  Well, it did OK on
the system disk, found the first FAT partician and the ext3 partician for
the root of the system.  In fact, after it wrote out the partician table, I
could mount the root file system without any sort of fsck required.  Very
cool.
 
Of the LVM hard disks, which is why I'm submitting this post, 3 out of 4
partician tables were identified and recovered (/dev/hde1, /dev/hdg1,
/dev/hdh1 but not /dev/hdf1).  For Lvm, I always used a single primary
partician, non-bootable, which uses the entire space on the hard disk.  So
recovering this partician table should be no problem, right?  I used fdisk
and re-created the partician table.
 
OK, so I've not re-written the grub boot-loader on the system disk, but I
did boot off of a rescue CD and performed a chroot to where the root file
system was mounted, so I have a chrooted environment, and I can run access
the binaries and file from the old system hard disk.  I check to make sure
that the lvm module was loaded using lsmod, and it was so, now I figured I'd
see how far I could get to recover the 130 GB of data that was on the LVM
volume.
 
First things first, I tried vgscan, and got the following results:
 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "u00_vg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

Additionally, pvscan reports the following:
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "u00_vg" (run
vgscan)
pvscan -- inactive PV "/dev/hdh1"  is associated to unknown VG "u00_vg" (run
vgscan)
pvscan -- inactive PV "/dev/hde1"  is associated to unknown VG "u00_vg" (run
vgscan)
pvscan -- total: 3 [204.96 GB] / in use: 3 [204.96 GB] / in no VG: 0 [0]

I did a pvdata, and produced the output at the bottom part of this message.
First notice that all the drive letters are the same, which I think is a
good thing.  I also notice that way at the end, there are UUIDs for each of
the volumes.  Now it would appear that the UUID from the one bad volume is
lost.  Do you suppose that I could use the UUID_fixed program to put that
UUID back on the physical volume and get it back?

Next, I moved the LVM disks from the old RedHat machine where they started
off at over to a SuSE 9.0 machine for the purpose of recovering any data
that I can.  The main reason is that the SuSE machine has a DM patched
kernel and LVM2, which should be able to handle partial LVMs.  I've also
added a brand new 200 GB hard disk to copy the recovered data to.  While it
won't hold uncompressed images of the LVM disks, if I recall, I had
something like 68 GB free on the LVM set, so I should have enough room to
hold all the recovered data.
 
I tried using e2retrieve (at http://coredump.free.fr/linux/e2retrieve.php)
to copy off the data by analyzing the raw disk data, but after it scans all
the disks, it seg faults.  So that went nowhere.  Too bad, from the
description of the program, it has some real promise for a general LVM
recovery utility.
 
When I do a pvscan, I get this (this is now with LVM2):
  3 PV(s) found for VG u00_vg: expected 4
  Logical volume (u00_lv) contains an incomplete mapping table.
  PV /dev/hde1    is in exported VG u00_vg [55.89 GB / 0    free]
  PV /dev/hdg1    is in exported VG u00_vg [74.52 GB / 0    free]
  PV /dev/hdh1    is in exported VG u00_vg [74.52 GB / 0    free]
  Total: 3 [0   ] / in use: 3 [0   ] / in no VG: 0 [0   ]

When I go a vgscan, I get this:
  Reading all physical volumes.  This may take a while...
  3 PV(s) found for VG u00_vg: expected 4
  Volume group "u00_vg" not found


Also, I'm wondering how I can re-create the volume group and logical volumes
to that I can mount the file system in read only more and copy all the data
off that I can access without causing any greater data loss on the hard
disks.
 
Any help in answering these questions would be greatly appreciated, as I
know what to do when LVM is working, but I'm at a little of a loss when it's
not working.
 
Thanks in advance,
    Erik.
 
==================================
pvdata information:

--- Physical volume ---
PV Name               /dev/hde1
VG Name               u00_vg
PV Size               55.90 GB [117226242 secs] / NOT usable 4.18 MB [LVM:
179 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              14308
Free PE               0
Allocated PE          14308
PV UUID               VILh9i-uWlA-cKBM-AcRJ-VYU7-54kM-OgiWQm
 
--- Physical volume ---
pcdata /dev/hdf1
pvdata segfaults on this command.
 
--- Physical volume ---
PV Name               /dev/hdg1
VG Name               u00_vg
PV Size               74.53 GB [156296322 secs] / NOT usable 4.25 MB [LVM:
198 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              19078
Free PE               0
Allocated PE          19078
PV UUID               AZf9pT-TYsE-Y3xF-jolh-Z9EF-WV3l-T6yATO
 
--- Physical volume ---
PV Name               /dev/hdh1
VG Name               u00_vg
PV Size               74.53 GB [156301425 secs] / NOT usable 4.25 MB [LVM:
198 KB]
PV#                   6
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              19078
Free PE               0
Allocated PE          19078
PV UUID               8seUMF-A73a-V5tQ-N88Q-Uv0M-Ci6f-5wVO9C
 
--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                255
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                4
Act PV                4
VG Size               243.28 GB
PE Size               4 MB
Total PE              62279
Alloc PE / Size       62279 / 243.28 GB
Free  PE / Size       0 / 0
VG UUID               tUQf5q-QvaA-hEj8-slM0-MmoW-A2Xt-47HS1p
 
--- List of physical volume UUIDs ---
 
001: AZf9pT-TYsE-Y3xF-jolh-Z9EF-WV3l-T6yATO	(/dev/hdg1)
002: Pclazx-RnTY-QBCG-P1O6-dVDg-V435-SlLluH	(/dev/hdf1?)
003: 8seUMF-A73a-V5tQ-N88Q-Uv0M-Ci6f-5wVO9C	(/dev/hdh1)
004: VILh9i-uWlA-cKBM-AcRJ-VYU7-54kM-OgiWQm	(/dev/hde1)

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Frank Mohr
> Sent: Tuesday, July 27, 2004 7:10 PM
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] pvscan fails 
> 
> 
> Hi
> 
> after a system crash my system can't find it's LVM volumes:
> 
> System:
> - SuSE 7.3 with last 7.3 patches, own Kernel Update to 2.4.26
> - was running for some longer time with SuSE lvm-1.0.0.2_rc2-6
>   (vgscan --help -> LVM 1.0.1-rc2 - 30/08/2001 (IOP 10))
> - I've updated LVM to LVM 1.0.8 - 17/11/2003 (IOP 10)
>   in the hope to fix the problem
> 
> vgscan dies with a Segmentation fault
> 
> odie:~/LVM/1.0.8/tools # vgscan -v    
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d" 
> vgscan -- reading all physical volumes (this may take a 
> while...) vgscan -- scanning for all active volume group(s) 
> first vgscan -- reading data of volume group "DATAVG" from 
> physical volume(s) Segmentation fault odie:~/LVM/1.0.8/tools # 
> 
> pvscan finds the volumes of the VG
> 
> odie:~/LVM/1.0.8/tools # pvscan
> pvscan -- reading all physical volumes (this may take a 
> while...) pvscan -- inactive PV "/dev/hdc1"  is associated to 
> unknown VG "DATAVG" (run vgscan) pvscan -- inactive PV 
> "/dev/hdd1"  is associated to unknown VG "DATAVG" (run 
> vgscan) pvscan -- inactive PV "/dev/hdb1"  is associated to 
> unknown VG "DATAVG" (run vgscan) pvscan -- total: 3 [306.23 
> GB] / in use: 3 [306.23 GB] / in no VG: 0 [0]
> 
> odie:~/LVM/1.0.8/tools # 
> 
> Running vgscan -dv results in
> 
> ...
> <1> vg_read_with_pv_and_lv -- AFTER lv_read_all_lv; 
> vg_this->pv_cur: 3 
> vg_this->pv_max: 255  ret: 0
> <1> vg_read_with_pv_and_lv -- BEFORE for PE
> <1> vg_read_with_pv_and_lv -- AFTER for PE
> <1> vg_read_with_pv_and_lv -- BEFORE for LV
> <1> vg_read_with_pv_and_lv -- 
> vg_this->lv[0]->lv_allocated_le: 32500 Segmentation fault
> 
> (copied the last few lines - didn't want to send 72k debug output)
> 
> Is there any chance to fix this without loosing the data on the disks?
> 
> 
> Frank
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
