Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l05726Zx024868
	for <linux-lvm@redhat.com>; Fri, 5 Jan 2007 02:02:06 -0500
Received: from deliver.uni-koblenz.de (deliver.uni-koblenz.de [141.26.64.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l057225b020063
	for <linux-lvm@redhat.com>; Fri, 5 Jan 2007 02:02:03 -0500
Received: from localhost (localhost [127.0.0.1])
	by deliver.uni-koblenz.de (Postfix) with ESMTP id BBAD4B480C0
	for <linux-lvm@redhat.com>; Fri,  5 Jan 2007 08:01:56 +0100 (CET)
Received: from deliver.uni-koblenz.de ([127.0.0.1])
	by localhost (deliver [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 04373-06 for <linux-lvm@redhat.com>;
	Fri,  5 Jan 2007 08:01:54 +0100 (CET)
Received: from bliss.uni-koblenz.de (bliss.uni-koblenz.de [141.26.64.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by deliver.uni-koblenz.de (Postfix) with ESMTP id A1D0FB9934E
	for <linux-lvm@redhat.com>; Fri,  5 Jan 2007 08:01:54 +0100 (CET)
From: Rainer Krienke <krienke@uni-koblenz.de>
Subject: Re: [linux-lvm] Persistent minor number problem in lvm2
Date: Fri, 5 Jan 2007 08:01:46 +0100
References: <200701041524.50995.krienke@uni-koblenz.de>
	<20070104203734.GB12275@IUPUI.Edu>
In-Reply-To: <20070104203734.GB12275@IUPUI.Edu>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1608312.4Yx6PFdE0B";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200701050801.49807.krienke@uni-koblenz.de>
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

--nextPart1608312.4Yx6PFdE0B
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Donnerstag, 4. Januar 2007 21:37 schrieb Mark H. Wood:
> Mount by LABEL=3D or UUID=3D?
>
> Device node numbers are good for physical things like serial lines,
> but not so good for logical things like storage volumes.  If you can
> label it, do, and always identify it by your label.

I doubt that this would solve the problem since in the scenario I had, the=
=20
client already had mounted a directory from a server. Then on the server th=
e=20
minor ids of exported NFS volumes changed and then the client did see=20
the "wrong" contents in the "right" NFS share mounted from the server. The=
=20
problem is that NFS relies on major, minor numbers in its protocol, I think=
=2E=20
So UUIDs could only help  in an initial mount but not later.

Have a nice day
Rainer
=2D-=20
=2D------------------------------------------------------------------------=
=2D-
Rainer Krienke, Universitaet Koblenz, Rechenzentrum, Raum A022
Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
=2D------------------------------------------------------------------------=
=2D-

--nextPart1608312.4Yx6PFdE0B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFnffdaldtjc/KDEoRAmIqAJ9RE81AwLmDYlYEkYJac/0MEKw3ygCg8Yym
bvkXRThvIIeNMlNuWRjgN3c=
=GFnD
-----END PGP SIGNATURE-----

--nextPart1608312.4Yx6PFdE0B--
