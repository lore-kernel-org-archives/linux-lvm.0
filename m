From: Peter Palfrader <peter@palfrader.org>
Message-ID: <20011208170737.GA15685@marvin.palfrader.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline
Subject: [linux-lvm] PV#s are not unique
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
Date: Sat Dec  8 11:08:02 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Hi,

I have the following problem:

I tried to pvmove PEs off of a PV and to remove that PV using vgreduce.
Unfortunatly it looks as if it did not really work. Now vgscan does not
find my VG vg_stuff any more.


I assume this might be the reason:

| marvin:~# pvdisplay /dev/ide/host?/bus?/target?/lun0/part1 | grep '^PV#'
| pvdisplay -- no physical volume identifier on "/dev/ide/host0/bus0/target0/lun0/part1"
| 
| PV#                   3
| PV#                   6
| PV#                   6
| PV#                   4
| PV#                   2
| PV#                   1
| PV#                   3

[PV#s are not unique]

All 7 PVs belond to the same volume group (VG Name: vg_stuff). Now when
I run vgscan, it does not detect this volumegroup. pvscan shows the PVs
as associated to an unknown VG.

Any idea on how to recover from this?  I'm using Logical Volume Manager
Tools Version 1.0.1-rc4 and kernel version 2.4.12-xfs-lvm1.0.1rc4.

Thanks in Advance,
					yours,
					peter

-- 
 PGP signed and encrypted  |  .''`.  ** Debian GNU/Linux **
    messages preferred.    | : :' :      The universal
                           | `. `'     Operating System.
 http://www.palfrader.org/ |   `-    http://www.debian.org/

--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename=pvscan

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/scsi/host0/bus0/target3/lun0/part2" of VG "vg_system" [8.25 GB / 512.00 MB free]
pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus1/target1/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus1/target0/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus1/target1/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/part1"   is associated to an unknown VG (run vgscan)
pvscan -- total: 8 [428.54 GB] / in use: 8 [428.54 GB] / in no VG: 0 [0]


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename=vgscan-v

vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- found active volume group "vg_system"
vgscan -- reading data of volume group "vg_system" from physical volume(s)
vgscan -- inserting "vg_system" into lvmtab
vgscan -- backing up volume group "vg_system"
vgscan -- checking volume group name "vg_system"
vgscan -- checking volume group consistency of "vg_system"
vgscan -- checking existence of "/etc/lvmtab.d"
vgscan -- storing volume group data of "vg_system" in "/etc/lvmtab.d/vg_system.tmp"
vgscan -- storing physical volume data of "vg_system" in "/etc/lvmtab.d/vg_system.tmp"
vgscan -- storing logical volume data of volume group "vg_system" in "/etc/lvmtab.d/vg_system.tmp"
vgscan -- renaming "/etc/lvmtab.d/vg_system.tmp" to "/etc/lvmtab.d/vg_system"
vgscan -- removing special files and directory for volume group "vg_system"
vgscan -- creating directory and group character special file for "vg_system"
vgscan -- creating block device special files for vg_system
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename=pvdisplay

--- Physical volume ---
PV Name               /dev/ide/host0/bus0/target1/lun0/part1
VG Name               vg_stuff
PV Size               38.35 GB / NOT usable 2.69 MB [LVM: 125.00 KB]
PV#                   3
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       32768
Total PE              1227
Free PE               1159
Allocated PE          68
PV UUID               d2skhN-h8w6-BzUz-joKn-Wad5-oN22-bw5O7i

--- Physical volume ---
PV Name               /dev/ide/host0/bus1/target0/lun0/part1
VG Name               vg_stuff
PV Size               57.27 GB / NOT usable 52.14 MB [LVM: 131.00 KB]
PV#                   6
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       32768
Total PE              1831
Free PE               660
Allocated PE          1171
PV UUID               Et6EvH-2q6q-sgf1-4WgR-emQF-n4nw-o0Dx1j

--- Physical volume ---
PV Name               /dev/ide/host0/bus1/target1/lun0/part1
VG Name               vg_stuff
PV Size               57.27 GB / NOT usable 52.14 MB [LVM: 131.00 KB]
PV#                   6
PV Status             available
Allocatable           yes
Cur LV                0
PE Size (KByte)       32768
Total PE              1831
Free PE               1831
Allocated PE          0
PV UUID               fL3U3f-yFiv-4mxi-pDId-v02W-wzZL-YDCElL

--- Physical volume ---
PV Name               /dev/ide/host2/bus0/target0/lun0/part1
VG Name               vg_stuff
PV Size               76.34 GB / NOT usable 55.22 MB [LVM: 133.00 KB]
PV#                   4
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       32768
Total PE              2441
Free PE               0
Allocated PE          2441
PV UUID               sP1cxE-MPdJ-zAQt-jGjs-RObn-I1KF-n2MEL2

--- Physical volume ---
PV Name               /dev/ide/host2/bus0/target1/lun0/part1
VG Name               vg_stuff
PV Size               38.34 GB / NOT usable 28.38 MB [LVM: 125.00 KB]
PV#                   2
PV Status             available
Allocatable           yes
Cur LV                0
PE Size (KByte)       32768
Total PE              1226
Free PE               1226
Allocated PE          0
PV UUID               VEx44c-TcOv-GHsR-gNip-7mWv-zU1w-UDE0w9

--- Physical volume ---
PV Name               /dev/ide/host2/bus1/target0/lun0/part1
VG Name               vg_stuff
PV Size               76.34 GB / NOT usable 23.22 MB [LVM: 130.00 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       32768
Total PE              2442
Free PE               0
Allocated PE          2442
PV UUID               EGp6Xa-CJia-693v-C1nh-t4aO-Pat8-CUJNe3

--- Physical volume ---
PV Name               /dev/ide/host2/bus1/target1/lun0/part1
VG Name               vg_stuff
PV Size               76.34 GB / NOT usable 55.22 MB [LVM: 133.00 KB]
PV#                   3
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       32768
Total PE              2441
Free PE               0
Allocated PE          2441
PV UUID               fpFhZ5-TyYJ-FW5P-HLcV-UIdz-jYQe-62DJea



--OwLcNYc0lM97+oe1--
