Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAK1akr10892
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 20:36:46 -0500
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAK1ab0E010961
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 20:36:37 -0500
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <20041120002207.GK3139@polop.usc.edu>
References: <1100857645.13422.99.camel@grma-lap>
	<1100888487.4379.9.camel@tesuji.nac.uci.edu>
	<20041119192447.GB10969@nile.gs.washington.edu>
	<1100909625.4379.51.camel@tesuji.nac.uci.edu>
	<20041120002207.GK3139@polop.usc.edu>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-T/Yn0ogiipBmjNPjvp7D"
Date: Fri, 19 Nov 2004 17:36:26 -0800
Message-Id: <1100914586.4379.75.camel@tesuji.nac.uci.edu>
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


--=-T/Yn0ogiipBmjNPjvp7D
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-11-19 at 16:22 -0800, Garrick Staples wrote:
> > Does PVFS2 have posix semantics these days?
> =20
> No.  I was at the pvfs2 BOF and SC04 last week and this is one of their s=
elling
> points... much greater scalibity and performance by throwing out half of =
POSIX.

Thanks for the info!

> > My understanding is that IBM will only support GPFS on IBM hardware...
>=20
> Nor is it really FOSS.

I see.  Is it kind of like the Sun Java or Mozilla licenses?

> Ultimately, it seems to me that GFS over clustered LVM is the way to go; =
though
> all the bits don't seem to be quite in place just yet.

What's this "clustered LVM" thing?  Is it the same as (or built upon)
NBD/ENBD?  Does it have the 2 terabyte or 16 terabyte limits?  Google
just turns up some mailing list hits at the top - is there a "stable"
release of CLVM yet?

Thanks!


--=-T/Yn0ogiipBmjNPjvp7D
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBnp+ao0feVm00f/8RAoWCAKChq0b7LJbXDUdrxSITFLDkFPDclQCgoD38
AmEyKyn9WpPoVXD5ewoqiAU=
=3TmT
-----END PGP SIGNATURE-----

--=-T/Yn0ogiipBmjNPjvp7D--
