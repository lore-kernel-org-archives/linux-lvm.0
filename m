Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j22KieK21803
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 15:44:40 -0500
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j22KiclX022247
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 15:44:38 -0500
Subject: Re: [linux-lvm] Partition table gone? Any way to restore?
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <1109791034l.28794l.3l@tangerine>
References: <4225FBC8.9020904@are-b.org> <20050302174819.GN17589@lug-owl.de>
	<4225FEBC.2060505@are-b.org> <20050302180537.GO17589@lug-owl.de>
	<42260F1B.2030803@are-b.org>  <1109791034l.28794l.3l@tangerine>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-EOdqKWlW3FvG8aHpt1jG"
Date: Wed, 02 Mar 2005 12:44:36 -0800
Message-Id: <1109796276.31821.263.camel@seki.nac.uci.edu>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-EOdqKWlW3FvG8aHpt1jG
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-03-02 at 19:17 +0000, Jean-Luc Coulon (f5ibh) wrote:
> Le 02.03.2005 20:08:11, oliver a =E9crit :
> > I do have an empty 120GB hdd available to dump the entire contence =20
> > on. I guess dd will do the trick?
>=20
> ddrescue the weapon of the last chance ...

I wouldn't even call it the last chance.

If you're doing anything you suspect might toast your drive even
further, it's a very good idea to run dd_rescue on it first, so you have
a 2nd copy of the data to fall back on if something goes kerflooey.

Anyway, dd_rescue does appear to have advantages for data recovery,
relative to the more traditional "dd conv=3Dnoerror,sync".


--=-EOdqKWlW3FvG8aHpt1jG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCJiW0o0feVm00f/8RAgH5AJsF+qeb2llfR4AzOlqMLmjezB1WRgCfTg/q
m8wdGSe36kYZBupPiL+yFZU=
=pThW
-----END PGP SIGNATURE-----

--=-EOdqKWlW3FvG8aHpt1jG--
