From: AJ Lewis <lewis@sistina.com>
Message-Id: <20020315205256.GA743@antimony.sistina.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
Subject: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.1-rc1 available at www.sistina.com
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
Date: Fri Mar 15 14:52:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all - Heinz is unavailable, so I'm sending this out for him:

LVM 1.1-rc1 release candidate supports both version 1 and 2 of the metadata.

Disclaimer:
-----------
This is not meant to be used on production systems!


There's *no* need to run any metadata update tools.

Please test this release candidate and feed back results to the linux-lvm
list in order to help us to release 1.1 ASAP.

A tarball is available now at

   <http://www.sistina.com/>

for download (Follow the "LVM 1.1-rc1" link).


Changes to LVM 1.1-rc1 include:

o volume group quorum support is in enabling optional activation of volume
  groups (vgchange -qn) in case at least one physical volume out of many is
  still accessable enabling retrieval of data in logical volumes allocated
  on the accessable devices

o vgimport supports importing by volume group name rather than requiring
  a physical volume list

o creation of metadata backup files in /etc/lvmtab* and metadata archives in
  /etc/lvmconf/ is now optional to help saving space for eg. on ram disks.
  If vgscan is not run at all and /etc/lvmtab* are removed, no backup files
  will be created.  If vgcfgbackup is not run at all and /etc/lvmconf/ is
  removed, no archive files will be created.

o locations of metadata backups and archives are configurable through
  environment varibles LVM_BACKUP_INDEX/LVM_BACKUP_DIR and LVM_ARCHIVE_DIR
  respectively

o volume group static mode in order to avoid all configuration changes to a
  volume group once set. This is useful to 'freeze' a volume group in order
  to activate it in a cluster of for fail-over configurations

o the llseek cast bug has been fixed, which caused pvmove to fail beyond the
  2GB offset


o more...


See the CHANGELOG file contained in the tarball for further information.

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
Sticks and stones may break my bones, and so would an 80 lb. carrot.
-----End Obligatory Humorous Quote------------------------------------------

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (FreeBSD)
Comment: For info see http://www.gnupg.org

iD8DBQE8kl8omC1ze528TskRAm8UAJ9PsbdbUVdGuscZBAuJoSXqGSoDGACgvpcd
4AwkKZIpoHK8303s6R2lsJ8=
=q2CQ
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
