Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3KLaQO29014
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2005 17:36:26 -0400
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3KLaKiY017390
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2005 17:36:20 -0400
Subject: Re: [linux-lvm] Snapshots and mmaped files.
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <opsphokdjknas5wc@a64.davidb.org>
References: <opsphokdjknas5wc@a64.davidb.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-DQ0I0cWXpwlYV6Q1ktF8"
Date: Wed, 20 Apr 2005 14:36:19 -0700
Message-Id: <1114032979.27207.100.camel@seki.nac.uci.edu>
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


--=-DQ0I0cWXpwlYV6Q1ktF8
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


If lvm2 snapshots are like most snapshots, then they aren't a panacea -
they only decrease the window during which your database must be
quiescent.

EG, with snapshotting:

1) Shut down database
2) bifurcate off a snapshot
3) Start up database
4) Do backup against snapshot
5) Eliminate snapshot


EG without snapshotting:

1) Shut down database
2) Do backup
3) Start up database


The first case has more steps, but it also has a lot shorter time during
which your database is inactive.

On Tue, 2005-04-19 at 10:08 -0700, David Brown wrote:
> I'm using lvm2 snapshots to do backups of several machines.  (lvm2 =20
> 2.00.33, device-mapper 1.01.00,
> ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.9/2.6.9-udm1.tar=
.bz2 =20
> minus patch 13)  (I've tried some newer patches, without success, but =20
> that'll be a separate mail).
>=20
> The problem shows up with files that contains Berkeley databases.  These =
=20
> files seem to be modified on both the original and the snapshot.  They =20
> show up in my 'var' partition with imapd, and exim, and anything else tha=
t =20
> has a berkeley database opened, and modifies the file after the snapshot =
=20
> is taken.
>=20
> The mtime of the file is not modified, only the contents.  I suspect that=
 =20
> if one side grew, then the size change would not be affected.
>=20
> Thanks,
> David Brown
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=-DQ0I0cWXpwlYV6Q1ktF8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCZstTo0feVm00f/8RAk34AJ9/sLspekEWBM2kznscZy1yxP7l9wCfSjaj
VgBvgGP/Jkd3xOgZnie56o0=
=LsVM
-----END PGP SIGNATURE-----

--=-DQ0I0cWXpwlYV6Q1ktF8--
