Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Fri, 15 Dec 2000 12:15:08 -0600
Subject: Re: [linux-lvm] Debian packaging
Message-ID: <20001215121508.A9183@sistina.com>
References: <0012132115222N.00826@lyta> <20001214104641.A15193@sistina.com> <0012150751103E.00826@lyta>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <0012150751103E.00826@lyta>; from russell@coker.com.au on Fri, Dec 15, 2000 at 07:51:10AM +0100
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
To: Russell Coker <russell@coker.com.au>
Cc: linux-lvm@sistina.com, tal26@cam.ac.uk

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2000 at 07:51:10AM +0100, Russell Coker wrote:
> If you don't reply to email sent to the package maintainer address and do=
n't=20
> fix high-priority bugs in your packages then your packages can be NMU'd=
=20
> without any issue.  After an NMU if there is still no response then they =
are=20
> up for grabs.
>
> If he doesn't want me to take over the package then he will have to reply=
 to=20
> my email.

Sounds good to me.  I want those packages updated and working too.

> >Since the configure.in scripts are essentially the same, you can just su=
bmit
> > a patch to one or the other to the lvm-devel list and we'll get it in on
> > the next release.  I am the one responsible for the conversion of LKM to
> > the autoconf system, so I'd be interested to see how you intend to
> > accomplish this.
>=20
> LKM?

Oops...that's supposed to be LVM.

> >> Also I would prefer to have the Debian packaging files in the upstream
> >> source.  They are about 5K of data in 11 files in a separate
> >> sub-directory. Please let me know if this would be desired/accepted as
> >> part of the LVM upstream source and I will send the relevant patch to =
you.
> >
> >One question.  Why?  Seems completely unnecessary to me.
>=20
> It makes things easier for people doing other distributions amoung other=
=20
> things.  If you had a Red Hat spec file in there then it would have made=
=20
> things a bit easier for me (I could probably find one on the net somewher=
e=20
> but then there's issues of whether it matches the source I've got etc).
> Also if someone submits a patch for lvm then they would (hopefully) also=
=20
> patch the Debian setup in a matching fashion thus saving duplication of=
=20
> effort.
> Debian packaging files in the CVS works well for KDE...

But if you have your packaging scripts setup correctly, when an upstream
version changes, you just run uupdate -u upstream-package.tar.gz and it
updates the source and puts it into the correct tree...seems much easier to
maintain than trying to keep everything current in the CVS.  As long as you
are releasing the debian source tarball as well as the binary, this shouldn=
't
be an issue.

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648

A computer without a Microsoft operating system is like a dog without bricks
tied to its head.

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6Ol+spE6/iGtdjLERAg5fAJ9zpPJq6V1OW310Uji256r+fFKkYACcDaCK
RlGva4JNuUlBFYQWqJaTZzE=
=lGLv
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
