Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9S4HPV31877
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 00:17:25 -0400
Received: from mail.interlix.com (interlix.com [64.22.224.125])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9S4HIAR020873
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 00:17:18 -0400
Received: from localhost ([127.0.0.1])
	by mail.interlix.com with esmtp (Exim 4.50) id 1EVLfr-0003HS-Jb
	for linux-lvm@redhat.com; Thu, 27 Oct 2005 23:17:06 -0500
From: Edward Muller <edwardam@interlix.com>
Date: Thu, 27 Oct 2005 23:17:02 -0500
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5196445.pARXGxEhGW";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200510272317.02488.edwardam@interlix.com>
Subject: [linux-lvm] Can LVM2 and CLVM co-exist
Reply-To: edwardam@interlix.com,
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

--nextPart5196445.pARXGxEhGW
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I have a system using LVM2 and recently setup a CORAID (www.coraid.com)=20
device. I'd like to use CLVM to manage the volumes on the device. But someo=
ne=20
mentioned that LVM2 and CLVM may be incompatible.=20

I didn't want to trash my test machine at the moment so I was wondering if=
=20
they are compatible or not.

Thx
=2D-=20
Edward Muller - Interlix
edwardam@interlix.com
417-862-0573
PGP Key: http://interlix.com/Members/edwardam/pgpkeys

--nextPart5196445.pARXGxEhGW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDYaY+6NYdR1GOdLkRAtRbAKCtgOBjgMwpEyhakq3Tkwjs4t/YuwCfRneu
FlO+gKU6+M5dOg6PvbD0ynE=
=XZXG
-----END PGP SIGNATURE-----

--nextPart5196445.pARXGxEhGW--
