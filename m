From: AJ Lewis <lewis@sistina.com>
Message-Id: <20020423161724.GA10057@antimony.sistina.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
Subject: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.1-rc2 available at www.sistina.com
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
Date: Tue Apr 23 11:16:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, lvm-devel@sistina.com

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all - Heinz is unavailable, so I'm sending this out for him again:

LVM 1.1-rc2 release candidate supports both version 1 and 2 of the metadata.

Disclaimer:
-----------
This is not meant to be used on production systems!


There's *no* need to run any metadata update tools.

Please test this release candidate and feed back results to the linux-lvm
list in order to help us to release 1.1 ASAP.

A tarball is available now at

   <http://www.sistina.com/>

for download (Follow the "LVM 1.1-rc2" link).

Changes to LVM 1.1-rc2 include:

Driver
------
o added feature flag support
 =20
Tools
-----
   =20
o single executable with statically linked in liblvm is the default now
 =20
o readline support for the single executable better supports bulk
  updates with less overhead
   =20
o usage functions implemented, cleaned up
 =20
Library
-------
 =20
o lv_change_vgname.c
  lv_read.c
  lv_read_byindex.c
  vg_read_with_pv_and_lv.c
  lvm_uuid.c
  pv_get_size.c
  pv_move.c
  pv_copy.c
  pv_read.c
  pv_read_all_pv_of_vg.c
  vg_name_of_lv.c
  vg_copy.c
  vg_read_from_pv.c
  vg_setup_for_split.c  avoided static structs and struct stack allocations
 =20
o implemented feature flag inlines
 =20
o implemented memory garbage collector


Feed back LVM related information to <linux-lvm@sistina.com>.

Thanks a lot for your support of LVM.

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              E-Mail: lewis@sistina.com
Minneapolis, MN 55414
http://www.sistina.com

Current GPG fingerprint =3D  7792 2F3E 9D86 DA4C 9111 7837 982D 737B 9DBC 4=
EC9
-----Begin Obligatory Humorous Quote----------------------------------------
A computer without a Microsoft operating system is like a dog without bricks
tied to its head.
-----End Obligatory Humorous Quote------------------------------------------

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (FreeBSD)
Comment: For info see http://www.gnupg.org

iD8DBQE8xYkTmC1ze528TskRAjboAKCgxpef9Hv6PLCt0oaPSVWHu3/6nwCfeO6r
JW5DccLjzEta69+GPZGS7iY=
=SQt3
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
