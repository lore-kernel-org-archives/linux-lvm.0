Subject: Re: [linux-lvm] vgcreate on 1.5TB volume
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <16900000.1034642423@[192.168.200.4]>
References: <16900000.1034642423@[192.168.200.4]>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-psSsSBTVdsGOx1lDqm9B"
Message-Id: <1034880699.30305.11.camel@UberGeek.coremetrics.com>
Mime-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Oct 17 13:52:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-psSsSBTVdsGOx1lDqm9B
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I ended up having to do vgcreate -s32M, that got me a 2TB LV Max.=20

ALso, there is an issue which I'd like to discuss here on this list. It
is about LVM1 and kernel stack clobbering. It's pretty terrible, and all
roads, so far, seem to point at LVM.

Austin

On Mon, 2002-10-14 at 19:40, Steven Lembark wrote:
> > What is the best way to get all 1.5TB in one LV?
>=20
> What are you using the space for? Nearly anything that would
> handle that much space can divide the space up into multiple
> areas (e.g., oracle tablespaces) that allow more reasonably
> sized filesystems.
>=20
>=20
> --
> Steven Lembark                               2930 W. Palmer
> Workhorse Computing                       Chicago, IL 60647
>                                             +1 800 762 1582
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--=20
Austin Gonyou <austin@coremetrics.com>
Coremetrics, Inc.

--=-psSsSBTVdsGOx1lDqm9B
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9rwa794g6ZVmFMoIRAvkqAJ9pUprwdF3LYGs+x/hbRcEWbUH7sQCfUB/7
ULzZLI0L5ka2YijB4jhkAaI=
=0HAt
-----END PGP SIGNATURE-----

--=-psSsSBTVdsGOx1lDqm9B--
