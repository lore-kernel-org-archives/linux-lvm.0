Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAK28Pr16984
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 21:08:25 -0500
Received: from polop.usc.edu (polop.usc.edu [128.125.10.9])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAK28Ib7020411
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 21:08:19 -0500
Received: from polop.usc.edu (localhost.localdomain [127.0.0.1])
	by polop.usc.edu (8.12.11/8.12.11) with ESMTP id iAK288Wp001731
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 18:08:08 -0800
Received: (from garrick@localhost)
	by polop.usc.edu (8.12.11/8.12.11/Submit) id iAK287nk001729
	for linux-lvm@redhat.com; Fri, 19 Nov 2004 18:08:07 -0800
Date: Fri, 19 Nov 2004 18:08:07 -0800
From: Garrick Staples <garrick@usc.edu>
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
Message-ID: <20041120020807.GP3139@polop.usc.edu>
References: <1100857645.13422.99.camel@grma-lap>
	<1100888487.4379.9.camel@tesuji.nac.uci.edu>
	<20041119192447.GB10969@nile.gs.washington.edu>
	<1100909625.4379.51.camel@tesuji.nac.uci.edu>
	<20041120002207.GK3139@polop.usc.edu>
	<1100914586.4379.75.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lEnBJ3eT4fJ0mBo"
Content-Disposition: inline
In-Reply-To: <1100914586.4379.75.camel@tesuji.nac.uci.edu>
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


--3lEnBJ3eT4fJ0mBo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2004 at 05:36:26PM -0800, Dan Stromberg alleged:
> > > My understanding is that IBM will only support GPFS on IBM hardware...
> >=20
> > Nor is it really FOSS.
>=20
> I see.  Is it kind of like the Sun Java or Mozilla licenses?

Last I checked, which has been while now, it was binary-only download; built
for only a few specific RH kernels.

Checking now, it's up on developerworks with a BSD license, but I don't
actually see any released files.

I'm half-way sure someone is going to correct me here :)

=20
> > Ultimately, it seems to me that GFS over clustered LVM is the way to go=
; though
> > all the bits don't seem to be quite in place just yet.
>=20
> What's this "clustered LVM" thing?  Is it the same as (or built upon)
> NBD/ENBD?  Does it have the 2 terabyte or 16 terabyte limits?  Google
> just turns up some mailing list hits at the top - is there a "stable"
> release of CLVM yet?

Cluster extensions for LVM.  Given shared storage, a few configs, and runni=
ng
clvmd, you can activate LVs on multiple machines at once.  This is great for
GFS, where it replaces the gfs "pools".

http://sources.redhat.com/cluster/

As I said, not all of the right bits seem to be in place yet.  But I expect
RHE4 to be very capable in this department.

--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--3lEnBJ3eT4fJ0mBo
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBnqcH0SBUxJbm9HMRAs/RAJ9/zj7mt/A4bATtF2E4pl2euH6JhQCgsY94
yKErblLbdqyirc4+w/ZH/qA=
=ovGW
-----END PGP SIGNATURE-----

--3lEnBJ3eT4fJ0mBo--
