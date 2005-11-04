Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA4J5YV11879
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2005 14:05:34 -0500
Received: from mail14.bluewin.ch (mail14.bluewin.ch [195.186.19.62])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA4J5PEP007384
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2005 14:05:26 -0500
Received: from vangelis (81.62.238.235) by mail14.bluewin.ch (Bluewin
	7.2.068.1) id 435DFE560001B683 for linux-lvm@redhat.com;
	Fri, 4 Nov 2005 19:05:20 +0000
From: Dan Johansson <Dan.Johansson@dmj.nu>
Date: Fri, 4 Nov 2005 20:05:08 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1288334.Ly0NbfSxZj";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200511042005.17392.Dan.Johansson@dmj.nu>
Subject: [linux-lvm] pvcreate on a dmraid device
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

--nextPart1288334.Ly0NbfSxZj
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I'm new to this list, but not to Linux and LVM.
I'm trying to setup a new Linux-server with an on board RAID-controller=20
(Promise PDC20265 FastTrak100 Lite/Ultra100). Now everything goes well unti=
l=20
I try to do a pvcreate on one of the raid-partitions, this is the output I=
=20
get:
# pvcreate /dev/mapper/pdc_edcfibbf4
  Device /dev/mapper/pdc_edcfibbf4 not found.

But the device-file is there (along with the other partitions).

# ll /dev/mapper/pdc_edcfibbf*
brw-------  1 root root 253,  7 Nov  4 18:22 /dev/mapper/pdc_edcfibbf
brw-------  1 root root 253,  8 Nov  4 18:22 /dev/mapper/pdc_edcfibbf1
brw-------  1 root root 253,  9 Nov  4 18:22 /dev/mapper/pdc_edcfibbf2
brw-------  1 root root 253, 10 Nov  4 18:22 /dev/mapper/pdc_edcfibbf3
brw-------  1 root root 253, 11 Nov  4 18:22 /dev/mapper/pdc_edcfibbf4

and dmraid shows the raidgroup OK:
# dmraid -s
*** Active Set
name   : pdc_edcfibbf
size   : 160086465
stride : 128
type   : mirror
status : ok
subsets: 0
devs   : 2
spares : 0

Any suggestions on how I can solve this issue and move on with my=20
installation.

Regards,
=2D-=20
Dan Johansson, <http://www.dmj.nu>
***************************************************
This message is printed on 100% recycled electrons!
***************************************************

--nextPart1288334.Ly0NbfSxZj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDa7DtF+s3Ki+4lK0RAiYWAJ9wY8urVDV8Dv8dgD7vNfjZ5hlg6wCgxldw
+T3h9aK342zxIGwB8Aq8wuQ=
=t7Lo
-----END PGP SIGNATURE-----

--nextPart1288334.Ly0NbfSxZj--
