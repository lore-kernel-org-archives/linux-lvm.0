Return-Path: <hne@inetnow.net>
Message-ID: <3AB49365.2020606@inetnow.net>
Date: Sun, 18 Mar 2001 19:52:21 +0900
From: HopNet <hne@inetnow.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Recovering PV's VG metadata
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
Content-Type: text/plain; charset="iso-2022-jp"
To: linux-lvm@sistina.com

Hello all.  I would appreciate any help or pointers to recovering the VG
data on a "blown" PV.

My setup:
  Logical Volume Manager 0.8 by Heinz Mauelshagen  04/11/1999  (IOP 6)
  x86/OS SuSE 6.4 on system disk (scsi, non-LVM)
  data on VG00 on hda & hdc (whole disk, no partitions)
  only one LVol exists, and takes up whole VG.
  hda & hdc are identical models of hard drives.
  VG01 in examples is a NEW VG on scsi array and can be ignored.

Problem:
  OS disk got trashed & system wasn't bootable.
  Reinstalled OS.  I think at this point, LILO, thinking hda was the
boot drive, overwrote some of the VG data.
  no LVMtab or conf files to vgcfgrestore from. :-(

Now:
  pvdata sees partial data on hda, and everything on hdc

What I'm looking for:
  Is there anyway to take common data from hdc and write it back to
hda.  What tools are available for sector editing (LVM or general)?

zeus:~ # pvdata -a /dev/hda
--- Physical volume ---
PV Name
VG Name
ΦR
PV Size               12.14 GB / NOT usable 3.21 MB [LVM: 16.09 MB]
PV#                   0
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              3106
Free PE               0
Allocated PE          3106

Segmentation fault
zeus:~ # pvdata -N -P /dev/hdc
--- Physical volume ---
PV Name               /dev/hdc
VG Name               vg00
PV Size               12.14 GB / NOT usable 3.24 MB [LVM: 242 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              3106
Free PE               0
Allocated PE          3106

--- List of physical volumes ---

000: /dev/hda
001: /dev/hdc

zeus:~ # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdb1" of VG "vg01" [21.26 GB / 11.26 GB
free]
pvscan -- inactive PV "/dev/hdc"  is associated to an unknown VG (run
vgscan)
pvscan -- total: 2 [33.4 GB] / in use: 2 [33.4 GB] / in no VG: 0 [0]

zeus:~ #

  If there is any other info that might be helpful, please ask.

Thanks again,
  Keith@HopNet
