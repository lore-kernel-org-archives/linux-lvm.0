Subject: Re: [linux-lvm] Re: VG vg1 metadata writing failed
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <20050606212110.GV15809@agk.surrey.redhat.com>
References: <1118087310.5509.40.camel@localhost.localdomain>
	<1118087611.5509.44.camel@localhost.localdomain>
	<1118091844.5509.79.camel@localhost.localdomain>
	<20050606212110.GV15809@agk.surrey.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-cz91HYkZNDYJ1Hp7+KZe"
Date: Mon, 06 Jun 2005 17:27:20 -0400
Message-Id: <1118093240.5509.81.camel@localhost.localdomain>
Mime-Version: 1.0
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Alasdair G Kergon <agk@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>


--=-cz91HYkZNDYJ1Hp7+KZe
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2005-06-06 at 22:21 +0100, Alasdair G Kergon wrote:
> On Mon, Jun 06, 2005 at 05:04:04PM -0400, Ming Zhang wrote:
> > this is reproducible on another box.
> =20
> There is currently a 64k hard-coded limit on metadata size.
>=20
> Some of the lvm2 tool algorithms also get quite slow when
> there are lots of entities.
>=20
> Keep an eye on the CVS code - there was an allocation speed-up=20
> added recently, and the 64k limit should be disappearing very=20
> soon too.
>=20
Thanks a lot for this information. It seems that this limitation is per
VG.

> Alasdair


Ming


--=-cz91HYkZNDYJ1Hp7+KZe
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCpL+4SYbkL5BnVYoRAq7kAJ95qTlBGWkoAlYSG56/LAns+mPQeQCfRcf7
fsFjR3pzcf0dpbpqAeEx79o=
=MX5D
-----END PGP SIGNATURE-----

--=-cz91HYkZNDYJ1Hp7+KZe--
