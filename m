Return-Path: <hopper@omnifarious.mn.org>
Date: Tue, 27 Feb 2001 15:04:17 -0600
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] Possible to raise Max LV?
Message-ID: <20010227150417.A22325@omnifarious.mn.org>
References: <20010227213517.G29642@vestdata.no> <200102272055.f1RKt5S27720@webber.adilger.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <200102272055.f1RKt5S27720@webber.adilger.net>; from adilger@turbolinux.com on Tue, Feb 27, 2001 at 01:55:05PM -0700
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

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2001 at 01:55:05PM -0700, Andreas Dilger wrote:
> Ragnar Kj_rstad writes:
> > What about increesing the [PE size] default, to say 32 MB?
> > 32 MB should be enough for everyone (because of the 2TB limit), and 16
> > MB waste on every PV isn't that bad.
>=20
> So says the guy from a company called "Big Storage" ;-).  However,
> I've seen several people who make multiple partitions on a single
> disk, and then turn these into PVs (don't ask me why), so they would
> be wasting 16MB per partition.  Most people will not need 2TB LVs for
> some time to come.  However, if your systems usually have large LVs,
> then it is OK for you to increase the default for your systems.

	I actually intend to for mine sometime later because it reduces
the fragmentation problem.  I know it shouldn't be that big a deal with
4M PEs, but with 32M PEs it'll be even less of a deal.  :-)

	I actually thinking of generally scaling my PEs to around 0.1%
of my total available space on the theory that allocation of finer
grained chunks than that is kinda silly.

	If I weren't working on some stuff of my own, I'd dive in and
see if I could write a defrag utility for LVM.  The part I'm not sure
how I'd handle would be striped LVs.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6nBZQG4QeWBeRdS8RAv94AJ9dC9oK1tyahSntrS41wt4tVoOKRACfTeFe
y/L4E79d7gjBYXB+MvnKIwg=
=qD1x
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
