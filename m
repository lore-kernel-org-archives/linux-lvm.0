Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6S62Ba24138
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 02:02:11 -0400
Received: from linux.interlinx.bc.ca (linux.interlinx.bc.ca [66.11.173.224])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6S625Xn030583
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 02:02:05 -0400
Received: from pc.interlinx.bc.ca (pc [10.75.22.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id DE96079232
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 02:01:57 -0400 (EDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by pc.interlinx.bc.ca (Postfix) with ESMTP id BC43EC87E
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 02:01:52 -0400 (EDT)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-2YTEZ8X1BNcq4IaImdzh"
Date: Wed, 28 Jul 2004 02:01:42 -0400
Message-Id: <1090994503.29875.41.camel@pc>
Mime-Version: 1.0
Subject: [linux-lvm] recover data from a pv that has first 4k damaged?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-2YTEZ8X1BNcq4IaImdzh
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

~sigh~

I sure was hoping I would never be one of those posting here with a
"help, my volume group has fallen and it can't get up" messages.  But
the the time has come and the hard disk Grimm Reaper is standing over
me.

I have the following set up:

IDE0 Master: hda1: ext3 /boot
             hda2: PV 1/2 of a single VG, but empty/unused
IDE1 Master: hdc:  PV 2/2 of the same single VG

So all data is on hdc, which is the 2nd "part" of a 2 part VG.  The
first part (hda2) is completely unused (because that disk sucks in terms
of performance).

Now for some reason, the first 4k (exactly 4096 bytes) of hdc is
unreadable.  It gives up all kinds of errors trying to read it.  However
I can read from 4096 bytes and beyond (dd if=3D/dev/hdc bs=3D4096 skip=3D1)
just fine.

hdc is large.  80GB or 160GB, I don't remember, and currently we are not
using but a few GB of it, so I am copying the first 20GB of the disk to
a spare 20GB HD here in my workstation, including 4096 empty bytes at
the beginning of the target disk:

(dd if=3D/dev/zero bs=3D4096 count=3D1 && dd if=3D/dev/hdc bs=3D4096 skip=
=3D1) |
ssh root@pc "dd of=3D/dev/hdc bs=3D1024k"

so that everything lines up, block offset wise.

Remember hda seems to be fine.  hdc is the one in trouble.

What can I do to get as much data off of hdc as possible?  Presumably if
I can get the lvm metadata back on it (the 20GB disk where there will be
no read errors in the 4096 bytes) and fsck (or debugfs) the filesystems,
only a few files (hopefully system binaries, etc. -- easily restorable)
will be damaged.

Thots?

Thanx,
b.


--=-2YTEZ8X1BNcq4IaImdzh
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBB0FFl3EQlGLyuXARAqGkAJ9Gwe/+itrKIWa7AeYGWjdlnWI2jQCgi+Vu
FDHTl5h4v17OF+bcLR6zr6g=
=TAt9
-----END PGP SIGNATURE-----

--=-2YTEZ8X1BNcq4IaImdzh--
