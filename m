From: AJ Lewis <lewis@sistina.com>
Message-ID: <20011126203223.A81635@antimony.sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
Subject: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.0.1 available at www.sistina.com
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
Date: Mon Nov 26 20:30:02 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, lvm-devel@sistina.com

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello all,

I'm sending this out in Heinz's stead, since he's at the 'Linuxkongress'
conference this week

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~

Hi all,

LVM 1.0.1 supports both version 1 and 2 of the metadata.

There's *no* need to run any metadata update tools.

A tarball is available now at
  =20
   <http://www.sistina.com/>
=20
for download (Follow the "LVM 1.0.1" link).

Changelog since 1.0 follows:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

LVM
---

LVM now supports both version 1 and version 2 data formats.  No need to
upgrade !

Driver
------

o now works with 2.4.16

Tools
-----

o support for version 1 and 2 data formats

o Now stores new and changed PVs in version 1 data format!

o zero pv and lv arrays in vg_cfgrestore

o removing of PVs from VGs with snapshot now works
  (changes in pv_read_all_pv_of_vg(), pv_read_all_pe_of_vg(),
   vg_setup_for_merge(), vg_setup_for_extend(), vg_setup_for_reduce(),=20
   vg_setup_for_split() and liblvm.h)

o persistent LV and PV numbers

o lvmcreate_initd now supports devfs

o support for non-partitioned MDs

o SPARC compilation fixes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


Feed back LVM related information to <linux-lvm@sistina.com>.

Thanks a lot for your support of LVM.


Regards,
Heinz    -- The LVM Guy --


=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

--
AJ Lewis <lewis@sistina.com>

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (FreeBSD)
Comment: For info see http://www.gnupg.org

iD8DBQE8Avs3b2fpvETN3pURAo5RAJwOjJZSDa2WU6D/L08nkzNHpaW1WgCghbE6
PWjf0fz8zb1nLQREL3uUc8I=
=eLvc
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
