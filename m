From: "Jason A. Lixfeld" <jlixfeld@fastvibe.com>
Message-ID: <002501c15a66$34f8d010$836788cf@industry>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <E15vISM-0005YX-00.2001-10-21-14-15-58@mail5.svr.pol.co.uk>
Subject: [linux-lvm] What really works?
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
Date: Sun Oct 21 14:25:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: ext3-users@redhat.com
Cc: linux-lvm@sistina.com

Folks, I'm really stressed here.  I'm sending this to both lists to see
if anyone can offer any assistance.

	I have 2 boxes.  Box1 has 10x80GB drives in it and 1 2GB drive
that the OS is installed on.  Box2 has 6x60GB drives in it and an 8GB
drive that the OS is installed on.  Here's the layout for box1:

Linux version 2.4.12-ac3(gcc version 2.96 20000731 (Red Hat Linux 7.1
2.96-81)

PDC20268: IDE controller on PCI bus 00 dev 40
PDC20268: chipset revision 1
PDC20268: not 100% native mode: will probe irqs later
PDC20268: ROM enabled at 0xe7000000
PDC20268: pci-config space interrupt mirror fixed.
PDC20268: (U)DMA Burst Bit ENABLED Primary MASTER Mode Secondary MASTER
Mode.
    ide2: BM-DMA at 0xb400-0xb407, BIOS settings: hde:pio, hdf:pio
    ide3: BM-DMA at 0xb408-0xb40f, BIOS settings: hdg:pio, hdh:pio
PDC20267: IDE controller on PCI bus 00 dev 48
PCI: Found IRQ 10 for device 00:09.0
PDC20267: chipset revision 2
PDC20267: not 100% native mode: will probe irqs later
PDC20267: ROM enabled at 0xe8000000
PDC20267: (U)DMA Burst Bit ENABLED Primary PCI Mode Secondary PCI Mode.
    ide4: BM-DMA at 0xc800-0xc807, BIOS settings: hdi:pio, hdj:pio
    ide5: BM-DMA at 0xc808-0xc80f, BIOS settings: hdk:pio, hdl:pio
PDC20267: IDE controller on PCI bus 00 dev 50
PCI: Found IRQ 12 for device 00:0a.0
PDC20267: chipset revision 2
PDC20267: not 100% native mode: will probe irqs later
PDC20267: ROM enabled at 0xe9000000
PDC20267: (U)DMA Burst Bit ENABLED Primary PCI Mode Secondary PCI Mode.
    ide6: BM-DMA at 0xdc00-0xdc07, BIOS settings: hdm:pio, hdn:pio
    ide7: BM-DMA at 0xdc08-0xdc0f, BIOS settings: hdo:pio, hdp:pio
hda: Maxtor 82100A4, ATA DISK drive
hdb: probing with STATUS(0x00) instead of ALTSTATUS(0x50)
hdb: probing with STATUS(0x00) instead of ALTSTATUS(0x50)
hde: Maxtor 98196H8, ATA DISK drive
hdf: Maxtor 98196H8, ATA DISK drive
hdg: Maxtor 98196H8, ATA DISK drive
hdh: Maxtor 98196H8, ATA DISK drive
hdi: Maxtor 98196H8, ATA DISK drive
hdj: MAXTOR 4K080H4, ATA DISK drive
hdk: MAXTOR 4K080H4, ATA DISK drive
hdl: MAXTOR 4K080H4, ATA DISK drive
hdm: Maxtor 98196H8, ATA DISK drive
hdn: Maxtor 98196H8, ATA DISK drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
ide2 at 0xa400-0xa407,0xa802 on irq 15
ide3 at 0xac00-0xac07,0xb002 on irq 15
ide4 at 0xc000-0xc007,0xc402 on irq 10
ide5 at 0xb800-0xb807,0xbc02 on irq 10
ide6 at 0xd400-0xd407,0xd802 on irq 12
hda: 4124736 sectors (2112 MB) w/256KiB Cache, CHS=1023/64/63, DMA
hde: 156312576 sectors (80032 MB) w/2048KiB Cache, CHS=155072/16/63,
UDMA(66)
hdf: 160086528 sectors (81964 MB) w/2048KiB Cache, CHS=158816/16/63,
UDMA(66)
hdg: 160086528 sectors (81964 MB) w/2048KiB Cache, CHS=158816/16/63,
UDMA(66)
hdh: 160086528 sectors (81964 MB) w/2048KiB Cache, CHS=158816/16/63,
UDMA(66)
hdi: 160086528 sectors (81964 MB) w/2048KiB Cache, CHS=158816/16/63,
UDMA(100)
hdj: 156301487 sectors (80026 MB) w/2000KiB Cache, CHS=155060/16/63,
UDMA(100)
hdk: 156301487 sectors (80026 MB) w/2000KiB Cache, CHS=155060/16/63,
UDMA(100)
hdl: 156301487 sectors (80026 MB) w/2000KiB Cache, CHS=155060/16/63,
UDMA(100)
hdm: 160086528 sectors (81964 MB) w/2048KiB Cache, CHS=158816/16/63,
UDMA(100)
hdn: 160086528 sectors (81964 MB) w/2048KiB Cache, CHS=158816/16/63,
UDMA(100)
Partition check:
 hda: hda1 hda2
 hde: hde1
 hdf: [PTBL] [9964/255/63] hdf1
 hdg: hdg1
 hdh: unknown partition table
 hdi: hdi1
 hdj: hdj1
 hdk: hdk1
 hdl: hdl1
 hdm: hdm1
 hdn: hdn1

# /sbin/pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdm" of VG "foo1" [76.31 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdn" of VG "foo3" [76.31 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdk" of VG "foo3" [74.50 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdl" of VG "foo2" [74.50 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdi" of VG "foo1" [76.31 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdj" of VG "foo2" [74.50 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdg" of VG "foo3" [76.31 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hde" of VG "foo1" [74.52 GB / 0 free]
pvscan -- total: 8 [603.47 GB] / in use: 8 [603.47 GB] / in no VG: 0 [0]

# /sbin/lvscan
lvscan -- ACTIVE            "/dev/foo1/pc" [227.14 GB]
lvscan -- ACTIVE            "/dev/foo2/cons" [149.00 GB]
lvscan -- ACTIVE            "/dev/foo3/mov" [227.12 GB]
lvscan -- 3 logical volumes with 603.27 GB total in 3 volume groups
lvscan -- 3 active logical volumes

--

History:  The LVMs and the RAID is brand new, not upgraded from a
previous version of LVM or EXT3 or anything.  The OS is old (RedHat
7.0).  To make a long story short, I was wrestling around for about a
week trying to find a good kernel rev that would work with the
FastTrack100 card, had all the recent features and fixes of LVM and all
the recent features and fixes of EXT3.  I compiled and installed the
latest e2fsprogs and utils-linux aswell.  I even tried a bunch of
different compilers before I found that 2.4.10-ac11 was a kernel rev
that finally started working ok.  Previous attempts at stock kernels and
various LVM/EXT3/FastTrack patches resulted in all kinds of errors
ranging from ATARAID errors to LVM errors to physical hard drive errors.
It was a big, huge mess.  Anyway, 2.4.10-ac11 worked fine for about 5
days.  We started to get low on space on the RAID so deleted stuff off
of one of the LVMs to make room and then we moved stuff from the raid
over to the LVM we had just free'd up space on.  As we were doing this,
kjournald chewed up all of the mem and CPU and then all these EXT3
errors started showing up in the logs.  All of a sudden, EXT3 crashed
and I had to make a trek into the office to hard boot the box.  I went
and rebooted the box and when it came back up, I decided to do forced
fsck'd of 2 of the LVMs that were having problems (/dev/foo3/mov was
getting data moved over to it and /dev/foo2/cons wasn't doing anything,
but it was showing up in dmesg as having some problems aswell before the
reboot).  I fsck'd both LVMs and fsck finds a whole WHACK of errors on
both LVMs.  After the fsck's finish and I delete the lost+found, I
discover that quite a large chunk of both LVMs are gone because of what
fsck thought to be bad data.  One of the lost+founds is stuck on my LVM
and I can't delete it.  Every time I try, it gives me permission denied
errors. Chattr -I doesn't work either (that's another problem, how the
hell do I get rid of all that stuff in there now).

Anyways, as it stands now every time I run a forced fsck on one of the
LVMs, it finds all kinds of errors, which results in data-loss as fsck
attempts to fix the problems.

I have just upgraded the kernel to 2.4.12-ac3, and now I get these
errors from the ATARAID:

attempt to access beyond end of device
72:01: rw=0, want=586678672, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586940816, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=588251536, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=588513680, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586678672, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586678672, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586678672, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586678672, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586678672, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586940816, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=588251536, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=588513680, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586678672, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586678672, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586678672, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586678672, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586678672, limit=160079661
attempt to access beyond end of device
72:01: rw=0, want=586678672, limit=160079661

I'm using these settings on my drives (via hdparm):/sbin/hdparm -m16 -c1
-d1 -a8 /dev/hd[e-n]

Also, for the ATARAID ppl who read this, as seen above, the drives that
are connected to the Promise FastTrack100 card come up as UDMA66,
instead of UDMA100.  How do I fix this?

New problem, I try to fsck another EXT3 LVM:

# /sbin/fsck /dev/ARCHiVE1/PC 
fsck 1.25 (20-Sep-2001)
e2fsck 1.25 (20-Sep-2001)
Superblock has a bad ext3 journal (inode 8).
Clear<y>? yes

*** ext3 journal has been deleted - filesystem is now ext2 only ***

/dev/ARCHiVE1/PC was not cleanly unmounted, check forced.
Pass 1: Checking inodes, blocks, and sizes

What's going on there?!

Why is all this happening?  What do I need to do to get this all
working?  This isn't complicated, is it?  10 drives, 3 LVMs and one
ATARAID?!

PLEASE help me get this working.  I'm sick and tired of wasting my days
fixing all this stuff... 

-JL
