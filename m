Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7BAgPa11188
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 06:42:25 -0400
Received: from websrv.werbeagentur-aufwind.de (websrv.werbeagentur-aufwind.de
	[213.239.197.241])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i7BAgIXn012255
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 06:42:18 -0400
Subject: Re: [linux-lvm] device-mapper: : dm-linear: Device lookup failed
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20040811011709.GK21230@chaos.ao.net>
References: <20040811011709.GK21230@chaos.ao.net>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-s8rg/WkSotqqK+zaFigW"
Date: Wed, 11 Aug 2004 12:42:09 +0200
Message-Id: <1092220929.11356.0.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Dan Merillat <dmerillat@sequiam.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>


--=-s8rg/WkSotqqK+zaFigW
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 10.08.2004, 21:17 -0400 schrieb Dan Merillat:

> I can't use my CD-rom as a device-mapper target, is this intended?
>=20
> "0 2048 linear /dev/hda1 0" works, "0 2048 linear /dev/hdc 0" does not.

You have to explicitly create a read-only mapping using -r.


--=-s8rg/WkSotqqK+zaFigW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBGfgAZCYBcts5dM0RAmEgAKCoVjC2iBtzof+W6wL4hWVRDDjYoQCdGyBh
f3KUgS2ICpXZSZgQb2q+Xlo=
=lEu3
-----END PGP SIGNATURE-----

--=-s8rg/WkSotqqK+zaFigW--
