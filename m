Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4GCms010843
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 08:48:54 -0400
Received: from orbb.hbedv.com (orbb.hbedv.com [217.11.63.31])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4GCmm8K019258
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 08:48:48 -0400
Received: from localhost (unknown [127.0.0.1])
	by orbb.hbedv.com (H+BEDV Postfix) with ESMTP id 9475A8BC83
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 14:48:37 +0200 (CEST)
Received: from chiron.bla.fasel.org (pD9E5C7E2.dip.t-dialin.net
	[217.229.199.226])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by orbb.hbedv.com (H+BEDV Postfix) with ESMTP id 275E68BC83
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 14:48:37 +0200 (CEST)
Received: from localhost (unknown [127.0.0.1])
	by chiron.bla.fasel.org (Postfix) with ESMTP id 7C96323
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 14:48:47 +0200 (CEST)
Received: from prometheus.bla.fasel.org (prometheus.bla.fasel.org
	[192.168.0.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by chiron.bla.fasel.org (Postfix) with ESMTP id 076DB23
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 14:48:46 +0200 (CEST)
Received: from localhost (unknown [127.0.0.1])
	by prometheus.bla.fasel.org (Postfix) with ESMTP id C2C802BFB1
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 14:48:46 +0200 (CEST)
Date: Sun, 16 May 2004 14:48:46 +0200
From: Wolfram Schlich <lists@wolfram.schlich.org>
Subject: Re: [linux-lvm] /boot on lvm?
Message-ID: <20040516124846.ALLYOURBASEAREBELONGTOUS.D9078@bla.fasel.org>
References: <40A72846.5050801@mlug.missouri.edu>
	<1084705130.3126.2.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline
In-Reply-To: <1084705130.3126.2.camel@localhost>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Jeff Layton <jtlayton@poochiereds.net> [2004-05-16 13:00]:
> On Sun, 2004-05-16 at 01:37 -0700, Michael wrote:
>=20
> > Is it okay to put everything, including /boot and other critical Linux=
=20
> > files on an LVM drive? How about swap space?
>=20
> I run everything on LVM except for /boot, primarily because I use GRUB
> as a bootloader and it doesn't understand LVM volumes. As long as your
> bootloader understands LVM volumes there should be no problem with it.

Gentoo bug 42433: [PATCH] GRUB x86 LVM support
http://bugs.gentoo.org/show_bug.cgi?id=3D42433

Altough it's not yet finished, it looks quite interesting.
--=20
Wolfram Schlich; Friedhofstr. 8, D-88069 Tettnang; +49-(0)178-SCHLICH

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAp2Mut15vnsGjAmgRAl23AKDAtLVRt2ipFvOiBWCVQe6Yu30bEACgpXcF
OnF7v8yukZlCwiB63+fmSCs=
=4oSt
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
