Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0204720316E8
	for <linux-lvm@redhat.com>; Mon,  6 Jan 2020 09:49:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85B351019800
	for <linux-lvm@redhat.com>; Mon,  6 Jan 2020 09:49:14 +0000 (UTC)
Received: from leda (unknown [87.190.244.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id 0B3A1C77D6
	for <linux-lvm@redhat.com>; Mon,  6 Jan 2020 10:48:59 +0100 (CET)
Date: Mon, 6 Jan 2020 10:48:57 +0100
From: Christian Hesse <list@eworm.de>
Message-ID: <20200106104857.0fa111e4@leda>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P_YI7CUG6JVqVjV._57DeN9";
	protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: [linux-lvm] bashism in tools/Makefile.in
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

--Sig_/P_YI7CUG6JVqVjV._57DeN9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello everybody,

building lvm2 with a shell other than bash fails:

% make -C tools/ command-count.h
make: Entering directory 'lvm2/tools'
    [GEN] cmds.h
/bin/dash: 1: set: Illegal option -o pipefail
    [GEN] command-lines-input.h
/bin/dash: 1: set: Illegal option -o pipefail
    [GEN] command-count.h
/bin/dash: 1: set: Illegal option -o pipefail
make: *** [Makefile:170: command-count.h] Error 2
make: Leaving directory 'lvm2/tools'

Please fix bashism in Makefile. Thanks!
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH=
"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);=
}

--Sig_/P_YI7CUG6JVqVjV._57DeN9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAl4TAokACgkQiUUh18yA
9HYZzQgAxJPmrPmuoZjwc8dxptae6ysWuQz5q6KFdb58KuuTpzE6NzqSrhBzDtDa
JQ5k3e6VoIhS1kB107/OZ8ZtYJJb5nsuhQY0RV6b3J5M3pb7u+ZMLuXgKLYD33sp
DuFMm6XJckcb11/lc20bftZSVDmt6IQjb4iXRmi8dPcIoD5DX87lurtlrs2AxIbD
+bYOLh54mOvQUOPWhr/DvvdGA1Ja07yTggU/NtDy8iJW0R3Se1s0mvhSpth6g64K
hvcSSvW75gpvfbanoj+FrrmiLrJx1MnkwiByLZG531iKtincJHO+juFgSDMeRy2H
WLxMukpq/hdjP1NDyhfkyu5lURNzRA==
=TrYl
-----END PGP SIGNATURE-----

--Sig_/P_YI7CUG6JVqVjV._57DeN9--
