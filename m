Return-Path: <josv@osp.nl>
Date: Fri, 18 May 2001 07:22:59 +0200
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] Problem with LVM root
Message-ID: <20010518072259.L1937@jadzia.josv.com>
References: <Pine.LNX.4.21.0105171825330.21464-300001@radio.PSCL.cwru.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0105171825330.21464-300001@radio.PSCL.cwru.edu>; from mokatz@radio.PSCL.CWRU.Edu on Thu, May 17, 2001 at 07:52:54PM -0400
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

Could it be that you are using the devfs /dev device file system? In
that case /dev is not mounted after you changed the root file system
(using the pivot_root() system call). When init starts, it communicates
with others through the /dev/initctl file. When that file does not
exist, it loops...

The solution? In your linuxrc, mount /dev after changing the root file
system.

++Jos

P.S. It might of course well be something else, but I experienced the
same behaviour and this turned out to be the solution....

And thus it came to pass that Mo Katz wrote:
(on Thu, May 17, 2001 at 07:52:54PM -0400 to be exact)

> I'm having a problem with LVM root.  I have a feeling that it might be
> something simple that I'm missing, but I'm not sure.  I'm running Debain
> 2.2r3 updated properly to run the 2.4.4 kernel.  I've patched to LVM beta7
> and also upgraded my tools.
> 
> I hacked the lvmcreate_initrd script a little bit to include dmesg and
> such as well as putting the line '/bin/bash' at the end of linuxrc to give
> me a shell to work with.
> 
> Pretty much everything is compiled monolithically into the kernel.  The
> first file is the dmesg output right after mounting of the initrd.  The
> 2nd file is the output of the linuxrc file with verbosity turned
> on.  After linuxrc completes it drops me to a shell (I set it to do
> that) so I could save the two files.  I then mounted the LV just fine
> (mount -t reiserfs /dev/sys/root /proc) [after /proc was unmounted] and
> saved the two files.  I then unmounted the LV and exited the shell which
> then continues on with the kernel boot.  The picture is a screenshot of
> what happens next.  (If people want, I can transcribe it to text.)  The
> kernel complains about various things, including some lvm stuff, mounts
> the lv as reiserfs, frees memory and then hangs, nothing happens further.
> 
> Thanks for any help you can give.
> 
> -- 
> Mo Katz  --  mokatz@radio.cwru.edu
> Webcasting Director, WRUW-FM 91.1
> Hear us on the web: http://radio.cwru.edu

> Linux version 2.4.4 (root@moshe) (gcc version 2.95.2 20000220 (Debian GNU/Linux)) #4 Wed May 16 23:57:03 EDT 2001
> BIOS-provided physical RAM map:
>  BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
>  BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
>  BIOS-e820: 00000000000e0000 - 0000000000100000 (reserved)
>  BIOS-e820: 0000000000100000 - 0000000006000000 (usable)
>  BIOS-e820: 00000000fec00000 - 00000000fec01000 (reserved)
>  BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
>  BIOS-e820: 00000000fffe0000 - 0000000100000000 (reserved)
> On node 0 totalpages: 24576
> zone(0): 4096 pages.
> zone(1): 20480 pages.
> zone(2): 0 pages.
> Kernel command line: auto BOOT_IMAGE=Linux ro root=3a00 BOOT_FILE=/vmlinuz ramdisk_size=8192
> Initializing CPU#0
> Detected 166.196 MHz processor.
> Console: colour VGA+ 80x25
> Calibrating delay loop... 331.77 BogoMIPS
> Memory: 92868k/98304k available (1344k kernel code, 5048k reserved, 480k data, 212k init, 0k highmem)
> Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
> Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
> Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
> Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
> CPU: Before vendor init, caps: 000001bf 00000000 00000000, vendor = 0
> Intel Pentium with F0 0F bug - workaround enabled.
> CPU: After vendor init, caps: 000001bf 00000000 00000000 00000000
> CPU: After generic, caps: 000001bf 00000000 00000000 00000000
> CPU: Common caps: 000001bf 00000000 00000000 00000000
> CPU: Intel Pentium 75 - 200 stepping 0c
> Checking 'hlt' instruction... OK.
> POSIX conformance testing by UNIFIX
> PCI: PCI BIOS revision 2.10 entry at 0xfdb91, last bus=0
> PCI: Using configuration type 1
> PCI: Probing PCI hardware
> Limiting direct PCI/PCI transfers.
> Activating ISA DMA hang workarounds.
> isapnp: Scanning for PnP cards...
> isapnp: Calling quirk for 01:00
> isapnp: SB audio device quirk - increasing port range
> isapnp: Calling quirk for 01:02
> isapnp: AWE32 quirk - adding two ports
> isapnp: Card 'Creative SB AWE32 PnP'
> isapnp: 1 Plug & Play card detected total
> Linux NET4.0 for Linux 2.4
> Based upon Swansea University Computer Society NET3.039
> apm: BIOS version 1.2 Flags 0x03 (Driver version 1.14)
> Starting kswapd v1.8
> Winbond Super-IO detection, now testing ports 3F0,370,250,4E,2E ...
> SMSC Super-IO detection, now testing Ports 2F0, 370 ...
> SMSC chip at EFER=0x3f0 key=0x55 devid=03 devrev=00
> SMSC unknown chip type
> pty: 256 Unix98 ptys configured
> block: queued sectors max/low 61589kB/20529kB, 192 slots per queue
> RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
> Uniform Multi-Platform E-IDE driver Revision: 6.31
> ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
> PIIX3: IDE controller on PCI bus 00 dev 39
> PIIX3: chipset revision 0
> PIIX3: not 100% native mode: will probe irqs later
>     ide0: BM-DMA at 0xffa0-0xffa7, BIOS settings: hda:DMA, hdb:pio
>     ide1: BM-DMA at 0xffa8-0xffaf, BIOS settings: hdc:DMA, hdd:DMA
> hda: Maxtor 87000D8, ATA DISK drive
> hdb: CD-ROM CDR-C3G, ATAPI CD/DVD-ROM drive
> hdc: Maxtor 87000D8, ATA DISK drive
> hdd: QUANTUM FIREBALL lct10 6.8A, ATA DISK drive
> ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
> ide1 at 0x170-0x177,0x376 on irq 15
> hda: 13678880 sectors (7004 MB) w/256KiB Cache, CHS=851/255/63, (U)DMA
> hdc: 13678880 sectors (7004 MB) w/256KiB Cache, CHS=14475/15/63, (U)DMA
> hdd: 13379310 sectors (6850 MB) w/418KiB Cache, CHS=14158/15/63, (U)DMA
> hdb: ATAPI 4X CD-ROM changer w/3 slots, 256kB Cache
> Uniform CD-ROM driver Revision: 3.12
> Partition check:
>  hda: hda1 hda2 hda3
>  hdc: hdc1 hdc2
>  hdd: hdd1
> Floppy drive(s): fd0 is 1.44M
> FDC 0 is a post-1991 82077
> RAMDISK: Compressed image found at block 0
> Freeing initrd memory: 929k freed
> NTFS version 010116
> udf: registering filesystem
> loop: loaded (max 8 devices)
> Serial driver version 5.05a (2001-03-20) with MANY_PORTS SHARE_IRQ DETECT_IRQ SERIAL_PCI ISAPNP enabled
> ttyS00 at 0x03f8 (irq = 4) is a 16550A
> ttyS01 at 0x02f8 (irq = 3) is a 16550A
> Real Time Clock Driver v1.10d
> Non-volatile memory driver v1.1
> Software Watchdog Timer: 0.05, timer margin: 60 sec
> Linux Tulip driver version 0.9.14e (April 20, 2001)
> 00:12.0:  MII transceiver #1 config 3000 status 7809 advertising 01e1.
> eth0: Lite-On 82c168 PNIC rev 32 at 0xe800, 00:A0:CC:60:09:71, IRQ 7.
> eth1: ADMtek Comet rev 17 at 0xec00, 00:00:78:02:13:DD, IRQ 9.
> Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
> sb: Creative SB AWE32 PnP detected
> sb: ISAPnP reports 'Creative SB AWE32 PnP' at i/o 0x220, irq 5, dma 1, 5
> <Sound Blaster 16 (4.13)> at 0x220 irq 5 dma 1,5
> <Sound Blaster 16> at 0x330 irq 5 dma 0,0
> sb: 1 Soundblaster PnP card(s) found.
> ISAPnP reports AWE32 WaveTable at i/o 0x620
> <SoundBlaster EMU8000 (RAM8192k)>
> usb.c: registered new driver usbdevfs
> usb.c: registered new driver hub
> uhci.c: USB UHCI at I/O 0xef80, IRQ 10
> usb.c: new USB bus registered, assigned bus number 1
> hub.c: USB hub found
> hub.c: 2 ports detected
> LVM version 0.9.1_beta7  by Heinz Mauelshagen  (10/04/2001)
> lvm -- Driver successfully initialized
> NET4: Linux TCP/IP 1.0 for NET4.0
> IP Protocols: ICMP, UDP, TCP, IGMP
> IP: routing cache hash table of 512 buckets, 4Kbytes
> TCP: Hash tables configured (established 8192 bind 8192)
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> NET4: AppleTalk 0.18a for Linux NET4.0
> VFS: Mounted root (ext2 filesystem).

> proc on /proc type proc (rw)
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- scanning for all active volume group(s) first
> vgscan -- found inactive volume group "sys"
> vgscan -- reading data of volume group "sys" from physical volume(s)
> vgscan -- inserting "sys" into lvmtab
> vgscan -- backing up volume group "sys"
> vgscan -- checking volume group name "sys"
> vgscan -- checking volume group consistency of "sys"
> vgscan -- checking existence of "/etc/lvmtab.d"
> vgscan -- storing volume group data of "sys" in "/etc/lvmtab.d/sys.tmp"
> vgscan -- storing physical volume data of "sys" in "/etc/lvmtab.d/sys.tmp"
> vgscan -- storing logical volume data of volume group "sys" in "/etc/lvmtab.d/sys.tmp"
> vgscan -- renaming "/etc/lvmtab.d/sys.tmp" to "/etc/lvmtab.d/sys"
> vgscan -- removing special files and directory for volume group "sys"
> vgscan -- creating directory and group character special file for "sys"
> vgscan -- creating block device special files for sys
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume group
> 
> vgchange -- locking logical volume manager
> vgchange -- finding all volume group(s)
> vgchange -- checking volume group name "sys"
> vgchange -- checking existence of volume group "sys"
> vgchange -- reading volume group data for "sys" from lvmtab
> vgchange -- checking volume group consistency  of "sys"
> vgchange -- checking if all physical volumes of volume group "sys" are available
> vgchange -- creating VGDA for "sys" in kernel
> vgchange -- volume group "sys" successfully activated
> 
> vgchange -- unlocking logical volume manager
> proc umounted



-- 
Although I walk in the valley of Death, I fear no evil;
For I am the evilest motherfucker in the valley...
