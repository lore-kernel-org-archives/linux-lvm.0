Date: Wed, 29 Dec 1999 14:11:46 -0600
From: Robert Haig <rhaig@deja.com>
Subject: [linux-lvm] vgcreate core dumps
Message-ID: <19991229141146.A15001@deja.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I'm perplexed.

here's what happened
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
# fdisk /dev/sdb

Command (m for help): p

Disk /dev/sdb: 255 heads, 63 sectors, 553 cylinders
Units =3D cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sdb1             1       553   4441941   8e  Unknown

Command (m for help): q

# pvcreate /dev/sdb1
pvcreate -- reinitializing physical volume
pvcreate -- physical volume "/dev/sdb1" successfully created

# vgcreate test_vg /dev/sdb1
Segmentation fault (core dumped)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
here's the state of my machine

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
# cat /proc/lvm
LVM module version 0.8i  (02/10/1999)

Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
Global: 140 bytes vmalloced   IOP version: 5   0:04:12 active

# uname -r
2.3.33

# lsmod
Module                  Size  Used by
lvm                    99920   0=20
3c509                   7188   1  (autoclean)

# vgcreate --help
vgcreate: invalid option -- -

Logical Volume Manager 0.8 by Heinz Mauelshagen  17/09/1999
<snipped, just looking for version>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I've also tried with the partition type set to 0xfe
with the same results. I've tried using the lvm module
and with lvm compiled directly into the kernel, with the=20
same results.

I'm obviously missing something here.  I just don't know what it is.

thanks for any help

--=20
Rob

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.0 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE4amsCKjdNQof+Cx4RAT2sAKCXYbkVfyAyLjNGSMlYcdPvK3WwnACfW+YZ
PiHzuXO/fdHytMd+a8E98FY=
=p161
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
