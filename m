From: Austin Gonyou <austin@coremetrics.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-MXQT1CJ20ta7jJZf0S5C"
Message-Id: <1024945627.6892.7.camel@UberGeek>
Mime-Version: 1.0
Subject: [linux-lvm] Best way to create a 540GB LVM Volume?
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
Date: Mon Jun 24 14:07:01 2002
List-Id: <linux-lvm.redhat.com>
To: Linux LVM Mailinglist <linux-lvm@sistina.com>

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
