Return-Path: <lewis@sistina.com>
Date: Mon, 30 Jul 2001 12:00:49 -0500
From: AJ Lewis <lewis@sistina.com>
Message-ID: <20010730120049.A3125@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
Subject: [linux-lvm] Odd snapshot behavior
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

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm seeing very odd snapshot behavior with Linux 2.4.7 and LVM 0.9.1 Beta8,
and the VFS-lock patch.  Even without the VFS-lock path, ext2 seems to cache
stuff up so the snapshot directory doesn't appear to be disabled for quite a
while.

2.4.7 with LVM 0.9.1 beta8 and VFS-lock patch
---------------------------------------------

ReiserFS
--------

Make LV (500m)
mkreiserfs
mount LV
cp something to it
make snapshot (16m)
mount snapshot
cp enough to LV to fill snapshot
sync
ls to a known directory in snapshot:

kernel BUG at namei.c:343!

Entering kdb (current=3D0xc5d42000, pid 338) Oops: invalid operand
due to oops @ 0xc8824c68
eax =3D 0x0000001b ebx =3D 0xc5d43e50 ecx =3D 0xc79fe000 edx =3D 0xc02bd964=
=20
esi =3D 0xc883e7b0 edi =3D 0xc5d43ed4 esp =3D 0xc5d43e38 eip =3D 0xc8824c68=
=20
ebp =3D 0xc5d43e68 xss =3D 0x00000018 xcs =3D 0x00000010 eflags =3D 0x00010=
286=20
xds =3D 0x00000018 xes =3D 0x00000018 origeax =3D 0xffffffff &regs =3D 0xc5=
d43e04
kdb> bt
    EBP       EIP         Function(args)
0xc5d43e68 0xc8824c68 [reiserfs]reiserfs_find_entry+0x88 (0xc7ec2bc0, 0xc7e=
34b7c, 0x4, 0xc5d43e94, 0xc5d43ed4)
                               reiserfs .text 0xc8821060 0xc8824be0 0xc8824=
d24
           0xc8824d90 [reiserfs]reiserfs_lookup+0x6c (0xc7ec2bc0, 0xc7e34b2=
0)=20
                               reiserfs .text 0xc8821060 0xc8824d24 0xc8824=
de8
           0xc0134b98 real_lookup+0x58 (0xc20137e0, 0xc5d43f5c, 0x0)       =
  =20
                               kernel .text 0xc0100000 0xc0134b40 0xc0134c0c
0xc5d43f68 0xc013525d path_walk+0x541 (0xc124c00c, 0xc5d43fa0)             =
=20
                               kernel .text 0xc0100000 0xc0134d1c 0xc0135490
0xc5d43f84 0xc013584c __user_walk+0x3c (0xbffffea8, 0x8, 0xc5d43fa0)       =
=20
                               kernel .text 0xc0100000 0xc0135810 0xc013586c
0xc5d43fbc 0xc0132a73 sys_lstat64+0x17 (0xbffffea8, 0x8053774, 0x401368e0, =
0x4013a050, 0xbffffea8)
                               kernel .text 0xc0100000 0xc0132a5c 0xc0132acc
           0xc0106b9b system_call+0x33                                     =
=20
                               kernel .text 0xc0100000 0xc0106b68 0xc0106ba0


---------------------------------------------------------------------------=
---

ext2
----

Make LV (500m)
mke2fs
mount LV
cp something to it
make snapshot (16m)
mount snapshot
cp enough to LV to fill snapshot
sync
ls to the snapshot mount:

# ls /demo2
boot  lost+found

ls to a known directory in snapshot:

/demo2/boot=20
ls: /demo2/boot: Input/output error

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
Sleep: A completely inadequate substitute for caffeine
-----End Obligatory Humorous Quote------------------------------------------

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7ZZLBpE6/iGtdjLERAkBBAJ4glYTdVJJXuheMpe2EnA5u37PiJwCeO2qY
tGb0OCnCSkp70dABhQDUnp0=
=X74D
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
