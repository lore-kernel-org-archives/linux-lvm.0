Subject: Re: [linux-lvm] LVM snapshot limits
From: Shaun Kruger <skruger@backcountry.com>
In-Reply-To: <47210A6B.6090104@redhat.com>
References: <200710251447.43405.skruger@backcountry.com>
	<47210A6B.6090104@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-GjYdkWKaBgGtVH4Bjti1"
Date: Tue, 30 Oct 2007 16:16:45 -0600
Message-Id: <1193782605.6766.13.camel@skrugerLT.wvc.bcinfra.net>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Milan Broz <mbroz@redhat.com>


--=-GjYdkWKaBgGtVH4Bjti1
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

> Hi,
> both problems are already known and will be fixed in RHEL 5.1 release.
> (See Red Hat Bugzilla bugs 211516 and 211525).
> (Upstream kernel is already fixed.)

Thanks again for your help on this issue.  Between your response and
redhat support I was able to quickly get a working kernel.

There is however one issue that probably needs attention.  If I create
snapshots until I get an error (about 200 snaps), remove them, and
repeat the creation/removal multiple times it is possible to destroy the
LVM metadata.  When this happens pvscan shows that there is no VG
associated with the physical volume.  Restarting results in full loss of
data.  I was able to reproduce this twice.

While it is not impacting my use of LVM snapshots this is probably a bug
that should be looked into.  It was quite worrying when my volume group
disappeared.

I can provide my scripts and detailed instructions on reproducing the
issue for anyone who is interested in looking into it.

Shaun Kruger

--=-GjYdkWKaBgGtVH4Bjti1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHJ61N/zJrlJgPNdURAgijAJ4hwSHdadBa8NgJ1QdG+c2m3piQwwCgrd18
x4zxeH3HKO3ipe/nD0szZ5o=
=MMsj
-----END PGP SIGNATURE-----

--=-GjYdkWKaBgGtVH4Bjti1--
