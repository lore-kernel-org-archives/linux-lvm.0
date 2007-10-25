Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9PKlwFV025389
	for <linux-lvm@redhat.com>; Thu, 25 Oct 2007 16:47:58 -0400
Received: from mail.backcountry.com (mail.backcountry.com [206.71.94.246])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9PKlpbC000795
	for <linux-lvm@redhat.com>; Thu, 25 Oct 2007 16:47:51 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.backcountry.com (Postfix) with ESMTP id 92F6823E1AB7
	for <linux-lvm@redhat.com>; Thu, 25 Oct 2007 14:47:46 -0600 (MDT)
Received: from mail.backcountry.com ([127.0.0.1])
	by localhost (mail.backcountry.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id nbyjR5X+4GVF for <linux-lvm@redhat.com>;
	Thu, 25 Oct 2007 14:47:44 -0600 (MDT)
Received: from skrugerlt.local (unknown [4.71.96.110])
	by mail.backcountry.com (Postfix) with ESMTP id 08EFB23E1992
	for <linux-lvm@redhat.com>; Thu, 25 Oct 2007 14:47:44 -0600 (MDT)
From: Shaun Kruger <skruger@backcountry.com>
Date: Thu, 25 Oct 2007 14:47:29 -0600
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1258872.g2ZCn0V2f7";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200710251447.43405.skruger@backcountry.com>
Subject: [linux-lvm] LVM snapshot limits
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

--nextPart1258872.g2ZCn0V2f7
Content-Type: multipart/mixed;
  boundary="Boundary-01=_hDQIH1r4pZcu3Vf"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_hDQIH1r4pZcu3Vf
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I'm trying to create 45 LVM snapshots on one of my dev machines.  I have ab=
out=20
7TB of disk to work with, but I keep having wierd issues.  I can't seem to=
=20
make more than 30 snapshots.  At about 15-20 snapshots they stop being=20
created reliably and as I get to 30 snapshots I stop getting snapshots and=
=20
start getting COW table sized logical volumes that are in no way snapshots.=
 =20
Some of these snapshots cause kernel panics on RHEL 5 when I try to remove=
=20
them.

If anyone wants to take a look, I have included a script that reproduces th=
e=20
issue.  It works on both RHEL 5 and Ubuntu 7.04.  The script only requires =
a=20
few gigabytes of storage, so I don't think the problem has to do with my=20
large volume of storage. =20

I filed a support ticket with redhat, but I figured I'd float it here to se=
e=20
if anyone has any suggestions/experience.

Shaun Kruger

--Boundary-01=_hDQIH1r4pZcu3Vf
Content-Type: application/x-shellscript;
  name="lvbreak"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="lvbreak"

#!/bin/bash

VG=VGMain

lvcreate -n TEST-BASE -L 100M $VG

for i in `seq 1 100`;
do
    lvcreate -s -n TEST-$i -L 50M /dev/$VG/TEST-BASE
done

sleep 10

for i in `seq 1 100`;
do
    lvremove /dev/$VG/TEST-$i -f
done

--Boundary-01=_hDQIH1r4pZcu3Vf--

--nextPart1258872.g2ZCn0V2f7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHIQDv/zJrlJgPNdURAmfMAJ9oYE1eAUkmTuKvkAuQhgz10LHD+QCffW9R
YFyqwII+/RnkfthpJySo7WA=
=PpC0
-----END PGP SIGNATURE-----

--nextPart1258872.g2ZCn0V2f7--
