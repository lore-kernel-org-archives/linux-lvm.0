Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6JCTKxv023745
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 08:29:20 -0400
Received: from cst-systemhaus.de (cst-systemhaus.de [212.227.82.111])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6JCTDmT010208
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 08:29:14 -0400
Received: from localhost (localhost [127.0.0.1])
	by cst-systemhaus.de (Postfix) with ESMTP id 436217819286
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 14:29:57 +0200 (CEST)
Received: from cst-systemhaus.de ([127.0.0.1])
	by localhost (cst-systemhaus.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26326-05 for <linux-lvm@redhat.com>;
	Wed, 19 Jul 2006 14:29:54 +0200 (CEST)
Received: from cst-it.dyndns.org (p54A7A756.dip0.t-ipconnect.de
	[84.167.167.86])
	by cst-systemhaus.de (Postfix) with ESMTP id 166FF7817347
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 14:29:54 +0200 (CEST)
Received: from ubuntu (ubuntu [192.168.100.233])
	by cst-it.dyndns.org (Postfix) with ESMTP id B52F21C40A2E
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 14:28:41 +0200 (CEST)
Subject: Re: [linux-lvm] compatibility between RAID and LVM
From: Denny Schierz <cuall@gmx.de>
In-Reply-To: <20060719081521.31156.qmail@web26610.mail.ukl.yahoo.com>
References: <20060719081521.31156.qmail@web26610.mail.ukl.yahoo.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-x6gm2kLc56PCYnyLrP6c"
Date: Wed, 19 Jul 2006 14:29:05 +0200
Message-Id: <1153312145.5156.16.camel@localhost.localdomain>
Mime-Version: 1.0
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


--=-x6gm2kLc56PCYnyLrP6c
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

hi,

Am Mittwoch, den 19.07.2006, 08:15 +0000 schrieb ramsis farhat:

> I'm trying to use RAID and LVM for an UNIX server, and I don't know what =
type of file system I should choose.
> Also, I don't know if LVM is compatible whith any type of RAID.

google has a lot of examples with mdraid and lvm. I use it it too since
a few month without any problems. I had only a problem with a bug in
2.6.16 and lvm snapshots.

So, i'm sure that you have also success to get md and lvm running too.

cu denny

--=20
Sicherheit verst=E4ndlich http://www.sides.de
GnuPG Key
http://pgpkeys.pca.dfn.de:11371/pks/lookup?op=3Dget&search=3D0x2A5CE192AB7D=
3FE0

--=-x6gm2kLc56PCYnyLrP6c
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEviWRKlzhkqt9P+ARAvlTAJ9LbrDJQ2VxTjj8S3OKFyI0b0qqrgCeNdg6
2+ezlURyZ8MamtV/xcIaENw=
=KwrS
-----END PGP SIGNATURE-----

--=-x6gm2kLc56PCYnyLrP6c--
