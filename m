Return-Path: <lewis@sistina.com>
Date: Mon, 2 Jul 2001 11:40:00 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] LVM kernel patch request
Message-ID: <20010702114000.A11195@sistina.com>
References: <3B401947.385A1472@home.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <3B401947.385A1472@home.com>; from tomcosimano@home.com on Mon, Jul 02, 2001 at 01:48:39AM -0500
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

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2001 at 01:48:39AM -0500, Tom Cosimano wrote:
> I'm running Redhat 7.1 kernel vmlinux-2.4.2-2smp.  I have tried a number
> of times and can only conclude that I'm missing some step(s).
> I have downloaded and installed the following RPMs from
> ftp://ftp.sistina.com/pub/LVM/binaries/redhat/0.9.1_beta in the order:
>=20
> 1) lvm-base-1.1-1.i386.rpm
> rebooted
> 2a) lvm-iop10-0.9.1_beta7-1.i386.rpm
> 2b) lvm-iop10-lib-0.9.1_beta7-1.i386.rpm
> 3) lvm-iop10-man-0.9.1_beta7-1.i386.rpm
> 4) lvm-iop10-patchgen-0.9.1_beta7-1.i386.rpm
> rebooted

You need to build a kernel with LVM support built into it to use this.  The
default Redhat kernel does not have this.  The lvm-iop10-patchgen* packages
contain a stripped down version of the LVM source code made just for
patching a stock kernel (from ftp.kernel.org).  If you need a Redhat kernel
that supports LVM, you should talk to Redhat and let them know it is a
requirement of yours.

You should look at the LVM HowTo at http://sistina.com/lvm/Pages/howto.html

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
File not found. Should I fake it? (Y/N)
-----End Obligatory Humorous Quote------------------------------------------
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
Bad command or file name. Bad, bad command! Sit! Stay! Staaaay...
-----End Obligatory Humorous Quote------------------------------------------

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7QKPgpE6/iGtdjLERAio3AJwJmE9wA2wvvGLhQyc4/vlj0uGouACePng2
akuhsnLffsOvgyFTi+gvINI=
=CSbF
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
