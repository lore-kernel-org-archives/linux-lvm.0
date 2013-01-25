Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0PGJwnU029979
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2013 11:19:59 -0500
Received: from diomedes.noc.ntua.gr (diomedes.noc.ntua.gr [147.102.222.220])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0PGJshZ007472
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2013 11:19:55 -0500
Date: Fri, 25 Jan 2013 18:19:52 +0200
From: Vangelis Koukis <vkoukis@grnet.gr>
Message-ID: <20130125161952.GE28327@daedalus.cslab.ece.ntua.gr>
References: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
	<20130124180834.GA3122@agk-dp.fab.redhat.com>
	<51017F0C.20100@bmsi.com>
	<20130124234235.GB3122@agk-dp.fab.redhat.com>
	<20130125084410.GB10563@daedalus.cslab.ece.ntua.gr>
	<20130125122922.GG3122@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Content-Disposition: inline
In-Reply-To: <20130125122922.GG3122@agk-dp.fab.redhat.com>
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
To: linux-lvm@redhat.com
Cc: synnefo-devel@googlegroups.com


--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 12:29:22pm +0000, Alasdair G Kergon wrote:
> On Fri, Jan 25, 2013 at 10:44:10AM +0200, Vangelis Koukis wrote:
> > this seems to fit the bill perfectly, it's a shame it's
> > not yet merged upstream.
> =20
> One of the reasons the zeroed  target is not upstream is because,
> although we thought it would be useful, we had nobody actually
> asking to test and use it.
>=20
> If we bring it up-to-date and prepare to merge it upstream, would you=20
> test it?
>=20
> Alasdair

Dear Alasdair,

this functionality is really useful, especially in VM provisioning
scenarios.

The need for this feature came through our work on the Synnefo cloud
software [1].

We were already planning to contribute code to Ganeti [2],
so it can allocate sparse LVs based on the snapshot feature.
If the zeroed DM target makes it upstream, we'll implement support for
it inside Ganeti and also propose it for inclusion upstream.

Then I won't just be able to test it manually, we'll be running Ganeti
burnin against it, and the number of potential testers will include
users currently running Ganeti and Synnefo in production.

Thanks,
Vangelis.

[1] http://www.synnefo.org
[2] http://code.google.com/p/ganeti

--=20
Vangelis Koukis
vkoukis@grnet.gr
OpenPGP public key ID:
pub  1024D/1D038E97 2003-07-13 Vangelis Koukis <vkoukis@cslab.ece.ntua.gr>
     Key fingerprint =3D C5CD E02E 2C78 7C10 8A00  53D8 FBFC 3799 1D03 8E97

Only those who will risk going too far
can possibly find out how far one can go.
        -- T.S. Eliot

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlECsKgACgkQ+/w3mR0DjpfUbgCgjgEC9gVi6jlajxorgUpasNcz
M+cAnA1eHPw7anoE+n0FPy1/iM8g7qUx
=Q2ii
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--
