Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i3UD0TV2030783
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 09:00:29 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.12.11/8.12.11) with ESMTP id i3UD0SH8019538
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 08:00:29 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.12.11/8.12.11/Submit) id i3UD0Sjj019537
	for linux-lvm@redhat.com; Fri, 30 Apr 2004 08:00:28 -0500
Date: Fri, 30 Apr 2004 08:00:28 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] FAQ about pvmove
Message-ID: <20040430130028.GA19343@null.msp.redhat.com>
References: <20040430134819.4319d1e9@lano>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20040430134819.4319d1e9@lano>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2004 at 01:48:19PM +0200, Lo'oRiS, BlackMage Kabukimono wro=
te:
> FAQ says this:
>=20
> > If you are using the version of device mapper in 2.6.5 and below, the
> > following commands and LV types are not supported:=20
> >=20
> > pvmove=20
> >=20
> > snapshots=20
>=20
> does it mean that from 2.6.6 they will work?

No - when that was written 2.6.6 was not out (AFAIK) - I guess I need to be
more clear that none of the current 2.6 kernel.org kernels support pvmove or
snapshots.

Regards,
--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414

Current GPG fingerprint =3D FE77 4B43 6A9B F982 A731  02FA 2BF5 7574 294A A=
A5A
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
-----Begin Obligatory Humorous Quote----------------------------------------
A morning without coffee is like something without something else.
-----End Obligatory Humorous Quote------------------------------------------

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAkk3r9QxUqFeMhxURApV2AKCUkKJidJMoVuLTjPc3r8MWgEQhOACgjB91
02YdGmuOVMQ7mBjHVIUBtdw=
=7ZAY
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
