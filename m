Subject: Re: [linux-lvm] software RAID over LVM
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <3C5831E7.9060705@birddog.com>
References: <3C5831E7.9060705@birddog.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="=-qAoCXkDfHO1c6P+ih+JM"
Message-Id: <1012413308.12412.3.camel@UberGeek>
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
Date: Wed Jan 30 11:55:04 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-qAoCXkDfHO1c6P+ih+JM
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I was stating that it's the way you'd want to do that. Doing otherwise
would be bad. :)=20


On Wed, 2002-01-30 at 11:48, Kirby C. Bohling wrote:
> Austin,
>=20
> 	Just as an aside, I have done all of those configurations with
> no LVM=20
> involved.  RAID0+1, RAID1+0, and RAID5 on top of mirrored devices.  Yes=20
> RAID1+0 isn't very smart, but we did it.  It is much simpiler, and more=20
> reliable to have RAID underneath LVM.  Not because LVM is unreliable,=20
> but if you forget, or don't realize both halves of a mirror got migrated
>=20
> to the same disks your mirror might be a lot less redundant then you=20
> believe it is.  Wow, I just restated the a FAQ entry in a very poor=20
> manner...
>=20
> 	LVM didn't try to be all incompassing.  It could have been, but
> it would=20
> have made things more complicated and duplicated a bunch of work from=20
> what I have read on this list.
>=20
> 		Kirby
>=20
>=20
> Austin Gonyou wrote:
> > I can think of MANY uses for this. The main one would be a relatively
> > cheap way of making a RAID0+1, or stripe of mirrors. If you don't have
> > any hardware to do this with, then software is next. It'd be nice to
> be
> > able to do this, for sure. You could even do 0+5, or something crazy
> > like that too.
> >=20
> >=20
> > On Tue, 2002-01-29 at 17:50, Kirby C. Bohling wrote:
> >=20
> >>Paul,
> >>
> >>	I haven't done it.  I have done mirrors underneath, but I am
> >>curious what=20
> >>is the reasoning and/or application.  The only thing I can think up is
>=20
> >>so you can migrate your mirrors to faster drives easily.  However,=20
> >>putting the mirror underneath should allow you to move off one mirror=20
> >>onto another.
> >>
> >>	I don't believe that mirroring can be expanded like a filesystem
> >>can.  In=20
> >>order to make the mirror bigger, you have to break the mirror as far
> as=20
> >>I know.  So what are you planning on doing with it, or is it just "to=20
> >>see if it could be done".
> >>
> >>	Thanks,
> >>		Kirby
> >>
> >>lvm@agilecat.mailshell.com wrote:
> >>
> >>>Hi all,
> >>>
> >>>I understand the use of LVM over software RAID.
> >>>But is it possible to use software RAID ON TOP
> >>>of LVM?  For example, have a RAID-1 mirroring
> >>>array created from two logical volumes.
> >>>
> >>>I've tried and it seems to be working.  Is
> >>>it safe to do this?  Any pitfalls?
> >>>
> >>>Thanks!
> >>>
> >>>Paul
> >>>
> >>>_______________________________________________________
> >>>The FREE service that prevents junk email http://www.mailshell.com
> >>>
> >>>_______________________________________________
> >>>linux-lvm mailing list
> >>>linux-lvm@sistina.com
> >>>http://lists.sistina.com/mailman/listinfo/linux-lvm
> >>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >>>
> >>>
> >>
> >>
> >>_______________________________________________
> >>linux-lvm mailing list
> >>linux-lvm@sistina.com
> >>http://lists.sistina.com/mailman/listinfo/linux-lvm
> >>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >>
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

--=-qAoCXkDfHO1c6P+ih+JM
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8WDN894g6ZVmFMoIRAp+pAKDJFpH1V9u2RolMXuEtICdihE78IACcDoEk
Mz9nCV+svrv13/qwWCzJPFA=
=8Pil
-----END PGP SIGNATURE-----

--=-qAoCXkDfHO1c6P+ih+JM--
