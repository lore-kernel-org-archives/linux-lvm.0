Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9GL9TZ1011454
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 17:09:29 -0400
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9GL9Emf023375
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 17:09:14 -0400
Received: from tp.knebb.de (p54BC5FE0.dip.t-dialin.net [84.188.95.224])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.knebb.de (Postfix) with ESMTP id 0EF07F7CA
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 23:09:12 +0200 (CEST)
Message-ID: <48F7AD78.1000002@knebb.de>
Date: Thu, 16 Oct 2008 23:09:12 +0200
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVs corrupted after pvresize
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
To: linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yohoo!

I'm currently in big troubles :-(
What happened?

I have a single VG running on three RAID arrays.

I resized one of these RAID arrays for additional 250GB. After this was
done I needed to reboot for the kernel to pick up the new size.
Then I went into fdisk, deleted the 8e-LVM partition and re-created a
new one with the same starting sector but a later end sector.
Again, for the kernel to pick up the new partition table I rebooted.

After the reboot my VG was inaccessible because it complained about a
missing PV.
I checked
http://www.novell.com/coolsolutions/appnote/19386.html#DiskPermanentlyRemoved
Symptom2, Solution2.

vgcfgrestore showed the same error: "Couldn't find device with uuid ..."

So I re-created th PV with "pvcreate --uuid [...] /dev/sdd1.

vgscan and I had the new size and a running VG showing all my LVs. :)

Unfortunately ALL my LVs on the /dev/sdd1 PV are severely corrupted- the
complain about missing partition tables, fsck.ext2 prints thousands of
errors and so on.

I tried to reduce the PV again, but the LVs remain corrupted.

I don't expect my data to be recoverable- but I want to know what I did
wrong.

Though, if you can recover my LVs it would be fine ;-)


Any ideas?


Christian


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFI96130XNIYlAXmzsRAqMGAKDK13dabQD/LFGl460R410PQlNFCQCgt7ZT
iVCXd/QCUoSQIdfTaODAbPU=
=XMWS
-----END PGP SIGNATURE-----
