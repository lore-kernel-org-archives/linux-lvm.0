Received: from null.msp.redhat.com (null.msp.redhat.com [10.15.80.136])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j5KFjoq9003815
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 11:45:50 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.13.4/8.12.11) with ESMTP id j5KFjnnY032235
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 10:45:50 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.13.4/8.13.4/Submit) id j5KFjnIw032233
	for linux-lvm@redhat.com; Mon, 20 Jun 2005 10:45:49 -0500
Date: Mon, 20 Jun 2005 10:45:49 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] Is LVM safe?
Message-ID: <20050620154549.GD12491@null.msp.redhat.com>
References: <1119268975.25392.34.camel@volt>
	<200506201517.01268.krienke@uni-koblenz.de>
	<1119275366.25392.48.camel@volt>
	<d45c7b521930741fc78fef25d061f74b@anderedomain.de>
	<20050620144233.GB12491@null.msp.redhat.com>
	<1119279649.18965.24.camel@volt>
	<20050620151211.GC12491@null.msp.redhat.com>
	<1119281255.18965.29.camel@volt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Content-Disposition: inline
In-Reply-To: <1119281255.18965.29.camel@volt>
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


--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2005 at 04:27:35PM +0100, John Rowe wrote:
>=20
> > =20
> > > The idea that a disk partition needs Unix file to be able to read it =
is
> > > absolutely astonishing.
> >=20
> > What?
>=20
> I'm getting two different answers here. One person says I don't
> need /etc/lvm.*, the other says I do!

Ok, so the only time you *need* /etc/lvm/* is if you have to recover from b=
ad
metadata.  Every PV in your VG has a complete copy of the metadata for that
VG, so you have multiple copies of the layout - if you have one of these, y=
ou
can recover your LVM setup.
=20
> FWIW, I'm running Linux version 2.6.9-5.0.5.EL having 'upgraded' from
> RedHat9 to Scientific Linux 4 (a RedHat Enterprise clone), and I can't
> see my LVM..

Seeing the output of 'vgscan -vvv' and 'vgchange -ay -vvv' would be helpful=
 -
maybe you could toss it up on pastebin.com?
=20
> Of course I have backups but it worries me for the future.

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


--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCtuSt9QxUqFeMhxURAlBkAJ0USsVQp77GeSz05ERbEnhvQWljewCbBRtv
KzsqCVBU6gsD6jcOHfKdYLw=
=Hsq2
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--
