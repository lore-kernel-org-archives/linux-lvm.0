Subject: Re: [linux-lvm] software RAID over LVM
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <3C57354D.1070601@birddog.com>
References: <3C57354D.1070601@birddog.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="=-xGnbs1qil8tID8+1LiFf"
Message-Id: <1012366706.5900.6.camel@UberGeek>
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
Date: Tue Jan 29 22:59:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-xGnbs1qil8tID8+1LiFf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I can think of MANY uses for this. The main one would be a relatively
cheap way of making a RAID0+1, or stripe of mirrors. If you don't have
any hardware to do this with, then software is next. It'd be nice to be
able to do this, for sure. You could even do 0+5, or something crazy
like that too.


On Tue, 2002-01-29 at 17:50, Kirby C. Bohling wrote:
> Paul,
>=20
> 	I haven't done it.  I have done mirrors underneath, but I am
> curious what=20
> is the reasoning and/or application.  The only thing I can think up is=20
> so you can migrate your mirrors to faster drives easily.  However,=20
> putting the mirror underneath should allow you to move off one mirror=20
> onto another.
>=20
> 	I don't believe that mirroring can be expanded like a filesystem
> can.  In=20
> order to make the mirror bigger, you have to break the mirror as far as=20
> I know.  So what are you planning on doing with it, or is it just "to=20
> see if it could be done".
>=20
> 	Thanks,
> 		Kirby
>=20
> lvm@agilecat.mailshell.com wrote:
> > Hi all,
> >=20
> > I understand the use of LVM over software RAID.
> > But is it possible to use software RAID ON TOP
> > of LVM?  For example, have a RAID-1 mirroring
> > array created from two logical volumes.
> >=20
> > I've tried and it seems to be working.  Is
> > it safe to do this?  Any pitfalls?
> >=20
> > Thanks!
> >=20
> > Paul
> >=20
> > _______________________________________________________
> > The FREE service that prevents junk email http://www.mailshell.com
> >=20
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >=20
>=20
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

--=-xGnbs1qil8tID8+1LiFf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8V31y94g6ZVmFMoIRAqTtAKCixylVr2F5XUe+WdzUsy+I26kK8wCeLGy8
o04ka1F5O0Tjllk5RASw00s=
=6ZLh
-----END PGP SIGNATURE-----

--=-xGnbs1qil8tID8+1LiFf--
