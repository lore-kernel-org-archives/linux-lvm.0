Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6NEioV32300
	for <linux-lvm@redhat.com>; Sat, 23 Jul 2005 10:44:50 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.186])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6NEiWX7002014
	for <linux-lvm@redhat.com>; Sat, 23 Jul 2005 10:44:41 -0400
Received: from localhost (localhost.vollmer.home [127.0.0.1])
	by joergli.vollmer.home (Postfix) with ESMTP id 65DAC6A8EB
	for <linux-lvm@redhat.com>; Sat, 23 Jul 2005 16:44:31 +0200 (CEST)
Received: from joergli.vollmer.home ([127.0.0.1])
	by localhost (joergli [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 23429-08 for <linux-lvm@redhat.com>;
	Sat, 23 Jul 2005 16:44:27 +0200 (CEST)
Received: from joergli.vollmer.home (joergli.vollmer.home [127.0.0.2])
	by joergli.vollmer.home (Postfix) with ESMTP id 1C2416A8E8
	for <linux-lvm@redhat.com>; Sat, 23 Jul 2005 16:44:27 +0200 (CEST)
From: "Dr. =?iso-8859-15?q?J=FCrgen?= Vollmer"
	<Juergen.Vollmer@informatik-vollmer.de>
Date: Sat, 23 Jul 2005 16:44:22 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3090492.797eZjpOy9";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200507231644.26202.Juergen.Vollmer@informatik-vollmer.de>
Subject: [linux-lvm] LVM / File descriptor .. left open / Snapshot-Problems
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
To: linux-lvm@redhat.com

--nextPart3090492.797eZjpOy9
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi everybody,

since some weeks I get the following messages:

> lvdisplay
=46ile descriptor 10 left open =A0<<<<<<< what does this tell me?
=46ile descriptor 11 left open
=A0 --- Logical volume ---
=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VGhome/LVhome
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VGhome
=2E...

Creating a snapshot behaves strange:
> lvcreate --snapshot --name lvm-snapshot --extents 754 /dev/VGhome/LVhome =
      =20
> mount -oro -t reiserfs /dev/VGhome/lvm-snapshot /lvm-snapshot/           =
    =20
> umount /lvm-snapshot
> lvremove -f /dev/VGhome/lvm-snapshot
works fine.
If I try to create the snapshot again (all within a view minutes)
I get the message:

  LV VGhome/lvm-snapshot in use: not removing
  Couldn't deactivate new snapshot.

lvdisplay shows the LV.

The abouve mount-command fails and results in:
 mount: wrong fs type, bad option, bad superblock on /dev/VGhome/lvm-snapsh=
ot,
        missing codepage or other error

lvremove removes the LV wiout any complains.

This is reproducable.

If I wait long enough (some 10 minutes) everything seems to work again.

Strange enough, the "file descriptor left open" message showed up yesterday=
=20
and the time before, but not today. The system was not rebooted inbetween.

I use SuSE 9.3 professional with all updates and=20
> lvm version=20
  LVM version:     2.01.07 (2005-03-08)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.4.0

Any help or explanation is welcome.

with best regards

J=FCrgen
=2D-=20
Dr.rer.nat. Juergen Vollmer, Viktoriastrasse 15, D-76133 Karlsruhe
Tel: +49(721) 9204871 Fax: +49(721) 24874
Juergen.Vollmer@informatik-vollmer.de
www.informatik-vollmer.de
Internet-Telefonie: www.skype.com Benutzer: juergen.vollmer

--nextPart3090492.797eZjpOy9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBC4lfKn1Xi7IT+kG0RAsEDAJ9Twgw9hQBc/Th36Uyez2ais9nDJgCfZ6Rz
LpEO1fo4teDd4KKWzAgzFRo=
=4smC
-----END PGP SIGNATURE-----

--nextPart3090492.797eZjpOy9--
