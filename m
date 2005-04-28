Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3SEE4O05665
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 10:14:04 -0400
Received: from smtp14.wanadoo.fr (smtp14.wanadoo.fr [193.252.23.69])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3SEDw6B024181
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 10:13:59 -0400
Received: from smtp14.wanadoo.fr (mwinf1404 [172.22.145.26])
	by mwinf1405.wanadoo.fr (SMTP Server) with ESMTP id 9D9D11C03110
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 15:29:30 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf1404.wanadoo.fr (SMTP Server) with ESMTP id 5377570000C9
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 15:29:18 +0200 (CEST)
Received: from tangerine.coulon.evette
	(ADijon-151-1-12-61.w83-194.abo.wanadoo.fr [83.194.242.61])
	by mwinf1404.wanadoo.fr (SMTP Server) with ESMTP id 2494470000B9
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 15:29:18 +0200 (CEST)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.50) id 1DR94v-00062e-Py
	for linux-lvm@redhat.com; Thu, 28 Apr 2005 15:29:17 +0200
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22853-05 for <linux-lvm@redhat.com>;
	Thu, 28 Apr 2005 15:29:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.50) id 1DR94m-00062O-KN
	for linux-lvm@redhat.com; Thu, 28 Apr 2005 15:29:08 +0200
Date: Thu, 28 Apr 2005 13:29:08 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] swap on LVM
References: <4270E3C4.1090408@nextra.ro>
In-Reply-To: <4270E3C4.1090408@nextra.ro> (from gimre@nextra.ro on Thu Apr
	28 15:23:16 2005)
Message-Id: <1114694948l.26372l.2l@tangerine>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-A+mW/ezXRB2P+QniaW5/"
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

--=-A+mW/ezXRB2P+QniaW5/
Content-Type: text/plain; charset=iso-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 28.04.2005 15:23:16, Gergely Imre a =E9crit=A0:
>=20
> what about swap partitions on LVM? are there any known problems? can
> one
>  put swap on a LV safely?
> thx.

I've a lvm2 over raid1 and the swap is in lvm. I didnt encoutered any =20
problem.

>=20
> --
> Gergely Imre

Regards

Jean-Luc

--=-A+mW/ezXRB2P+QniaW5/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCcOUkUdGGXzzGnNARAhW/AJ9Xpv2EUynpPwmeRFvbPIe9vuDONQCeMwRW
oq9q7K6h6EjtvhwwRKVfpgQ=
=Xqrp
-----END PGP SIGNATURE-----

--=-A+mW/ezXRB2P+QniaW5/--
