Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
From: Gregory Ade <gkade@bigbrother.net>
In-Reply-To: <20021109130628.B12935@sistina.com>
References: <20021009133650.E23965@sistina.com>
	<1035782975.3398.128.camel@gopher> <20021028101739.F16452@sistina.com>
	<1035866273.9074.74.camel@gopher> <20021029101033.A22193@sistina.com>
	<1035921224.1276.24.camel@gopher> <20021031134804.A491@sistina.com>
	<1036104859.21418.104.camel@pslgregory> <20021105152824.E27825@sistina.com>
	<1036727077.7035.50.camel@pslgregory>  <20021109130628.B12935@sistina.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-cnKQDd93tK6iFq3rNGSu"
Message-Id: <1038001112.3299.17.camel@pslgregory>
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
Date: Fri Nov 22 15:51:04 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-cnKQDd93tK6iFq3rNGSu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2002-11-09 at 04:06, Heinz J . Mauelshagen wrote:
>=20
> Gregory,
>=20
> this proves my assumption right that something is fishy with the high
> memory support in your SMP environment.
>=20
> I guess that it might work as well in case you make a single processor ke=
rnel
> _with_ high memory enabled and repeat the very same test and that it migh=
t
> be a highmem/smp problem still to be fixed.

I'll give this a try in the next week or so and get back to you.

--=20
Gregory K. Ade <gkade@bigbrother.net>
http://bigbrother.net/~gkade
OpenPGP Key ID: EAF4844B  keyserver: pgpkeys.mit.edu

--=-cnKQDd93tK6iFq3rNGSu
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA93qPWeQUEYOr0hEsRAi0mAJ42K7+FPdjhX4AUT7rA2uDMc1iazgCg04ou
8kmGj9v9Fx1u9/nbL0UIr8w=
=2a6f
-----END PGP SIGNATURE-----

--=-cnKQDd93tK6iFq3rNGSu--
