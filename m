Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6FLR3a30355
	for <linux-lvm@redhat.com>; Thu, 15 Jul 2004 17:27:03 -0400
Received: from web11806.mail.yahoo.com (web11806.mail.yahoo.com
	[216.136.172.160])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i6FLR2e1026278
	for <linux-lvm@redhat.com>; Thu, 15 Jul 2004 17:27:02 -0400
Message-ID: <20040715212701.10322.qmail@web11806.mail.yahoo.com>
Date: Thu, 15 Jul 2004 14:27:01 -0700 (PDT)
From: <bowmailtmp-lvm@yahoo.com>
Subject: Re: [linux-lvm] vgscan can not find active volume group when i add a
	cdrom
In-Reply-To: <20040715124328.GJ25352@meuh.dyndns.org>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Have you tried using the "filter" directive in the
/etc/lvm/lvm.cnf  to force vgscan to ignore the
/dev/hdd device?  In my config it ignores /dev/cdrom
which does not actually point to my real cdrom on
/dev/hdc and it still has no issues, but it may be
worth a shot anyway.

Also, it might be worth strace-ing the vgscan to see
what happens when it tries to fstat the /dev/hdd
device:
strace vgscan >& output.log

-dave


--- Christophe Nowicki <cscm@meuh.dyndns.org> wrote:
> Hi all,
> 
> I'am running Debian GNU/Linux "sarge" with Linux
> 2.4.26, LVM version 
> 1.0.8 (lib lvm-common 1.5.16).
> 
> My server has 3 IDE hard drives when I plug a ide
> cdrom on /dev/hdd,
> vgscan can not find my active volume.
> 
> Here is my dmesg output without the cdrom ide plug
> in :
> [...]
> ide: Assuming 33MHz system bus speed for PIO modes;
> override with
> idebus=xx
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> ide: late registration of driver.
> VP_IDE: IDE controller at PCI slot 00:07.1
> VP_IDE: chipset revision 6
> VP_IDE: not 100% native mode: will probe irqs later
> VP_IDE: VIA vt82c686b (rev 40) IDE UDMA100
> controller on pci00:07.1
>     ide0: BM-DMA at 0xd000-0xd007, BIOS settings:
> hda:DMA, hdb:DMA
>     ide1: BM-DMA at 0xd008-0xd00f, BIOS settings:
> hdc:DMA, hdd:pio
> hda: ST3120026A, ATA DISK drive
> hdb: ST3120026A, ATA DISK drive
> blk: queue f0825120, I/O limit 4095Mb (mask
> 0xffffffff)
> blk: queue f082525c, I/O limit 4095Mb (mask
> 0xffffffff)
> hdc: ST3120022A, ATA DISK drive
> blk: queue f0825574, I/O limit 4095Mb (mask
> 0xffffffff)
> ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
> ide1 at 0x170-0x177,0x376 on irq 15
> hda: attached ide-disk driver.
> hda: 234441648 sectors (120034 MB) w/8192KiB Cache,
> CHS=14593/255/63,
> UDMA(100)
> hdb: attached ide-disk driver.
> hdb: 234441648 sectors (120034 MB) w/8192KiB Cache,
> CHS=14593/255/63,
> UDMA(100)
> Partition check:
>  /dev/ide/host0/bus0/target0/lun0: p1 p2 < p5 p6 >
>  /dev/ide/host0/bus0/target1/lun0: p1
> Journalled Block Device driver loaded
> [..]
> 
> Everything is ok, I can mount all disk and I see my
> 2 volume groupe :
> 
> vgscan -v output :
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- creating empty "/etc/lvmtab" and
> "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may
> take a while...)
> vgscan -- scanning for all active volume group(s)
> first
> vgscan -- found active volume group "vg_hda"
> vgscan -- reading data of volume group "vg_hda" from
> physical volume(s)
> vgscan -- inserting "vg_hda" into lvmtab
> vgscan -- backing up volume group "vg_hda"
> vgscan -- checking volume group name "vg_hda"
> vgscan -- checking volume group consistency of
> "vg_hda"
> vgscan -- checking existence of "/etc/lvmtab.d"
> vgscan -- storing volume group data of "vg_hda" in
> "/etc/lvmtab.d/vg_hda.tmp"
> vgscan -- storing physical volume data of "vg_hda"
> in
> "/etc/lvmtab.d/vg_hda.tmp"
> vgscan -- storing logical volume data of volume
> group "vg_hda" in
> "/etc/lvmtab.d/vg_hda.tmp"
> vgscan -- renaming "/etc/lvmtab.d/vg_hda.tmp" to
> "/etc/lvmtab.d/vg_hda"
> vgscan -- removing special files and directory for
> volume group "vg_hda"
> vgscan -- creating directory and group character
> special file for
> "vg_hda"
> vgscan -- creating block device special files for
> vg_hda
> vgscan -- found active volume group "vg_hdb"
> vgscan -- reading data of volume group "vg_hdb" from
> physical volume(s)
> vgscan -- inserting "vg_hdb" into lvmtab
> vgscan -- backing up volume group "vg_hdb"
> vgscan -- checking volume group name "vg_hdb"
> vgscan -- checking volume group consistency of
> "vg_hdb"
> vgscan -- checking existence of "/etc/lvmtab.d"
> vgscan -- storing volume group data of "vg_hdb" in
> "/etc/lvmtab.d/vg_hdb.tmp"
> vgscan -- storing physical volume data of "vg_hdb"
> in
> "/etc/lvmtab.d/vg_hdb.tmp"
> vgscan -- storing logical volume data of volume
> group "vg_hdb" in
> "/etc/lvmtab.d/vg_hdb.tmp"
> vgscan -- renaming "/etc/lvmtab.d/vg_hdb.tmp" to
> "/etc/lvmtab.d/vg_hdb"
> vgscan -- removing special files and directory for
> volume group "vg_hdb"
> vgscan -- creating directory and group character
> special file for
> "vg_hdb"
> vgscan -- creating block device special files for
> vg_hdb
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d"
> successfully created
> vgscan -- WARNING: This program does not do a VGDA
> backup of your volume
> groups
> 
> When I plug the IDE cdrom drive nothing is working.
> 
> Here is my dmesg output with the cdrom plug in :
> 
> [...]
> VP_IDE: IDE controller at PCI slot 00:07.1
> VP_IDE: chipset revision 6
> VP_IDE: not 100% native mode: will probe irqs later
> ide: Assuming 33MHz system bus speed for PIO modes;
> override with
> idebus=xx
> VP_IDE: VIA vt82c686b (rev 40) IDE UDMA100
> controller on pci00:07.1
>     ide0: BM-DMA at 0xd000-0xd007, BIOS settings:
> hda:DMA, hdb:DMA
>     ide1: BM-DMA at 0xd008-0xd00f, BIOS settings:
> hdc:DMA, hdd:DMA
> hda: ST3120026A, ATA DISK drive
> hdb: ST3120026A, ATA DISK drive
> blk: queue f082a2c0, I/O limit 4095Mb (mask
> 0xffffffff)
> blk: queue f082a3fc, I/O limit 4095Mb (mask
> 0xffffffff)
> hdc: ST3120022A, ATA DISK drive
> hdd: Hewlett-Packard CD-Writer Plus 7500, ATAPI
> CD/DVD-ROM drive
> blk: queue f082a714, I/O limit 4095Mb (mask
> 0xffffffff)
> ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
> ide1 at 0x170-0x177,0x376 on irq 15
> hda: attached ide-disk driver.
> hda: 234441648 sectors (120034 MB) w/8192KiB Cache,
> CHS=14593/255/63,
> UDMA(100)
> hdb: attached ide-disk driver.
> hdb: 234441648 sectors (120034 MB) w/8192KiB Cache,
> CHS=14593/255/63,
> UDMA(100)
> hdc: attached ide-disk driver.
> hdc: 234441648 sectors (120034 MB) w/2048KiB Cache,
> CHS=14593/255/63,
> UDMA(100)
> Partition check:
>  /dev/ide/host0/bus0/target0/lun0: p1 p2 < p5 p6 >
>  /dev/ide/host0/bus0/target1/lun0: p1
>  /dev/ide/host0/bus1/target0/lun0: p1
> Journalled Block Device driver loaded
> [...]
> As you can see /dev/hdd, the ide cdrom is detected
> by the linux kernel.
> But vgscan doesn't find my volume groups:
> 
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- creating empty "/etc/lvmtab" and
> "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may
> take a while...)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d"
> successfully created
> vgscan -- WARNING: This program does not do a VGDA
> backup of your volume
> group
> 
> Did I miss something? What's wrong with my setup?
> 
> Best Regards,
> -- 
> Nowicki Christophe                                  
> EPITECH Promo 2006                                 
> http://etudiant.epita.fr/~nowick_c/                 
> 

> ATTACHMENT part 1.2 application/pgp-signature
name=signature.asc
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://tldp.org/HOWTO/LVM-HOWTO/
