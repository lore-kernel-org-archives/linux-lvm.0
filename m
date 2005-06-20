Received: from null.msp.redhat.com (null.msp.redhat.com [10.15.80.136])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j5KFCBq9029853
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 11:12:12 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.13.4/8.12.11) with ESMTP id j5KFCBkK031622
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 10:12:11 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.13.4/8.13.4/Submit) id j5KFCBQS031621
	for linux-lvm@redhat.com; Mon, 20 Jun 2005 10:12:11 -0500
Date: Mon, 20 Jun 2005 10:12:11 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] Is LVM safe?
Message-ID: <20050620151211.GC12491@null.msp.redhat.com>
References: <1119268975.25392.34.camel@volt>
	<200506201517.01268.krienke@uni-koblenz.de>
	<1119275366.25392.48.camel@volt>
	<d45c7b521930741fc78fef25d061f74b@anderedomain.de>
	<20050620144233.GB12491@null.msp.redhat.com>
	<1119279649.18965.24.camel@volt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline
In-Reply-To: <1119279649.18965.24.camel@volt>
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


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2005 at 04:00:49PM +0100, John Rowe wrote:
>=20
> > > Yes, it's easy. You just need a kernel with DM-Support and the=20
>=20
> > But this is similar to what
> > happens if the partition table gets busted on a normal disk.
>=20
> So the previous poster's "Yes" actually means "No". And a broken
> partition table will zap a disk with an LVM partition too won't it? So
> the bottom line is that if I want to move an LVM partition to a
> different system I have to hold my breath and pray.=20

No - that should just work.  You just need to have the device-mapper kernel
modules and the lvm2 tools.  Then you do a 'vgscan && vgchange -ay' and it
will be there.
=20
> The idea that a disk partition needs Unix file to be able to read it is
> absolutely astonishing.

What?

--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
One Main Street SE, Suite 209
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCttzL9QxUqFeMhxURAlN9AJ43/xGvjxBRKqwdIk3OGnMPzjwsxQCgkzjc
ZVYH/7z0WK+RVbkV0e8UpIo=
=LiFF
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
