Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6JCPEfa022843
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 08:25:14 -0400
Received: from cst-systemhaus.de (cst-systemhaus.de [212.227.82.111])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6JCPDMh008135
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 08:25:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by cst-systemhaus.de (Postfix) with ESMTP id 7DA7C7819286
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 14:25:56 +0200 (CEST)
Received: from cst-systemhaus.de ([127.0.0.1])
	by localhost (cst-systemhaus.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26326-01 for <linux-lvm@redhat.com>;
	Wed, 19 Jul 2006 14:25:53 +0200 (CEST)
Received: from cst-it.dyndns.org (p54A7A756.dip0.t-ipconnect.de
	[84.167.167.86])
	by cst-systemhaus.de (Postfix) with ESMTP id 103377817347
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 14:25:53 +0200 (CEST)
Received: from ubuntu (ubuntu [192.168.100.233])
	by cst-it.dyndns.org (Postfix) with ESMTP id 04C651C40A2E
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 14:24:40 +0200 (CEST)
Subject: RE: [linux-lvm] Error setting up a mirrored lv
From: Denny Schierz <cuall@gmx.de>
In-Reply-To: <D81E5F9261AA644D90FF7B8E400588173C6FB2@PDBEX02E.pdb.fsc.net>
References: <D81E5F9261AA644D90FF7B8E400588173C6FB2@PDBEX02E.pdb.fsc.net>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-twaimw0q2RP55/K8n2VE"
Date: Wed, 19 Jul 2006 14:25:04 +0200
Message-Id: <1153311905.5156.11.camel@localhost.localdomain>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-twaimw0q2RP55/K8n2VE
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

hi,

Am Mittwoch, den 19.07.2006, 12:15 +0200 schrieb Laurenz, Dirk:
> so, what is the best way to mirror storage?
>=20
> lvm ontop of multipath and mirrored lvs or
> lvm ontop of md ontop of multipath

in most cases i prefer lvm ontop of md devices, cause for better
handling and it works with every setup and distribution.

cu denny

--=20
Sicherheit verst=E4ndlich http://www.sides.de
GnuPG Key
http://pgpkeys.pca.dfn.de:11371/pks/lookup?op=3Dget&search=3D0x2A5CE192AB7D=
3FE0

--=-twaimw0q2RP55/K8n2VE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEviSgKlzhkqt9P+ARAmcoAJ9IiDRcWOX6AioVIVAlKMubGnv+vQCfRW1P
xJ78LyyLN8xviXKb8jNr7Zw=
=r2a2
-----END PGP SIGNATURE-----

--=-twaimw0q2RP55/K8n2VE--
