Subject: Re: [linux-lvm] Best way to create a 540GB LVM Volume?
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <Pine.LNX.4.44.0206241536360.2708-100000@dragon.inside.ntisys.com>
References: 
	 <Pine.LNX.4.44.0206241536360.2708-100000@dragon.inside.ntisys.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-GhIttou3CbdXtAreotUN"
Message-Id: <1024948498.7706.1.camel@UberGeek>
Mime-Version: 1.0
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
Date: Mon Jun 24 14:55:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-GhIttou3CbdXtAreotUN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

No..this is not my issue. As stated, I set -s 8m(16m even) and when I
try to create a volume > 450GB, I'm not allowed. lvcreate that there are
no more allocatable PEs but vgdisplay shows there are.=20



I'm using LVM 1.0.3 from 2.4.19-pre10, soon RC1.=20


On Mon, 2002-06-24 at 14:38, bscott@ntisys.com wrote:
> On 24 Jun 2002, at 2:07pm, Austin Gonyou wrote:
> > I've got 14 FC1 disks in a PV660F. I want to take 7 of them and make
> a
> > large volume. I can't seem to make a > 450 GB volume though, even
> though
> > lvdisplay is showing xxMB PE free.
>=20
>   http://tech.sistina.com/Pages/faq.php?action=3Dview&ID=3D39
>=20
>   Is that your issue?
>=20

--=20
Austin Gonyou <austin@coremetrics.com>
Coremetrics, Inc.

--=-GhIttou3CbdXtAreotUN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9F3kS94g6ZVmFMoIRAnEzAKDKBKmBuwG2wcwdkZHF884GWst4vwCdHK1H
EVwpACKxnxIiK/eRAz6Mkqo=
=GYuu
-----END PGP SIGNATURE-----

--=-GhIttou3CbdXtAreotUN--
