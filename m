Return-Path: <lewis@sistina.com>
Date: Sun, 8 Apr 2001 22:40:43 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] 2.2.19 Patches??
Message-ID: <20010408224043.A19238@sistina.com>
References: <Pine.LNX.4.30.0104071239490.1215-100000@leopard.dorfam.ca> <3ACFA28B.AE154AE5@ednet.ns.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <3ACFA28B.AE154AE5@ednet.ns.ca>; from boutilpj@ednet.ns.ca on Sat, Apr 07, 2001 at 08:28:11PM -0300
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

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 07, 2001 at 08:28:11PM -0300, Patrick Boutilier wrote:
> I didn't see that option either but the LVM information is in /proc so it=
 must be
> in by default now.

Precisely right.  If you look at LVM/kernel/lvm.c, you'll see that this was
changed on Jan. 8, 2001.  (search for 08/01/2001)

> gerry@dorfam.ca wrote:
>=20
> > Well, I tried to follow the instructions and surprisingly...LVM is work=
ing
> > with a fresh new 2.2.19 kernel!  I found it confusing to install patches
> > labeled for other kernels.  Also, I don't normally venture into the rea=
lm
> > of building my own kernel patches!
> >
> > I had a question though.  When I got LVM working with the older 2.2.17
> > kernel I had two choices when I was running make xconfig.  The first was
> > to include LVM as inline or a module and the second was for lvm proc
> > support.  This time around with the 2.2.19 kernel I didn't get the lvm
> > proc support option.  Did I miss something???
> >
> > Gerry
> >
> > On Fri, 6 Apr 2001, Patrick Boutilier wrote:
> >
> > > Below is some instructions direct from the README in the PATCHES dire=
ctory.
> > > If you want to get your own raw-io patch get
> > > ftp://ftp.kernel.org/pub/linux/kernel/people/sct/raw-io/kiobuf-2.2.18=
.tar.bz2.
> > > I used raw-2.2.18.FULL.diff to patch my 2.2.19 kernel.
> > >
> > >snip....
> > >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
cthread. cthread_fork(). Fork, thread, fork!
-----End Obligatory Humorous Quote------------------------------------------

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE60S87pE6/iGtdjLERAg1pAJsHzUYr2RaVdmmb+BAeQFibQ30TyACfeUrH
AZ+CgR+EjrvCDXqe3YAewmk=
=UHNT
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
