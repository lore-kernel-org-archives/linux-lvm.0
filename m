Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8QBtir15169
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 07:55:44 -0400
Received: from postman.arcor.de (postman2.arcor-online.net [151.189.20.157])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8QBtb7a018744
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 07:55:43 -0400
Received: from bongo.freakout.de (freakout.homeip.net [217.173.146.67])
	(authenticated bits=0)
	by postman.arcor.de (8.13.0.PreAlpha4/8.13.0.PreAlpha4) with ESMTP id
	i8QBtVRg026367
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 13:55:31 +0200 (MEST)
Received: from smtphost (bongo.freakout.de [192.168.7.68])
	by bongo.freakout.de (8.13.1/8.13.1) with ESMTP id i8QBskt6004659
	for linux-lvm@redhat.com; Sun, 26 Sep 2004 13:54:46 +0200
Date: Sun, 26 Sep 2004 13:54:46 +0200
Message-Id: <200409261154.i8QBskt6004659@bongo.freakout.de>
From: Axel Reinhold <lvm@freakout.de>
Subject: [linux-lvm] enlarge a physical partition
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

can i simply enlarge a physical volume by changing the partition?
I have no more free partition numbers but the lvm-volume is the
last partition on the disk. I cloned the whole disk and now have
free space just behind the physical volume. I could change the
partition but how can lvm see that it had growed?

Axel
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBVq4GHQ9JwE2bDw0RAkcFAKDk5v+YzgMuH3DSP7yasBF45Yfy8wCfW+uy
NjKB8gjNZchEAFvwB/ZGExs=
=GXMT
-----END PGP SIGNATURE-----
