From: Anders Karlsson <anders.karlsson@meansolutions.com>
Message-ID: <20021228222936.GA3752@alien.meansolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
Subject: [linux-lvm] Linux LVM
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sat Dec 28 16:29:01 2002
List-Id: <linux-lvm.redhat.com>
To: "Heinz J. Mauelshagen" <linux-lvm@sistina.com>

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I have been using LVM for a long time (0.9beta era and onwards) and always
been very happy with it. It always seems to work well for me, so no
complaints on that.

I have been running SuSE 8.1 Professional for a while, and recently updated
to kernel 2.4.20-ac2. Since then, I have problem with doing anything that
modifies anything, the error I get doing anything at all is:

ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan

Now, this has been reported on the mailinglist, and I have tried the
prescribed remedies. First I tried upgrading the LVM tools to 1.0.6, that
did not help. Recompiled the kernel with linux lvm 1.0.6 patch applied,
that did not help either. Then I built 2.4.20 with lvm 1.0.6 patch applied
and that, you guessed it, has not fixed the problem either.

I am at this point a little stumped and do not quite know what to do. Kernel
2.4.20 (and 2.4.20-ac2) enabled me to use DRM/DRI and to customise a few
other things that SuSE does not provide in their kernel.

If you could come up with a few pointers on things to look at to fix this,
I would be happy to try them...

Regards,

--=20
Anders Karlsson <anders.karlsson@meansolutions.com>
Trudheim Technology Ltd. - AIX and Linux System Administrator

PGP Usage Strongly Advised!!      My Key ID =3D 4B20601A
Fingerprint =3D 1B11 2F8C CBD6 7E53 E246  B23B 2D8C B0AA 4B20 601A

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE+DiXQLYywqksgYBoRAnijAKC2kHD8we9QpljRpAUjZoHDCcNjkACgnDik
1BzbAbCo42LeaLhKN5yifnE=
=/STi
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
