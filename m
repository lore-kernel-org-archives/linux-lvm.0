Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6IDo6M7023144
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2012 09:50:07 -0400
Received: from igw1.tempest.sk (mx1.tempest.sk [195.28.127.2])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6IDo3DT023647
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2012 09:50:04 -0400
Received: from EXCASHT01.tempest.intra (excasht01.tempest.intra [195.28.100.5])
	by igw1.tempest.sk (Postfix) with ESMTP id 12B4F38A31
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2012 15:49:58 +0200 (CEST)
Message-ID: <5006BF05.9090305@tempest.sk>
Date: Wed, 18 Jul 2012 15:49:57 +0200
From: Tomas Vanderka <tomas_vanderka@tempest.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig8BDCC378E4FC3497123B5AD4"
Subject: [linux-lvm] Replacing failed disk in raid volume without hot spare
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--------------enig8BDCC378E4FC3497123B5AD4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,
i created a raid6 volume over 5 disks, with only those 5 in VG. Then I re=
moved 1 disk, rebooted and added a new one. The question is how to replac=
e the missing device with
the new one. All is fine if I have 6th disk in VG as a hot spare, then i =
can just use "lvconvert --repair".

Tried all of theese, nothing seems to work

[root@lvm ~]# lvconvert --repair test/raid6
  Couldn't find device with uuid jnGEwl-EVqs-yQ0M-rUxa-gLqD-fHNU-AJUKjl.
Attempt to replace failed RAID images (requires full device resync)? [y/n=
]: y
  Insufficient suitable allocatable extents for logical volume : 87 more =
required
  Failed to allocate replacement images for test/raid6
  Failed to replace faulty devices in test/raid6.

This doesn't work with or without /dev/sdg
[root@lvm ~]# lvconvert --replace raid6_rimage_0 test/raid6 /dev/sdg
  Couldn't find device with uuid jnGEwl-EVqs-yQ0M-rUxa-gLqD-fHNU-AJUKjl.
  Cannot change VG test while PVs are missing.
  Consider vgreduce --removemissing.

[root@lvm ~]# vgextend --restoremissing test /dev/sdg
  Couldn't find device with uuid jnGEwl-EVqs-yQ0M-rUxa-gLqD-fHNU-AJUKjl.
  WARNING: PV /dev/sdg not found in VG test
  No PV has been restored.


My lvm looks like this at the moment

[root@lvm ~]# pvs
  Couldn't find device with uuid jnGEwl-EVqs-yQ0M-rUxa-gLqD-fHNU-AJUKjl.
  PV             VG     Fmt  Attr PSize    PFree=20
  /dev/sda2      vg_lvm lvm2 a--     7.51g      0
  /dev/sdc       test   lvm2 a--  1020.00m 672.00m
  /dev/sdd       test   lvm2 a--  1020.00m 672.00m
  /dev/sde       test   lvm2 a--  1020.00m 672.00m
  /dev/sdf       test   lvm2 a--  1020.00m 672.00m
  /dev/sdg              lvm2 a--     1.00g   1.00g
  unknown device test   lvm2 a-m  1020.00m 672.00m

[root@lvm ~]# lvs -a -o name,lv_attr,devices test
  Couldn't find device with uuid jnGEwl-EVqs-yQ0M-rUxa-gLqD-fHNU-AJUKjl.
  LV               Attr     Devices                                      =
                                          =20
  raid6            rwi---r- raid6_rimage_0(0),raid6_rimage_1(0),raid6_rim=
age_2(0),raid6_rimage_3(0),raid6_rimage_4(0)
  [raid6_rimage_0] Iwi---r- unknown device(1)                            =
                                          =20
  [raid6_rimage_1] Iwi---r- /dev/sdc(1)                                  =
                                          =20
  [raid6_rimage_2] Iwi---r- /dev/sdd(1)                                  =
                                          =20
  [raid6_rimage_3] Iwi---r- /dev/sde(1)                                  =
                                          =20
  [raid6_rimage_4] Iwi---r- /dev/sdf(1)                                  =
                                          =20
  [raid6_rmeta_0]  ewi---r- unknown device(0)                            =
                                          =20
  [raid6_rmeta_1]  ewi---r- /dev/sdc(0)                                  =
                                          =20
  [raid6_rmeta_2]  ewi---r- /dev/sdd(0)                                  =
                                          =20
  [raid6_rmeta_3]  ewi---r- /dev/sde(0)                                  =
                                          =20
  [raid6_rmeta_4]  ewi---r- /dev/sdf(0)                                  =
                                          =20

I also tried doing "vgreduce --removemissing --force" but it just destroy=
s the partial raid volume.

--=20
Tomas Vanderka
TEMPEST a.s.
Galvaniho 17/B, 821 04 BRATISLAVA
Phone: +421 905 571 691



--------------enig8BDCC378E4FC3497123B5AD4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org/

iEYEARECAAYFAlAGvwUACgkQKa3WijwxZE1zOQCfS0OKAtzkAHtiErJOga12cqSw
i0YAn3Fh9taWiMGkLTzdksAMKPC0596Q
=wtCJ
-----END PGP SIGNATURE-----

--------------enig8BDCC378E4FC3497123B5AD4--
