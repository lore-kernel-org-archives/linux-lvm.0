Return-Path: <lewis@sistina.com>
Date: Mon, 30 Jul 2001 09:22:42 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Changing partition names?
Message-ID: <20010730092242.A28850@sistina.com>
References: <20010730070457.A10441@sistina.com> <Pine.LNX.4.21.0107310046190.12641-100000@server.gordon.co.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0107310046190.12641-100000@server.gordon.co.nz>; from donald@gordon.co.nz on Tue, Jul 31, 2001 at 12:48:35AM +1200
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

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2001 at 12:48:35AM +1200, Donald Gordon wrote:
> On Mon, 30 Jul 2001, AJ Lewis wrote:
>=20
> > On Mon, Jul 30, 2001 at 11:48:56PM +1200, Donald Gordon wrote:
> > > I can't seem to see any way to tell lvm that the name of one of the
> > > partitions it is using has changed (from /dev/sda10 to /dev/sda8; I'm
> > > transitioning a system to LVM).  Should it pick this up on reboot or =
is
> > > there some config file I need to prod?
> >=20
> > vgscan will do this for you automatically.
> >=20
>=20
> When I (ahem) remove a partition by mistake and re-create it in the same
> location with fdisk vgscan no longer recognises it.
>=20
> Also, is there any way to point vgscan in the general direction of the
> block devices where PVs are to be found?  It takes quite some time to scan
> *everything* on my p75 :(

Are you using devfs?  If so, which version of LVM are you using?  If not, do
you have /proc mounted?  And are the values in /proc/partitions valid?  LVM
should use /proc/partitions on a non-devfs system to determine which devices
to scan.  On a devfs system, LVM should use the dynamically created device
nodes to determine the same.

Of course, this is all assuming you're using the current LVM 0.9.1 beta8
version of LVM.  I'm not positive where this functionality was intruduced.

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
Over and over I find being redundant is key to success
in the art of redundancy - Jay Armstrong
-----End Obligatory Humorous Quote------------------------------------------

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7ZW2ypE6/iGtdjLERAqD5AJ4im+AT7PGg37JuRoOWGj+ARKrXfgCgk6BX
JhWDwjI7Y/j5G/PSBkh+HRI=
=KCE7
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
