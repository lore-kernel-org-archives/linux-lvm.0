Return-Path: <lewis@sistina.com>
Date: Fri, 27 Jul 2001 13:29:10 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] snapshots & reiserfs
Message-ID: <20010727132910.A20153@sistina.com>
References: <Pine.LNX.4.33.0107271727460.16916-100000@greebo.foobarhouse.com> <20010727125542.B14486@sistina.com> <20010727125750.M5363@unirez.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <20010727125750.M5363@unirez.com>; from mark@unirez.com on Fri, Jul 27, 2001 at 12:57:50PM -0500
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

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2001 at 12:57:50PM -0500, Mark Bainter wrote:
> AJ Lewis [lewis@sistina.com] wrote:
> > You need to make sure you apply the linux-2.4.x-VFS-lock.patch, and also
> > apply this:
> >=20
> [snip]
> >=20
> > Apply the patches in this order:
> >  - LVM Beta8 patch
> >  - VFS-lock patch
> >  - the patch included in this email
> >=20
> > Regards,
>=20
> Hrm.  Do you have to be running LVM Beta8, or can those two patches
> be used with the current kernel version?  (.9.0 I think?)

I don't know.  The current kernel version is rather broken AFAIK, so I
really can't recommend using it.  We're working on getting the latest stuff
into the kernel, but it is *very* slow going.

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
Chaos, panic, pandemonium - my work here is done
-----End Obligatory Humorous Quote------------------------------------------

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7YbL2pE6/iGtdjLERAi0FAJ9Q+c9RfC4uFNCNKeA0NUNhQ5oBPQCbBV/2
Ifa1yDG+gKkGBnSUvQVNfxo=
=aqKD
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
