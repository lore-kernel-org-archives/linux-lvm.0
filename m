Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j41EaOO14985
	for <linux-lvm@redhat.com>; Sun, 1 May 2005 10:36:24 -0400
Received: from mail.ruckusnetwork.com (mail.ruckusnetwork.com [64.242.9.195])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j41EaN2G006814
	for <linux-lvm@redhat.com>; Sun, 1 May 2005 10:36:23 -0400
Received: from [127.0.0.1] ([24.218.205.251])
	(authenticated user lreed@ruckus.net) by mail.ruckusnetwork.com
	for linux-lvm@redhat.com; Sun, 1 May 2005 10:36:17 -0400
Message-ID: <4274E94D.306@ruckusnetwork.com>
Date: Sun, 01 May 2005 10:35:57 -0400
From: Lance Reed <lreed@ruckusnetwork.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Does pvcreate destroy data if run on an existing PV?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I am having a problem with a LVM 1 implemenation.

LVM version info:
# rpm -qa | grep lvm
lvm-1.0.3-1_MVD_SNAP
# pvcreate --version
pvcreate: Logical Volume Manager 1.0.3
Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)

Kernel info:
# uname -a
Linux rawstore 2.4.19-116_MVD_SNAPenterprise #1 SMP Fri Dec 5 08:26:34 
CST 2003 i686 unknown

I have a NAS head that connects to Large storage arrays using LSI SCSI 
cards.
Drivers: Fusion MPT SCSI Host driver 2.05.00 ; mptscsih  ; mptbase        
For some reason the array loacked up, and the kernel was not able to 
talk to two of the SCSI devices,
which are two scsi devices (sdc and sde) that make up a VG, each SCSI 
device being PV's for the VG.

When the system and storage array were rebooted, the linux host was not 
able to use the LVM VG that
was having the SCSI issues. It appears that before the reboot, the 
metadata and the .conf file for
say that the VG for DiskPoolC should use /dev/sdc and /dev/sde1.  
Currently the system after the reboot
sees /dev/sdc and /dev/sde.  The system no longer see's the /dev/sde1 
partition.

We have attempted to do a  vgcfgrestore using the DiskPoolC.conf which 
is only 2 days old.
The restore of the metadata for /dev/sdc matches and works fine.
The restore of the metadata for /dev/sde throws errors about not finding 
/dev/sde1.

So we tried susing the -o option:
[root@rawstore log]# vgcfgrestore -v -o /dev/sde1 -n DiskPoolC 
/dev/sde     vgcfgrestore -- INFO: using backup file 
"/etc/lvmconf/DiskPoolC.conf"
vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "DiskPoolC" from 
"/etc/lvmconf/DiskPoolC.conf"
vgcfgrestore -- checking existence of "/etc/lvmconf/DiskPoolC.conf"
vgcfgrestore -- reading volume group data for "DiskPoolC" from 
"/etc/lvmconf/DiskPoolC.conf"
vgcfgrestore -- reading physical volume data for "DiskPoolC" from 
"/etc/lvmconf/DiskPoolC.conf"
vgcfgrestore -- reading logical volume data for "DiskPoolC" from 
"/etc/lvmconf/DiskPoolC.conf"
vgcfgrestore -- checking volume group consistency of "DiskPoolC"
vgcfgrestore -- checking volume group consistency of "DiskPoolC"
vgcfgrestore -- reading physical volume "/dev/sde"
vgcfgrestore -- ERROR "pv_read(): PV identifier invalid" reading 
physical volume "/dev/sde"

So, at this point I am thinking that the placeholder for the PV metadat 
is corrupt.

So, my question is, can I run a pvcreate on the PV, which is currently 
not active, reset
the pv area, then use vgcfgrestore to restore the metadate, and allow 
the PV to be recognized
vy vgscan.  If so, will this work without destroying all the data that 
exists on the PV we are
running the pvcreate on?

I have seen one reference to this in a web search that say it might 
work, but I have also seen
many refernces to using ovcreate to destory data on a disk.  This is on 
fresh disks, being setup
for LVM.  I was hoping that running pvcreate on an eixsting PV will on 
reinitiakize the Metadata
area, and not touch the data on the PV itself.

I am currently do a dd to replicate the /sde disk to another disk to 
experriment with recovery techniques.

Also, any idea if there is a way to do a pvmove or somethign to attempt 
to move the PV data over to a fresh
disk, and load the metadata there?

Anybody have any idea of what could have caused this behavior and how 
can we recover?
Thanks so much for any assistane in this matter or any suggestions!

Cheers!

Lance

LVM info / tests

-----------

[root@rawstore log]# vgcfgrestore -v -o /dev/sde1 -n DiskPoolC /dev/sde    

vgcfgrestore -- INFO: using backup file "/etc/lvmconf/DiskPoolC.conf"

vgcfgrestore -- locking logical volume manager

vgcfgrestore -- restoring volume group "DiskPoolC" from 
"/etc/lvmconf/DiskPoolC.conf"

vgcfgrestore -- checking existence of "/etc/lvmconf/DiskPoolC.conf"

vgcfgrestore -- reading volume group data for "DiskPoolC" from 
"/etc/lvmconf/DiskPoolC.conf"

vgcfgrestore -- reading physical volume data for "DiskPoolC" from 
"/etc/lvmconf/DiskPoolC.conf"

vgcfgrestore -- reading logical volume data for "DiskPoolC" from 
"/etc/lvmconf/DiskPoolC.conf"

vgcfgrestore -- checking volume group consistency of "DiskPoolC"

vgcfgrestore -- checking volume group consistency of "DiskPoolC"

vgcfgrestore -- reading physical volume "/dev/sde"

vgcfgrestore -- ERROR "pv_read(): PV identifier invalid" reading 
physical volume "/dev/sde"

 

 

[root@rawstore log]# lvmdiskscan

lvmdiskscan -- reading all disks / partitions (this may take a while...)

lvmdiskscan -- /dev/sda1  [     800.98 MB] Primary  LINUX native 
partition [0x83]

lvmdiskscan -- /dev/sda2  [          1 GB] Primary  LINUX swap partition 
[0x82]

lvmdiskscan -- /dev/sda3  [        401 MB] Primary  LINUX native 
partition [0x83]

lvmdiskscan -- /dev/sda4  [       1.59 TB] DOS extended partition [0x05]

lvmdiskscan -- /dev/sda5  [     800.98 MB] Extended LINUX native 
partition [0x83]

lvmdiskscan -- /dev/sda6  [     500.98 MB] Extended LINUX native 
partition [0x83]

lvmdiskscan -- /dev/sda7  [       1.59 TB] Extended LVM partition [0x8E]

lvmdiskscan -- /dev/sdb   [       1.59 TB] USED LVM whole disk

lvmdiskscan -- /dev/sdc   [     814.21 GB] USED LVM whole disk

lvmdiskscan -- /dev/sdd1  [     814.21 GB] Primary  LINUX native 
partition [0x83]

lvmdiskscan -- /dev/sde   [     814.21 GB] free whole disk

lvmdiskscan -- /dev/sdf   [     814.21 GB] USED LVM whole disk

lvmdiskscan -- 6 disks

lvmdiskscan -- 4 whole disks

lvmdiskscan -- 0 loop devices

lvmdiskscan -- 0 multiple devices

lvmdiskscan -- 0 network block devices

lvmdiskscan -- 8 partitions

lvmdiskscan -- 1 LVM physical volume partition

 

--- Volume group ---

VG Name               DiskPoolC

VG Access             read/write

VG Status             NOT available/resizable

VG #                  2

MAX LV                256

Cur LV                4

Open LV               0

MAX LV Size           2 TB

Max PV                256

Cur PV                2

Act PV                2

VG Size               1.59 TB

PE Size               64 MB

Total PE              26052

Alloc PE / Size       20988 / 1.28 TB

Free  PE / Size       5064 / 316.50 GB

VG UUID               EXoF2l-PdM7-xYtk-F7hl-N956-Pjag-HN24Iz

 

--- Logical volume ---

LV Name                /dev/DiskPoolC/lvol1

VG Name                DiskPoolC

LV Write Access        read/write

LV Status              NOT available

LV #                   1

# open                 0

LV Size                395.88 GB

Current LE             6334

Allocated LE           6334

Allocation             next free

Read ahead sectors     10000

Block device           58:3

--- Logical volume ---

LV Name                /dev/DiskPoolC/lvol2

VG Name                DiskPoolC

LV Write Access        read/write

LV Status              NOT available

LV #                   2

# open                 0

LV Size                465.06 GB

Current LE             7441

Allocated LE           7441

Allocation             next free

Read ahead sectors     10000

Block device           58:4

 

--- Logical volume ---

LV Name                /dev/DiskPoolC/lvol3

VG Name                DiskPoolC

LV Write Access        read/write

LV Status              NOT available

LV #                   3

# open                 0

LV Size                440 GB

Current LE             7040

Allocated LE           7040

Allocation             next free

Read ahead sectors     10000

Block device           58:7

 

--- Logical volume ---

LV Name                /dev/DiskPoolC/lvol4

VG Name                DiskPoolC

LV Write Access        read/write

LV Status              NOT available

LV #                   4

# open                 0

LV Size                10.81 GB

Current LE             173

Allocated LE           173

Allocation             next free

Read ahead sectors     10000

Block device           58:9

 

--- Physical volume ---

PV Name               /dev/sde1

VG Name               DiskPoolC

PV Size               814.21 GB [1707516657 secs] / NOT usable 64.19 MB 
[LVM: 178 KB]

PV#                   1

PV Status             available

Allocatable           yes (but full)

Cur LV                3

PE Size (KByte)       65536

Total PE              13026

Free PE               0

Allocated PE          13026

PV UUID               TS7aiH-Mz1Z-WBVJ-0UEx-VITp-6h0V-DztSM7

 

--- Physical volume ---

PV Name               /dev/sdc

VG Name               DiskPoolC

PV Size               814.21 GB [1707517952 secs] / NOT usable 64.19 MB 
[LVM: 178 KB]

PV#                   2

PV Status             available

Allocatable           yes

Cur LV                4

PE Size (KByte)       65536

Total PE              13026

Free PE               5064

Allocated PE          7962

PV UUID               a9k9We-e3l8-V0M9-cQlZ-mJha-EDTW-fvSG5Q

 
Relevant Boot messages:

Apr 30 16:20:03 rawstore kernel: LVM version 1.0.3(19/02/2002) module loaded
Apr 30 16:20:03 rawstore kernel: Journalled Block Device driver loaded
Apr 30 16:20:03 rawstore kernel: SGI XFS CVS-2002-11-01_06:00_UTC with 
ACLs, quota, no debug enabled
Apr 30 16:20:03 rawstore kernel: SCSI subsystem driver Revision: 1.00
Apr 30 16:20:03 rawstore kernel: kmod: failed to exec /sbin/modprobe -s 
-k scsi_hostadapter, errno = 2
Apr 30 16:20:03 rawstore kernel: Fusion MPT base driver 2.05.00
Apr 30 16:20:03 rawstore kernel: Copyright (c) 1999-2002 LSI Logic 
Corporation
Apr 30 16:20:03 rawstore kernel: mptbase: Initiating ioc0 bringup
Apr 30 16:20:03 rawstore kernel: ioc0: 53C1030: Capabilities={Initiator}
Apr 30 16:20:03 rawstore kernel: mptbase: Initiating ioc1 bringup
Apr 30 16:20:03 rawstore kernel: ioc1: 53C1030: Capabilities={Initiator}
Apr 30 16:20:03 rawstore kernel: mptbase: Initiating ioc2 bringup
Apr 30 16:20:03 rawstore kernel: ioc2: 53C1030: Capabilities={Initiator}
Apr 30 16:20:03 rawstore kernel: mptbase: Initiating ioc3 bringup
Apr 30 16:20:03 rawstore kernel: ioc3: 53C1030: Capabilities={Initiator}
Apr 30 16:20:03 rawstore kernel: mptbase: 4 MPT adapters found, 4 installed.
Apr 30 16:20:03 rawstore kernel: Fusion MPT SCSI Host driver 2.05.00
Apr 30 16:20:03 rawstore kernel: scsi0 : ioc0: LSI53C1030, 
FwRev=01030700h, Ports=1, MaxQ=222, IRQ=28
Apr 30 16:20:03 rawstore kernel: scsi1 : ioc1: LSI53C1030, 
FwRev=01030700h, Ports=1, MaxQ=222, IRQ=29
Apr 30 16:20:03 rawstore kernel: scsi2 : ioc2: LSI53C1030, 
FwRev=01030700h, Ports=1, MaxQ=222, IRQ=24
Apr 30 16:20:03 rawstore kernel: scsi3 : ioc3: LSI53C1030, 
FwRev=01030700h, Ports=1, MaxQ=222, IRQ=27
Apr 30 16:20:03 rawstore kernel:   Vendor: WINSYS    Model: Flashdisk 
G7      Rev: 331J
Apr 30 16:20:03 rawstore kernel:   Type:   
Direct-Access                      ANSI SCSI revision: 03
Apr 30 16:20:03 rawstore kernel:   Vendor: WINSYS    Model: Flashdisk 
G7      Rev: 331J
Apr 30 16:20:03 rawstore kernel:   Type:   
Direct-Access                      ANSI SCSI revision: 03
Apr 30 16:20:03 rawstore kernel:   Vendor: WINSYS    Model: Flashdisk 
G7      Rev: 334C
Apr 30 16:20:03 rawstore kernel:   Type:   
Direct-Access                      ANSI SCSI revision: 03
Apr 30 16:20:03 rawstore keytable: ^[[60G
Apr 30 16:20:03 rawstore kernel:   Vendor: WINSYS    Model: Flashdisk 
G7      Rev: 334C
Apr 30 16:20:03 rawstore kernel:   Type:   
Direct-Access                      ANSI SCSI revision: 03
Apr 30 16:20:03 rawstore kernel:   Vendor: WINSYS    Model: Flashdisk 
G7      Rev: 334C
Apr 30 16:20:03 rawstore kernel:   Type:   
Direct-Access                      ANSI SCSI revision: 03
Apr 30 16:20:03 rawstore kernel:   Vendor: WINSYS    Model: Flashdisk 
G7      Rev: 334C
Apr 30 16:20:03 rawstore kernel:   Type:   
Direct-Access                      ANSI SCSI revision: 03
Apr 30 16:20:03 rawstore kernel: Attached scsi disk sda at scsi0, 
channel 0, id 0, lun 0
Apr 30 16:20:03 rawstore kernel: Attached scsi disk sdb at scsi1, 
channel 0, id 0, lun 0
Apr 30 16:20:03 rawstore kernel: Attached scsi disk sdc at scsi2, 
channel 0, id 0, lun 0
Apr 30 16:20:03 rawstore kernel: Attached scsi disk sdd at scsi2, 
channel 0, id 0, lun 1
Apr 30 16:20:03 rawstore kernel: Attached scsi disk sde at scsi3, 
channel 0, id 0, lun 0
Apr 30 16:20:03 rawstore kernel: Attached scsi disk sdf at scsi3, 
channel 0, id 0, lun 1
Apr 30 16:20:03 rawstore kernel: SCSI device sda: -879931392 512-byte 
hdwr sectors (-450524 MB)
Apr 30 16:20:03 rawstore kernel: Partition check:
Apr 30 16:20:03 rawstore kernel:  sda: sda1 sda2 sda3 sda4 < sda5 sda6 
sda7 >
Apr 30 16:20:03 rawstore kernel: SCSI device sdb: -879931392 512-byte 
hdwr sectors (-450524 MB)
Apr 30 16:20:03 rawstore kernel:  sdb: unknown partition table
Apr 30 16:20:03 rawstore kernel: SCSI device sdc: 1707517952 512-byte 
hdwr sectors (-225261 MB)
Apr 30 16:20:03 rawstore kernel:  sdc: unknown partition table
Apr 30 16:20:03 rawstore kernel: SCSI device sdd: 1707517952 512-byte 
hdwr sectors (-225261 MB)
Apr 30 16:20:03 rawstore kernel:  sdd: sdd1
Apr 30 16:20:03 rawstore keytable:
Apr 30 16:20:03 rawstore kernel: SCSI device sde: 1707517952 512-byte 
hdwr sectors (-225261 MB)
Apr 30 16:20:03 rawstore keytable: Loading system font:
Apr 30 16:20:03 rawstore kernel:  sde: unknown partition table
Apr 30 16:20:03 rawstore kernel: SCSI device sdf: 1707517952 512-byte 
hdwr sectors (-225261 MB)
Apr 30 16:20:03 rawstore kernel:  sdf: unknown partition table
Apr 30 16:20:03 rawstore kernel: kjournald starting.  Commit interval 5 
seconds
Apr 30 16:20:03 rawstore kernel: EXT3-fs: mounted filesystem with 
ordered data mode.
Apr 30 16:20:03 rawstore kernel: VFS: Mounted root (ext3 filesystem) 
readonly.
Apr 30 16:20:03 rawstore kernel: Trying to move old root to /initrd ... 
failed
Apr 30 16:20:03 rawstore kernel: Unmounting old root
Apr 30 16:20:04 rawstore kernel: Trying to free ramdisk memory ... okay
Apr 30 16:20:04 rawstore kernel: Freeing unused kernel memory: 128k freed
Apr 30 16:20:04 rawstore kernel: EXT3 FS 2.4-0.9.17, 10 Jan 2002 on 
sd(8,1), internal journal
Apr 30 16:20:04 rawstore kernel: Adding Swap: 1049592k swap-space 
(priority -1)
Apr 30 16:20:04 rawstore kernel: EXT3 FS 2.4-0.9.17, 10 Jan 2002 on 
sd(8,1), internal journal
Apr 30 16:20:04 rawstore kernel: MVD SnapFS(v2.0.2) loaded
Apr 30 16:20:04 rawstore kernel: loop: loaded (max 8 devices)
Apr 30 16:20:04 rawstore kernel: kjournald starting.  Commit interval 5 
seconds
Apr 30 16:20:04 rawstore kernel: EXT3 FS 2.4-0.9.17, 10 Jan 2002 on 
sd(8,3), internal journal
Apr 30 16:20:04 rawstore kernel: EXT3-fs: mounted filesystem with 
ordered data mode.
Apr 30 16:20:04 rawstore kernel: kjournald starting.  Commit interval 5 
seconds
Apr 30 16:20:04 rawstore kernel: EXT3 FS 2.4-0.9.17, 10 Jan 2002 on 
sd(8,5), internal journal
Apr 30 16:20:04 rawstore kernel: EXT3-fs: mounted filesystem with 
ordered data mode.
Apr 30 16:20:04 rawstore kernel: XFS mounting filesystem lvm(58,1)
Apr 30 16:20:04 rawstore keytable:
Apr 30 16:20:04 rawstore kernel: XFS mounting filesystem lvm(58,2)
Apr 30 16:20:04 rawstore rc: Starting keytable:  succeeded
Apr 30 16:20:04 rawstore kernel: XFS mounting filesystem lvm(58,0)
Apr 30 16:20:04 rawstore kernel: XFS mounting filesystem lvm(58,5)
Apr 30 16:20:04 rawstore kernel: XFS mounting filesystem lvm(58,6)
Apr 30 16:20:04 rawstore kernel: XFS mounting filesystem lvm(58,8)
Apr 30 16:20:04 rawstore kernel: XFS mounting filesystem lvm(58,10)
Apr 30 16:20:04 rawstore kernel: ip_conntrack (8192 buckets, 65536 max)
Apr 30 16:20:04 rawstore kernel: Intel(R) PRO/1000 Network Driver - 
version 5.2.20
Apr 30 16:20:04 rawstore kernel: Copyright (c) 1999-2003 Intel Corporation.
Apr 30 16:20:04 rawstore kernel: eth0: Intel(R) PRO/1000 Network Connection
Apr 30 16:20:04 rawstore kernel: eth1: Intel(R) PRO/1000 Network Connection
Apr 30 16:20:04 rawstore random: Initializing random number generator:  
succeeded
Apr 30 16:20:04 rawstore mount: mount: special device 
/dev/DiskPoolC/lvol1 does not exist
Apr 30 16:20:04 rawstore mount: mount: special device 
/dev/DiskPoolC/lvol2 does not exist
Apr 30 16:20:04 rawstore mount: mount: special device 
/dev/DiskPoolC/lvol3 does not exist
Apr 30 16:20:04 rawstore mount: mount: special device 
/dev/DiskPoolC/lvol4 does not exist
Apr 30 16:20:04 rawstore netfs: Mounting other filesystems:  failed
Apr 30 16:20:04 rawstore ntpd[708]: ntpd 4.0.99k Thu Apr  5 14:21:47 EDT 
2001 (1)
Apr 30 16:20:04 rawstore ntpd: ntpd startup succeeded
Apr 30 16:20:04 rawstore ntpd[708]: precision = 8 usec
Apr 30 16:20:04 rawstore ntpd[708]: using kernel phase-lock loop 0040
Apr 30 16:20:04 rawstore ntpd[708]: frequency initialized 56.219 from 
/etc/ntp/drift
Apr 30 16:20:04 rawstore ntpd[708]: using kernel phase-lock loop 0041
Apr 30 16:20:04 rawstore atd: atd startup succeeded
Apr 30 16:20:04 rawstore ucd-snmp[733]: UCD-SNMP version 4.2.5
Apr 30 16:20:04 rawstore snmpd: snmpd startup succeeded
Apr 30 16:20:04 rawstore sshd: Starting sshd:
Apr 30 16:20:04 rawstore rc: Starting sshd:  succeeded
Apr 30 16:19:58 rawstore rc.sysinit: Mounting proc filesystem:  succeeded
Apr 30 16:19:58 rawstore sysctl: net.ipv4.ip_forward = 0
Apr 30 16:19:58 rawstore sysctl: net.ipv4.conf.all.rp_filter = 1
Apr 30 16:19:58 rawstore rc.sysinit: Configuring kernel parameters:  
succeeded
Apr 30 16:19:58 rawstore date: Sat Apr 30 16:19:58 GMT 2005
Apr 30 16:19:58 rawstore rc.sysinit: Setting clock  (localtime): Sat Apr 
30 16:19:58 GMT 2005 succeeded
Apr 30 16:19:58 rawstore rc.sysinit: Loading default keymap succeeded
Apr 30 16:19:58 rawstore rc.sysinit: Setting default font (lat0-sun16):  
succeeded
Apr 30 16:19:58 rawstore rc.sysinit: Activating swap partitions:  succeeded
Apr 30 16:19:58 rawstore rc.sysinit: Setting hostname rawstore:  succeeded
Apr 30 16:19:58 rawstore fsck: /: clean, 35343/102592 files, 
125303/205052 blocks
Apr 30 16:19:58 rawstore rc.sysinit: Checking root filesystem succeeded
Apr 30 16:19:58 rawstore rc.sysinit: Remounting root filesystem in 
read-write mode:  succeeded
Apr 30 16:19:58 rawstore rc.sysinit: Finding module dependencies:  succeeded
Apr 30 16:19:58 rawstore fsck: /tmp: clean, 12/102816 files, 
21224/410624 blocks
Apr 30 16:19:58 rawstore rc.sysinit: Checking filesystems succeeded
Apr 30 16:19:58 rawstore fsck: /var: clean, 523/102592 files, 
32046/205052 blocks
Apr 30 16:20:00 rawstore vgscan: vgscan -- reading all physical volumes 
(this may take a while...)
Apr 30 16:20:00 rawstore rc.sysinit: Scan available volume groups: succeeded
Apr 30 16:20:00 rawstore vgscan: vgscan -- found active volume group 
DiskPoolA
Apr 30 16:20:00 rawstore vgscan: vgscan -- found active volume group 
DiskPoolB
Apr 30 16:20:00 rawstore vgscan: vgscan -- /etc/lvmtab and /etc/lvmtab.d 
successfully created
Apr 30 16:20:00 rawstore vgscan: vgscan -- WARNING: This program does 
not do a VGDA backup of your volume groups
Apr 30 16:20:00 rawstore vgscan: vgscan -- ERROR vg_read_with_pv_and_lv():
Apr 30 16:20:01 rawstore vgchange: vgchange -- volume group DiskPoolA 
successfully activated
Apr 30 16:20:01 rawstore vgchange: vgchange -- volume group DiskPoolB 
successfully activated
Apr 30 16:20:01 rawstore rc.sysinit: Setting up LVM: succeeded
Apr 30 16:20:01 rawstore mount: mount: special device 
/dev/DiskPoolC/lvol1 does not exist
Apr 30 16:20:01 rawstore mount: mount: special device 
/dev/DiskPoolC/lvol2 does not exist
Apr 30 16:20:01 rawstore mount: mount: special device 
/dev/DiskPoolC/lvol3 does not exist
Apr 30 16:20:01 rawstore mount: mount: special device 
/dev/DiskPoolC/lvol4 does not exist
