Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i66LiV009052
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 17:44:31 -0400
Received: from polop.usc.edu (polop.usc.edu [128.125.10.9])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i66LiTe1021026
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 17:44:30 -0400
Received: from polop.usc.edu (localhost.localdomain [127.0.0.1])
	by polop.usc.edu (8.12.11/8.12.11) with ESMTP id i66LiTTg004760
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 14:44:29 -0700
Received: (from garrick@localhost)
	by polop.usc.edu (8.12.11/8.12.11/Submit) id i66LiTUl004758
	for linux-lvm@redhat.com; Tue, 6 Jul 2004 14:44:29 -0700
Date: Tue, 6 Jul 2004 14:44:29 -0700
From: Garrick Staples <garrick@usc.edu>
Subject: Re: [linux-lvm] dm kernel patch size
Message-ID: <20040706214428.GW11597@polop.usc.edu>
References: <20040706191502.GL11597@polop.usc.edu>
	<20040706204647.GC1506@chaos.ao.net>
	<20040706205622.GR11597@polop.usc.edu>
	<20040706211738.GM30186@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8q6ApRMttMB4WTI6"
Content-Disposition: inline
In-Reply-To: <20040706211738.GM30186@agk.surrey.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--8q6ApRMttMB4WTI6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2004 at 10:17:38PM +0100, Alasdair G Kergon alleged:
> On Tue, Jul 06, 2004 at 01:56:23PM -0700, Garrick Staples wrote:
> > Do the dm targets require the mm patchset?  Is it possible to get _just=
_ the
> > new dm targets?
>=20
> Yes - instead of applying the entire included -mm patch, take the dm patc=
hes=20
> from the "broken out" version on his website:
>=20
>   http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/
>=20
> [Or work from Linus's bk tree, if you just want snapshot and pvmove.]

The only dm-related patch in 2.6.7-mm6 that I can see is the new IO barrier
patch.

I don't want to follow any development trees, including Linus'.  Can I get =
just
the dm targets for 2.6.7 vanilla kernel.org?

--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--8q6ApRMttMB4WTI6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFA6x080SBUxJbm9HMRAiKLAJ9WOSzT+/7qdz2B+fcyPcEa/mXgVgCfbh4r
pO0xRoRf2vBiCu4Jgb4E6WE=
=p7Nr
-----END PGP SIGNATURE-----

--8q6ApRMttMB4WTI6--
