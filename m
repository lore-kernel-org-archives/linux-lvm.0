Date: Mon, 17 Sep 2001 16:54:16 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Phantom Vol Grp
Message-ID: <20010917165416.A13723@sistina.com>
References: <3BA66769.1030001@kenamea.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <3BA66769.1030001@kenamea.com>; from kenny@kenamea.com on Mon, Sep 17, 2001 at 02:13:13PM -0700
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

--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 17, 2001 at 02:13:13PM -0700, Kenny Gorman wrote:
> I can not delete a vol grp, but it doesn't show as there.  When I try to=
=20
> create a new one with the same name, then it says it exists...  how do I=
=20
>   'clean out' old references?
>=20
> See below:
>=20
> colobus:~ # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sdb1" of VG "oraredo1" [100 MB / 100 MB free]
> pvscan -- inactive PV "/dev/sdb2" is in no VG  [16.99 GB]
> pvscan -- ACTIVE   PV "/dev/sdc1" of VG "oraredo2" [100 MB / 100 MB free]
> pvscan -- inactive PV "/dev/sdc2" is in no VG  [16.99 GB]
> pvscan -- ACTIVE   PV "/dev/sdd1" of VG "redogrp3" [17.09 GB / 16.98 GB=
=20
> free]
> pvscan -- ACTIVE   PV "/dev/sdd2" of VG "sysgrp"   [16.99 GB / 12.49 GB=
=20
> free]
> pvscan -- total: 6 [68.26 GB] / in use: 4 [34.28 GB] / in no VG: 2=20
> [33.98 GB]
>=20
> colobus:~ # vgcreate indxgrp /dev/sdc2
> vgcreate -- volume group directory or file already exists
> vgcreate -- please choose a different name

I believe this is referring to the /dev/indxgrp directory...look at that and
if you know you don't need it, rm it.

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 60F3 160D C0D5 2C4B 751B  4FF9 6F67 E9BC 44CD D=
E95

-----Begin Obligatory Humorous Quote----------------------------------------
cthread. cthread_fork(). Fork, thread, fork!
-----End Obligatory Humorous Quote------------------------------------------

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7pnEIb2fpvETN3pURAphVAKCpMpyn0TlUU3AayVq+6Vhpe+h+rACfTu19
Bzign8IV1cuWCws7hZImShE=
=5Guy
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
