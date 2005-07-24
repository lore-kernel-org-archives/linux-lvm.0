Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6OI25V24491
	for <linux-lvm@redhat.com>; Sun, 24 Jul 2005 14:02:05 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.183])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6OI1qYl017079
	for <linux-lvm@redhat.com>; Sun, 24 Jul 2005 14:01:57 -0400
Received: from localhost (localhost.vollmer.home [127.0.0.1])
	by joergli.vollmer.home (Postfix) with ESMTP id B3E9C6AD78
	for <linux-lvm@redhat.com>; Sun, 24 Jul 2005 20:01:51 +0200 (CEST)
Received: from joergli.vollmer.home ([127.0.0.1])
	by localhost (joergli [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 02493-04 for <linux-lvm@redhat.com>;
	Sun, 24 Jul 2005 20:01:47 +0200 (CEST)
Received: from joergli.vollmer.home (joergli.vollmer.home [127.0.0.2])
	by joergli.vollmer.home (Postfix) with ESMTP id 1D8BE6ACEC
	for <linux-lvm@redhat.com>; Sun, 24 Jul 2005 20:01:47 +0200 (CEST)
From: "Dr. =?iso-8859-1?q?J=FCrgen?= Vollmer"
	<Juergen.Vollmer@informatik-vollmer.de>
Subject: Re: [linux-lvm] LVM / File descriptor .. left open / Snapshot-Problems
Date: Sun, 24 Jul 2005 20:01:42 +0200
References: <200507231644.26202.Juergen.Vollmer@informatik-vollmer.de>
	<20050723152045.GH23710@agk.surrey.redhat.com>
In-Reply-To: <20050723152045.GH23710@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1582699.anBScy4duS";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200507242001.46066.Juergen.Vollmer@informatik-vollmer.de>
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

--nextPart1582699.anBScy4duS
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Samstag, 23. Juli 2005 17:20 schrieb Alasdair G Kergon:
> On Sat, Jul 23, 2005 at 04:44:22PM +0200, Dr. J=FCrgen Vollmer wrote:
> > This is reproducable.
> > If I wait long enough (some 10 minutes) everything seems to work again.
>
> Add one or more -v options to the lvm commands to see more details.

The majer difference has been between a success and a failure has been:
  >   LV VGhome/lvm-snapshot in use: not removing
  >   Couldn't deactivate new snapshot.

> Run 'dmsetup info -c' and 'ls -l /sys/block/dm*' between lvm commands
> to check the changes have taken place.

after a non-successful lvcreate I get:
> dmsetup info -c
Name             Maj Min Stat Open Targ Event  UUID
VGhome-lvm--snapshot 253   1 L--w    0    1      0  =20
5mUudIrDe2N4x6x1D2T969Ux32kgljxXgbwKmGxoDE0SVIduDE3fboFFrMLFTqRB
VGhome-LVhome    253   0 L--w    2    5      0=20
5mUudIrDe2N4x6x1D2T969Ux32kgljxX00000000000000000000000000000000


After a successfull lvcreate I get:
> dmsetup info -c
Name             Maj Min Stat Open Targ Event  UUID
VGhome-lvm--snapshot-cow 253   1 L--w    1    1      0=20
5mUudIrDe2N4x6x1D2T969Ux32kgljxXAn7i5UocqOGzPhK0p9gT7zRjxJK1Nacn-cow
VGhome-lvm--snapshot 253   3 L--w    2    1      0=20
5mUudIrDe2N4x6x1D2T969Ux32kgljxXAn7i5UocqOGzPhK0p9gT7zRjxJK1Nacn
VGhome-LVhome    253   0 L--w    2    1      0=20
5mUudIrDe2N4x6x1D2T969Ux32kgljxX00000000000000000000000000000000
VGhome-LVhome-real 253   2 L--w    2    5      0=20
5mUudIrDe2N4x6x1D2T969Ux32kgljxX00000000000000000000000000000000-real

but I have no glue what this means :-(

> Is there much or any I/O happening on the snapshotted device while you do
> this?=20
no.
> Does adding 'sync' in between commands make any difference?=20
no

I observed the following:
Initially I used "--extents 754"  approx. 2.9GB. If I reduce the size to 51=
2M=20
or less, lvcreate is always successful. For any value greater than 512M, th=
e=20
behaviour is as described.

With best regards
J=FCrgen


PS: My physcial setting is:
> pvdisplay
=46ile descriptor 10 left open
=46ile descriptor 11 left open
  --- Physical volume ---
  PV Name               /dev/sdb2
  VG Name               VGhome
  PV Size               16,08 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              4117
  Free PE               0
  Allocated PE          4117
  PV UUID               qYRKMw-gcHH-MU12-qzMm-7Kpp-m0wD-bxYB9Q

  --- Physical volume ---
  PV Name               /dev/sdc2
  VG Name               VGhome
  PV Size               33,17 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              8492
  Free PE               0
  Allocated PE          8492
  PV UUID               znM82W-cSIj-e0jR-CN4A-n1vZ-rdsm-a3uKfd

 --- Physical volume ---
  PV Name               /dev/sdd1
  VG Name               VGhome
  PV Size               68,49 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              17533
  Free PE               754
  Allocated PE          16779
  PV UUID               UDiW4I-BXof-tKiE-QCTX-6pcW-iHZn-oxsT4U


all disks are SCSI disks (Ultra wide)

=2D-=20
Dr.rer.nat. Juergen Vollmer, Viktoriastrasse 15, D-76133 Karlsruhe
Tel: +49(721) 9204871 Fax: +49(721) 24874
Juergen.Vollmer@informatik-vollmer.de
www.informatik-vollmer.de
Internet-Telefonie: www.skype.com Benutzer: juergen.vollmer

--nextPart1582699.anBScy4duS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBC49eKn1Xi7IT+kG0RAuGdAJ90+I6rC3xAd1lmFHuFlfHRzgNHwACfZ4Z4
UK9Zq1P2eByn64RZfdCh/ls=
=4LGw
-----END PGP SIGNATURE-----

--nextPart1582699.anBScy4duS--
