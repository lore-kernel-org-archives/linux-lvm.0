Date: Tue, 28 Aug 2001 14:53:02 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] lvm-1.0.1-rc1 doesn't generate proper patch for linux-2.4.10-pre1
Message-ID: <20010828145302.A25358@sistina.com>
References: <20010828135726.A22794@beaver.iucha.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <20010828135726.A22794@beaver.iucha.org>; from florin@iucha.net on Tue, Aug 28, 2001 at 01:57:26PM -0500
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

On Tue, Aug 28, 2001 at 01:57:26PM -0500, Florin Iucha wrote:
> There is a problem with generating the lvm-1.0.1-rc1 patch for kernel
> 2.4.10-pre1.=20
>=20
> The patched kernel will not compile because of the
>    get_hardsect_size/get_hardblocksize problem that occured in the transi=
tion
> from 2.4.2 to 2.4.3.
>=20
> Thinking about it a little, it looks like the patching mechanism got conf=
used
> about the kernel version and generated a patch for 2.4.1 . I am not sure =
about
> this and I have not investigated it, but it smells like it.
>=20
> Please look into it.

Yep, the comparison in select_fragements is wrong.  We're workign on it.

Thanks.
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
Computer Science: solving today's problems tomorrow.
-----End Obligatory Humorous Quote------------------------------------------

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7i/aepE6/iGtdjLERApPxAJ9rHVebJ5essK9FHClZu6rzJ58rFQCfdtY8
mh6n1tiiTPggj3i41VqxYRY=
=EaCi
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
