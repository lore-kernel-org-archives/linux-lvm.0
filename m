Date: Thu, 13 Jul 2000 19:42:29 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] invalid i/o protocal version
Message-ID: <20000713194229.A32516@omnifarious.mn.org>
References: <001301bfea54$f84de470$42c225c3@steuer.ofd.niedersachsen.de> <Pine.LNX.4.21.0007131531430.3258-100000@scooby.cisco.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0007131531430.3258-100000@scooby.cisco.com>; from acrews@cisco.com on Thu, Jul 13, 2000 at 03:55:07PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Adam Crews <acrews@cisco.com>
Cc: linux-lvm@msede.com


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2000 at 03:55:07PM -0700, Adam Crews wrote:
> I have re-compiled the lvm tools against the 2.2.16 src and libs, but
> I get the same message.
>=20
> How can I fix this, or what other info is needed to figure out what is
> happening?

	I'm betting you didn't install the older versions of the
executables.  Look carefully at which version of the LVM you're patching
your kernel to, and make sure that's the version of the utilities you're
using.

	The error message you're getting means that the utility versions
don't match up with the kernel module/patch version.

Have fun (if at all possible),
--=20
Its name is Public Opinion.  It is held in reverence. It settles everything.
Some think it is the voice of God.  Loyalty to petrified opinion never yet
broke a chain or freed a human soul.     ---Mark Twain
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5bmH1G4QeWBeRdS8RAgFGAKCGpTX2WMXdxlJpGCYxjmsVnQAL4gCfW6V1
1wMl+cWgQRnWvvlT44dbWxI=
=Wmtj
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
