Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6CHOYqW022221
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 13:24:34 -0400
Received: from cst-systemhaus.de (cst-systemhaus.de [212.227.82.111])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6CHOQTV009212
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 13:24:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by cst-systemhaus.de (Postfix) with ESMTP id 405B97816A4B
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 19:24:31 +0200 (CEST)
Received: from cst-systemhaus.de ([127.0.0.1])
	by localhost (cst-systemhaus.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26256-04 for <linux-lvm@redhat.com>;
	Wed, 12 Jul 2006 19:24:28 +0200 (CEST)
Received: from [192.168.3.150] (dslb-084-058-150-218.pools.arcor-ip.net
	[84.58.150.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by cst-systemhaus.de (Postfix) with ESMTP id 452FF7817347
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 19:24:28 +0200 (CEST)
Message-ID: <44B53042.1060303@gmx.de>
Date: Wed, 12 Jul 2006 19:24:18 +0200
From: Denny Schierz <cuall@gmx.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] cryptsetup *SOLVED*
References: <1152720087.12966.18.camel@localhost.localdomain>
In-Reply-To: <1152720087.12966.18.camel@localhost.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig90C0D749F892450EFCCF4151"
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig90C0D749F892450EFCCF4151
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Denny Schierz schrieb:
> hi,
>=20
> i try to encrypt logical volumes, but it seems, that it doesn't work.
> Can i use only real partitions?

it was my fault. I compiled the wrong cryptsetup version without luks
extension. I tried allready the version from breezy and it let me type
the password, but nothing more.

Now i have the static compiled version from here:
http://luks.endorphin.org/ and i was able to create the crypted logical
volume :-)

thanks.


--------------enig90C0D749F892450EFCCF4151
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEtTBFKlzhkqt9P+ARAiFXAJ92CvpZqX0a7uzHe3EdbiW8Sg6a6ACfb9IT
iTH4+x6VLs9go1MraD/OSns=
=OYvz
-----END PGP SIGNATURE-----

--------------enig90C0D749F892450EFCCF4151--
