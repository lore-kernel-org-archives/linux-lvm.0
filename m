Return-Path: <lewis@sistina.com>
Date: Fri, 16 Mar 2001 14:22:44 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] LVM 0.9.1 Beta6 RPMS
Message-ID: <20010316142244.A5505@sistina.com>
References: <20010316124446.B1478@sistina.com> <20010316131523.A21757@omnifarious.mn.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <20010316131523.A21757@omnifarious.mn.org>; from hopper@omnifarious.mn.org on Fri, Mar 16, 2001 at 01:15:23PM -0600
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

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 16, 2001 at 01:15:23PM -0600, Eric M. Hopper wrote:
> On Fri, Mar 16, 2001 at 12:44:46PM -0600, AJ Lewis wrote:
> > LVM 0.9.1 Beta6 RPMS are up on the Sistina FTP site:
> > ftp://ftp.sistina.com/pub/LVM/0.9.1_beta/binaries/redhat
> >=20
> > These are based on the Connectiva LVM packages, but were created on a
> > Redhat 6.2 system.  (I think they will work on any RPM based system
> > though...) They use a modified version of the wrapper script (it uses
> > sed instead of basename and the libary name has changed).  You need to
> > grab at a minimum, the lvm-base, lvm-iop10, and lvm-iop10-lib
> > packages.
>=20
> 	Would you consider releasing kernel patches against the 2.4.x
> series kernels?

This is what the lvm-iop10-patchgen package is for.  It contains a tarball
with the patch generation code in it.  Read the README in the main source
tree when you untar it and follow the instructions to generate a patch.  Let
me know if you have any questions about how it works.

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
Sleep: A completely inadequate substitute for caffeine
-----End Obligatory Humorous Quote------------------------------------------

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6snYUpE6/iGtdjLERAoWWAJ9EcOubSbIr8tc1/HDUJpMKTUMDjQCfXxuE
6XqFzP/6X6Rk7mgrtwyTwLI=
=Nd42
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
