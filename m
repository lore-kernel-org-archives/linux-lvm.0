From: Rainer Krienke <krienke@uni-koblenz.de>
MIME-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_XvjH/LFXEXpEUiw";
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200307230940.07980.krienke@uni-koblenz.de>
Subject: [linux-lvm] Warning: dev_open(/etc/lvm/metadata/data1) called while suspended ?
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
Date: Wed Jul 23 08:31:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Boundary-02=_XvjH/LFXEXpEUiw
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

Hello,

I use lvm2 (stable version) on a suse linux system (with patched 2.4er=20
kernel). The metadata format is lvm2. I tried to extend an existing logical=
=20
volume which worked. However I received a warning message calling lvextend:

WARNING: dev_open(/etc/lvm/metadata/data1) called while suspended

data1 is the volumegroup name to which the LV belongs that I extended using=
=20
lvextend.=20

My question is simply if this warning is something serious or if one can=20
safely ignore it. Actually I cannot classify this message since I don't hav=
e=20
an idea of what it means.

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

--Boundary-02=_XvjH/LFXEXpEUiw
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/HjvXaldtjc/KDEoRAvt1AKDa/geRQ4WK7AyP60svKNKEyymWugCfa0qP
/avfXYOyDxyCpPOY1kIU15c=
=oBvx
-----END PGP SIGNATURE-----

--Boundary-02=_XvjH/LFXEXpEUiw--
