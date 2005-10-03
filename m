Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j939eqV25044
	for <linux-lvm@redhat.com>; Mon, 3 Oct 2005 05:40:52 -0400
Received: from wavehammer.waldi.eu.org (postfix@wavehammer.waldi.eu.org
	[82.139.196.55])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j939ejrw000388
	for <linux-lvm@redhat.com>; Mon, 3 Oct 2005 05:40:45 -0400
Date: Mon, 3 Oct 2005 11:40:23 +0200
From: Bastian Blank <waldi@debian.org>
Message-ID: <20051003094023.GA15082@wavehammer.waldi.eu.org>
References: <E1EMFoR-0008MU-48@karp.cs.elte.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <E1EMFoR-0008MU-48@karp.cs.elte.hu>
Subject: [linux-lvm] Re: Bug#331342: lvm2: lvs fails to display snapshot
	volumes
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
To: Barasz Mihaly <klao@cs.elte.hu>, 331342@bugs.debian.org
Cc: linux-lvm@redhat.com


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tags 331342 upstream
forwarded 331342 linux-lvm@redhat.com
thanks

On Mon, Oct 03, 2005 at 04:12:19AM +0200, Barasz Mihaly wrote:
> After a recent upgrade lvs and lvdisplay stopped to display snapshot
> volumes. Example:
>=20
> # lvs
>   LV   VG   Attr   LSize  Origin Snap%  Move Log Copy%=20
>   data vg0  -wi-ao 84.00G                             =20
>   home vg0  owi-ao 50.00G                             =20
> #
>=20
> One can see that "home" is an origin for some snapshot, but can't see
> the snapshot volume.
>=20
> It may be interesting, that the snapshot can be used, it appears in
> /dev/vg0:
>=20
> # ls -l /dev/vg0
> total 0
> lrwxrwxrwx  1 root root 20 Oct  3 03:32 data -> /dev/mapper/vg0-data
> lrwxrwxrwx  1 root root 20 Oct  3 03:32 home -> /dev/mapper/vg0-home
> lrwxrwxrwx  1 root root 22 Oct  3 03:32 tegnap -> /dev/mapper/vg0-tegnap
> #=20
> (the one named "tegnap" is the snapshot.)
>=20
> Snapshots still can be created/removed/used, the only problem that they a=
re
> "invisible" now.

Seems that I found the problem. The code which iterates over the LVs
explicitely ignores snapshot volumes.

tools/toollib.c:
| 62         list_iterate_items(lvl, &vg->lvs) {
| 63                if (lvl->lv->status & SNAPSHOT)
| 64                        continue;

> I've checked the vanilla versions from
> ftp://sources.redhat.com/pub/lvm2/  and neither 2.01.13 nor 2.01.14
> works, so the bug is probably in the upstream.
> The last version that works for me is 2.01.09.

This code is new in 2.01.10 or 2.01.11.

Bastian

--=20
Well, Jim, I'm not much of an actor either.

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iEYEARECAAYFAkNA/IcACgkQnw66O/MvCNEYUQCgn+2yHOsSzhlgoCyKD1vKuweT
c3cAn2p0i4mI5n620n0H3nm4cZOGt9wM
=Mplf
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
