Date: Wed, 17 Oct 2001 14:07:34 -0500
From: "Chad C. Walstrom" <chewie@wookimus.net>
Subject: Re: [linux-lvm] problem to compile lvm-1.0.1.rc4
Message-ID: <20011017140734.B3930@wookimus.net>
References: <000001c1571f$91f28f80$6c88e289@tweety> <000b01c15720$47f76490$7b02a8c0@bor1mp0999>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline
In-Reply-To: <000b01c15720$47f76490$7b02a8c0@bor1mp0999>
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

--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2001 at 05:27:48PM +0200, Raynaud frederic wrote:
> use kgcc instead of gcc.
> i have compile lvm-1.0.1.rc4 this afternoon with kgcc (the compilation
> failed with gcc 2.96)

Ugh.  Let's qualify that statement.  If you're using Red Hat, it would
be wise to use their screwed up, renamed, earlier version of gcc called
kgcc.  gcc-2.96 wasn't stable when Red Hat packaged it and pushed it out
to the world.

If you're using Debian stable/testing or any other sane distribution,
just use the default gcc, which should be gcc-2.95.x.

--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Key fingerprint =3D B4AB D627 9CBD 687E 7A31  1950 0CC7 0B18 206C 5AFD


--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7zdb2DMcLGCBsWv0RAvf6AJoCpJTvmf+chT/wONc9YBDZs3cyVACfXtGk
6Kg+2Rtxh/AKreh6UUm9GCk=
=dPly
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
