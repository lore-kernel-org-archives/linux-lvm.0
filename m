Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0P8iGw3015718
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2013 03:44:16 -0500
Received: from diomedes.noc.ntua.gr (diomedes.noc.ntua.gr [147.102.222.220])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0P8iBkn001235
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2013 03:44:12 -0500
Date: Fri, 25 Jan 2013 10:44:10 +0200
From: Vangelis Koukis <vkoukis@grnet.gr>
Message-ID: <20130125084410.GB10563@daedalus.cslab.ece.ntua.gr>
References: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
	<20130124180834.GA3122@agk-dp.fab.redhat.com>
	<51017F0C.20100@bmsi.com>
	<20130124234235.GB3122@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline
In-Reply-To: <20130124234235.GB3122@agk-dp.fab.redhat.com>
Subject: Re: [linux-lvm] Sparse LVs, --virtualsize equal to --size
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: synnefo-devel@googlegroups.com


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2013 at 11:42:35pm +0000, Alasdair G Kergon wrote:
> So look at thin provisioning with its zeroing option.
> External origin.  (support currently being added to lvm)
>=20
> Or this not-yet-upstream target:
> http://people.redhat.com/agk/patches/linux/editing/dm-add-zeroed-target.p=
atch
>=20
> Alasdair

Thanks Alasdair,

this seems to fit the bill perfectly, it's a shame it's
not yet merged upstream.

Until then, if we are to go with the "snapshot-over-the-zero-target"
route, can you comment on quantifying the space overhead of tracking
chunks in the snapshot?

Thanks again,
Vangelis.

--=20
Vangelis Koukis
vkoukis@grnet.gr
OpenPGP public key ID:
pub  1024D/1D038E97 2003-07-13 Vangelis Koukis <vkoukis@cslab.ece.ntua.gr>
     Key fingerprint =3D C5CD E02E 2C78 7C10 8A00  53D8 FBFC 3799 1D03 8E97

Only those who will risk going too far
can possibly find out how far one can go.
        -- T.S. Eliot

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlECRdoACgkQ+/w3mR0Djpc8QwCgjSRletFjquTycBeA+YYRg9aJ
d98AoKgR5r8lGBGlSmPLYhCYLLSJ+9qS
=w0mj
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
