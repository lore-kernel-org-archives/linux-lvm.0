Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j35JtJO16477
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 15:55:19 -0400
Received: from smtpout1.cns.ohiou.edu (smtpout1.cns.ohiou.edu [132.235.51.146])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j35JtDxc003490
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 15:55:13 -0400
Received: from hibbard.research.ohiou.edu (hibbard.research.ohiou.edu
	[132.235.167.185])
	by oak.cats.ohiou.edu (8.13.1/8.13.1) with ESMTP id j35JrwFP2507125
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 15:53:59 -0400 (EDT)
From: Tim Hibbard <hibbard@ohio.edu>
Subject: Re: [linux-lvm] Problems compiling LVM2.2.01.09
Date: Tue, 5 Apr 2005 14:53:55 -0500
References: <200504051055.18460.hibbard@ohio.edu>
	<20050405153549.GA5839@tykepenguin.com>
In-Reply-To: <20050405153549.GA5839@tykepenguin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1809608.RDrVzAHJUK";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200504051553.58509.hibbard@ohio.edu>
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

--nextPart1809608.RDrVzAHJUK
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

That fixed the problem.  Thanks.



On Tuesday 05 April 2005 11:35, Patrick Caulfield wrote:
> On Tue, Apr 05, 2005 at 09:55:15AM -0500, Tim Hibbard wrote:
> > I am trying to compile LVM2.2.01.09 and I am having problems.  I have=20
patched=20
> > kernel-2.4.30 with device-mapper.1.00.21 support.  I now have the kerne=
l=20
> > booted with device manager support.
> >=20
> > When I type 'make install' on LVM2 I get the following errors:
> >=20
>=20
> You need the latest libdevmapper 1.01.x
>=20
>=20
> --=20
>=20
> patrick
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20

=2D-=20
Tim Hibbard
Database/Programmer for
Vice President Of Research
109C RTEC
Ohio University
Athens, Ohio 45701
740.593.0373

******** W A R N I N G ! **************************************
Linux should not be used by those under the influence of MicroSoft.
May cause dizziness or vertigo. Consult your tech support before
using Linux. (note--after using Linux, you may notice extreme
discomfort when using MicroSoft. Discontinue use of MicroSoft.)
************************************** W A R N I N G ! ********

--nextPart1809608.RDrVzAHJUK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iQCVAwUAQlLs1h4Uh8wHoWf/AQKY/gP/am3wV9Iy5qHNiSPaVcfQ2nCCWd7kdKZE
eEdDFtKhoTBGpXm3Vj0GqIRzIVOP78jS4Ac0qLs7Mp6mWYkotJxUw87cnQEYZt/M
SgWxvNSJopm27P9yhZ1Zln0zOJml9Su06dyconG9wSHfJnvctNAOnUXsa+BKQiJK
mQ5uki9sAok=
=sC1p
-----END PGP SIGNATURE-----

--nextPart1809608.RDrVzAHJUK--
