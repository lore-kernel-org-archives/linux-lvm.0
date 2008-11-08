Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA8KokDH014874
	for <linux-lvm@redhat.com>; Sat, 8 Nov 2008 15:50:46 -0500
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA8KoWel030448
	for <linux-lvm@redhat.com>; Sat, 8 Nov 2008 15:50:32 -0500
Received: from tp.knebb.de (p54BC4A50.dip.t-dialin.net [84.188.74.80])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.knebb.de (Postfix) with ESMTP id 846DE11830
	for <linux-lvm@redhat.com>; Sat,  8 Nov 2008 21:50:29 +0100 (CET)
Message-ID: <4915FB94.1070005@knebb.de>
Date: Sat, 08 Nov 2008 21:50:28 +0100
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove and 100% IO Wait
References: <4915F80E.40407@knebb.de>
	<f4f537b50811081243i351b8a7ch716292ec1ef7d08a@mail.gmail.com>
In-Reply-To: <f4f537b50811081243i351b8a7ch716292ec1ef7d08a@mail.gmail.com>
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

>> consists of two 3Ware 9500 PCI-X, a USB-SATA drive and three disks
>> connected to the local SATA controller.
> is the USB-SATA at all involved in the pvmove?

Hm...good question. I'd say no- but I can't say for sure where any
temporary PEs have been allocated.

The last pvmove FROM the USB-SATA went without any issues (500GB!).

Is it relevant?

Cheers

Christian
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFJFfuU0XNIYlAXmzsRAsTbAJ0daUInw5jMl4veCwctLdjK12h1EwCfSBQJ
In7oAFNWQkKka1KfFU2OO14=
=HDDo
-----END PGP SIGNATURE-----
