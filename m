From: AJ Lewis <lewis@sistina.com>
Message-ID: <20030108165545.GC25266@antimony.sistina.com>
References: <Pine.LNX.4.33.0301081907180.471-100000@epsilon.cs.karelia.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0301081907180.471-100000@epsilon.cs.karelia.ru>
Subject: [linux-lvm] Re: lvm question
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
Date: Wed Jan  8 10:48:02 2003
List-Id: <linux-lvm.redhat.com>
To: Timophey.Nazarov@cs.karelia.ru
Cc: linux-lvm@sistina.com

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

You really should match the version of your LVM module and tools.  I suggest
you upgrade to LVM 1.0.6 for both the kernel driver and the tools.  The
version mismatch is likely causing the segfault.

On Wed, Jan 08, 2003 at 07:27:22PM +0300, Timophey V. Nazarov wrote:
> Hello.
> Maybe it will be usefull for you.
> I use RedHat Linux 7.0, kernel 2.2.21 with lvm driver (v1.0.2) as loadable
> module, which has been compiled from ftp sources, and lvm software
> (v0.9.1_beta7), which has been got from ftp server in binary form.
> Now I cannot remove one VG by vgremove. I can pvcreate, vgcreate,
> lvcreate, [vg,lv]rename, vgreduce, etc. All but vgremove.
>=20
> When I try to vgremove it returns me "Segmentation fault" after
> "...initializing all physical volumes".
>=20
>=20
> A propos, in HOWTO at tLDP you said that initscripts RH Linux 7, 7.1 are
> able to work with LVM, but I use RH7 and I customized initscripts
> manually.
>=20
>=20
> 	Timophey
>=20
>=20

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              E-Mail: lewis@sistina.com
Minneapolis, MN 55414
http://www.sistina.com

Current GPG fingerprint =3D FE77 4B43 6A9B F982 A731  02FA 2BF5 7574 294A A=
A5A
Grab the key at: http://people.sistina.com/~lewis/gpg.html or one of the
many keyservers out there...
-----Begin Obligatory Humorous Quote----------------------------------------
I have yet to meet a C compiler that is more friendly and easier to use
than eating soup with a knife.
-----End Obligatory Humorous Quote------------------------------------------

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE+HFgRK/V1dClKqloRAl1RAJ0YF4UAj5Mv30teCCY71Gt53zTSIQCfSBTP
QwYksttl/nq8JhzIgxxwFlY=
=M4HU
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
