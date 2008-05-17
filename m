Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4H9COav005417
	for <linux-lvm@redhat.com>; Sat, 17 May 2008 05:12:24 -0400
Received: from pro-linux.de (www.pro-linux.de [213.239.211.178])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4H9CBHq006163
	for <linux-lvm@redhat.com>; Sat, 17 May 2008 05:12:11 -0400
Received: from laach.hjbaader.home (reverse-82-141-50-144.dialin.kamp-dsl.de
	[82.141.50.144]) by pro-linux.de (Postfix) with ESMTP id 841D117C00E
	for <linux-lvm@redhat.com>; Sat, 17 May 2008 11:12:00 +0200 (CEST)
Received: from kiwi.hjbaader.home (kiwi.hjbaader.home [172.30.4.7])
	by laach.hjbaader.home (Postfix) with ESMTP id 4FD892283ADA
	for <linux-lvm@redhat.com>; Sat, 17 May 2008 11:11:59 +0200 (CEST)
Received: from hans by kiwi.hjbaader.home with local (Exim 3.36 #1 (Debian))
	id 1JxISF-0005CH-00
	for <linux-lvm@redhat.com>; Sat, 17 May 2008 11:11:51 +0200
Date: Sat, 17 May 2008 11:11:51 +0200
From: Hans-Joachim Baader <hjb@pro-linux.de>
Message-ID: <20080517091151.GB14292@kiwi.hjbaader.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline
Sender: Hans-Joachim Baader <hjb@pro-linux.de>
Subject: [linux-lvm] Performance of striping
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


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

last year I built a server with 3 SATA disks. I used a physical volume
for each disk, a volume group on each, and then created identical LVs
in each VG. Then I used dmesetup to create a RAID 0 over all 3 disks.
A single disk has an I/O performance of 70 MB/s. After creating a
filesystem on the RAID and measuring its performance I got the expected
result: 210 MB/s.

But this setup was too complicated for me, so I tried a different
approach. Still a physical volume for each disk (actually partiton 2
which is nearly the complete disk), but only one volume group vg0.
The commands used were:

pvcreate /dev/sda2
pvcreate /dev/sdb2
pvcreate /dev/sdc2
vgcreate vg0 -s 128 /dev/sda2 /dev/sdb2 /dev/sdc2

On vg0, I created a LV which should span all 3 disks and therefore be
equivalent to a RAID 0:

lvcreate --name=3Dtest -L 10000M -i 3 vg0

Resulting LV:

  --- Logical volume ---                                                   =
       LV Name                /dev/vg0/ubuntu                              =
            VG Name                vg0
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                10,12 GB
  Current LE             81
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:10

However, I get only half the expected performance. I created an XFS
filesystem and mounted it on /mnt/tmp:

# dd if=3D/dev/zero of=3D/mnt/tmp/bla bs=3D1024k count=3D10000
10485760000 Bytes (10 GB) kopiert, 112,233 Sekunden, 93,4 MB/s
# dd if=3D/mnt/tmp/bla of=3D/dev/null bs=3D1024k count=3D10000
10485760000 Bytes (10 GB) kopiert, 88,8886 Sekunden, 118 MB/s

This was measured with kernel 2.6.23.12 and 2.6.25.1 on AMD64 X2.
Is it possible to get 210 MB/s?

Thanks,
hjb
--=20
Pro-Linux - Germany's largest volunteer Linux support site
http://www.pro-linux.de/          Public Key ID 0x3DDBDDEA

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFILqFXLbySPj3b3eoRAiJ0AJ48WsxQdQ/eDrfwDxvYluy6b3dYqgCeO/o6
RoMlFXmdokQ8tX4525VwAoM=
=b6gN
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
