Date: Sat, 2 Sep 2000 17:04:14 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: [linux-lvm] Striping and pvmove
Message-ID: <20000902170414.A21426@omnifarious.mn.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

	What happens when you do a pvmove to move striped LEs to PEs
where striping can't be done?

	In my case, I have two drives, and I'm using striping as a sort
of poor man's RAID0.  If I wanted to remove one drive and replace it
with a bigger one, what would I do?

Thanks,
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5sXleG4QeWBeRdS8RAtJOAKDoMraa7H1A964ur1wCyg/HqeSLOACdFDEl
xn83m1FJIS99480gF9CIhCQ=
=Iouf
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
