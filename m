Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAGNsqpe020727
	for <linux-lvm@redhat.com>; Fri, 16 Nov 2007 18:54:52 -0500
Received: from mail.4lin.net (mail.4lin.net [78.47.171.132])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAGNsjJV019032
	for <linux-lvm@redhat.com>; Fri, 16 Nov 2007 18:54:46 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.4lin.net (Postfix) with ESMTP id DC64F1449806
	for <linux-lvm@redhat.com>; Sat, 17 Nov 2007 00:55:20 +0100 (CET)
Received: from mail.4lin.net ([127.0.0.1])
	by localhost (mail.4lin.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-XFEpKF+Ry2 for <linux-lvm@redhat.com>;
	Sat, 17 Nov 2007 00:55:08 +0100 (CET)
Received: from [192.168.3.101] (dslb-088-068-196-060.pools.arcor-ip.net
	[88.68.196.60])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.4lin.net (Postfix) with ESMTP id 46EF1140009D
	for <linux-lvm@redhat.com>; Sat, 17 Nov 2007 00:55:08 +0100 (CET)
Message-ID: <473E2DA8.6000502@4lin.net>
Date: Sat, 17 Nov 2007 00:54:16 +0100
From: Denny Schierz <linuxmail@4lin.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigE011603C50E41C968F5D6AA1"
Subject: [linux-lvm] Strange snapshots behavior in dev/<vg>/
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigE011603C50E41C968F5D6AA1
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

hi,

to manage backups from Xen DomUs, I create snapshots from every guest.
They're all running under Debian Etch. No problem at all, normally, but
=2E.. see yourself:

My script creates only snapshots and mounts them, nothing more.

-----
root@henrietta ~ # /usr/local/bin/snap-mount.sh

  Logical volume "angelica-disk-snap" successfully removed
  Logical volume "hitomi-disk-snap" successfully removed
  Logical volume "rico-disk-snap" successfully removed
  Logical volume "triela-disk-snap" successfully removed
  Logical volume "zoe-disk-snap" successfully removed

Logical volume "angelica-disk-snap" created
/dev/neko/angelica-disk

Logical volume "hitomi-disk-snap" created
/dev/neko/hitomi-disk

Logical volume "rico-disk-snap" created
/dev/neko/rico-disk

Logical volume "triela-disk-snap" created
/dev/neko/triela-disk

Logical volume "zoe-disk-snap" created
/dev/neko/zoe-disk

root@henrietta ~ # ls /media/backup/angelica-disk/dev/neko/
hitomi-disk
----

So, first question, why i have the name from a different volume
(hitomi-disk) in the dev from angelica?


root@henrietta ~ # ls /media/backup/hitomi-disk/dev/neko
ls: /media/backup/hitomi-disk/dev/neko: Input/output error

Why i get here an error?


any suggestions?

root@henrietta ~ # uname -a
Linux henrietta 2.6.16.33-xen #1 SMP Mon Jan 8 14:39:02 GMT 2007 i686
GNU/Linux

root@henrietta ~ # dpkg -l | grep lvm
ii  lvm-common               1.5.20                          The Logical
Volume Manager for Linux (common
ii  lvm2                     2.02.06-4                       The Linux
Logical Volume Manager

root@henrietta ~ # dpkg -l | grep udev
ii  udev                     0.105-4                         /dev/ and
hotplug management daemo


LV display:

  --- Logical volume ---
  LV Name                /dev/neko/hitomi-disk
  VG Name                neko
  LV UUID                Tes7KH-pnv5-IGNt-vdf5-yCni-wSTo-dBd8ul
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/neko/hitomi-disk-snap [active]
  LV Status              available
  # open                 1
  LV Size                1.00 GB
  Current LE             256
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:2

  --- Logical volume ---
  LV Name                /dev/neko/hitomi-disk-snap
  VG Name                neko
  LV UUID                DIeQ81-Oeao-j9gt-RoRL-4G5L-0xko-Z5W9vN
  LV Write Access        read/write
  LV snapshot status     active destination for /dev/neko/hitomi-disk
  LV Status              available
  # open                 1
  LV Size                1.00 GB
  Current LE             256
  COW-table size         1.00 GB
  COW-table LE           256
  Allocated to snapshot  0.07%
  Snapshot chunk size    8.00 KB
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:25


  --- Logical volume ---
  LV Name                /dev/neko/angelica-disk
  VG Name                neko
  LV UUID                72Ibgz-WlBX-x0G2-6HlQ-MgB2-UOd2-n3aXSq
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/neko/angelica-disk-snap [active]
  LV Status              available
  # open                 1
  LV Size                4.00 GB
  Current LE             1024
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:10


  --- Logical volume ---
  LV Name                /dev/neko/angelica-disk-snap
  VG Name                neko
  LV UUID                fclDHb-U9Xb-wWQc-ptFH-jrNg-mNou-qzinbe
  LV Write Access        read/write
  LV snapshot status     active destination for /dev/neko/angelica-disk
  LV Status              available
  # open                 1
  LV Size                4.00 GB
  Current LE             1024
  COW-table size         1.00 GB
  COW-table LE           256
  Allocated to snapshot  0.09%
  Snapshot chunk size    8.00 KB
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:21

cu denny

--=20
Stoppt den =DCberwachungswahn - Stoppt den Sch=E4uble Katalog:
http://www.nopsis.de


--------------enigE011603C50E41C968F5D6AA1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHPi2oKlzhkqt9P+ARAggeAJ9F/dRXZlGu/PueIKsA2ieIMA7EKgCfSY2x
tZikvI+1LbtNNEch7jCzHqE=
=iCqh
-----END PGP SIGNATURE-----

--------------enigE011603C50E41C968F5D6AA1--
