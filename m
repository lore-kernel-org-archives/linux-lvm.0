Subject: Re: [linux-lvm] LVM on 2.4.17
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <Pine.LNX.4.33.0201180011090.26948-100000@greebo.foobarhouse.com>
References: <Pine.LNX.4.33.0201180011090.26948-100000@greebo.foobarhouse.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="=-QIgGq+SxLvpZZq+k8p2c"
Message-Id: <1011411634.1992.19.camel@UberGeek>
MIME-Version: 1.0
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
Date: Fri Jan 18 21:41:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-QIgGq+SxLvpZZq+k8p2c
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Did you compile any MD support in there?

On Thu, 2002-01-17 at 18:12, James Pattinson wrote:
> Hi!
>=20
> I've been neglecting my systems and LVM... currently trying to upgrade
> from 2.4.16 to 2.4.17. 2.4.17 seems to include LVM 1.0.1-rc4 but it
> fails
> when I compile:
>=20
> lvm-snap.c: In function `lvm_snapshot_COW':
> lvm-snap.c:380: `phys_start' undeclared (first use in this function)
> lvm-snap.c:380: (Each undeclared identifier is reported only once
> lvm-snap.c:380: for each function it appears in.)
>=20
> Do I need to apply additional patches?
>=20
> Cheers!
>=20
> James
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-698-7250
email: austin@coremetrics.com

"It is the part of a good shepherd to shear his flock, not to skin it."
Latin Proverb

--=-QIgGq+SxLvpZZq+k8p2c
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8SOqx94g6ZVmFMoIRAvoXAKCnfvgaUY2A2w+Uk35P/sJBdQO2iwCfTX+G
4jIrCtECjmOErOB6uJy5zQU=
=cBCa
-----END PGP SIGNATURE-----

--=-QIgGq+SxLvpZZq+k8p2c--
