Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1NMjYZV002762
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 17:45:34 -0500
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NMjNVu017867
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 17:45:23 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1PsNDf-0004tM-TS
	for linux-lvm@redhat.com; Wed, 23 Feb 2011 23:30:03 +0100
Received: from spike.mokotowplaza.waw.pl ([89.171.67.10])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 23:30:03 +0100
Received: from tnowak by spike.mokotowplaza.waw.pl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 23:30:03 +0100
From: "Tomasz Nowak" <tnowak@netventure.pl>
Date: Wed, 23 Feb 2011 23:24:13 +0100
Message-ID: <ik41em$6rl$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Errors after adding new md pv (boot only?)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-lvm@redhat.com

Hello,
I have a weird problem after adding new PV do LMV volume group.
It seems the error comes out only during boot time. Please read the story.

I have couple of 1U machines. They all have two, four or more Fujitsu-Siemens
SAS 2,5" disks, which are bounded in Raid1 pairs with Linux mdadm.
First pair of disks has always two arrays (md0, md1). Small md0 is used
for booting and the rest - md1 is used as PV for volume group (vg0).
When I need to enlarge the volume, I just add 2 new disks, create
a raid 1 array of their whole space I add it as another mdX to vg0.

That has been working fine since yesterday.  I received new disks
branded by Toshiba (Toshiba bought Fujitsu-Simens hdd business)
which were supposed to be added as disk no 3 and 4.
As far as I remember I've done everything in the same way as before:

- They come out as sdc and sdd, so I
- fdisk /dev/sdc, created one primary parition of whole space, type fd
- the same with /dev/sdd
- mdadm --create /dev/md2 -R -l 1 -n 2 /dev/sdc1 /dev/sdd1
- array has been created and syncronized
- mdadm --examine --scan > /etc/mdadm.conf
- cat /etc/mdadm.conf
ARRAY /dev/md0 level=raid1 num-devices=2 UUID=91518bd3:79953138:f203f159:f2795fde
ARRAY /dev/md1 level=raid1 num-devices=2 UUID=5b6722ca:b325344b:4ab40fc6:c3f1d6b4
ARRAY /dev/md2 level=raid1 num-devices=2 UUID=45e2f59b:1be94f42:5d55c385:da4faf78
- pvcreate /dev/md2
- vgextend vg0 /dev/md2

and it looks fine:
----------------------------------------------------------------------
# cat /proc/mdstat
Personalities : [raid1]
md1 : active raid1 sdb2[1] sda2[0]
      140488320 blocks [2/2] [UU]

md2 : active raid1 sdd1[1] sdc1[0]
      292961216 blocks [2/2] [UU]

md0 : active raid1 sdb1[1] sda1[0]
      3148608 blocks [2/2] [UU]
----------------------------------------------------------------------
# pvdisplay
  --- Physical volume ---
  PV Name               /dev/md1
  VG Name               vg0
  PV Size               133.98 GB / not usable 11.62 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              4287
  Free PE               1695
  Allocated PE          2592
  PV UUID               AufZRm-QbFC-xRj1-OxwW-Z2w2-qbkM-qzoEcP

  --- Physical volume ---
  PV Name               /dev/md2
  VG Name               vg0
  PV Size               279.39 GB / not usable 14.94 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              8940
  Free PE               8940
  Allocated PE          0
  PV UUID               qeDW2q-nq5b-Yh5U-5sKY-7Rkd-1UXh-LAxL8j
----------------------------------------------------------------------
# vgdisplay
  --- Volume group ---
  VG Name               vg0
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  1010
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                8
  Open LV               2
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               413.34 GB
  PE Size               32.00 MB
  Total PE              13227
  Alloc PE / Size       2592 / 81.00 GB
  Free  PE / Size       10635 / 332.34 GB
  VG UUID               5cF1dk-1CMM-qiuf-CyNY-aCmw-8Hx8-4iO12I
----------------------------------------------------------------------
# lvdisplay
  --- Logical volume ---
  LV Name                /dev/vg0/d0v
  VG Name                vg0
  LV UUID                q7zmrV-EykH-jPzR-smYJ-eehh-3Gbx-ebu5wK
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                3.00 GB
  Current LE             96
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0

[...] this part may be skiped as it's very long an irrelevant.
There are no errors here.
----------------------------------------------------------------------

And now please take a look what happens during boot:


[...]
scsi0 : ioc0: LSISAS1078 C2, FwRev=01180400h, Ports=1, MaxQ=276, IRQ=20
mptsas: ioc0: attaching ssp device: fw_channel 0, fw_id 1, phy 0, sas_addr
0x500000e01f975022
  Vendor: FUJITSU   Model: MBB2147RC         Rev: 0105
  Type:   Direct-Access                      ANSI SCSI revision: 05
SCSI device sda: 287277984 512-byte hdwr sectors (147086 MB)
sda: Write Protect is off
SCSI device sda: drive cache: write back
SCSI device sda: 287277984 512-byte hdwr sectors (147086 MB)
sda: Write Protect is off
SCSI device sda: drive cache: write back
sda: sda1 sda2
sd 0:0:0:0: Attached scsi disk sda
mptsas: ioc0: attaching ssp device: fw_channel 0, fw_id 2, phy 1, sas_addr
0x500000e01f602f42
  Vendor: FUJITSU   Model: MBB2147RC         Rev: 0105
  Type:   Direct-Access                      ANSI SCSI revision: 05
SCSI device sdb: 287277984 512-byte hdwr sectors (147086 MB)
sdb: Write Protect is off
SCSI device sdb: drive cache: write back
SCSI device sdb: 287277984 512-byte hdwr sectors (147086 MB)
sdb: Write Protect is off
SCSI device sdb: drive cache: write back
sdb: sdb1 sdb2
sd 0:0:1:0: Attached scsi disk sdb
mptsas: ioc0: attaching ssp device: fw_channel 0, fw_id 3, phy 2, sas_addr
0x50000392b8028856
  Vendor: TOSHIBA   Model: MBF2300RC         Rev: 0107
  Type:   Direct-Access                      ANSI SCSI revision: 05
SCSI device sdc: 585937500 512-byte hdwr sectors (300000 MB)
sdc: Write Protect is off
SCSI device sdc: drive cache: write back
SCSI device sdc: 585937500 512-byte hdwr sectors (300000 MB)
sdc: Write Protect is off
SCSI device sdc: drive cache: write back
sdc: sdc1
sd 0:0:2:0: Attached scsi disk sdc
mptsas: ioc0: attaching ssp device: fw_channel 0, fw_id 4, phy 3, sas_addr
0x50000392b80236da
  Vendor: TOSHIBA   Model: MBF2300RC         Rev: 0107
  Type:   Direct-Access                      ANSI SCSI revision: 05
SCSI device sdd: 585937500 512-byte hdwr sectors (300000 MB)
sdd: Write Protect is off
SCSI device sdd: drive cache: write back
SCSI device sdd: 585937500 512-byte hdwr sectors (300000 MB)
sdd: Write Protect is off
SCSI device sdd: drive cache: write back
sdd: sdd1
sd 0:0:3:0: Attached scsi disk sdd
Loading shpchp.ko module
shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
Loading libata.ko module
Loading ata_piix.ko module
GSI 23 sharing vector 0x41 and IRQ 23
ACPI: PCI Interrupt 0000:00:1f.2[B] -> GSI 18 (level, low) -> IRQ 23
ata_piix 0000:00:1f.2: MAP [ P0 P2 P1 P3 ]
scsi1 : ata_piix
scsi2 : ata_piix
ata1: SATA max UDMA/133 cmd 0x3138 ctl 0x314c bmdma 0x3110 irq 23
ata2: SATA max UDMA/133 cmd 0x3130 ctl 0x3148 bmdma 0x3118 irq 23
ata1: SATA link down (SStatus 0 SControl 300)
ata2: SATA link down (SStatus 0 SControl 300)
GSI 24 sharing vector 0x49 and IRQ 24
ACPI: PCI Interrupt 0000:00:1f.5[D] -> GSI 21 (level, low) -> IRQ 24
ata_piix 0000:00:1f.5: MAP [ P0 -- P1 -- ]
scsi3 : ata_piix
scsi4 : ata_piix
ata3: SATA max UDMA/133 cmd 0x3128 ctl 0x3144 bmdma 0x30f0 irq 24
ata4: SATA max UDMA/133 cmd 0x3120 ctl 0x3140 bmdma 0x30f8 irq 24
ata3: SATA link down (SStatus 4 SControl 300)
ata4: SATA link down (SStatus 0 SControl 300)
Loading usb-storage.ko module
Initializing USB Mass Storage driver...
scsi5 : SCSI emulation for USB Mass Storage devices
usbcore: registered new driver usb-storage
Waiting for driver initialization.
USB Mass Storage support registered.
  Vendor: TEAC      Model: DV-28S-V          Rev: 1.0B
  Type:   CD-ROM                             ANSI SCSI revision: 00
Loading dm-mod.ko module
device-mapper: uevent: version 1.0.3
device-mapper: ioctl: 4.11.5-ioctl (2007-12-12) initialised: 
dm-devel@redhat.com
Loading dm-log.ko module
Loading dm-mirror.ko module
Loading dm-zero.ko module
Loading dm-snapshot.ko module
Loading dm-mem-cache.ko module
Loading dm-region_hash.ko module
Loading dm-message.ko module
Loading dm-raid45.ko module
device-mapper: dm-raid45: initialized v0.2594l
Waiting for driver initialization.
Scanning and configuring dmraid supported devices
md: Autodetecting RAID arrays.
md: autorun ...
md: considering sdd1 ...
md:  adding sdd1 ...
md:  adding sdc1 ...
md: sdb2 has different UUID to sdd1
md: sdb1 has different UUID to sdd1
md: sda2 has different UUID to sdd1
md: sda1 has different UUID to sdd1
md: created md2
md: bind<sdc1>
md: bind<sdd1>
md: running: <sdd1><sdc1>
raid1: raid set md2 active with 2 out of 2 mirrors
md: considering sdb2 ...
md:  adding sdb2 ...
md: sdb1 has different UUID to sdb2
md:  adding sda2 ...
md: sda1 has different UUID to sdb2
md: created md1
md: bind<sda2>
md: bind<sdb2>
md: running: <sdb2><sda2>
raid1: raid set md1 active with 2 out of 2 mirrors
md: considering sdb1 ...
md:  adding sdb1 ...
md:  adding sda1 ...
md: created md0
md: bind<sda1>
md: bind<sdb1>
md: running: <sdb1><sda1>
raid1: raid set md0 active with 2 out of 2 mirrors
md: ... autorun DONE.
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.

------------------------ and here come the problem -----------------------

Scanning logical volumes
  Reading all physical volumes.  This may take a while...
  Couldn't find device with uuid qeDW2q-nq5b-Yh5U-5sKY-7Rkd-1UXh-LAxL8j.
  Found volume group "vg0" using metadata type lvm2
Activating logical volumes
  Couldn't find device with uuid qeDW2q-nq5b-Yh5U-5sKY-7Rkd-1UXh-LAxL8j.
  8 logical volume(s) in volume group "vg0" now active
Creating root device.
Mounting root filesystem.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
Setting up other filesystems.
Setting up new root fs
no fstab.sys, mounting internal defaults
Switching to new root and running init.
unmounting old /dev
unmounting old /proc
unmounting old /sys
SELinux:  Disabled at runtime.
type=1404 audit(1298476404.427:2): selinux=0 auid=4294967295 ses=4294967295
INIT: version 2.86 booting
                Welcome to  CentOS release 5.5 (Final)
                Press 'I' to enter interactive startup.
Setting clock  (utc): Wed Feb 23 16:53:25 CET 2011 [  OK  ]
Starting udev: [  OK  ]
Loading default keymap (us): [  OK  ]
Setting hostname xen13.local:  [  OK  ]
Setting up Logical Volume Management:   8 logical volume(s) in volume group "vg0" now
active
[...]



I have no idea were the problem is. I could paste vgck result here
but its long, is it nessesary?


I have yet another machine with the same setup and the same new
Toshiba disks and it shows even some more errors:


Scanning logical volumes
  Reading all physical volumes.  This may take a while...
  Couldn't find device with uuid fNeN0H-zeD1-ems8-TfqW-2pyC-ZBdR-3ni250.
  Found volume group "vg0" using metadata type lvm2
Activating logical volumes
  Couldn't find device with uuid fNeN0H-zeD1-ems8-TfqW-2pyC-ZBdR-3ni250.
  Refusing activation of partial LV d1dc. Use --partial to override.
  6 logical volume(s) in volume group "vg0" now active
[...]
but then later:
[...]
Setting up Logical Volume Management:   7 logical volume(s) in volume group "vg0" now
active


and after boot all 7 logical volumes work fine.



Where could be the problem with these errors?


-- 
Tomasz 
