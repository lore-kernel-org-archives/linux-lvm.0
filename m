Date: Sun, 24 Sep 2000 20:14:31 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] Which kernel?
Message-ID: <20000924201431.A5074@omnifarious.mn.org>
References: <20000924183236.B14632@wookimus.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <20000924183236.B14632@wookimus.net>; from chewie@wookimus.net on Sun, Sep 24, 2000 at 06:32:36PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2000 at 06:32:36PM -0500, ^chewie wrote:
> Which of the recent kernels should I "upgrade" to in order to use LVM? =
=20

	I've had good luck with 2.2.17.  The 2.2.14 patch seems to work
fine against it.  I've had some fun problems related to trying to manage
RedHat's patches against the kernel in addition to LVMs, but these are
largely a non-issue for 2.2.17 if you don't enable any of the md
support.

> I was looking into going to a recent 2.2.x kernel (as in > 15 ), but
> noticed that the LVM patch wasn't available for these kernel versions.
> The last patch I saw on the "test" versions (2.3.x) was for 99, but
> since I'm not sure what the status is even on this test kernel, I'm
> still not sure I want to use "test" kernels any more.  (Being bitten a
> couple times makes one nervous when handling the snake-like test's.)
>=20
> What do you recommend I use?  What's the status of the LVM patches to
> 2.2.x kernels?  Anyone had overall success with the 2.4.0-testX
> series?

	The lvm_0.8i patches against the 2.2.14 kernel worked OK for me
on the 2.2.17 kernel.

	Also, you'll have to go to a 0.8-pre version of the lvm tools
because the ioctl protocol changed between lvm_0.8final and
lvm-0.8-pre.  You'll get weird protocol mismatch errors if you try to
run the new tools with the slightly older driver.

	As I understand it though, the on-disk data structures didn't
change, so your partitions should be OK.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5zqb3G4QeWBeRdS8RAu3DAKCnz7Gssx4yLW2dv9xjhMb4sMLgOgCguh3a
icbRcSvETkHq2r6qa3PwYpk=
=5WNS
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
