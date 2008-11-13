Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mADAU4ps002337
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 05:30:04 -0500
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mADATrfH022948
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 05:29:53 -0500
Received: from tp.knebb.de (p54BC6088.dip.t-dialin.net [84.188.96.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.knebb.de (Postfix) with ESMTP id 5CCA5FA0C
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 11:29:52 +0100 (CET)
Message-ID: <491C019F.6060205@knebb.de>
Date: Thu, 13 Nov 2008 11:29:51 +0100
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove --abort does nothing
References: <491BF3CF.2090800@knebb.de>
	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>
In-Reply-To: <C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>
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
> prompt> dmsetup status
> and
> prompt> dmsetup table
Both report several line for each LV, but empty for the pvmove0:

"vg1-pvmove0:"

Nothing more. Do you need the lines from the other LVs?

Thanks for trying to help!

Christian

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFJHAGf0XNIYlAXmzsRAuGLAJ9gA3Xc0DIZybrO6f0OQagfrUzOvQCgtBID
5DQIHKtzPj2Bp6lfWAH5tAI=
=Ma56
-----END PGP SIGNATURE-----
