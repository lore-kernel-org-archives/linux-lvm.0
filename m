Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5RFAuoj024998
	for <linux-lvm@redhat.com>; Sat, 27 Jun 2009 11:10:56 -0400
Received: from orion.eta-ori.net (eta-ori.net [91.121.142.51])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5RFAhXH010932
	for <linux-lvm@redhat.com>; Sat, 27 Jun 2009 11:10:43 -0400
Received: from [IPv6:2a01:198:229:0:217:31ff:fe81:8c8]
	(istari.fallback.kleinerfeigling.org
	[IPv6:2a01:198:229:0:217:31ff:fe81:8c8])
	by orion.eta-ori.net (Postfix) with ESMTPSA id 89CDB240BE
	for <linux-lvm@redhat.com>; Sat, 27 Jun 2009 17:10:42 +0200 (CEST)
Message-ID: <4A46366C.2000607@impulze.org>
Date: Sat, 27 Jun 2009 17:10:36 +0200
From: Daniel Mierswa <impulze@impulze.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig538890232E58BB8C30937EC6"
Subject: [linux-lvm] S.I. and consistent units
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig538890232E58BB8C30937EC6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Has anyone been working on the consistency problem in LVM wrt units
lately (http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D306200)? If no=
t
i'm willing to come up with a patch that attempts to fix those
consistency issues, if patches are welcome.

--=20
Mierswa, Daniel

If you still don't like it, that's ok: that's why I'm boss. I simply
know better than you do.
               --- Linus Torvalds, comp.os.linux.advocacy, 1996/07/22


--------------enig538890232E58BB8C30937EC6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEARECAAYFAkpGNnEACgkQm9l44K3zL5fHYACcCi4xDIx7g0/VYxG1Vs7apoko
FxcAnj5OZxa1dHQe48/HnuiOHgqGfuvn
=882B
-----END PGP SIGNATURE-----

--------------enig538890232E58BB8C30937EC6--
