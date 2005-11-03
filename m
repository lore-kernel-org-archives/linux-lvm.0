Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA40rvV18340
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 19:53:57 -0500
Received: from spamtest2.viacore.net ([64.162.99.240])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jA40rpSB017725
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 19:53:52 -0500
Received: from spamtest1.spamtest.viacore.net (spamtest1.spamtest.viacore.net
	[192.168.201.101])
	by spamtest2.viacore.net (Postfix) with SMTP id 2410E81449
	for <linux-lvm@redhat.com>; Thu,  3 Nov 2005 15:40:43 -0800 (PST)
Received: from [10.15.1.15] (loather.viacore.net [10.15.1.15])
	by spamtest1.spamtest.viacore.net (Postfix) with ESMTP id F37A8281146
	for <linux-lvm@redhat.com>; Thu,  3 Nov 2005 15:42:44 -0800 (PST)
Message-ID: <436AA2DF.8030002@tsss.org>
Date: Thu, 03 Nov 2005 15:53:03 -0800
From: kelsey hudson <khudson@tsss.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot weirdness
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

Hello.

I'm building a disk-to-disk-to-tape backup appliance here, and decided 
that for maximum flexibility I'd use LVM2 (mainly because of its 
snapshot feature and the ability to hot-add disks and extend volumes 
seamlessly. Good stuff.)

Anyhow, I have a 600GB primary physical volume configured with a single 
logical volume utilizing 99% of the extents. I have the system set to 
take a snapshot every night so there's always a live copy of the data 
available for backup. Three such snapshots are used in rotation (the 
oldest snapshot is deleted and recreated as the newest); each occupy 25 
extents. The problem is, after some time, I'll have a bunch of errors 
regarding the snapshot volumes spewed to the system logs and console. If 
I subsequently try and read from the filesystem, the kernel shuts the 
filesystem down (XFS feature).

This makes it rather inconvenient to back up a snapshot -- if I can't 
read it, it doesn't do me much good to have it. I'm basically using the 
snapshots read-only, and the filesystems are mounted as such, as well.

So, can anyone shed some insight on why I have self-corrupting 
filesystems on my snapshot volumes?

Thanks in advance.
-Kelsey
