Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j63HbVV00429
	for <linux-lvm@redhat.com>; Sun, 3 Jul 2005 13:37:31 -0400
Received: from smtp11.wanadoo.fr (smtp11.wanadoo.fr [193.252.22.31])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j63HbJLe006983
	for <linux-lvm@redhat.com>; Sun, 3 Jul 2005 13:37:19 -0400
Received: from smtp11.wanadoo.fr (mwinf1108 [172.22.142.38])
	by mwinf1110.wanadoo.fr (SMTP Server) with ESMTP id 6A48C1C01C1E
	for <linux-lvm@redhat.com>; Sun,  3 Jul 2005 18:52:18 +0200 (CEST)
Received: from me-wanadoo.net (unknown [127.0.0.1])
	by mwinf1108.wanadoo.fr (SMTP Server) with ESMTP id F26331C000BC
	for <linux-lvm@redhat.com>; Sun,  3 Jul 2005 18:52:03 +0200 (CEST)
Received: from tangerine.coulon.evette
	(ADijon-151-1-7-1.w83-194.abo.wanadoo.fr [83.194.115.1])
	by mwinf1108.wanadoo.fr (SMTP Server) with ESMTP id C48AB1C000AA
	for <linux-lvm@redhat.com>; Sun,  3 Jul 2005 18:52:03 +0200 (CEST)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.52) id 1Dp7hL-0002T4-DN
	for linux-lvm@redhat.com; Sun, 03 Jul 2005 18:52:03 +0200
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06883-07 for <linux-lvm@redhat.com>;
	Sun, 3 Jul 2005 18:51:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.52) id 1Dp7hD-0002Ss-4i
	for linux-lvm@redhat.com; Sun, 03 Jul 2005 18:51:55 +0200
Date: Sun, 03 Jul 2005 16:51:50 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean.luc.coulon@gmail.com>
Message-Id: <1120409514l.9263l.0l@tangerine>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-3oQGU7p5XyG4ghGQUSpU"
Subject: [linux-lvm] Converting from LVM to LVM on RAID1
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
To: LVM Discussions <linux-lvm@redhat.com>

--=-3oQGU7p5XyG4ghGQUSpU
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Is there a safe way to convert from a working LVM (with root on LVM) to =20
a software RAID1 including the device where is the existing LVM ?

Regards

Jean-Luc

--=-3oQGU7p5XyG4ghGQUSpU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCyBeqNv61Ho2INJ8RAoKIAKCLG+EB6uRZOWkG5a+wTz7wbTwU8wCeOlbh
6WzmvdWWDpX3Cs5r76oYz0k=
=y1z+
-----END PGP SIGNATURE-----

--=-3oQGU7p5XyG4ghGQUSpU--
