Date: Sun, 29 Oct 2000 06:06:39 -0600
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] Size limits and kernel versions
Message-ID: <20001029060639.A6263@omnifarious.mn.org>
References: <OLEAJMNOEMOMMNEIMMINEEEBCBAA.pswartz@digitalrom.com> <200010270313.e9R3DGU27627@webber.adilger.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <200010270313.e9R3DGU27627@webber.adilger.net>; from adilger@turbolinux.com on Thu, Oct 26, 2000 at 09:13:16PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2000 at 09:13:16PM -0600, Andreas Dilger wrote:
>=20
>> If so, what kernel patch do I use for RedHat 7.0?
>=20
> You can probably use my 2.2 patch at
> ftp://ftp.stelias.com/pub/adilger/ but I haven't tried it on Red Hat.
> I have heard some strange things about RH 7.0 headers and such, so it
> may take a bit of work.  It may even be that RH 7.0 has LVM in it
> already, I don't know.

	The main problem I'd had with RedHat kernels lately has been
that their MD (kernel RAID) modifications don't work well with LVM.  I
just disable MD and it works fine.

	This is with the stock 0.8i kernel patch.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5/BLPG4QeWBeRdS8RAgddAKCgjAl5O4R8eVKwYCAdTSqkaC6xPQCfalra
cCb0qXdzO9iY2176Tm2/heY=
=qj7C
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
