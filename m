Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i87B3c324345
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2004 07:03:38 -0400
Received: from server.klaube.net (root@www.klaube.net [195.190.148.2])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i87B3WS0028901
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2004 07:03:37 -0400
Received: from server.klaube.net (localhost [127.0.0.1])
	by server.klaube.net (8.12.3/8.12.2/SuSE Linux 0.6) with ESMTP id
	i87B3UJO005369
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2004 13:03:30 +0200
Received: (from t1@localhost)
	by server.klaube.net (8.12.3/8.12.3/Submit) id i87B3Ukw005368
	for linux-lvm@redhat.com; Tue, 7 Sep 2004 13:03:30 +0200
Date: Tue, 7 Sep 2004 13:03:30 +0200
From: Thomas Klaube <t.klaube@efm.de>
Message-ID: <20040907110330.GE2689@server.klaube.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 snapshots on root fs
Reply-To: Thomas Klaube <t.klaube@efm.de>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

we are using lvm (lvm version 1) snapshots for backup purposes for some
time without any problems. 

Whenever I try to create a LVM (version 2) snapshot of the lvm
containing the root fs my machine crashes. I am using SuSE 9.1 (kernel
2.6.5, lvm2-2.00.15, device-mapper-1.00.09), but I also tried a unpatched 
2.6.8.1 kernel with the redhat lvm2-2.00.21 and device-mapper-1.00.19
rpms. Same result... I can't create snapshots of the lvm with the root
fs, other lvm snapshots are ok.

Is this a known lvm2 problem? If it is a kernel issue, are there any
patches?

Regards
Thomas Klaube
