Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5UC618H026280
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2009 08:06:01 -0400
Received: from orion.eta-ori.net (eta-ori.net [91.121.142.51])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5UC5jIs023733
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2009 08:05:45 -0400
Received: from [IPv6:2a01:198:229:0:217:31ff:fe81:8c8] (unknown
	[IPv6:2a01:198:229:0:217:31ff:fe81:8c8])
	by orion.eta-ori.net (Postfix) with ESMTPSA id E922C23573
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2009 14:05:43 +0200 (CEST)
Message-ID: <4A49FF86.50902@impulze.org>
Date: Tue, 30 Jun 2009 14:05:26 +0200
From: Daniel Mierswa <impulze@impulze.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] S.I. and consistent units
References: <4A46366C.2000607@impulze.org>
	<4A47F129.7040701@impulze.org>	<20090629055011.GA14031@maude.comedia.it>	<4A48880E.3060703@impulze.org>
	<20090630111832.GB20848@agk-dp.fab.redhat.com>
In-Reply-To: <20090630111832.GB20848@agk-dp.fab.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig5CAA8D932A8995B9B39818EB"
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
--------------enig5CAA8D932A8995B9B39818EB
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Alasdair G Kergon wrote:
> Firstly, any *functional* changes in the patch need to be identified:
> If, given identical data, any code reads in or writes out a different n=
umber as
> a result of the patch we need to consider implications carefully and
> document that change in release notes.
Agreed. I was just initially wondering if there is any kind of interest
in that separation at all. What exactly do you want me to identify now?
Do you want me to document the source where functional changes happen,
write a summary and attach it to the source or mail? I'm not aware of my
task for this. :P

> Secondly, in the man pages, where we list the units, it would be helpfu=
l to
> add a sentence each time to explain the difference between MB and MiB, =
in
> terms of multiples of 1000 vs multiples of 1024.
Yes, When writing I always thought that a single place describing the
units makes much more sence than to repeat it over and over again. I
will definitely fix this once I know what to identify (see above).

> Perhaps lvm.8 could have a paragraph about how LVM2 uses units
> throughout incl.  an external reference to something like
> http://physics.nist.gov/cuu/Units/binary.html (or the original standard=

> if you can track that down).
Agreed aswell. The standard is ISO and not available for public viewing
online (ISO 80000). I bet we can find right prashing ourselves. :D

--=20
Mierswa, Daniel

If you still don't like it, that's ok: that's why I'm boss. I simply
know better than you do.
               --- Linus Torvalds, comp.os.linux.advocacy, 1996/07/22


--------------enig5CAA8D932A8995B9B39818EB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEARECAAYFAkpJ/40ACgkQm9l44K3zL5eVDwCfc1GoD0zq+mMWrGwTWpamLIW0
3yMAnjDuyU8o9jdRn2W3SdggiFIpsxDP
=7epg
-----END PGP SIGNATURE-----

--------------enig5CAA8D932A8995B9B39818EB--
