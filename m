Return-Path: <lewis@sistina.com>
Date: Fri, 15 Jun 2001 09:18:05 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] $(DESTDIR) inclusion into Makefile.in files
Message-ID: <20010615091805.A8645@sistina.com>
References: <Pine.LNX.4.33.0106151209260.29617-100000@falka.mfa.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0106151209260.29617-100000@falka.mfa.kfki.hu>; from dice@mfa.kfki.hu on Fri, Jun 15, 2001 at 12:12:09PM +0200
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

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2001 at 12:12:09PM +0200, Gergely Tamas wrote:
> It would be probably a good idea to insert a $(DESTDIR) in front of all
> installation targets. This would make packagers life easyer.

Thanks Gergely,
I've been intending to do that but hadn't yet.  Instead of putting it in the
Makefiles themselves though, I put it where the install directories are
defined, make.tmpl.in.  The head of the current CVS has these changes.

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
665.9238429876 - Number of the Pentium Beast
-----End Obligatory Humorous Quote------------------------------------------

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7KhkdpE6/iGtdjLERAnxlAKCKZMU3/B3jXz60UGLeqf3qqaJfOACfRW+q
Q7sCwIk48h96KF8dSzUSXD8=
=BNvD
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
