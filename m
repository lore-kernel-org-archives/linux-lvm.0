Return-Path: <lewis@sistina.com>
Date: Thu, 21 Jun 2001 09:28:11 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Re: another nice feature for packagers ...
Message-ID: <20010621092811.A7832@sistina.com>
References: <20010618103116.A32391@sistina.com> <34770000.993090545@dizzy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <34770000.993090545@dizzy>; from lembark@wrkhors.com on Wed, Jun 20, 2001 at 09:29:05PM -0500
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

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2001 at 09:29:05PM -0500, Steven Lembark wrote:
> > Care to explain further?  I don't know what you're talking about here.
> > --prefix works fine for me in all cases.
>=20
> Try:
>=20
> 	./configure --prefix=3D/lvm;
>=20
> build and install everything.  Notice where the vgXX directories go:  /de=
v,
> not /lvm.  None of the configure switches (last time I compiled) were able
> to keep the vg's out of devfs's clutches w/o hacking a #define in the cod=
e.
> As a temporary fix until all the devfs glitches are worked out (some not =
lvm
> related) it'd be nice to avoid problems.=20

Erm...this was never intended to change where the device nodes go, only
where the tools and libs and docs go.  There's a simple solution: don't
use devfs.  Or submit patches.  That's the beauty of free software. You can
do that.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
I can bend minds with my spoon.
-----End Obligatory Humorous Quote------------------------------------------

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7MgR7pE6/iGtdjLERAvpsAJ9fg06aTzy8lELhcHmk/KarbZ9QxgCeLl74
GxHZ9OlT544CFSDBsF4LpEk=
=A5J8
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
