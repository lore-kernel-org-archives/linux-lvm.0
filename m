Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k63CVkNK009951
	for <linux-lvm@redhat.com>; Mon, 3 Jul 2006 08:31:46 -0400
Received: from mail-in-04.arcor-online.net (mail-in-04.arcor-online.net
	[151.189.21.44])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k63CVixg008950
	for <linux-lvm@redhat.com>; Mon, 3 Jul 2006 08:31:44 -0400
Received: from mail-in-08-z2.arcor-online.net (mail-in-08-z2.arcor-online.net
	[151.189.8.20])
	by mail-in-04.arcor-online.net (Postfix) with ESMTP id DBAB5132486
	for <linux-lvm@redhat.com>; Mon,  3 Jul 2006 14:31:43 +0200 (CEST)
Received: from mail-in-03.arcor-online.net (mail-in-03.arcor-online.net
	[151.189.21.43])
	by mail-in-08-z2.arcor-online.net (Postfix) with ESMTP id CC2175452E
	for <linux-lvm@redhat.com>; Mon,  3 Jul 2006 14:31:43 +0200 (CEST)
Received: from bongo.freakout.de (freakout.homeip.net [217.173.146.67])
	(Authenticated sender: hotrat@arcor.de)
	by mail-in-03.arcor-online.net (Postfix) with ESMTP id 97F2B1F6148
	for <linux-lvm@redhat.com>; Mon,  3 Jul 2006 14:31:43 +0200 (CEST)
Received: from smtphost (bongo.freakout.de [192.168.7.68])
	by bongo.freakout.de (8.13.7/8.13.6) with ESMTP id k63CVT2M018632
	for linux-lvm@redhat.com; Mon, 3 Jul 2006 14:31:29 +0200
Date: Mon, 3 Jul 2006 14:31:29 +0200
Message-Id: <200607031231.k63CVT2M018632@bongo.freakout.de>
From: Axel Reinhold <lvm@freakout.de>
Subject: [linux-lvm] need pvresize (lvm1)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

still using LVM1 / 2.4.x on servers - have user-space-tools 1.0.8 installed from source.
In the distribution is a man-page for "pvresize" - but no such binary is produced by make!?

Would need that functionality on a server. How can i produce pvresive (lvm1)?

Axel
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4-PB (GNU/Linux)

iD8DBQFEqQ4gHQ9JwE2bDw0RAn1jAKC4W9ZiDLYyMcBxShlMAJ4oA/gqawCghFbR
cS50ggf2HbIqtCAlwz34jjc=
=K5qU
-----END PGP SIGNATURE-----
