Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA94TGxb020282
	for <linux-lvm@redhat.com>; Sat, 8 Nov 2008 23:29:16 -0500
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA94T2QT004053
	for <linux-lvm@redhat.com>; Sat, 8 Nov 2008 23:29:02 -0500
Received: from tp.knebb.de (p54BC4A50.dip.t-dialin.net [84.188.74.80])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.knebb.de (Postfix) with ESMTP id 46DDD1190A
	for <linux-lvm@redhat.com>; Sun,  9 Nov 2008 05:29:01 +0100 (CET)
Message-ID: <4916670C.4020502@knebb.de>
Date: Sun, 09 Nov 2008 05:29:00 +0100
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove and 100% IO Wait
References: <4915F80E.40407@knebb.de>	<f4f537b50811081243i351b8a7ch716292ec1ef7d08a@mail.gmail.com>	<4915FB94.1070005@knebb.de>
	<f4f537b50811081523v303ba8aep6b24de53c414a6d2@mail.gmail.com>
In-Reply-To: <f4f537b50811081523v303ba8aep6b24de53c414a6d2@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yohoo!

> Might not be, but if an operation involves multiple disks it will
> probably go at the pace of the slowest disk, which for me has always
> been USB...
I agree about the speed- but not with the issue of hanging. When pvmove
works the IO load is moderate (about 20% or less). But when it hangs it
jumps up to 100% on one or more cores.

> Are you 100% certainty the devices underlying all PVs are good, that
> you can dd 100% successfully?
Yes. I can do resize2fs, cp, mv and dd, too. Well, I haven't tried to dd
the whole devices as they are aprox. 1.5TB in size. But I'd say this is
fine!

GReetings

Christian

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFJFmcM0XNIYlAXmzsRAiQOAJ9Fo6SA3+yBGlZ6Ky0bKDw1sStAGACgmprm
pT+asXOQS/a0MMQ2jQoCeGo=
=eMR2
-----END PGP SIGNATURE-----
