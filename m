From: Austin Gonyou <austin@coremetrics.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-NBF38uPUOpk5dJqlhckj"
Message-Id: <1024945914.6875.16.camel@UberGeek>
Mime-Version: 1.0
Subject: [linux-lvm] [Fwd: Best way to create a 540GB LVM Volume?]
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
Date: Mon Jun 24 14:12:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-NBF38uPUOpk5dJqlhckj
Content-Type: multipart/mixed; boundary="=-lcOgEeb6fbLALVUxtcdi"


--=-lcOgEeb6fbLALVUxtcdi
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


--=20
Austin Gonyou <austin@coremetrics.com>
Coremetrics, Inc.

--=-lcOgEeb6fbLALVUxtcdi
Content-Disposition: inline
Content-Description: Forwarded message - Best way to create a 540GB LVM
	Volume?
Content-Type: message/rfc822

Subject: Best way to create a 540GB LVM Volume?
From: Austin Gonyou <austin@coremetrics.com>
To: Linux LVM Mailinglist <linux-lvm@sistina.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-MXQT1CJ20ta7jJZf0S5C"
Organization: Coremetrics, Inc.
X-Mailer: Ximian Evolution 1.1.0.99 (Preview Release)
Date: 24 Jun 2002 14:07:07 -0500
Message-Id: <1024945627.6892.7.camel@UberGeek>
Mime-Version: 1.0


--=-MXQT1CJ20ta7jJZf0S5C
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I've got 14 FC1 disks in a PV660F. I want to take 7 of them and make a
large volume. I can't seem to make a > 450 GB volume though, even though
lvdisplay is showing xxMB PE free.=20

I'm using default 4mb and also 8mb extentsize when creating the VG.
Please advise.


--=20
Austin Gonyou <austin@coremetrics.com>
Coremetrics, Inc.

--=-MXQT1CJ20ta7jJZf0S5C
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9F23b94g6ZVmFMoIRArNoAKDck3CTPUY7cI5cA2Kxy8YOWd3K7gCfcBnJ
qYlsGIGGyUYxwm/ZgUTwdeA=
=2Uds
-----END PGP SIGNATURE-----

--=-MXQT1CJ20ta7jJZf0S5C--

--=-lcOgEeb6fbLALVUxtcdi--

--=-NBF38uPUOpk5dJqlhckj
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9F27694g6ZVmFMoIRAj+GAJ93fFrQ/dPHdXtxTLojjejKG7tb7QCcCnx5
kJ0eWtngGPzJbz5NL+bHs3Q=
=8KYv
-----END PGP SIGNATURE-----

--=-NBF38uPUOpk5dJqlhckj--
