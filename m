From: AJ Lewis <lewis@sistina.com>
Message-ID: <20020715192652.GA5740@antimony.sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
Subject: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.0.5 available at www.sistina.com
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
Date: Mon Jul 15 14:21:03 2002
List-Id: <linux-lvm.redhat.com>
To: lvm-devel@sistina.com, linux-lvm@sistina.com

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey all,

A tarball is available now at

   <http://www.sistina.com/>

for download.

Changelog for 1.0.4 to 1.0.5

Driver
------
o Fixed pvmove lock bug in lvm_do_le_remap
o use blk_ioctl() of blkpg.c in lvm_blk_ioctl in order to support BLKBSZSET
  and other general ioctls
o Fixed OBO error on vg array access


Tools
-----

o vgscan
  - Workaround for minor metadata corruption bug in 1.1rc,
    for those downgrading.
o vgcfgbackup
  - running vgcfgbackup with no VGs is not an error


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
I can bend minds with my spoon.
-----End Obligatory Humorous Quote------------------------------------------

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9MyH8mC1ze528TskRAnioAKC3AbG1DtBNttGGFj5/oob2dzjz2wCfYfQ8
NxvzRNdg5lh+nCQ3De9ZkDU=
=LcYt
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
