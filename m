Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jASDPoV29271
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 08:25:50 -0500
Received: from pong.topalis.com (pong.topalis.com [195.243.109.5])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jASDPh3Z015671
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 08:25:43 -0500
Received: from pong.topalis.com (localhost.localdomain [127.0.0.1])
	by localhost.pong.topalis.com (Postfix) with ESMTP id 06905189AE2
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 14:25:41 +0100 (CET)
Received: from topalis.com (fw-dmz.topalis.com [195.243.109.1])
	by pong.topalis.com (Postfix) with ESMTP id EB0461ED184
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 14:25:40 +0100 (CET)
Received: from lt-mm.think (lt-mm.think [192.168.10.147])
	by topalis.com (Postfix) with ESMTP id D56BF40106
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 14:25:40 +0100 (CET)
From: Michael Mey <michael.mey@to.com>
Date: Mon, 28 Nov 2005 14:25:33 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1985825.mxXC8l37ZY";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200511281425.39209.michael.mey@to.com>
Subject: [linux-lvm] CLVM raid support
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

--nextPart1985825.mxXC8l37ZY
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

today I found a note in the FAQ of the CLVM project page that says there ar=
e=20
plans to support redundant raid levels.
Does anybody know, if and when this support could be realized?

Would that mean, one can e.g. the following scenario could be realised:

host1 and host2, both having a data-partition that is exported / imported=20
using GNBD to each other.
Now a raid-1 is build on top of these two devices, which can be seen on bot=
h=20
hosts.
That could be used to have a gfs-filesystem on this raid, to have shared=20
storage withing two hosts which is mirrored, so if one host failes, no=20
problem.

Regards,

Michael


=2D-=20
=2D------------------------------------------------------------------------=
=2D--------------
Michael Mey=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0=20
Thinking Objects Software GmbH =A0  |=A0  mailto: michael.mey@to.com=20
Lilienthalstrasse 2/1 =A0 =A0 =A0 =A0 =A0 =A0             |   phone: +49 71=
1 88770-147
70825 Stuttgart-Korntal, Germany =A0|  =A0fax: +49 711 88770-449
=2D------------------------------------------------------------------------=
=2D--------------

--nextPart1985825.mxXC8l37ZY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDiwVT3rj8BeD5OvMRAhC2AJ95UR48NrBjHLZsQfMXkBOIhWHWtACffOhN
hoOVOnJi3osvosBZmFO8zW4=
=Qeqz
-----END PGP SIGNATURE-----

--nextPart1985825.mxXC8l37ZY--
