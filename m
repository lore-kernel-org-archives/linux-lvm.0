Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7BNYka14310
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 19:34:46 -0400
Received: from polop.usc.edu (polop.usc.edu [128.125.10.9])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i7BNYje1032589
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 19:34:45 -0400
Date: Wed, 11 Aug 2004 16:34:34 -0700
From: Garrick Staples <garrick@usc.edu>
Subject: Re: [linux-lvm] question about physical disks with LVM
Message-ID: <20040811233433.GA2136@polop.usc.edu>
References: <OF4389A259.1F4C61A4-ON88256EEC.007B49FD-88256EEC.007BD660@epamail.epa.gov>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aSM3KCOUSI0G0tph"
Content-Disposition: inline
In-Reply-To: <OF4389A259.1F4C61A4-ON88256EEC.007B49FD-88256EEC.007BD660@epamail.epa.gov>
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
Cc: Wolfe.Jennifer@epamail.epa.gov


--aSM3KCOUSI0G0tph
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2004 at 03:32:39PM -0700, Parker.Christine@epamail.epa.gov =
alleged:
>=20
>=20
>=20
>=20
> Hello.  I got your name from the LVM man page in Enterprise Linux.  I
> have a question about creating one filesystem
> on multiple physical volumes:  can the physical volumes be of different
> sizes?
>=20
> Here's our situation:  We have a SAN setup here, and we currently have
> one filesystem that spans 10disks.
> We want to add 10 more disks (one DAE), but the new disks are larger
> than the old ones.  Will we be able to extend the old file
> system to include the new disks using LVM?  If not, can you suggest
> alternatives for us?

Yes, your can vgextend your VG to add the new larger drives.  Then you can
either create new LVs or lvextend an existing LV.


--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--aSM3KCOUSI0G0tph
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBGq0J0SBUxJbm9HMRAiOIAKCc92ktb5Kjp8prtVhgkwjzpCziqwCfbeu5
gP9e3FPyvWm3iUV3ZdXfW/o=
=9WSP
-----END PGP SIGNATURE-----

--aSM3KCOUSI0G0tph--
