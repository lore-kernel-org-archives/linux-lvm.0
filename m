Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAD5I8L7010855
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 00:18:08 -0500
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAD5HrVV007508
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 00:17:54 -0500
Received: from tp.knebb.de (p54BC5DE8.dip.t-dialin.net [84.188.93.232])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.knebb.de (Postfix) with ESMTP id B6DCA119E6
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 06:17:50 +0100 (CET)
Message-ID: <491BB87D.7020903@knebb.de>
Date: Thu, 13 Nov 2008 06:17:49 +0100
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove and 100% IO Wait
References: <4915F80E.40407@knebb.de>	<f4f537b50811081243i351b8a7ch716292ec1ef7d08a@mail.gmail.com>	<4915FB94.1070005@knebb.de>	<f4f537b50811081523v303ba8aep6b24de53c414a6d2@mail.gmail.com>	<4916670C.4020502@knebb.de>
	<779919740811100933y914c938mc7813453ac88da59@mail.gmail.com>
In-Reply-To: <779919740811100933y914c938mc7813453ac88da59@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yohoo!

> I ran into similar issues when attempting a pvmove with clustered VG's
> under CLVMD.
What is CLVMD?

Anyway: It happened again and USB was not involved at all!
All SATA disks or SATA RAIDs.

$%^$%^=EF=BF=BD!!!

Any clues?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFJG7h80XNIYlAXmzsRAtHXAKDf0EyUvZngOLzoMoIHsWj+VxtWUQCcCqR2
E1COMYVO2FaqxB88K4wBGgY=3D
=3D+riP
-----END PGP SIGNATURE-----
