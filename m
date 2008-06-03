Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of
	snapshot merging
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-TcAKyHxGHVlK8l6kz3dy"
Date: Tue, 03 Jun 2008 16:32:47 -0400
Message-Id: <1212525167.29076.191.camel@pc.ilinx>
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
Cc: Alasdair G Kergon <agk@redhat.com>, Milan Broz <mbroz@redhat.com>


--=-TcAKyHxGHVlK8l6kz3dy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-06-03 at 15:26 -0400, Mikulas Patocka wrote:
> Hi

> Merging allows you to copy data in snapshot back to the origin device.=20

Cool.

> During merging, aby
typo? ------------^^^
>  reads and writes to the origin device are identical to=20
> accesses to the merging snapshots.

So the origin looks 100% merged as soon as the merging starts?

> There may be multiple snapshots while one of them is being merged ---=20
> exceptions in other snapshots are being allocated and there snapshots are=
=20
> kept stable.

So basically, before blocks are copied up from the merging snapshot to
the origin, the blocks to be overwritten (in the origin) are first
copied down to other snapshots of the same origin?

Is it smart about a block that is to be copied up to the origin being
the same as the corresponding blocks in peer snapshots?  By "smart" I
mean erase the block in the peer's snapshot and put back the pointer up
to the origin.

A pedantic example would be to create an origin, O1 and then a snapshot
of O1 called S1.  Make a bunch of changes to S1 and then create another
snapshot of O1 called S2 and then block copy from S1 to S2 (presumably,
although I don't know for sure, S2 only contains the same changed blocks
as S1).  Now if you merge S1 up to O1, ideally S2 should be "empty".

> Don't try to concurrently merge more than one snapshot

Heh.

b.


--=-TcAKyHxGHVlK8l6kz3dy
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIRapvl3EQlGLyuXARAlG3AJ9LDEmCPactxvN878lQjyhw1Sza9gCfWiFn
QS0hoZz8dSs7JyPQCQe2CN4=
=i/5N
-----END PGP SIGNATURE-----

--=-TcAKyHxGHVlK8l6kz3dy--
