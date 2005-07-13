Received: from null.msp.redhat.com (null.msp.redhat.com [10.15.80.136])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j6DDngsC012649
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 09:49:42 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.13.4/8.12.11) with ESMTP id j6DDng3B015218
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 08:49:42 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.13.4/8.13.4/Submit) id j6DDngwi015217
	for linux-lvm@redhat.com; Wed, 13 Jul 2005 08:49:42 -0500
Date: Wed, 13 Jul 2005 08:49:42 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] pvcreate prblem
Message-ID: <20050713134942.GB14421@null.msp.redhat.com>
References: <1121258369.13309.29.camel@fortocent.comodo.net>
	<42D51683.7060106@berbee.com>
	<1121262411.14004.1.camel@fortocent.comodo.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline
In-Reply-To: <1121262411.14004.1.camel@fortocent.comodo.net>
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


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2005 at 07:16:51PM +0530, susmitha wrote:
> Hi,
>=20
> "fdisk -l " is showing correctly
> I mean showing those partitions.
> But I didn't get why it came.
> Ok I will try by rebooting.
>=20
> Thanks for immediate reply :)

If the partitin table went into effect, you probably just needed a vgscan to
pick up the new partitions.  Rebooting works too though.  ;)

Regards,=20
--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat                                    E-Mail: alewis@redhat.com
One Main Street SE, Suite 209
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC1Rv29QxUqFeMhxURAgucAKCGjew2C3t8eU8o4B3HLE5WgKGkdwCfTU1C
qKgaA55VW+lX3+iYGeuDuYw=
=Ydiz
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
