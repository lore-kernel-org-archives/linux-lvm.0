Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5SH2Lr8022979
	for <linux-lvm@redhat.com>; Wed, 28 Jun 2006 13:02:21 -0400
Received: from cst-systemhaus.de (cst-systemhaus.de [212.227.82.111])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5SH2KJA027874
	for <linux-lvm@redhat.com>; Wed, 28 Jun 2006 13:02:21 -0400
Received: from localhost (localhost [127.0.0.1])
	by cst-systemhaus.de (Postfix) with ESMTP id 0BE6E7819286
	for <linux-lvm@redhat.com>; Wed, 28 Jun 2006 19:00:54 +0200 (CEST)
Received: from cst-systemhaus.de ([127.0.0.1])
	by localhost (cst-systemhaus.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10445-03 for <linux-lvm@redhat.com>;
	Wed, 28 Jun 2006 19:00:51 +0200 (CEST)
Received: from cst-it.dyndns.org (p54A794BF.dip0.t-ipconnect.de
	[84.167.148.191])
	by cst-systemhaus.de (Postfix) with ESMTP id BB8107817367
	for <linux-lvm@redhat.com>; Wed, 28 Jun 2006 19:00:50 +0200 (CEST)
Received: from ubuntu (ubuntu [192.168.100.233])
	by cst-it.dyndns.org (Postfix) with ESMTP id B6F2A1C0F516
	for <linux-lvm@redhat.com>; Wed, 28 Jun 2006 18:59:30 +0200 (CEST)
From: Denny Schierz <cuall@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-XCIvm4dioZ5nco/RVx23"
Date: Wed, 28 Jun 2006 19:02:11 +0200
Message-Id: <1151514131.8712.20.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [linux-lvm] can't delete snapshot
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


--=-XCIvm4dioZ5nco/RVx23
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

hi,

i did a mistake and created a snapshot from a mounted lvm and break it,
while it was creating the snapshot.

my /dev/raid_daten/vhost6_root is definitely unusable so i want to
delete it:

(i had do to a ctrl +c to break lvs, cause: "Giving up waiting for
lock, /var/lock/lvm/V_raid_daten: flock failed:
Can't lock raid_daten:skipping, but than it shows the output )

ACTIVE   Original '/dev/raid_daten/vhost1_root' [4,96 GB] inherit
ACTIVE   Snapshot '/dev/raid_daten/vhost6_root' [4,96 GB] inherit

root@xendom0:~# lvremove raid_daten/vhost6_root
Do you really want to remove active logical volume "vhost6_root"? [y/n]:
y

i don't know, how i can delete these snapshot. It hangs and i can't do
anything.

Kernel is 2.6.16-xen

any suggestions?

cu denny

--=20
Sicherheit verst=E4ndlich http://www.sides.de
GnuPG Key
http://pgpkeys.pca.dfn.de:11371/pks/lookup?op=3Dget&search=3D0x2A5CE192AB7D=
3FE0

--=-XCIvm4dioZ5nco/RVx23
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBEorYTKlzhkqt9P+ARAs4PAJ9EjMGvSNGYguOIwcVGLrXe4Z4MLACaAoFy
1YXuIkx81QBdqNsiqvqQpnc=
=jAy/
-----END PGP SIGNATURE-----

--=-XCIvm4dioZ5nco/RVx23--
