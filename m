Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB3B5or29320
	for <linux-lvm@redhat.com>; Fri, 3 Dec 2004 06:05:50 -0500
Received: from ns.bj-ig.de (ns1.bj-ig.de [217.119.193.11])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB3B5mXH011258
	for <linux-lvm@redhat.com>; Fri, 3 Dec 2004 06:05:48 -0500
Received: from tower.bj-ig.de (bjgate.bj-ig.de [194.127.182.253])
	by ns.bj-ig.de (8.12.6/8.12.6/SuSE Linux 0.6) with ESMTP id
	iB3B5kJJ004591
	for <linux-lvm@redhat.com>; Fri, 3 Dec 2004 12:05:46 +0100
Received: from ralf.bj-ig.de (ralf.bj-ig.de [194.127.182.13])
	by tower.bj-ig.de (8.12.6/8.12.6/SuSE Linux 0.6) with ESMTP id
	iB3B5j3E031500
	for <linux-lvm@redhat.com>; Fri, 3 Dec 2004 12:05:45 +0100
From: Ralf =?iso-8859-15?q?M=FCller?= <ralf@bj-ig.de>
Subject: Re: [linux-lvm] Problem with pvmove of system installation volume
Date: Fri, 3 Dec 2004 12:05:35 +0100
References: <200412021848.01813@bj-ig.de>
In-Reply-To: <200412021848.01813@bj-ig.de>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Boundary-02=_IiEsBQVxyCAM91L";
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200412031205.45068@bj-ig.de>
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


--Boundary-02=_IiEsBQVxyCAM91L
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Ok - update to my own post. I started the move process again - this time=20
with strace to get a protocoll of the failed system call. So the last=20
system calls of pvmove were:

write(1, "      /dev/md2: lvm2 label detec"..., 36) =3D 36
ioctl(5, BLKBSZGET, 0xbfff8f5c)         =3D 0
_llseek(5, 0, [0], SEEK_SET)            =3D 0
read(5, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,=20
4096) =3D 4096
ioctl(5, BLKBSZGET, 0xbfff8f7c)         =3D 0
_llseek(5, 53248, [53248], SEEK_SET)    =3D 0
read(5, "system {\nid =3D \"Qo3GHB-44Tw-wv7M-"..., 4096) =3D 4096
write(1, "    Found volume group \"system\"\n", 32) =3D 32
ioctl(6, DM_DEV_STATUS, 0x80d14b0)      =3D -1 ENXIO (No such device or=20
address)
ioctl(6, DM_DEV_STATUS, 0x80d14b0)      =3D -1 ENXIO (No such device or=20
address)
ioctl(6, DM_LIST_DEVICES, 0x80d14b0)    =3D 0
ioctl(6, DM_DEV_STATUS, 0x80ff518)      =3D 0
ioctl(6, DM_DEV_STATUS, 0x80ff518)      =3D 0
ioctl(6, DM_DEV_STATUS, 0x80ff580)      =3D 0
ioctl(6, DM_DEV_STATUS, 0x80ff5c8)      =3D -1 ENXIO (No such device or=20
address)
ioctl(6, DM_DEV_STATUS, 0x80d14b0)      =3D -1 ENXIO (No such device or=20
address)
write(1, "    Loading system-pvmove0\n", 27) =3D 27
write(1, "      Setting activation/mirror_"..., 51) =3D 51
ioctl(6, DM_DEV_CREATE

And here it stopped ...
Ralf

=2D-=20
Van Roy's Law: -------------------------------------------------------
       An unbreakable toy is useful for breaking other toys.

--Boundary-02=_IiEsBQVxyCAM91L
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBsEiIZcF+4X5mWz8RAuy0AJ4s3ky81e39mflTVtLPtvJmbyht2QCgie+T
UH+aiuBT6Zz3bVYOwvbZKxY=
=M+SA
-----END PGP SIGNATURE-----

--Boundary-02=_IiEsBQVxyCAM91L--
