Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oB4I70TH012703
	for <linux-lvm@redhat.com>; Sat, 4 Dec 2010 13:07:01 -0500
Received: from mtaout20.012.net.il (mtaout20.012.net.il [80.179.55.166])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB4I6n5O003816
	for <linux-lvm@redhat.com>; Sat, 4 Dec 2010 13:06:49 -0500
Received: from conversion-daemon.a-mtaout20.012.net.il by
	a-mtaout20.012.net.il (HyperSendmail v2007.08) id
	<0LCX00B000TYG400@a-mtaout20.012.net.il> for
	linux-lvm@redhat.com; Sat, 04 Dec 2010 20:06:48 +0200 (IST)
Received: from dovidhalevi ([87.70.40.209]) by a-mtaout20.012.net.il
	(HyperSendmail v2007.08) with ESMTPA id
	<0LCX00AN90ZCVCA0@a-mtaout20.012.net.il> for
	linux-lvm@redhat.com; Sat, 04 Dec 2010 20:06:48 +0200 (IST)
Received: from localhost ([127.0.0.1] helo=dovidhalevi.homelinux.net)	by
	dovidhalevi with esmtp (Exim 4.72)	(envelope-from
	<d_baron@012.net.il>)	id 1POwVT-00035f-OV	for
	linux-lvm@redhat.com; Sat, 04 Dec 2010 20:06:47 +0200
Date: Sat, 04 Dec 2010 20:06:46 +0200
From: David Baron <d_baron@012.net.il>
Message-id: <201012042006.46803.d_baron@012.net.il>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] "Condensing" Physical Volumes
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

I need more extents to move stuff off older, possibly failing IDE disks to my 
new SATA terrabyter. However, not enough extents are available. The disk is 
very sparsely populated.

Is there any way to "condense" physical volumes to recover/expose empty 
extents in order to make use of them?
