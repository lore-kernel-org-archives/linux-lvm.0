Return-Path: <lewis@sistina.com>
Date: Tue, 21 Aug 2001 11:22:52 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] vgscan && vgchange -ay at startup
Message-ID: <20010821112252.A21206@sistina.com>
References: <20010821130033.D402@sky.net> <20010821070403.A16248@sistina.com> <3B8267F5.D3174CAB@tls.msk.ru> <20010821160012.E25747@dragon.blacknet.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <20010821160012.E25747@dragon.blacknet.de>; from bock@blacknet.de on Tue, Aug 21, 2001 at 04:00:12PM +0200
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

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2001 at 04:00:12PM +0200, Goetz Bock wrote:
>=20
> On Tue, Aug 21 '01 at 17:53, Michael Tokarev wrote:
> > But how to have root mounted read-only?
> > I resolved problem with only one file that needs to be read-write --
> > it is /etc/mtab that I moved out to /var/run (modified glibc and
> this should be fixable with making /etc/mtab a link to /proc/mounts

I've done this on my system for about a month it seems to work fine.

> > mount itself).  So my root is now read-only at all times.  But how
> > to deal with lvm?  Should I move /etc/lvm* to /var also?
> The ideal solution would be to have LVM not write any files at all and
> do everything in memory. If I want to make a backup (e.g. when changing
> anything) either make the meta data journaling or save the backup to
> some where in /var
>=20
> just my =DB0.02 (soon equal to $0.02, btw on my mac this is an euro sign)

Yeah, that's in the works for the development version of LVM, but the 1.0x
series will likely always have the files in /etc.  I agree that it is better
not to have it write files by default, or at least not rely on them being
written out.

> But, I won't complain. LVM rocks as it is and I'm happy with it.=20

:)

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
A computer without a Microsoft operating system is like a dog without bricks
tied to its head.
-----End Obligatory Humorous Quote------------------------------------------

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7gorcpE6/iGtdjLERAoEOAJ9H4elkT1FbmU55FzlNpDv1SPt+RQCfVQSt
77+/XRRFc7fude14tX0QB1c=
=iRAA
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
