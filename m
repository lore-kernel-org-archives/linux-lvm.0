Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0VA39J3015334
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2008 05:03:09 -0500
Received: from mars.math-info.univ-paris5.fr (mars.math-info.univ-paris5.fr
	[193.48.200.18])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0VA2Xdj000786
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2008 05:02:34 -0500
Received: from krishna.math-info.univ-paris5.fr
	(krishna.math-info.univ-paris5.fr [193.48.200.152])
	by mars.math-info.univ-paris5.fr (8.14.1/jtpda-5.4) with ESMTP id
	m0VA2XLP024595
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2008 11:02:33 +0100
Message-ID: <47A19CB9.6030503@math-info.univ-paris5.fr>
Date: Thu, 31 Jan 2008 11:02:33 +0100
From: =?ISO-8859-1?Q?Fran=E7ois_Patte?=
	<francois.patte@math-info.univ-paris5.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] question about install on a new disk
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bonjour,

I have presently an install of fedora 6 on a disk sdb with partitions:

sdb1 / (ext3)
sdb2 LVM with lv: /usr, /var, /opt, /tmp, /home

I would like to perform a new install on sda with partitions:

sda1 / (ext3)
sda2 LVM with same lv except /home


How can I mount the "old" logical volumes located on sdb when the new
system will be running on sda?

As devices /dev/mapper/VolGroup00-LogVol00 etc. are created at boot time
in the /dev of the running system I will be unable to access the logical
volumes located on sdb....

I don't know how to proceed.

Thanks for any help.

- --
Fran�ois Patte
UFR de math�matiques et informatique
Universit� Paris Descartes
T�l. +33 (0)1 44 55 35 61
http://www.math-info.univ-paris5.fr/~patte
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHoZy4dE6C2dhV2JURAkX5AKCe5XYdJTe3su16YrR8KogjWONc7QCfbOyO
UImcEFi74zPWLj2agd+hICE=
=k3H+
-----END PGP SIGNATURE-----
