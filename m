Date: Wed, 28 Jul 1999 21:44:14 -0500
From: Brian Wolfe <ahzz@yamato.terrabox.com>
Subject: Re: [linux-lvm] Compile Problems (Thanks!)
Message-ID: <19990728214414.C25298@yamato.terrabox.com>
Reply-To: ahzz@yamato.terrabox.com
References: <379B99D3.67007D3@thephaedo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="vEao7xgI/oilGqZ+"; micalg=pgp-md5;
	protocol="application/pgp-signature"
In-Reply-To: <379B99D3.67007D3@thephaedo.com>; from S. Ryan Quick on Sun, Jul 25, 1999 at 11:12:20PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: "S. Ryan Quick" <ryan@thephaedo.com>
Cc: linux-lvm@msede.com


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

	Actualy i'd be interested in the fixes and wht you think is rwong with the=
 "debian way" of doing things. I'm interested in making a deb outa this all=
....

	ahzz


On Sun, Jul 25, 1999 at 11:12:20PM +0000, S. Ryan Quick wrote:
> Thanks everyone, I got it.
>=20
> Turns out the Debian convention of using the debian.rules moniker and
> relinking the header files for the kernel was
> the problem.  I forced a rebuild of the include files (make_kpkg
> kernel_source) as well as the installed kernel and
> everything went like clockwork.   Already working with 2 vgs and now
> playing with the resize functions.
>=20
> Thanks . . .
>=20
> Ryan
>=20
> PS.  If anyone wants detailed information on the fix (it's all Debian's
> slightly-odd control of header files) I can post it.
>=20
>=20

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: 2.6.3ia

iQCVAwUBN5+//VoyucRTDyulAQFIhwP/TtY0TUW+CYfG2KF+7fE/bekjLZ7GCT8X
L/dQDH/7PJIvRaeD+xjCKq9WTsQpm6VIR3gLcbfy+pjsExRYTHXF2lziMjmvOWOz
izog5RkoIz6oTS760c06K6WPuS+f7vyPbAxLfS4Aab3E40ZAv6jK34aAek04Hf/K
sNuKa0r/gMc=
=hilh
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--
