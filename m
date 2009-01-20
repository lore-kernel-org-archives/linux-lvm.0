Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0KGrEKW014353
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 11:53:14 -0500
Received: from mail.4lin.net (85-10-235-107.clients.your-server.de
	[85.10.235.107])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0KGqsSD015541
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 11:52:55 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.4lin.net (Postfix) with ESMTP id EE4F242CAEE
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 17:53:53 +0100 (CET)
Received: from mail.4lin.net ([127.0.0.1])
	by localhost (mail.4lin.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6FOWIi6YRaEz for <linux-lvm@redhat.com>;
	Tue, 20 Jan 2009 17:53:36 +0100 (CET)
Received: from [172.19.100.72] (unknown [94.220.203.14])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.4lin.net (Postfix) with ESMTP id 203A94350AC
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 17:53:35 +0100 (CET)
From: Denny Schierz <linuxmail@4lin.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-6QoEkm4V5pMBTbvwVm22"
Date: Tue, 20 Jan 2009 17:52:35 +0100
Message-Id: <1232470355.16912.12.camel@kusanagi>
Mime-Version: 1.0
Subject: [linux-lvm] Snapshot don't exists / can't remove
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


--=-6QoEkm4V5pMBTbvwVm22
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

hi,

i have a strange problem, under (Xen enabled) kernel 2.6.18:

lvscan:

  /dev/dm-33: open failed: No such device or address
  /dev/dm-34: open failed: No such device or address
  /dev/dm-36: open failed: No such device or address

[...]
  ACTIVE            '/dev/neko/angelica-disk-snap' [500.00 MB] inherit
  ACTIVE            '/dev/neko/rico-disk-snap' [500.00 MB] inherit
  ACTIVE            '/dev/neko/triela-disk-snap' [500.00 MB] inherit

ls -l /dev/mapper/*snap
b--------- 1 root root 253,  1 Jan 12
07:35 /dev/mapper/neko-angelica--disk--snap
b--------- 1 root root 253, 38 Jan 18
07:35 /dev/mapper/neko-rico--disk--snap
b--------- 1 root root 253, 39 Jan 20
07:35 /dev/mapper/neko-triela--disk--snap


i can't remove these snapshots, because, they don't exists
in /dev/neko/... (my vg is called neko)

I absolutely don't now, why and when it happens. I did not rebooted the
system, cause of bad time. Does anybody knows, what could be the reason?

Linux henrietta 2.6.18.8-xen #2 SMP Mon Jan 5 19:11:14 UTC 2009 x86_64
GNU/Linux

System is Debian Etch with kernel from xen.org (xen 3.3.1)

cu denny


--=-6QoEkm4V5pMBTbvwVm22
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkl2AVMACgkQKlzhkqt9P+BV+QCghE3GGiM2h//bay7/yrzqnEsY
UYcAnAqIlTzM8144JOpShmpKQPxmCgu7
=5fgF
-----END PGP SIGNATURE-----

--=-6QoEkm4V5pMBTbvwVm22--
