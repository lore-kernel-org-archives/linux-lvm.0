Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7KIHSV08676
	for <linux-lvm@redhat.com>; Sat, 20 Aug 2005 14:17:28 -0400
Received: from natsmtp00.rzone.de (natsmtp00.rzone.de [81.169.145.165])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7KIHJ8A014282
	for <linux-lvm@redhat.com>; Sat, 20 Aug 2005 14:17:23 -0400
Received: from micha-mobile (p5086EB21.dip.t-dialin.net [80.134.235.33])
	by post.webmailer.de (8.13.1/8.13.1) with ESMTP id j7KIH82q001689
	for <linux-lvm@redhat.com>; Sat, 20 Aug 2005 20:17:15 +0200 (MEST)
From: mailinglist@krausam.de
Date: Sat, 20 Aug 2005 21:16:56 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6511520.qVuvnAe1oB";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200508202117.05941.mailinglist@krausam.de>
Subject: [linux-lvm] Onbord-raid problem
Reply-To: micha@krausam.de,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--nextPart6511520.qVuvnAe1oB
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I try to install Gentoo on my Asus A7N8X, I used this:=20
http://tienstra4.flatnet.tudelft.nl/~gerte/gen2dmraid/
for help, because I want to use my on-bord "Bios Raid".

Problem:

# fdisk -l /dev/mapper/sil_afaidcaafaci

Disk /dev/mapper/sil_afaidcaafaci: 240.0 GB, 240065101824 bytes
255 heads, 63 sectors/track, 29186 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes

                       Device Boot      Start         End      Blocks   Id =
 System
/dev/mapper/sil_afaidcaafaci1   *           1        1305    10482381    7 =
HPFS/NTFS
/dev/mapper/sil_afaidcaafaci2            1306       27426   209816932+   f =
 W95 Ext'd (LBA)
/dev/mapper/sil_afaidcaafaci3           27427       29186    14137200   8e =
 Linux LVM
/dev/mapper/sil_afaidcaafaci5            1306       27413   209712478+   7 =
 HPFS/NTFS
/dev/mapper/sil_afaidcaafaci6           27414       27426      104391   83 =
 Linux

# pvcreate /dev/mapper/sil_afaidcaafaci3 -vv
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
      Locking /var/lock/lvm/P_orphans WB
      Unlocking /var/lock/lvm/P_orphans
    Wiping cache of LVM-capable devices
    Wiping internal VG cache
      Locking /var/lock/lvm/P_orphans WB
  Device /dev/mapper/sil_afaidcaafaci3 not found.
      Unlocking /var/lock/lvm/P_orphans

=2D-=20
Micha Krause

Jabber:	SMS-King@jabber.org
Email:	Micha@krausam.de

--nextPart6511520.qVuvnAe1oB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDB4GxfAR45tA28LgRAoMPAJ4kheUPMu/W4eyjd0VLQ6adwnZ91ACcCVqk
3BcMeEXS6Mem3Go4Uj59F7w=
=zx9g
-----END PGP SIGNATURE-----

--nextPart6511520.qVuvnAe1oB--
