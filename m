Date: Mon, 13 Nov 2000 16:07:25 -0600
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] Removing a PV
Message-ID: <20001113160725.A13890@omnifarious.mn.org>
References: <20001113195854.D23680@colombina.comedia.it> <Pine.BSO.4.21.0011131545220.14526-100000@loonybin.loonybin.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <Pine.BSO.4.21.0011131545220.14526-100000@loonybin.loonybin.net>; from rob@loonybin.net on Mon, Nov 13, 2000 at 03:58:37PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2000 at 03:58:37PM -0500, Rob Foehl wrote:
> I'd assumed that was the correct command sequence, but does lvreduce
> ensure that the filesystem won't be damaged? Ie. does it only remove LE's
> from the end of the LV, or what?

	Yes, you guessed it.  :-)

	I'm not sure what happens with pvmove if the logical volume is
striped though.  I'd really like to know.  :-)

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6EGYdG4QeWBeRdS8RAqaSAKCKdlMKOgz8EKzAiZBqTyK7DHNbmQCgpiOX
r6W0LYX1RY95kRVOMx9wWw0=
=oSfr
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
