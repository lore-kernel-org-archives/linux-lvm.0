Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l04EOv4R032196
	for <linux-lvm@redhat.com>; Thu, 4 Jan 2007 09:24:57 -0500
Received: from deliver.uni-koblenz.de (deliver.uni-koblenz.de [141.26.64.15])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l04EOsgq015152
	for <linux-lvm@redhat.com>; Thu, 4 Jan 2007 09:24:54 -0500
Received: from localhost (localhost [127.0.0.1])
	by deliver.uni-koblenz.de (Postfix) with ESMTP id B12CFB9B1A7
	for <linux-lvm@redhat.com>; Thu,  4 Jan 2007 15:24:53 +0100 (CET)
Received: from deliver.uni-koblenz.de ([127.0.0.1])
	by localhost (deliver [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 00993-08 for <linux-lvm@redhat.com>;
	Thu,  4 Jan 2007 15:24:51 +0100 (CET)
Received: from bliss.uni-koblenz.de (bliss.uni-koblenz.de [141.26.64.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by deliver.uni-koblenz.de (Postfix) with ESMTP id A6A43B9B158
	for <linux-lvm@redhat.com>; Thu,  4 Jan 2007 15:24:51 +0100 (CET)
From: Rainer Krienke <krienke@uni-koblenz.de>
Date: Thu, 4 Jan 2007 15:24:47 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13006856.QuWWbFIXga";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200701041524.50995.krienke@uni-koblenz.de>
Subject: [linux-lvm] Persistent minor number problem in lvm2
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

--nextPart13006856.QuWWbFIXga
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

I am running fileservers with SUSEs SLES10 using lvm2-2.02.02.

I noticed that minor numbers are not persitent no matter if I call lvcreate=
=20
with "-M y" or without it. Whenever a logical volume is deleted and the=20
machine is rebooted all minor numbers above the one of the lv that I delete=
d=20
deleted are reassigned. This has dramatic consequences if the system server=
s=20
as a NFS server as I had to learn. Clients (not rebooted) suddenly acces a=
=20
NFS share say server:/export/A  but the contents of A are what=20
server:/export/B really contains because the minor number of A and B change=
d=20
on the server. So the mount succeeds but you get another NFS share than you=
=20
mounted. Really ugly.

I found this discussion:
=20
http://lists.alioth.debian.org/pipermail/pkg-lvm-maintainers/2006-July/0006=
90.html

So I guess that this bug should have been fixed. Can anyone tell me if this=
 is=20
true, so that minor numbers are really persisent and what version of lvm I=
=20
need to get this persistence to work correctly?

Thanks
Rainer Krienke
=2D-=20
=2D------------------------------------------------------------------------=
=2D-
Rainer Krienke, Universitaet Koblenz, Rechenzentrum, Raum A022
Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
=2D------------------------------------------------------------------------=
=2D-

--nextPart13006856.QuWWbFIXga
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFnQ4yaldtjc/KDEoRAp7KAJ4l64wPmXlSwhRCUWYk5VArh9FWcQCfRbUb
3XEeGfqHv806q7YMDhDlbl8=
=019e
-----END PGP SIGNATURE-----

--nextPart13006856.QuWWbFIXga--
