Return-Path: <hopper@omnifarious.mn.org>
Date: Thu, 30 Nov 2000 05:42:21 -0600
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] lvm 0.9 kernel build problems
Message-ID: <20001130054221.A26692@omnifarious.mn.org>
References: <OLEAJMNOEMOMMNEIMMINMENJCBAA.pswartz@digitalrom.com> <20001129211909.C26635@srv.t-online.de> <005c01c05a4d$ee072080$a56cfea9@miguel> <20001130024449.J1381@wookimus.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <20001130024449.J1381@wookimus.net>; from chewie@wookimus.net on Thu, Nov 30, 2000 at 02:44:49AM -0600
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2000 at 02:44:49AM -0600, Chewie wrote:
> On Wed, Nov 29, 2000 at 10:47:09PM +0100, Falcon wrote:
> > You must to change gcc by kgcc in the Makefile
>=20
> <rant>
> Is it just me, or does this sound like a Red Hat-like solution?  Gee.
> Let's package an old version of gcc just so we can compile the kernel
> correctly.  We can't simply use a stable gcc as our standard compiler.
> We have to reach back into the bag of the ancients to keep our
> machines running and make it LOOK like we're using the bleeding edge
> with gcc 2.96!
> </rant>

	If I'm not mistaken, the reasons the new gcc won't compile the
kernel have more to do with the kernel than with the new gcc.  This
problem has happened several times in the past, and it was usually (with
one notable exception in gcc 2.7.1) the kernel's fault.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6Jj0dG4QeWBeRdS8RApzxAJ9jNNuPBjyuhx7yivbAcCvG+Tlj1gCfeqFA
PrLa3JTLWQPjFcKeEg0Av/U=
=OvEE
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
