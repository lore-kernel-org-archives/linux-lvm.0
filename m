Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6C9bo90029716
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 05:37:50 -0400
Received: from cst-systemhaus.de (cst-systemhaus.de [212.227.82.111])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6C9bh1n015453
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 05:37:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by cst-systemhaus.de (Postfix) with ESMTP id EA0997816A4B
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 11:37:45 +0200 (CEST)
Received: from cst-systemhaus.de ([127.0.0.1])
	by localhost (cst-systemhaus.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17096-09 for <linux-lvm@redhat.com>;
	Wed, 12 Jul 2006 11:37:42 +0200 (CEST)
Received: from cst-it.dyndns.org (p54A79109.dip0.t-ipconnect.de [84.167.145.9])
	by cst-systemhaus.de (Postfix) with ESMTP id 6D87A7819289
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 11:37:42 +0200 (CEST)
Received: from ubuntu (ubuntu [192.168.100.233])
	by cst-it.dyndns.org (Postfix) with ESMTP id 77CDF4DE81
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 11:24:25 +0200 (CEST)
From: Denny Schierz <cuall@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-sY7pieJEDIAu0427GLPc"
Date: Wed, 12 Jul 2006 11:37:34 +0200
Message-Id: <1152697054.5934.3.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [linux-lvm] Whats happens? -> remove first phy disk from lvm
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


--=-sY7pieJEDIAu0427GLPc
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

hi,

i created a lvm volume over two partitions, hda8 and hdc8. Now hda8 is
broken and have to replace the disk.=20

on the lvm where several files. My questions, if i create a volume over
more than one partition, is that a stipe? Or does lvm use the first
partition, than the second?

cu denny


--=20
Sicherheit verst=E4ndlich http://www.sides.de
GnuPG Key
http://pgpkeys.pca.dfn.de:11371/pks/lookup?op=3Dget&search=3D0x2A5CE192AB7D=
3FE0

--=-sY7pieJEDIAu0427GLPc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEtMLeKlzhkqt9P+ARAq13AJ0e5KV6FOxq7sHXEMGYnBnF4pfInQCfXenL
VnAXqbyqsgTG9Z7Fe+dWB8U=
=bvj1
-----END PGP SIGNATURE-----

--=-sY7pieJEDIAu0427GLPc--
