Message-Id: <20020306062354.D9090@progsoc.uts.edu.au>
MIME-Version: 1.0
Content-Disposition: inline
From: Anand Kumria <wildfire@progsoc.uts.edu.au>
Subject: [linux-lvm] vgscan errors with 1.0.3
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
Date: Tue Mar  5 13:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi there,

I recently add a metadevice to my existing LVM setup. Basically I
copied the data (use tar) from one LV to another and removed the
original LV (and associated PV).

A few reboots later (where things were working) and I decided to
do an lvrename. Upon rebooting vgscan complains that it "can't
get data of volume group 'caliban' from physical volumes".

This is somewhat disturbing.

I have checked the archives and have also attached an lvmdiskscan
and confirmed I have some free space in / (only 2.4M, but still).

I would have attached the output from 'pvdata -a /dev/md0' and
'vgscan -d -d' however they are large files, instead I've made it 
available at <URL: http://www.progsoc.org/~wildfire/lvm/> along 
with my other files.

I am using Linux 2.4.16 and LVM tools 1.0.3 (all the work was done
using this version of the tools). Here is some of the output:

Script started on Wed Mar  6 05:31:49 2002
(none):~# cat /proc/sys/kernel/tainted
0
(none):~# uname -a
Linux (none) 2.4.16 #4 SMP Tue Feb 26 00:15:49 EST 2002 i686 unknown
(none):~# pvscan --version
pvscan: Logical Volume Manager 1.0.3
Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)
(none):~# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/md0"  is associated to unknown VG "caliban" (run vgscan)
pvscan -- WARNING: physical volume "/dev/hdg" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/hde" belongs to a meta device
pvscan -- total: 3 [111.80 GB] / in use: 3 [111.80 GB] / in no VG: 0 [0]

(none):~# vgscan --version
vgscan: unrecognized option `--version'
Logical Volume Manager 1.0.3
Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)

vgscan -- scan for available volume groups for use by LVM

vgscan [-d|--debug] 
	[-f/--force_numbers]
	[-h/--help]
	[-r/--remove_snapshots [VgNameToRemoveSnapshotsFrom]]
	[-v/--verbose]

(none):~# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "caliban" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

(none):~# pvdisplay /dev/md0
--- Physical volume ---
PV Name               /dev/md0
VG Name               caliban
PV Size               111.80 GB [234462464 secs] / NOT usable 3.62 MB [LVM: 232 KB]
PV#                   4
PV Status             available
Allocatable           yes
Cur LV                2
PE Size (KByte)       4096
Total PE              28620
Free PE               9576
Allocated PE          19044
PV UUID               Wmmzbe-bxjy-auNC-ViiX-mQfW-4srb-Y3kMFy

(none):~# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/md0   [     111.80 GB] free meta device
lvmdiskscan -- /dev/hdg   [      55.90 GB] free whole disk
lvmdiskscan -- /dev/hde   [      55.90 GB] free whole disk
lvmdiskscan -- /dev/hdf   [      55.90 GB] free whole disk
lvmdiskscan -- /dev/hda1  [       1.91 GB] Primary  LINUX native partition [0x83]
lvmdiskscan -- /dev/hda2  [     122.06 MB] Primary   [0x82]
lvmdiskscan -- /dev/hda3  [       5.72 GB] Primary  LINUX native partition [0x83]
lvmdiskscan -- /dev/hda4  [       4.38 GB] Primary  LINUX native partition [0x83]
lvmdiskscan -- 4 disks
lvmdiskscan -- 3 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 1 multiple device
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 4 partitions
lvmdiskscan -- 0 LVM physical volume partitions

(none):~# exit

Script done on Wed Mar  6 05:32:39 2002

What concerns me about this output is that it thinks that /dev/md0 is *free*
whereas pvdisplay knows it is not. If you have any suggestions, please let
me know.

Thanks,
Anand

-- 
 `` We are shaped by our thoughts, we become what we think.
 When the mind is pure, joy follows like a shadow that never
 leaves. '' -- Buddha, The Dhammapada
