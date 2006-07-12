Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6CG1Zki030512
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 12:01:35 -0400
Received: from cst-systemhaus.de (cst-systemhaus.de [212.227.82.111])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6CG1YCA030326
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 12:01:34 -0400
Received: from localhost (localhost [127.0.0.1])
	by cst-systemhaus.de (Postfix) with ESMTP id 1186D7816A4B
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 18:01:39 +0200 (CEST)
Received: from cst-systemhaus.de ([127.0.0.1])
	by localhost (cst-systemhaus.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24497-07 for <linux-lvm@redhat.com>;
	Wed, 12 Jul 2006 18:01:35 +0200 (CEST)
Received: from cst-it.dyndns.org (p54A78B29.dip0.t-ipconnect.de
	[84.167.139.41])
	by cst-systemhaus.de (Postfix) with ESMTP id A41AE7817347
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 18:01:35 +0200 (CEST)
Received: from ubuntu (ubuntu [192.168.100.233])
	by cst-it.dyndns.org (Postfix) with ESMTP id AA8414DD29
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 17:48:16 +0200 (CEST)
From: Denny Schierz <cuall@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-6pyAVb51zqNaoWc5KgXY"
Date: Wed, 12 Jul 2006 18:01:27 +0200
Message-Id: <1152720087.12966.18.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [linux-lvm] cryptsetup
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


--=-6pyAVb51zqNaoWc5KgXY
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

hi,

i try to encrypt logical volumes, but it seems, that it doesn't work.
Can i use only real partitions?

I have several virtual hosts with Xen and every hosts has it own data
and swap volume. For example:

ACTIVE            '/dev/daten/vhost1_swap' [500.00 MB] inherit
ACTIVE            '/dev/daten/vhost2_swap' [500.00 MB] inherit
ACTIVE            '/dev/daten/vhost3_swap' [500.00 MB] inherit
ACTIVE            '/dev/daten/vhost4_swap' [500.00 MB] inherit
ACTIVE            '/dev/daten/irc_swap' [500.00 MB] inherit
ACTIVE            '/dev/daten/mx_swap' [500.00 MB] inherit
ACTIVE            '/dev/daten/vhost4_daten' [100.00 GB] inherit

PV /dev/hda8   VG daten        lvm2 [92.58 GB / 0    free]
PV /dev/hdc8   VG daten        lvm2 [92.58 GB / 82.23 GB free]


I these example, i want to crypt /dev/daten/vhost4_daten:

root@xendom0:~# cryptsetup -y create data /dev/daten/vhost4_daten
Command failed: Invalid argument

So, what for options i have?

cu denny

--=20
Sicherheit verst=E4ndlich http://www.sides.de
GnuPG Key
http://pgpkeys.pca.dfn.de:11371/pks/lookup?op=3Dget&search=3D0x2A5CE192AB7D=
3FE0

--=-6pyAVb51zqNaoWc5KgXY
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEtRzXKlzhkqt9P+ARAtHGAJ9AvBheQhZ9oPQrGCZYR3394+JWbQCffH88
ulxb4lpXMoU0eE88n9bfB30=
=teRc
-----END PGP SIGNATURE-----

--=-6pyAVb51zqNaoWc5KgXY--
