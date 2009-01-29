Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0T782Ap020023
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 02:08:02 -0500
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0T77fBx004702
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 02:07:42 -0500
Received: from mx.knebb.de (p54BC59FB.dip.t-dialin.net [84.188.89.251])
	by mail.knebb.de (Postfix) with ESMTP id 44E8570165
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 08:08:16 +0100 (CET)
Received: from tp.knebb.de (tp.knebb.de [192.168.0.200])
	by mx.knebb.de (Postfix) with ESMTP id 4E62E1D014D
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 08:07:43 +0100 (CET)
Message-ID: <498155BB.9030607@knebb.de>
Date: Thu, 29 Jan 2009 08:07:39 +0100
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot on "disk": file system consistent?
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

Just for my own curiousity:

I have a LVM volume which is presentet through iSCSI to another box. On
the other box I used fdisk to create a partition and formatted the
partition with ext3.

Now I'm performing a backup on the local iSCSI/LVM server like follows:

Taking a snapshot of the LV:
lvcreate -s -p r -c 64K -L 30G -n snap_backup /dev/vg/backup

Setting up the lo-device with the calculation for the partition start:
losetup -o$[512*64] /dev/loop1 /dev/vg/snap_backup

Mounting:
mount /dev/loop1 /srv/snap/ -t ext3 -o ro

Now my question is about the file system on the partition. Is it
consistent? Would it be better to perform a fsck before mounting?

Or can I rely on the above procedure to gain always a proper filesystem?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFJgVW70XNIYlAXmzsRAvFeAJ9Xz1IzEqEw49+kBnhAChixvK6zCgCgtxaz
a7bgGVSkpTWpEoDXueralWE=
=RR04
-----END PGP SIGNATURE-----
