Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5OJkX009906
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 15:46:33 -0400
Received: from mail.gurulabs.com (mail.gurulabs.com [67.137.148.7])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5OJkSXn026697
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 15:46:28 -0400
Received: from [10.2.3.71] (dhcp71.glwlan.gurulabs.com [10.2.3.71])
	by mail.gurulabs.com (Postfix) with ESMTP id D0BFB7878
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 13:46:27 -0600 (MDT)
From: Dax Kelson <dax@gurulabs.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-U4ljksVnyvS8LE0sp4Ln"
Date: Thu, 24 Jun 2004 13:46:21 -0600
Message-Id: <1088106381.3810.22.camel@mentor.gurulabs.com>
Mime-Version: 1.0
Subject: [linux-lvm] LVM 2 limits?
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


--=-U4ljksVnyvS8LE0sp4Ln
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


What limits exist in LVM2?

How many Volume Groups per system?
Max size of Volume Groups?
How many Physical Extents per VG?
What is the valid PE size range?
How many Logical volumes per system?

2.6 kernel VFS limits?

What is the maximum block device size?
What is the maximum filesystem size?
What is the maximum ext3 filesystem size?
What is the maximum reiserfs3 filesystem size?
What is the maximum xfs filesystem size?
What is the maximum jfs filesystem size?


--=20
Dax Kelson <dax@gurulabs.com>

--=-U4ljksVnyvS8LE0sp4Ln
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBA2y+NESq34TbtkiIRAnQDAJ9SWBWa3RJBvhcPv2jN6KT3VHOZkwCffhgz
CqjoBfkRPY1uQ/WncmEFY1w=
=2gPn
-----END PGP SIGNATURE-----

--=-U4ljksVnyvS8LE0sp4Ln--
