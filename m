Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAK2INr18687
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 21:18:23 -0500
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAK2ILln021171
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 21:18:22 -0500
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <20041120020807.GP3139@polop.usc.edu>
References: <1100857645.13422.99.camel@grma-lap>
	<1100888487.4379.9.camel@tesuji.nac.uci.edu>
	<20041119192447.GB10969@nile.gs.washington.edu>
	<1100909625.4379.51.camel@tesuji.nac.uci.edu>
	<20041120002207.GK3139@polop.usc.edu>
	<1100914586.4379.75.camel@tesuji.nac.uci.edu>
	<20041120020807.GP3139@polop.usc.edu>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-ACFYbuutO3FGEiYZFoI8"
Date: Fri, 19 Nov 2004 18:18:16 -0800
Message-Id: <1100917096.4379.92.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
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


--=-ACFYbuutO3FGEiYZFoI8
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-11-19 at 18:08 -0800, Garrick Staples wrote:

> > > Ultimately, it seems to me that GFS over clustered LVM is the way to =
go; though
> > > all the bits don't seem to be quite in place just yet.
> >=20
> > What's this "clustered LVM" thing?  Is it the same as (or built upon)
> > NBD/ENBD?  Does it have the 2 terabyte or 16 terabyte limits?  Google
> > just turns up some mailing list hits at the top - is there a "stable"
> > release of CLVM yet?
>=20
> Cluster extensions for LVM.  Given shared storage, a few configs, and run=
ning
> clvmd, you can activate LVs on multiple machines at once.  This is great =
for
> GFS, where it replaces the gfs "pools".
>=20
> http://sources.redhat.com/cluster/
>=20
> As I said, not all of the right bits seem to be in place yet.  But I expe=
ct
> RHE4 to be very capable in this department.

Last I heard:

Sistina (prior to the Redhat purchase) had a roadmap for GFS, which
included bringing it up to, but not surpassing, the 16 terabyte limit.

Since the Redhat purchase, my understanding is that this previous
roadmap has been scrapped, and there are no longer any immediate plans
to raise the GFS filesystem size limit from 2 terabytes to 16 terabytes
- in which case, you can pretty much just use NFS, unless you're stuck
with small disks or low density servers.  :)

I'd -really-like- to find out this isn't true.


--=-ACFYbuutO3FGEiYZFoI8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBnqlno0feVm00f/8RApLgAJ9VYqQXegMbVXGoIX0n7eyGBnirbQCbBuBm
d2eJ4zztCRBny4WBfrJkQ8I=
=EaJn
-----END PGP SIGNATURE-----

--=-ACFYbuutO3FGEiYZFoI8--
