Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5ULgdu08494
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 17:42:39 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5ULgX8V025468
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 17:42:33 -0400
From: Ming Zhang <mingz@ele.uri.edu>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-VXFLraSonSyjmwnY+63V"
Date: Thu, 30 Jun 2005 17:42:27 -0400
Message-Id: <1120167747.5505.37.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [linux-lvm] live lock?
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-VXFLraSonSyjmwnY+63V
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

i now met a PV that can not add or remove from a VG. i now do not know
if it belongs to vg1 at all.


[root@gs_lan root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sda3" of VG "vg1" [102.64 GB / 60.28 GB
free]
pvscan -- inactive PV "/dev/sdb1" of VG "vg1" [137.78 GB / 129.97 GB
free]
pvscan -- total: 2 [240.44 GB] / in use: 2 [240.44 GB] / in no VG: 0 [0]

[root@gs_lan root]# vgreduce vg1 /dev/sdb1
vgreduce -- physical volume "/dev/sdb1" doesn't belong to volume group
"vg1"

[root@gs_lan root]# vgcreate vg2 /dev/sdb1
vgcreate -- "/dev/sdb1" is not a new physical volume
vgcreate -- physical volume "/dev/sdb1" already belongs to volume group
"vg1"


Ming


--=-VXFLraSonSyjmwnY+63V
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCxGdDSYbkL5BnVYoRAhGqAJ49JZoQ9Z7yDEVH6kE1jA3ZPQgb+QCfZEf3
JY1iSzJUulI23p2apm+3U7g=
=fMf3
-----END PGP SIGNATURE-----

--=-VXFLraSonSyjmwnY+63V--
