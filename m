Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0U9PxO12107
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 04:25:59 -0500
Received: from smtp8.wanadoo.fr (smtp8.wanadoo.fr [193.252.22.23])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0U9Pv4S032237
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 04:25:58 -0500
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0801.wanadoo.fr (SMTP Server) with ESMTP id 4607F18000A4
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 10:25:52 +0100 (CET)
Received: from tangerine-64.coulon.evette
	(ALille-208-1-5-15.w80-15.abo.wanadoo.fr [80.15.105.15])
	by mwinf0801.wanadoo.fr (SMTP Server) with ESMTP id 04CA218000A1
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 10:25:52 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine-64.coulon.evette with esmtp (Exim 4.44)
	id 1CvBL5-0006Ji-GH
	for linux-lvm@redhat.com; Sun, 30 Jan 2005 10:25:51 +0100
Received: from tangerine-64.coulon.evette ([127.0.0.1])
	by localhost (tangerine-64 [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23992-09 for <linux-lvm@redhat.com>;
	Sun, 30 Jan 2005 10:25:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine-64)
	by tangerine-64.coulon.evette with esmtp (Exim 4.44)
	id 1CvBKx-0006J7-MP
	for linux-lvm@redhat.com; Sun, 30 Jan 2005 10:25:43 +0100
Date: Sun, 30 Jan 2005 09:25:43 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] converting ext3 / to LVM
References: <006901c5069a$db39b690$4857fea9@desktop>
In-Reply-To: <006901c5069a$db39b690$4857fea9@desktop> (from
	mrz@intelenet.net on Sun Jan 30 08:10:52 2005)
Message-Id: <1107077143l.22995l.0l@tangerine-64>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-8IA4nvBwxNATjNg2/T3x"
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
To: linux-lvm@redhat.com

--=-8IA4nvBwxNATjNg2/T3x
Content-Type: text/plain; charset=ISO-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 30.01.2005 08:10:52, matthew zeier a =E9crit=A0:
>=20
> Are there any tips on converting an existing ext3 / to LVM?  I found =20
> something that talks about ext2 using LVM1 but I'm not sure if that =20
> applies to my system (RHEL ES v3).

LVM is not a filestem and is not aware of the filesystem you will =20
install on it.

I've installed xfs filesystem over lvm with the same instructions as =20
for ext2.

Only the tolls to resize the ilesystem are different.
Some filesystems needs to be mounted, other to be unmounted.
i.e: you can reeeeize an xfs only if t is mounted and you cannot =20
schrink it, only growing is avalable.

>=20
> --
> matthew zeier

Jean-Luc

--=-8IA4nvBwxNATjNg2/T3x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBB/KgXUdGGXzzGnNARAsj8AKCKJ8Wy1t9COCMViUOFEWMmnWIJzwCeObQN
KNCDNgmxcjUFRykGKviVS2g=
=um98
-----END PGP SIGNATURE-----

--=-8IA4nvBwxNATjNg2/T3x--
