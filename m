Return-Path: <hopper@omnifarious.mn.org>
Date: Fri, 16 Mar 2001 14:04:49 -0600
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] LVM 0.9.1 Beta6 RPMS
Message-ID: <20010316140449.A21854@omnifarious.mn.org>
References: <20010316131523.A21757@omnifarious.mn.org> <200103161944.f2GJi6d17583@webber.adilger.int>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <200103161944.f2GJi6d17583@webber.adilger.int>; from adilger@turbolinux.com on Fri, Mar 16, 2001 at 12:44:05PM -0700
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

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 16, 2001 at 12:44:05PM -0700, Andreas Dilger wrote:
> Eric Hopper writes:
> > On Fri, Mar 16, 2001 at 12:44:46PM -0600, AJ Lewis wrote:
> > > LVM 0.9.1 Beta6 RPMS are up on the Sistina FTP site:
> > > ftp://ftp.sistina.com/pub/LVM/0.9.1_beta/binaries/redhat
> >=20
> > 	Would you consider releasing kernel patches against the 2.4.x
> > series kernels?
> >=20
> > 	I want to upgrade to 2.4.x someday soon.  I currently use LVM on
> > my system, but my confusion over exactly what patches I need to apply
> > prevents me from upgrading to 2.4.x.
>=20
> Actually, the LVM CVS (and I assume tarball as well) is fairly well
> set up to handle this.  Since it is a lot of work to maintain patches
> against every kernel (consider each pre, ac kernel also).  They rather
> ship the whole lvm*.[ch].  If you are compiling as a module, you shuld
> be able to compile directly in LVM/kernel (pending a patch that was
> posted today).

	OK.  That makes sense.  Trying to decide if that's a good way to
do it or not.  I guess its easier for brand new users, and so that's a
good thing.  I'm expecting different because of how reiserfs does things
and previous experience with LVM.  :-)

> Generally, the current LVM kernel code will work properly with the
> current tools.  On occasion, the current tools will not work with an
> older kernel (or vice versa).  It is my opinion that we should treat
> that as a bug to be fixed, until such a time we really need to
> increase the IOP version, at which point the kernel/tools will refuse
> to work with older code.

	It seems to me like newer versions of the tools should work with
older kernel code up to a certain number of versions back.

Thanks,
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6snHhG4QeWBeRdS8RAmOPAJ40bKwyFIaOSsU28LEVkGuivuRzmQCgr3ax
6FnCYzj7dokuFBLas18NxIY=
=QttX
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
