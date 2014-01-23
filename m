Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0NDRALi024748
	for <linux-lvm@redhat.com>; Thu, 23 Jan 2014 08:27:11 -0500
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [80.190.48.209])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0NDR6aN026209
	for <linux-lvm@redhat.com>; Thu, 23 Jan 2014 08:27:07 -0500
Received: from leda.localdomain (unknown [10.10.1.2])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id 0668911FC0B6
	for <linux-lvm@redhat.com>; Thu, 23 Jan 2014 14:27:06 +0100 (CET)
Date: Thu, 23 Jan 2014 14:27:00 +0100
From: Christian Hesse <list@eworm.de>
Message-ID: <20140123142700.315e2d3f@leda.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/oVB_Yhnn8LaRVIJrnEExkxc";
	protocol="application/pgp-signature"
Subject: [linux-lvm] lvm2 2.02.105 breaks snapshots
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
To: linux-lvm@redhat.com

--Sig_/oVB_Yhnn8LaRVIJrnEExkxc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello everybody,

looks like lvm2 2.02.105 breaks snapshots. This is my block device tree:

NAME                MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
sda                   8:0    0   477G  0 disk
|-sda1                8:1    0   767M  0 part
| `-vg0-boot        254:0    0    64M  0 lvm   /boot
|-sda2                8:2    0 444,2G  0 part
| `-cvg             254:3    0 444,2G  0 crypt
|   |-cvg-root      254:4    0    40G  0 lvm   /
|   |-cvg-swap      254:5    0     4G  0 lvm   [SWAP]
|   |-cvg-log       254:6    0     1G  0 lvm   /var/log
|   `-cvg-home      254:8    0   320G  0 lvm   /home
|-sda3                8:3    0    32G  0 part
`-sda128            259:0    0     1M  0 part

Creating a snapshot succeeds, but it is broken and can not be mounted:

# lvcreate -s -pr -l50%free -n snap-home cvg/home
  Logical volume "snap-home" created
# mount /dev/cvg/snap-home /mnt/tmp=20
mount: /dev/mapper/cvg-snap--home is write-protected, mounting read-only
mount: wrong fs type, bad option, bad superblock on
/dev/mapper/cvg-snap--home, missing codepage or helper program, or other er=
ror

Syslog has a lot of these messages:

[ 4823.002220] EXT4-fs (dm-7): ext4_check_descriptors: Checksum for group 2=
56
failed (43470!=3D57954)

Downgrading to lvm2 2.02.104 fixes the problem:

# lvcreate -s -pr -l50%free -n snap-home
cvg/home Logical volume "snap-home" created
# mount /dev/cvg/snap-home /mnt/tmp
mount: /dev/mapper/cvg-snap--home is write-protected, mounting read-only

This is an Arch Linux system with Linux 3.12.8.
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/oVB_Yhnn8LaRVIJrnEExkxc
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJS4RipAAoJEIlFIdfMgPR2F7EIAIbve2IIPEBE0P7MxvuZpwzv
kTX27OiG5L1ETk+PF3mjEav/0f5dEU2e+LJ2tVba+td4vvmlvoFEv4Rim8IwccUq
vtco6bXprd+Vcvt7gnORMbJLLK3cQRl/AAtgdQYlB5Ji4BNUezUQsifzZlfPumao
3Q0yBWAA0PLPQ8L588ZAJDXKbGbdKTGJgO3mUSE3YHlvqFTOte37FMywgrjYVwuD
WP7g+1iDhRCghXb/VHCBmFvJu9im9ltolTN6FFbdn3sY16XDwqLRkGNhg8mFHgqg
lZ/zhBt/gIQpyXMDSVH3wXiQoOm2w7L6mfgIcqJq25iPym4mUT9pznV6+c4k7mk=
=NiUI
-----END PGP SIGNATURE-----

--Sig_/oVB_Yhnn8LaRVIJrnEExkxc--
