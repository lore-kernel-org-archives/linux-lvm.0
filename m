Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s148ts6q009445
	for <linux-lvm@redhat.com>; Tue, 4 Feb 2014 03:55:54 -0500
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [80.190.48.209])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s148tpoh030365
	for <linux-lvm@redhat.com>; Tue, 4 Feb 2014 03:55:52 -0500
Received: from leda.localdomain (unknown [10.10.1.2])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id E167E11FC123
	for <linux-lvm@redhat.com>; Tue,  4 Feb 2014 09:55:50 +0100 (CET)
Date: Tue, 4 Feb 2014 09:55:44 +0100
From: Christian Hesse <list@eworm.de>
Message-ID: <20140204095544.65cad0f2@leda.localdomain>
In-Reply-To: <20140123142700.315e2d3f@leda.localdomain>
References: <20140123142700.315e2d3f@leda.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/J_G5nx9Ivd5Da+L2TOik4Ow";
	protocol="application/pgp-signature"
Subject: Re: [linux-lvm] lvm2 2.02.105 breaks snapshots
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--Sig_/J_G5nx9Ivd5Da+L2TOik4Ow
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Christian Hesse <list@eworm.de> on Thu, 2014/01/23 14:27:
> Hello everybody,
>=20
> looks like lvm2 2.02.105 breaks snapshots. This is my block device tree:
>=20
> NAME                MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
> sda                   8:0    0   477G  0 disk
> |-sda1                8:1    0   767M  0 part
> | `-vg0-boot        254:0    0    64M  0 lvm   /boot
> |-sda2                8:2    0 444,2G  0 part
> | `-cvg             254:3    0 444,2G  0 crypt
> |   |-cvg-root      254:4    0    40G  0 lvm   /
> |   |-cvg-swap      254:5    0     4G  0 lvm   [SWAP]
> |   |-cvg-log       254:6    0     1G  0 lvm   /var/log
> |   `-cvg-home      254:8    0   320G  0 lvm   /home
> |-sda3                8:3    0    32G  0 part
> `-sda128            259:0    0     1M  0 part
>=20
> Creating a snapshot succeeds, but it is broken and can not be mounted:
>=20
> # lvcreate -s -pr -l50%free -n snap-home cvg/home
>   Logical volume "snap-home" created
> # mount /dev/cvg/snap-home /mnt/tmp=20
> mount: /dev/mapper/cvg-snap--home is write-protected, mounting read-only
> mount: wrong fs type, bad option, bad superblock on
> /dev/mapper/cvg-snap--home, missing codepage or helper program, or other
> error
>=20
> Syslog has a lot of these messages:
>=20
> [ 4823.002220] EXT4-fs (dm-7): ext4_check_descriptors: Checksum for group
> 256 failed (43470!=3D57954)
>=20
> Downgrading to lvm2 2.02.104 fixes the problem:
>=20
> # lvcreate -s -pr -l50%free -n snap-home
> cvg/home Logical volume "snap-home" created
> # mount /dev/cvg/snap-home /mnt/tmp
> mount: /dev/mapper/cvg-snap--home is write-protected, mounting read-only
>=20
> This is an Arch Linux system with Linux 3.12.8.

Hello everybody,

did anybody notice my mail? This is a real regression for me and I would li=
ke
to get this sorted. I will help with whatever is needed to find the problem.
--=20
main(a){char*c=3D/*    Best regards,                           */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/J_G5nx9Ivd5Da+L2TOik4Ow
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJS8KsWAAoJEIlFIdfMgPR2QEEH+gI8UMZI5ygjGMJSDDrKTo9K
p5E/ck8FxBkxmU+Mj6BBKj852zID7qWmnnbK4ee8Ylkjrn7+/SfCai7q6Jj1i7Og
BiT7JBjVJ7fStE2dv58emtosQ/D8MzWUlKZ+mMTG1G2wl9L0QbK45XgrKpXAWB0X
tSbE/5GXVBWAYXKVzrxphAHc4py+BQEG3xGMQRrEledI34orAMKIbIOmKO2BxWed
VUpmJ14J9KPW1mIAOwTu5txNyYemRQ+zzhspQKfzW8vMNT9+gsmuhJP8TgtbGJq5
NpcE288JxIuoAPoJcQCdLNuJpkex+pnYQK/yarUTKHl29Sy2Cr3XgmWpc2W1Z+Y=
=ertO
-----END PGP SIGNATURE-----

--Sig_/J_G5nx9Ivd5Da+L2TOik4Ow--
