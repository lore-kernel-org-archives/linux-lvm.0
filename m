Return-Path: <Jesse@cryptocard.com>
Subject: Re: [linux-lvm] Re: Help! Upgrade 2.2.18 -> 2.4.4 killed a PV
From: Jesse Stockall <jesse@cryptocard.com>
In-Reply-To: 
	<Pine.LNX.4.33.0105301516160.17597-100000@UberGeek.coremetrics.com>
References: 
	<Pine.LNX.4.33.0105301516160.17597-100000@UberGeek.coremetrics.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-kAPr6p0lziMXoGvh0tJ+"
Date: 30 May 2001 16:52:44 -0400
Message-Id: <991255964.19428.3.camel@jesseDEB>
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-kAPr6p0lziMXoGvh0tJ+
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 30 May 2001 15:17:50 -0500, Austin Gonyou wrote:
> Recompiling an XFS 2.4.5 tree, after patching with LVM 0.9.1b7, which wen=
t
> fine except for the drivers/md/Makefile( stuff already exists in this
> tree), no other changes, checked the .rej file, I get the following
> failure when trying to make the kernel:
>=20
> drivers/md/mddev.o: In function `__update_hardblocksize':
> drivers/md/mddev.o(.text+0xaba1): undefined reference to
> `get_hardblocksize'
> drivers/md/mddev.o(.text+0xabed): undefined reference to
> `get_hardblocksize'
> make[1]: *** [kallsyms] Error 1
> make[1]: Leaving directory `/usr/src/linux-2.4-xfs/linux'
> make: *** [vmlinux] Error 2
>=20
> Any ideas?
>=20
> --=20
> Austin Gonyou
> Systems Architect, CCNA
> Coremetrics, Inc.
> Phone: 512-796-9023
> email: austin@coremetrics.com
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

I had the same problem a couple of nights ago.

Replace `get_hardblocksize` with `get_hardsect_size` there should be 2
instances of it in lvm.c=20

Enjoy

--=20
 Jesse Stockall                 |       Tel: 1+ 613.599.2441 ext. 243
 CRYPTOCard Corporation         |       Fax: 1+ 613.599.2442           =20
 Suite 304, 300 March Rd.       |       email: jesse@cryptocard.com
 Ottawa, ON, Canada K2K 2E2     |       web: www.cryptocard.com=20
---------------------------------------------------------------------
-------------- Debian - The Choice of a GNU Generation --------------

--=-kAPr6p0lziMXoGvh0tJ+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.5 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA7FV2bhh8uPnqIUZIRAo6tAJ9hHpJYP9FWZumgWq5UaFSnp7uvoQCfQb0T
WOFyQEA9yEp36WgtyQWCyqs=
=9Ck+
-----END PGP SIGNATURE-----

--=-kAPr6p0lziMXoGvh0tJ+--
