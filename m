Date: Mon, 25 May 2015 18:36:50 +0200
From: Christian Hesse <list@eworm.de>
Message-ID: <20150525183650.36634482@leda.localdomain>
In-Reply-To: <5562CC3F.9010901@redhat.com>
References: <20150521141955.70ebe714@leda.localdomain>
	<5562CC3F.9010901@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/PPXbHCdrwsim3QTYPWBzWNA";
	protocol="application/pgp-signature"
Subject: Re: [linux-lvm] autoactivation fails
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Ondrej Kozina <okozina@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--Sig_/PPXbHCdrwsim3QTYPWBzWNA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Ondrej Kozina <okozina@redhat.com> on Mon, 2015/05/25 09:16:
> On 05/21/2015 02:19 PM, Christian Hesse wrote:
> > Hello everybody,
> >
> > with recent lvm2 I had problems booting an Arch Linux system with
> > non-systemd initramfs. lvmetad is launched, but volumes are not
> > activated. A git bisect reported this bad commit:
> >
> > commit fe30658a4d5fe4e4e6bb346c9c9ee7142a98f49d
> > Author: Ondrej Kozina <okozina@redhat.com>
> > Date:   Mon Apr 13 16:29:15 2015 +0200
>=20
> Fixed by commit:
>=20
> commit f8bf6410954fcf82bf28852e0dba015c6b7f19dc
> Author: Ondrej Kozina <okozina@redhat.com>
> Date:   Fri May 22 14:48:28 2015 +0200
>=20
>      lvmetad.c: ignore lvmetad global handle on disconnect
>=20
>      do not unset lvmetad global handle on disconnect. This is
>      hotfix for issue described in:
>      https://www.redhat.com/archives/linux-lvm/2015-May/msg00008.html
>=20
>      Reported-by: Christian Hesse <list@eworm.de>
>=20
> pvscan --cache --background segfaulted due to NULL ptr dereference.
>=20
> Thanks for the report!

Looks good. Thanks a lot!
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/PPXbHCdrwsim3QTYPWBzWNA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVY0+iAAoJEIlFIdfMgPR29DsIAMcqKf8nC2BDgvrZWqZhHaij
O7xj+rtvg9OTfI2rRhjsFWnAki6MyidtbtGG26Baadtr8FrAh8Y1HtnufGFYhx4g
tIAcTreeVVqZorOhPoHpRs8k6s3JINV3w6LvKbwvsl5GLqDGqdnwvr6dZv5pG9jU
6Ohm9Zfm9l6Rq70nz4ZBXEDHlb9o2vejhplbA2sVpHOHfNd4EmCyac60By2HCQJ/
0qCP5UM3kQiN7uSS9sirdrVGi9RXG4ghP1e02CmI1PyZhDeRycbLTl9AWLLr3W3D
EGelhBguAZ+8CxWFuIiAm3Z4S3y8QLH0XT52esssIiqTktUJbyOzMvBZl0EyEzM=
=hiCG
-----END PGP SIGNATURE-----

--Sig_/PPXbHCdrwsim3QTYPWBzWNA--
