From: AJ Lewis <lewis@sistina.com>
Message-Id: <20020502215808.GA492@antimony.sistina.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
Subject: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.0.4 available at www.sistina.com
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
Date: Thu May  2 16:56:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, lvm-devel@sistina.com

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

To clarify, this is a stable release with bugfixes for 1.0.3 only.  Try LVM2
if you want to track the latest developments in LVM.

LVM 1.0.4 supports both version 1 and 2 of the metadata.

There's *no* need to run any metadata update tools.

A tarball is available now at

   <http://www.sistina.com/>

for download (Follow the "LVM 1.0" link).

Changelog for 1.0.3 to 1.0.4

Driver
------

o Support for NBD
o /proc/partitions segfault fixed

Tools
-----

o pvmove
  - bug preventing moves beyond a 2GB offset fixed
  - try to move snapshot extents rejected
  - ignore_read bug fixed

Library
-------
o pv_move.c, liblvm.h
  - bug preventing moves beyond a 2GB offset fixed
  - ignore_read bug fixed
  - try to move snapshot extents rejected


Send LVM related feedback to <linux-lvm@sistina.com>.

Thank you for your support of LVM.
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              E-Mail: lewis@sistina.com
Minneapolis, MN 55414
http://www.sistina.com

Current GPG fingerprint =3D  7792 2F3E 9D86 DA4C 9111 7837 982D 737B 9DBC 4=
EC9
-----Begin Obligatory Humorous Quote----------------------------------------
Sticks and stones may break my bones, and so would an 80 lb. carrot.
-----End Obligatory Humorous Quote------------------------------------------

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (FreeBSD)
Comment: For info see http://www.gnupg.org

iD8DBQE80bZwmC1ze528TskRAhcGAJkBTPcnyiTeJ0QbHJs737H8J059lACcDvIy
pGXAhh77pLz9oLmdUE7aChM=
=HF6d
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
