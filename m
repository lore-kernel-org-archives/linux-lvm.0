From: "Jason A. Lixfeld" <jlixfeld@andromedas.com>
Date: Tue, 9 Oct 2001 23:31:27 -0400
Message-ID: <000901c1513c$0b59d9d0$836788cf@industry>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] More strangeness
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Me again.  Anyone care to fathom a guess as to what's going on here?

Below is taken from dmesg.  2 Promise Ultra100 Controllers, 6x60GB
drives.

PDC20268: IDE controller on PCI bus 00 dev 58
PDC20268: chipset revision 2
PDC20268: not 100% native mode: will probe irqs later
PDC20268: ROM enabled at 0xdf000000
PDC20268: (U)DMA Burst Bit ENABLED Primary MASTER Mode Secondary MASTER
Mode.
    ide2: BM-DMA at 0xb800-0xb807, BIOS settings: hde:pio, hdf:pio
    ide3: BM-DMA at 0xb808-0xb80f, BIOS settings: hdg:pio, hdh:pio
PDC20268: IDE controller on PCI bus 00 dev 68
PDC20268: chipset revision 2
PDC20268: not 100% native mode: will probe irqs later
PDC20268: ROM enabled at 0xe0000000
PDC20268: (U)DMA Burst Bit ENABLED Primary MASTER Mode Secondary MASTER
Mode.
    ide4: BM-DMA at 0xcc00-0xcc07, BIOS settings: hdi:pio, hdj:pio
    ide5: BM-DMA at 0xcc08-0xcc0f, BIOS settings: hdk:pio, hdl:pio
keyboard: Timeout - AT keyboard not present?(ed)
keyboard: Timeout - AT keyboard not present?(f4)
hda: ST38641A, ATA DISK drive
hde: WDC WD600AB-22BVA0, ATA DISK drive
hdf: WDC WD600AB-22BVA0, ATA DISK drive
hdg: Maxtor 96147U8, ATA DISK drive
hdh: Maxtor 96147H6, ATA DISK drive
hdi: Maxtor 96147H8, ATA DISK drive
hdj: Maxtor 96147U8, ATA DISK drive
hdl: Maxtor 98196H8, ATA DISK drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
ide2 at 0xa800-0xa807,0xac02 on irq 10
ide3 at 0xb000-0xb007,0xb402 on irq 10
ide4 at 0xbc00-0xbc07,0xc002 on irq 11
ide5 at 0xc400-0xc407,0xc802 on irq 11
hda: 16809660 sectors (8607 MB) w/128KiB Cache, CHS=8338/32/63, UDMA(33)
hde: 117231408 sectors (60022 MB) w/2048KiB Cache, CHS=116301/16/63,
UDMA(100)
hdf: 117231408 sectors (60022 MB) w/2048KiB Cache, CHS=116301/16/63,
UDMA(100)
hdg: 120060864 sectors (61471 MB) w/2048KiB Cache, CHS=119108/16/63,
UDMA(100)
hdh: 120064896 sectors (61473 MB) w/2048KiB Cache, CHS=119112/16/63,
UDMA(100)
hdi: 120060864 sectors (61471 MB) w/2048KiB Cache, CHS=119108/16/63,
UDMA(100)
hdj: 120060864 sectors (61471 MB) w/2048KiB Cache, CHS=119108/16/63,
UDMA(100)
hdl: 160086528 sectors (81964 MB) w/2048KiB Cache, CHS=158816/16/63,
UDMA(100)

Compiler:
gcc version 2.96 20000731 (Red Hat Linux 7.1 2.96-81)

Kernel:
Linux HiT0DAY 2.4.10 #1 Tue Oct 9 12:12:25 EDT 2001 i686 unknown

LVM:
LVM version 1.0.1-rc4(03/10/2001)
(Tools compiled with -O0)

E2fsprogs 1.25

Here are the steps I use to create an LVM.  In this case, we'll create
the VG test, LV test using /dev/hde /dev/hdg and /dev/hdi:

1) Fdisk drive to nuke partiton
2) /sbin/pvcreate /dev/hde /dev/hdg /dev/hdi
3) /sbin/vgcreate -s 16M test /dev/hde /dev/hdg /dev/hdi
5) /sbin/lvcreate -l 10900 -n test test
6) /sbin/mke2fs -j /dev/test/test
7) /sbin/tune2fs -i 0 /dev/test/test
8) mount -t ext3 /dev/test/test /mnt/test

Ok, looks normal right?  Let's make sure pvscan looks right:

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdi" of VG "test" [57.22 GB / 0 free]
pvscan -- inactive PV "/dev/hdj" is in no VG  [57.25 GB]
pvscan -- ACTIVE   PV "/dev/hdg" of VG "test" [57.22 GB / 0 free]
pvscan -- inactive PV "/dev/hdh" is in no VG  [57.25 GB]
pvscan -- ACTIVE   PV "/dev/hde" of VG "test" [55.88 GB / 0 free]
pvscan -- total: 4 [227.65 GB] / in use: 2 [113.15 GB] / in no VG: 2
[114.50 GB]

Looks fine to me.  Finally, let's check dmesg:

<snip>
Adding Swap: 2097136k swap-space (priority -1)
reiserfs: checking transaction log (device 39:41) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.10, 23 Sep 2001 on lvm(58,0), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
eth0: Setting 100mbps full-duplex based on auto-negotiated partner
ability 41e1.
task `ifconfig' exit_signal 17 in reparent_to_init
</snip>

Looks perfect.  Let's reboot, just to make sure that everything comes up
ok.  Once we reboot, let's check dmesg to see the errors:

<snip>
Oct  9 22:26:35 hit0day syslog: syslogd startup succeeded
Oct  9 22:26:36 hit0day kernel: klogd 1.4-0, log source = /proc/kmsg
started.
Oct  9 22:26:36 hit0day kernel: Inspecting /boot/System.map-2.4.10
Oct  9 22:26:36 hit0day syslog: klogd startup succeeded
Oct  9 22:26:36 hit0day random: Initializing random number generator:
succeeded
Oct  9 22:26:36 hit0day kernel: Symbol table has incorrect version
number. 
Oct  9 22:26:36 hit0day kernel: Inspecting /boot/System.map
Oct  9 22:26:36 hit0day kernel: Symbol table has incorrect version
number. 
Oct  9 22:26:36 hit0day kernel: Cannot find map file.
Oct  9 22:26:36 hit0day kernel: No module symbols loaded - kernel
modules not enabled. 
Oct  9 22:26:36 hit0day kernel: cannot find any symbols, turning off
symbol lookups 
Oct  9 22:26:36 hit0day kernel: y SeekComplete DataRequest Error }
Oct  9 22:26:36 hit0day kernel: hdg: read_intr: error=0x10 {
SectorIdNotFound }, LBAsect=239992834, sector=2
Oct  9 22:26:36 hit0day kernel: hdg: read_intr: status=0x59 { DriveReady
SeekComplete DataRequest Error }
Oct  9 22:26:36 hit0day kernel: hdg: read_intr: error=0x10 {
SectorIdNotFound }, LBAsect=239992834, sector=2
Oct  9 22:26:36 hit0day kernel: hdg: read_intr: status=0x59 { DriveReady
SeekComplete DataRequest Error }
Oct  9 22:26:36 hit0day kernel: hdg: read_intr: error=0x10 {
SectorIdNotFound }, LBAsect=239992834, sector=2
Oct  9 22:26:36 hit0day sshd: Starting sshd:
Oct  9 22:26:36 hit0day kernel: hdg: read_intr: status=0x59 { DriveReady
SeekComplete DataRequest Error }
Oct  9 22:26:36 hit0day kernel: hdg: read_intr: error=0x10 {
SectorIdNotFound }, LBAsect=239992834, sector=2
Oct  9 22:26:36 hit0day kernel: ide3: reset: success
...
...
...
...
<various hard drive errors for ALL drives (/dev/hde /dev/hdg AND
/dev/hdi) in LVM test continue for a couple of pages>
</snip>

Why, all of a sudden do I get all these errors?  After a couple of days,
I have deduced that the problem is infact with /dev/hdg, so I remove it
from the LVM completley.  Then, afterwards, in order to stop it from
showing up in pvscan, I run mke2fs /dev/hdg.  After that, I can mount
/dev/hdg on it's own.  Then, the LVM is fine, but so is hdg.  It's
running perfectly on it's own, but it refuses to run in an LVM.

Anyone have any ideas?  This has been driving me nuts for over a week
now.  I'd like to send the drive back, but it appears to work fine.
Anyone seen anything similar?

-JL
