Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with SMTP id iAFFq7f23311
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 10:52:08 -0500
Received: from terirem.net.at.spry.com (terirem.net.at.spry.com [66.249.3.204])
	by mx2.redhat.com (8.12.11/8.12.11) with SMTP id iAFFvMtv003140
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 10:57:22 -0500
Received: from onyx.ispol.com (ip68-98-132-159.dc.dc.cox.net [68.98.132.159])
	by terirem.net.at.spry.com (8.11.6/8.11.6) with ESMTP id iAFFMcq07463
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 07:22:39 -0800
Received: from grisha.dyndns.org (localhost [127.0.0.1])
	by onyx.ispol.com (8.12.9p2/8.12.8) with ESMTP id iAFFMbhL055865
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 10:22:37 -0500 (EST)
	(envelope-from grisha@ispol.com)
Received: from localhost (grisha@localhost)
	by grisha.dyndns.org (8.12.9p2/8.12.8/Submit) with ESMTP id
	iAFFMbbB055861
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 10:22:37 -0500 (EST)
Date: Mon, 15 Nov 2004 10:22:37 -0500 (EST)
From: "Gregory (Grisha) Trubetskoy" <grisha@ispol.com>
Message-ID: <20041115101921.J55836@grisha.dyndns.org>
MIME-Version: 1.0
Subject: [linux-lvm] Snapshost status in vanilla 2.6.9?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hi -

I haven't been able to find much info on this, but it seems to me that in 
the vanilla 2.6.9 LVM2 snapshots do not work.

I'm trying to figure out what is the best path for me to take - I need the 
2.6.9 vanilla kernel, should I just stick to LVM1 if I need snapshots, or 
is there some significant drawback to doing this?

Thanks,

Grisha
