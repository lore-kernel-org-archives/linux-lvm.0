Date: Thu, 23 Aug 2001 07:09:22 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Building outside source tree
Message-ID: <20010823070922.C2885@sistina.com>
References: <20010821121229.A4661@sistina.com> <20010821192307.2864.qmail@dumain.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Content-Disposition: inline
In-Reply-To: <20010821192307.2864.qmail@dumain.com>; from wish-lvm@dumain.com on Tue, Aug 21, 2001 at 08:23:07PM +0100
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

--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2001 at 08:23:07PM +0100, wish-lvm@dumain.com wrote:
> My original patch works only if given an absolute path to the source.
> Your patch works only if the path to source is precisely ..
> Incidentally it would appear that relative paths to the kernel
> source don't work either. =20
> I'll fix the patch and resubmit it.

Fixed in the CVS now.  Looking into relative kernel source paths...

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
A bad random number generator: 1, 1, 1, 1, 1, 4.33e+67, 1, 1, 1...
-----End Obligatory Humorous Quote------------------------------------------

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7hPJypE6/iGtdjLERAsxyAJ0YSqknaoXm+gxcXCL83SpO0mC8UQCglpWy
h8iy6/aN5hMCZzE61ijEHvE=
=+N+X
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--
