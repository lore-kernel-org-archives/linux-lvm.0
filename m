From: Rainer Krienke <krienke@uni-koblenz.de>
MIME-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_I0f3+snK3mJ1c1B";
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200306041607.04201.krienke@uni-koblenz.de>
Subject: [linux-lvm] lvm2 and xfs ?
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
Date: Mon Jun  9 09:32:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Boundary-02=_I0f3+snK3mJ1c1B
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

Hello,

since I have trouble with lvm1 in a linux san environment with a multipath =
=20
configuration I wanted to give  lvm2 a try. So I downloaded a plain 2.4.20=
=20
kernel and patched the devicemapper (latest stable version) and then I want=
ed=20
to apply xfs patches since I want to use xfs. It seems that the devicemappe=
r=20
and xfs are not yet compatible. No matter which patch I appply first I have=
=20
one file (/linux/fs/buffer.c) where either of the patches will fail if the=
=20
other one has already been applied.=20

Is there anyone running lvm2 with xfs? What kernel should I use to get both=
=20
working (in a stable fashion)?

Any comments?

Thanks
Rainer
=2D-=20
=2D------------------------------------------------------------------------=
=2D-
Rainer Krienke, Universitaet Koblenz, Rechenzentrum
Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
=2D------------------------------------------------------------------------=
=2D-

--Boundary-02=_I0f3+snK3mJ1c1B
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA+3f0Ialdtjc/KDEoRArdeAKDXKnckyfBJJKV1R5FjRTBdAuAXmQCgx2tq
bZz7Dsm7fn2wuAtuIUg/oLo=
=oWUi
-----END PGP SIGNATURE-----

--Boundary-02=_I0f3+snK3mJ1c1B--
