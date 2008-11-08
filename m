Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA8KZhhJ011521
	for <linux-lvm@redhat.com>; Sat, 8 Nov 2008 15:35:43 -0500
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA8KZSVc025363
	for <linux-lvm@redhat.com>; Sat, 8 Nov 2008 15:35:29 -0500
Received: from tp.knebb.de (p54BC4A50.dip.t-dialin.net [84.188.74.80])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.knebb.de (Postfix) with ESMTP id 88EA111830
	for <linux-lvm@redhat.com>; Sat,  8 Nov 2008 21:35:27 +0100 (CET)
Message-ID: <4915F80E.40407@knebb.de>
Date: Sat, 08 Nov 2008 21:35:26 +0100
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove and 100% IO Wait
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

I've some issues with pvmove.

It is very likely to appear during a pvmove operation for my server to
spike to 100% IO waits.

If this happens, no IO on the LVs is possible, even the rest of the
server is accessible without any issues.

I can't predict when it happens, but it happens...

pvmove started. Some minutes or hours later the io wait on the server
goes up to 100% (or 3 cores of the quad core are going to 100%).

Running a RedHat EL 5.x (CentOS) with all current updates. The storage
consists of two 3Ware 9500 PCI-X, a USB-SATA drive and three disks
connected to the local SATA controller.

I can't see anything relevant in the logfiles. When the CPU is up, I
have to reset the server as any operation on the LV will never finish  :-(

Any clues?

Christian

Any clues?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFJFfgN0XNIYlAXmzsRAih2AKCk2ItzDHX0s4n+pCHdnom9wh4WQgCeOlba
PDfvqDf1WmgYDmPbB49Ltso=
=nvvi
-----END PGP SIGNATURE-----
