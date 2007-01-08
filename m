Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l08DtaCw009576
	for <linux-lvm@redhat.com>; Mon, 8 Jan 2007 08:55:36 -0500
Received: from deliver.uni-koblenz.de (deliver.uni-koblenz.de [141.26.64.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l08DtY58011465
	for <linux-lvm@redhat.com>; Mon, 8 Jan 2007 08:55:34 -0500
From: Rainer Krienke <krienke@uni-koblenz.de>
Subject: Re: [linux-lvm] Persistent minor number problem in lvm2
Date: Mon, 8 Jan 2007 14:55:30 +0100
References: <200701041524.50995.krienke@uni-koblenz.de>
	<200701050801.49807.krienke@uni-koblenz.de>
	<20070108122421.334a1933@slopi>
In-Reply-To: <20070108122421.334a1933@slopi>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9597747.W5tTGddeJi";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200701081455.30823.krienke@uni-koblenz.de>
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
To: Chris Osicki <osk@admin.swisscom-mobile.ch>, LVM general discussion and development <linux-lvm@redhat.com>

--nextPart9597747.W5tTGddeJi
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Montag, 8. Januar 2007 12:24 schrieben Sie:
> On Fri, 5 Jan 2007 08:01:46 +0100
>
> Hi Paul
>
> Don't let OS generate filesystem handles from major/minor numbers.
> Have a look at fsid option for exportfs (man 5 exports). It works.
> It's how I implemented it on my failover NFS clusters.
> BTW, persistent minors works as well, I found fsid easier to manage,
> though.
>
> Hope it helps.

Yes this helps. This is excactly what I was looking for and a goog solution=
=2E I=20
just didn't find it :-)

Have a nice day
Rainer=20
=2D-=20
=2D------------------------------------------------------------------------=
=2D-
Rainer Krienke, Universitaet Koblenz, Rechenzentrum, Raum A022
Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
=2D------------------------------------------------------------------------=
=2D-

--nextPart9597747.W5tTGddeJi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFok1Saldtjc/KDEoRAkh2AJ94jiusqjAr+/rIEgfQ81kUwvpE7wCguvgp
lB8Efn5cmGi1jCWOrgBFKz0=
=WM2Z
-----END PGP SIGNATURE-----

--nextPart9597747.W5tTGddeJi--
