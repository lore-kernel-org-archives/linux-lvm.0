Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i3UDAxV2032267
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 09:11:00 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.12.11/8.12.11) with ESMTP id i3UDAxJA019627
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 08:10:59 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.12.11/8.12.11/Submit) id i3UDAxRI019626
	for linux-lvm@redhat.com; Fri, 30 Apr 2004 08:10:59 -0500
Date: Fri, 30 Apr 2004 08:10:59 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] FAQ about pvmove
Message-ID: <20040430131059.GB19343@null.msp.redhat.com>
References: <20040430134819.4319d1e9@lano>
	<20040430130028.GA19343@null.msp.redhat.com>
	<20040430150352.3d721c91@lano>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline
In-Reply-To: <20040430150352.3d721c91@lano>
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


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2004 at 03:03:52PM +0200, Lo'oRiS, BlackMage Kabukimono wro=
te:
> AJ Lewis <alewis@redhat.com>  ha scritto:
>=20
> > No - when that was written 2.6.6 was not out (AFAIK) - I guess I need t=
o be
> > more clear that none of the current 2.6 kernel.org kernels support pvmo=
ve or
> > snapshots.
>=20
> Ah, ok. What a pity, and... good work :)

But do note that you can grab the latest unstable 2.6 patches from
http://people.sistina.com/~thornber/dm/ and test this before it gets into
the main kernel.org kernel.  Doing so and reporting success/failure will
help us to get it stabilized faster.

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
"In this time of war against Osama bin Laden and the oppressive
Taliban regime, we are thankful that OUR leader isn't the spoiled son
of a powerful politician from a wealthy oil family who is supported by
religious fundamentalists, operates through clandestine organizations,
has no respect for the democratic electoral process, bombs innocents,
and uses war to deny people their civil liberties." --The Boondocks
-----End Obligatory Humorous Quote------------------------------------------

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAklBi9QxUqFeMhxURApJXAJwLj3oJdWOkhj4L7MUCgeEfGI9ChwCeNrQM
62F4pbCWvzR3WTRFz3bPFEI=
=SGh2
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
