Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6GKOuIu021650
	for <linux-lvm@redhat.com>; Sat, 16 Jul 2011 16:24:56 -0400
Received: from mtaout22.012.net.il (mtaout22.012.net.il [80.179.55.172])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6GKOsch020910
	for <linux-lvm@redhat.com>; Sat, 16 Jul 2011 16:24:55 -0400
Received: from conversion-daemon.a-mtaout22.012.net.il by
	a-mtaout22.012.net.il (HyperSendmail v2007.08) id
	<0LOG009000K4YR00@a-mtaout22.012.net.il> for
	linux-lvm@redhat.com; Sat, 16 Jul 2011 23:24:52 +0300 (IDT)
Received: from dovidhalevi ([87.70.44.174]) by a-mtaout22.012.net.il
	(HyperSendmail v2007.08) with ESMTPA id
	<0LOG009300PGTC70@a-mtaout22.012.net.il> for
	linux-lvm@redhat.com; Sat, 16 Jul 2011 23:24:52 +0300 (IDT)
Received: from localhost ([127.0.0.1] helo=dovidhalevi.homelinux.net)	by
	dovidhalevi with esmtp (Exim 4.76)	(envelope-from
	<d_baron@012.net.il>)	id 1QiBPw-0006fH-Cr	for
	linux-lvm@redhat.com; Sat, 16 Jul 2011 23:24:52 +0300
Date: Sat, 16 Jul 2011 23:24:50 +0300
From: David Baron <d_baron@012.net.il>
Message-id: <201107162324.51234.d_baron@012.net.il>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] Bootable GUI Image
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Certain operations, like reducing the size of logical volumes to make room 
such as for elimating an older disk from the system, require operating on an 
unmounted volume. So one needs to boot something else not dependent upon the 
volumes such as a liveCD. Unfortunately, Debian's, at least, does not support 
LVM from it GUI desktop mode. One can use the command line-only rescue mode.

Is their a bootable CD  image that will work with the GUI to operating on 
LVMs?
