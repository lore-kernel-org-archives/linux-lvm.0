Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6IMRha08591
	for <linux-lvm@redhat.com>; Sun, 18 Jul 2004 18:27:43 -0400
Received: from meuh.csquad.org (ALagny-151-1-48-69.w83-114.abo.wanadoo.fr
	[83.114.254.69])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6IMRge1027129
	for <linux-lvm@redhat.com>; Sun, 18 Jul 2004 18:27:42 -0400
Date: Mon, 19 Jul 2004 00:27:32 +0200
From: Christophe Nowicki <cscm@meuh.dyndns.org>
Subject: Re: [linux-lvm] vgscan can not find active volume group when i add a
	cdrom
Message-ID: <20040718222732.GA4476@TuX>
References: <20040715124328.GJ25352@meuh.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20040715124328.GJ25352@meuh.dyndns.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I've solved my problem, I just switched cdrom possition.=20
I put the CD-ROM as secondary master and the hard drive as secondary
slave. And now everything is working :

/* dmesg output */=20
ide: late registration of driver.
VP_IDE: IDE controller at PCI slot 00:07.1
VP_IDE: chipset revision 6
VP_IDE: not 100% native mode: will probe irqs later
VP_IDE: VIA vt82c686b (rev 40) IDE UDMA100 controller on pci00:07.1
    ide0: BM-DMA at 0xd000-0xd007, BIOS settings: hda:DMA, hdb:DMA
    ide1: BM-DMA at 0xd008-0xd00f, BIOS settings: hdc:DMA, hdd:DMA
hda: ST3120026A, ATA DISK drive
hdb: ST3120026A, ATA DISK drive
blk: queue f0825120, I/O limit 4095Mb (mask 0xffffffff)
blk: queue f082525c, I/O limit 4095Mb (mask 0xffffffff)
hdc: Hewlett-Packard CD-Writer Plus 7500, ATAPI CD/DVD-ROM drive
hdd: ST3120022A, ATA DISK drive
blk: queue f08256b0, I/O limit 4095Mb (mask 0xffffffff)
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
ide1 at 0x170-0x177,0x376 on irq 15
hda: attached ide-disk driver.
hda: 234441648 sectors (120034 MB) w/8192KiB Cache, CHS=3D14593/255/63,
UDMA(100)
hdb: attached ide-disk driver.
hdb: 234441648 sectors (120034 MB) w/8192KiB Cache, CHS=3D14593/255/63,
UDMA(100)
hdd: attached ide-disk driver.
hdd: 234441648 sectors (120034 MB) w/2048KiB Cache, CHS=3D14593/255/63,
UDMA(100)
Partition check:
 /dev/ide/host0/bus0/target0/lun0: p1 p2 < p5 p6 >
 /dev/ide/host0/bus0/target1/lun0: p1
 /dev/ide/host0/bus1/target1/lun0: p1
Journalled Block Device driver loaded

/* vgscan output */=20

vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- found active volume group "vg_hda"
vgscan -- reading data of volume group "vg_hda" from physical volume(s)
vgscan -- inserting "vg_hda" into lvmtab
vgscan -- backing up volume group "vg_hda"
vgscan -- checking volume group name "vg_hda"
vgscan -- checking volume group consistency of "vg_hda"
vgscan -- checking existence of "/etc/lvmtab.d"
[...]


Strange, it isn't it? I've a link between /dev/hdc and /dev/cdrom =20
does it play a role?

Thanks
--=20
Nowicki Christophe                                 =20
EPITECH Promo 2006                                =20
http://etudiant.epita.fr/~nowick_c/                =20

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA+vlU3jtE0lRnlNoRAupLAKCW6UHKSK5kbPYm8I43qLWZ7ZsbxQCePfYo
1HFssaUi0TxaYEZY8J73H6c=
=DG7I
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
