Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6CA8QBc002755
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 06:08:26 -0400
Received: from cst-systemhaus.de (cst-systemhaus.de [212.227.82.111])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6CA8ItN023059
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 06:08:19 -0400
Received: from localhost (localhost [127.0.0.1])
	by cst-systemhaus.de (Postfix) with ESMTP id 055C07816A4B
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 12:08:22 +0200 (CEST)
Received: from cst-systemhaus.de ([127.0.0.1])
	by localhost (cst-systemhaus.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17786-06 for <linux-lvm@redhat.com>;
	Wed, 12 Jul 2006 12:08:19 +0200 (CEST)
Received: from cst-it.dyndns.org (p54A79109.dip0.t-ipconnect.de [84.167.145.9])
	by cst-systemhaus.de (Postfix) with ESMTP id 159057817347
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 12:08:19 +0200 (CEST)
Received: from ubuntu (ubuntu [192.168.100.233])
	by cst-it.dyndns.org (Postfix) with ESMTP id 4138F4DDC1
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 11:55:02 +0200 (CEST)
Subject: Re: [linux-lvm] Whats happens? -> remove first phy disk from lvm
From: Denny Schierz <cuall@gmx.de>
In-Reply-To: <44B4C52B.7080000@redhat.com>
References: <1152697054.5934.3.camel@localhost.localdomain>
	<44B4C52B.7080000@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-QS6jJDDoRDyTYDixw3g1"
Date: Wed, 12 Jul 2006 12:08:11 +0200
Message-Id: <1152698891.12966.4.camel@localhost.localdomain>
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


--=-QS6jJDDoRDyTYDixw3g1
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

hi,

Am Mittwoch, den 12.07.2006, 10:47 +0100 schrieb Patrick Caulfield:

> Depending on the filesystem (and luck) you might get some files back off =
the
> remaining disk :)

hmm, thanks. It seems, that the files lost, cause i don't expecting,
that these files are on the second disk.

But, keep in mind, is there a way, to reactivate the lvm without loosing
data on hdc8, if i adding hda8 to the lvm?

cu denny

--=20
Sicherheit verst=E4ndlich http://www.sides.de
GnuPG Key
http://pgpkeys.pca.dfn.de:11371/pks/lookup?op=3Dget&search=3D0x2A5CE192AB7D=
3FE0

--=-QS6jJDDoRDyTYDixw3g1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEtMoLKlzhkqt9P+ARAisxAJ0ZQkfSF7z1IaqXDQar+gUggRMstQCgj8HA
QLK0f615ct3RTcKMREqTi34=
=JudY
-----END PGP SIGNATURE-----

--=-QS6jJDDoRDyTYDixw3g1--
