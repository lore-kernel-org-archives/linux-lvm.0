Subject: Re: [linux-lvm] cannot extend lv
Message-ID: <20030119180753.GA15083@mitethe.eudyptes>
References: <3E2A7AE4.8080801@informatik.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <3E2A7AE4.8080801@informatik.uni-erlangen.de>
From: idsfa@visi.com
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
Date: Sun Jan 19 12:07:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: Rainer.Lay@informatik.uni-erlangen.de

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 19, 2003 at 10:16:04AM +0000,
Rainer.Lay@informatik.uni-erlangen.de wrote:
> My idea was not to make a 4 stripe set with 4 PV, but a 2 stripe set:
>=20
> stripe1: aaaaaaaaabbbbbb
> stripe2: cccccccccdddddd
>=20
> so if PV a and c are full, PV b and d are used.

Striping doesn't work that way.  It stripes across all pvs EVENLY
to improve access speeds (the whole reason to stripe).  The only
way to do what you want would have been to use kernel RAID to combine
the physical devices into a single logical device before creating the
stripe set.

> I would create a new lv as you suggested, but drives a and c are two=20
> times bigger than b and d, so I thought about the above solution.

I understand, I went through the same exercise two months ago.  I
borrowed a disk from a friend, moved all of the data to it, and rebuilt
my whole VG setup.  It was a major pain in the neck.

Michael
--=20
Think Locally, Act Globally: =20
"It's cold in here ... I'd better release a few million tons of CFCs!"

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+Kul5zCEwIKHWl1kRAmg/AJ90/4mcdOMGIWFqc3nKv5OmUpbHCACdGWHi
2GiU6HdPU+zMOaihQKEOYc0=
=uVT1
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
