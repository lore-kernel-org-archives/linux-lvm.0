Subject: Re: [linux-lvm] software RAID over LVM
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <20020130094342.GA13425@colombina.comedia.it>
References: <20020130094342.GA13425@colombina.comedia.it>
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="=-SfE7DzmuHq6Wsx4C5r7t"
Message-Id: <1012410289.11805.0.camel@UberGeek>
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
Date: Wed Jan 30 11:05:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-SfE7DzmuHq6Wsx4C5r7t
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Right, that's what I'm talking about. If you didn't do it that way,
you'd be screwed! :)=20

On Wed, 2002-01-30 at 03:43, Luca Berra wrote:
> Well, since the whole point of having LVM is ease of resizing logical
> volumes,
> and resizing MD device is impossible or painful, i do not really
> understand
> why should anyone want to do this.
> If mirroring were to be implemented over lvm, it should be at the PE/LE
> level,
> in the LVM driver itself, since this is not true (search archives for
> the reasoning
> behind this) the only sensible chance is having LVM over MD.
>=20
> On Tue, Jan 29, 2002 at 10:58:26PM -0600, Austin Gonyou wrote:
> > I can think of MANY uses for this. The main one would be a relatively
> > cheap way of making a RAID0+1, or stripe of mirrors. If you don't have
> > any hardware to do this with, then software is next. It'd be nice to
> be
> > able to do this, for sure. You could even do 0+5, or something crazy
> > like that too.
>=20
>=20
>=20
> --=20
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
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

--=-SfE7DzmuHq6Wsx4C5r7t
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8WCew94g6ZVmFMoIRAortAJ99VrkPi7PADuiUsVHRl7qgV5+mGwCgy7wk
iPxwAa4T4abYqUYLOuNbyds=
=jR/k
-----END PGP SIGNATURE-----

--=-SfE7DzmuHq6Wsx4C5r7t--
