Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAD9VBwF006517
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 04:31:11 -0500
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAD9UvE1025413
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 04:30:57 -0500
Received: from tp.knebb.de (p54BC6088.dip.t-dialin.net [84.188.96.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.knebb.de (Postfix) with ESMTP id 69390FA0C
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 10:30:56 +0100 (CET)
Message-ID: <491BF3CF.2090800@knebb.de>
Date: Thu, 13 Nov 2008 10:30:55 +0100
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove --abort does nothing
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

Regarding to another thread (pvmove and 100% IO Wait) I had to reboot my
server during a pvmove.

Now I have a pvmove0 LV which seems to be locked.
A "pvmove"  does nothing.
Same for "pvmove --abort".
Nothing happens- I can't remove the pvmove0 LV neither continue with the
pvmove operation!

How can I get out of here?

Thanks!

Christian
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFJG/PP0XNIYlAXmzsRAvLtAJ9oD5GrLwdtHhf9dzbxOoZoQKLkYACgoLfS
5pT48VLTB2t93MJdiMfA8Xo=
=sN2X
-----END PGP SIGNATURE-----
