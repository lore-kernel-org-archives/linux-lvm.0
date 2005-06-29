Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5TGH1u25835
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 12:17:01 -0400
Received: from ofb3.ofb.net (h34-aclarke.sv.meer.net [205.217.153.34])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5TGGuT0011238
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 12:17:00 -0400
Date: Wed, 29 Jun 2005 09:16:52 -0700
From: Jason Heiss <jheiss-lvm@ofb.net>
Subject: Re: [linux-lvm] Export an LV?
Message-ID: <20050629161652.GB16989@ofb.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline
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


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stefan Paletta wrote:
>=20
> Jason Heiss wrote:
> > Is there a way to do this?  (I'm guessing no, but thought I'd check.)
>=20
> vgsplit
>=20

Thanks, that worked perfectly.

Jason

--=20
Jason Heiss
PGP key:  http://ofb.net/~jheiss/jheiss.pgp.txt


--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCwsl0myNX8sTTeO0RAmElAJ47aPenkF3k1GGT2y1SYq4CrQKvQwCcCECb
jhLQr9TLfIeooGtxe4qwv6E=
=w6XI
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
