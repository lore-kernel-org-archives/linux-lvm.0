Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4B9ZTQT029480
	for <linux-lvm@redhat.com>; Mon, 11 May 2015 05:35:30 -0400
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4B9ZQq5004704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 11 May 2015 05:35:27 -0400
Received: from leda.localdomain (unknown [10.10.1.2])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id 1BEEC249BA
	for <linux-lvm@redhat.com>; Mon, 11 May 2015 11:35:25 +0200 (CEST)
Date: Mon, 11 May 2015 11:35:19 +0200
From: Christian Hesse <list@eworm.de>
Message-ID: <20150511113519.7570055c@leda.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/7hOa9aH3Z=AZ9PS=EQbQOth";
	protocol="application/pgp-signature"
Subject: [linux-lvm] invalid snapshot with umounted fs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--Sig_/7hOa9aH3Z=AZ9PS=EQbQOth
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello everybody,

I have a backup scripts that creates read-only snapshots from my lvm volume=
s,
then runs rsync on them.

This fails for one of my volumes, mount reports an unknown filesystem on the
snapshot. The only difference compared to my other volumes is the fact that
it is not mounted by default.
Mounting the filesystem fixes the problem, the snapshot is valid when creat=
ed
from mounted filesystem.

I saw this behavior with lvm2 versions 2.02.116 to 2.02.119. Probably I did
not have this configuration before, so possibly the problem exists even
longer.
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/7hOa9aH3Z=AZ9PS=EQbQOth
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVUHfXAAoJEIlFIdfMgPR23bEIAJd4Ejnd2QRMtt9PxAf73A18
9furYIsKycgPBzPhkAMvUnrjsx5p7KrQ2YC7ZKyF+/7daJma8MRTonpdzGF7hmjI
UUKB7qT7XtnWhj/v626CEsCsxdd5iwMNMbCkZHgnudWWhj1h35aMHTJo4q7N8wPK
Xyc3q7LsR/HIaovjlBK/EaWuNS8n5Dvkvk1911ag0hQ4wKsQDvkEQ78fO8fQETJr
o4kUps3lObQZ2FaJHvVtzcnNafWs16ztx4YtZpPD6grvm5AnLthqy/WSrVyPIx1s
QAyN6u7H4pWYaidZlMciOzw+aQMs0NvLMyXexgiK847FaeWJIEwsd6NZpj+THmw=
=pips
-----END PGP SIGNATURE-----

--Sig_/7hOa9aH3Z=AZ9PS=EQbQOth--
