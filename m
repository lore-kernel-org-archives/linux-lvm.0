Return-Path: <lewis@sistina.com>
Date: Mon, 2 Jul 2001 11:47:39 -0500
From: AJ Lewis <lewis@sistina.com>
Message-ID: <20010702114739.B11195@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
Subject: [linux-lvm] UUID fixer released!
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

--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

To help ease the problems people have had transistioning from early 0.9
versions of LVM, I wrote a little program that fixes the missing or
corrupted UUID problem.  You can find it at
ftp://ftp.sistina.com/pub/LVM/contrib/uuid_fixer-0.3-IOP10.tar.gz

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                          UUID FIXER v0.3
                        For LVM 0.9x (IOP 10)
                    AJ Lewis <lewis@sistina.com>

This is a simple LVM utility to ease the problems people see with the LVM
driver in the Linux 2.4.x kernels (Up to 2.4.5 at this point).  After
extending a VG, folks have been known to have 'vgscan' no longer find their
VGs.  This is due to the fact that the UUID list (The list of numbers that
uniquely identifies each PV) in the VG gets messed up.  Previous to this
program, users had to go through a complex process with 'dd' and a hexeditor
to restore this list.

To use it, simply type 'uuid_fixer <PVS>' where PVS are the physical volumes
from a Volume Group.  You must type all of the PVs for the VG, and no more.
uuid_fixer will complain and exit if you do not.

This package contains a statically linked x86 binary, as well as the C code
for the program itself.  The makefile can be tweaked to point to your LVM
source code if you wish to compile it yourself, or you can drop uuid_fixer.c
into the LVM tools directory and just run 'make'.

Please let me know if you have issues with it.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
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
To know recursion, you must first know recursion.
-----End Obligatory Humorous Quote------------------------------------------
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
Programming graphics in X is like finding sqrt(pi) using Roman numerals.
-----End Obligatory Humorous Quote------------------------------------------

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7QKWrpE6/iGtdjLERApktAJ4qDeoyrtUSJmd3z5KUMpMJtfRMwACgiGkf
XJZThTvYwQiLIiFpqc82HKg=
=YM0s
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
