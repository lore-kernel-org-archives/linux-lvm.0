Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAE8LN88020379
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 03:21:23 -0500
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAE8L9tP011641
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 03:21:09 -0500
Received: from tp.knebb.de (p54BC555E.dip.t-dialin.net [84.188.85.94])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.knebb.de (Postfix) with ESMTP id 41E9BDF38
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 09:21:08 +0100 (CET)
Message-ID: <491D34F3.7030108@knebb.de>
Date: Fri, 14 Nov 2008 09:21:07 +0100
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove --abort does nothing
References: <491BF3CF.2090800@knebb.de>	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>	<491C019F.6060205@knebb.de>
	<361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
In-Reply-To: <361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
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

Hi,

meanhwhile I did a "vgsplit" and the pvmove0 LV went together with one
LV to the new VG while the old VG seems to be ok now.

Looks like it is attached to this particular LV. Unfortunately, this is
the largest LV and it would be hard to move the data over...

Any further ideas?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFJHTTz0XNIYlAXmzsRAqAPAJ9GZh5sto3GAg4qqmkEPVipA8TLUQCeODdZ
HvE8ErHDUJtI2MFROONaCt8=
=NGly
-----END PGP SIGNATURE-----
