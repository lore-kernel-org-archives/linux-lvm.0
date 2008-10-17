Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9H462qe028015
	for <linux-lvm@redhat.com>; Fri, 17 Oct 2008 00:06:02 -0400
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9H45HeF030368
	for <linux-lvm@redhat.com>; Fri, 17 Oct 2008 00:05:47 -0400
Received: from tp.knebb.de (p54BC5FE0.dip.t-dialin.net [84.188.95.224])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.knebb.de (Postfix) with ESMTP id 87367F7BB
	for <linux-lvm@redhat.com>; Fri, 17 Oct 2008 06:05:16 +0200 (CEST)
Message-ID: <48F80EFB.30404@knebb.de>
Date: Fri, 17 Oct 2008 06:05:15 +0200
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVs corrupted after pvresize
References: <48F7AD78.1000002@knebb.de>
	<Pine.LNX.4.64.0810161829570.14457@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0810161829570.14457@bmsred.bmsi.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yohoo!

|> I resized one of these RAID arrays for additional 250GB. After this was
| Resizing a RAID-5 array is often not what you think, and doing so often
| scrambles the data, depending on what RAID implementation you are using.
I'm using a hardware RAID 3ware 9500S Controller. And this guy offers
migration from RAID10 (4disks) to RAID5 (4disks, but with larger capacity).
And I already did this task several times on these types of controllers.


| In any case, LVM was not your problem.
This answer is too simple to be true.
After the resize the partition and the PV were recognized correctly! So
I'm pretty sure the migration was ok.
But after the deletion of the partion, recreation and pvcreate
everything went wrong. So for me it is obvious, LVM had an issue. But
which one?

Greets
Christian
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFI+A770XNIYlAXmzsRAicJAKCpogPKLWhuOtABRI/cBthIRVwlHACZAcoi
b7+z+RaIKUKnui+b8XLqtw0=
=TSoe
-----END PGP SIGNATURE-----
