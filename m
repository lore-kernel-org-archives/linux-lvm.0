Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4LCK7Sl020754
	for <linux-lvm@redhat.com>; Thu, 21 May 2015 08:20:07 -0400
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4LCK2cI020210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 21 May 2015 08:20:03 -0400
Received: from leda.localdomain (unknown [10.10.1.2])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id 15A3024A6F
	for <linux-lvm@redhat.com>; Thu, 21 May 2015 14:20:01 +0200 (CEST)
Date: Thu, 21 May 2015 14:19:55 +0200
From: Christian Hesse <list@eworm.de>
Message-ID: <20150521141955.70ebe714@leda.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/XFgfVwaf_dyVuYjtDxbDCAs";
	protocol="application/pgp-signature"
Subject: [linux-lvm] autoactivation fails
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

--Sig_/XFgfVwaf_dyVuYjtDxbDCAs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello everybody,

with recent lvm2 I had problems booting an Arch Linux system with non-syste=
md
initramfs. lvmetad is launched, but volumes are not activated. A git bisect
reported this bad commit:

commit fe30658a4d5fe4e4e6bb346c9c9ee7142a98f49d
Author: Ondrej Kozina <okozina@redhat.com>
Date:   Mon Apr 13 16:29:15 2015 +0200

    toollib: close connection to lvmetad after fork
   =20
    sharing connection between parent command and background
    processes spawned from parent could lead to occasional failures
    due to unexpected corruption in daemon responses sent to either child
    or a parent.
   =20
    lvmetad issued warning about duplicate config values in request.
    LVM commands occasionaly failed w/ internal error after receving
    corrupted response.
   =20
    lvmetad connection is renewed when needed after explicit disconnect
    in child

Reverting this single commit makes everything work with git master
(v2_02_120-36-gba68aed) again.
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/XFgfVwaf_dyVuYjtDxbDCAs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVXc1rAAoJEIlFIdfMgPR2924IAM6dxn6ovvhsndyTGOHxv467
yvleQn7Up+0TomUKnPphZ2yj6seNEhWs3dzlYhlVo3SY/NoT4VzYNl1drWC1o0g/
BPaSZ7sfsGs9U6l5GRNM8NUUH0mJZ8RAiqWQbdFmuU5DSNBryEYtcdWqo6yjBx/u
XuAXDcIwNgP9zRckFX0z8ngsNDBoIwFKdoABMrCsWOCTEN3htLZbWrqrIBKgBUYA
pdR2kt8+Mo0iUBoBKneLEeSNfFSzCdDlicaPskQlogTmwkwuDkpGerQT6vgWnIp1
4Fy9qi1VlHDfdHv5Jz/Mj6GsKVcxbCg+CvxgUxe62HgsJjBazEtetb4cjBxvCzs=
=v0wr
-----END PGP SIGNATURE-----

--Sig_/XFgfVwaf_dyVuYjtDxbDCAs--
