From: Andrew Snare <ajs@pigpond.com>
Message-ID: <20031223154608.GI12266@nl.pigpond.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] VG active, but member PV inactive
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
Date: Tue Dec 23 09:47:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: pwagland@allshare.nl

Hi All,

We've encountered a problem on a Debian server we brought into production
recently. Specifically, although a VG is active and in use, the (sole) PV
is for some reason marked as inactive. This means that tools like lvscan
and lvcreate do not work.

Configuration: single PV, with a VG. All filesystems (except from /boot)
are on it, including the root filesystem:

Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/ro0t_vg/root      5242716   1610536   3632180  31% /
/dev/cciss/c0d0p1        93295      7164     76496   9% /boot
/dev/ro0t_vg/tmp       2097084     61456   2035628   3% /tmp
/dev/ro0t_vg/var       3145628    115584   3030044   4% /var
/dev/ro0t_vg/log       1048540     83904    964636   9% /var/log
/dev/ro0t_vg/cache     5242716   1796104   3446612  35% /var/cache
/dev/ro0t_vg/local     2097084     32840   2064244   2% /usr/local
/dev/ro0t_vg/home     52427196   6112988  46314208  12% /home
/dev/ro0t_vg/exports  41941756  20314692  21627064  49% /exports

Attempting to create a swap volume results in this:

# lvcreate -n swap -L 512M ro0t_vg -v
lvcreate -- checking volume group name "ro0t_vg"
lvcreate -- checking volume group existence
lvcreate -- checking volume group activity
lvcreate -- checking logical volume path "/dev/ro0t_vg/swap"
lvcreate -- checking stripe count
lvcreate -- checking stripe size
lvcreate -- locking logical volume manager
lvcreate -- getting volume group status from VGDA in kernel
lvcreate -- ERROR "pv_status_all_pv_of_vg(): no PV" getting status of volume group "ro0t_vg" from kernel

# lvcreate --version
lvcreate: Logical Volume Manager 1.0.8
Heinz Mauelshagen, Sistina Software  17/11/2003 (IOP 10)

# uname -a
Linux some.host 2.4.22-1-686-smp #5 SMP Sat Oct 4 14:35:05 EST 2003 i686 GNU/Linux

We've tried to fix this with various combinations of vgscan and so forth to
no avail:

# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- found active volume group "ro0t_vg"
vgscan -- reading data of volume group "ro0t_vg" from physical volume(s)
vgscan -- inserting "ro0t_vg" into lvmtab
vgscan -- backing up volume group "ro0t_vg"
vgscan -- checking volume group name "ro0t_vg"
vgscan -- checking volume group consistency of "ro0t_vg"
vgscan -- checking existence of "/etc/lvmtab.d"
vgscan -- storing volume group data of "ro0t_vg" in "/etc/lvmtab.d/ro0t_vg.tmp"
vgscan -- storing physical volume data of "ro0t_vg" in "/etc/lvmtab.d/ro0t_vg.tmp"
vgscan -- storing logical volume data of volume group "ro0t_vg" in "/etc/lvmtab.d/ro0t_vg.tmp"
vgscan -- renaming "/etc/lvmtab.d/ro0t_vg.tmp" to "/etc/lvmtab.d/ro0t_vg"
vgscan -- removing special files and directory for volume group "ro0t_vg"
vgscan -- creating directory and group character special file for "ro0t_vg"
vgscan -- creating block device special files for ro0t_vg
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

# pvscan -v -v
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- getting data for physical volume "/dev/cciss/c0d0p2" from kernel
pvscan -- physical volume "/dev/cciss/c0d0p2" is not active
--- Physical volume ---
PV Name               /dev/cciss/c0d0p2
VG Name               ro0t_vg
PV Size               271.23 GB [568813455 secs] / NOT usable 32.19 MB [LVM: 161 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                8
PE Size (KByte)       32768
Total PE              8678
Free PE               5222
Allocated PE          3456
PV UUID               nTEW3H-rqiW-Yy9z-ubHT-toAk-V6GB-rnQj2y
System Id             Knoppix1068807402


pvscan -- total: 1 [271.23 GB] / in use: 1 [271.23 GB] / in no VG: 0 [0]

Hence the problem we're having appears to be that the disk is marked as
inactive, even though it is actually in use. Rebooting the machine does
not help; the problem persists. In addition, vgchange -a y ro0t_vg does
not work; it short-circuits because the VG is already active.

Trying to run an lvscan results in the same error as the lvcreate:

# lvscan
lvscan -- ERROR "pv_status_all_pv_of_vg(): no PV" getting status of volume  group "ro0t_vg"

A simple vgdisplay works, while a verbose one fails:

# vgdisplay ro0t_vg
--- Volume group ---
VG Name               ro0t_vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                8
Open LV               8
MAX LV Size           2 TB
Max PV                256
Cur PV                1
Act PV                1
VG Size               271.19 GB
PE Size               32 MB
Total PE              8678
Alloc PE / Size       3456 / 108 GB
Free  PE / Size       5222 / 163.19 GB
VG UUID               MeHrkK-7wdp-MGkQ-wHRv-ho97-78zA-C8t9dU


# vgdisplay -v ro0t_vg
vgdisplay -- ERROR "pv_status_all_pv_of_vg(): no PV" getting status of "ro0t_vg"

A search of the archives yields a Gentoo user having the same
problem, although it goes away when they boot from Redhat.
<http://lists.sistina.com/pipermail/linux-lvm/2003-November/015320.html>

Does anyone know what we can do to correct this problem? If more
information is required I'll be happy to supply it.

Thanks in advance for any hints...

 - Andrew
