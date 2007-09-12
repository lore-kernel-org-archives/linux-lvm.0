Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8C79cjK007678
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 03:09:38 -0400
Received: from mx1.aecom.yu.edu (mx1.aecom.yu.edu [129.98.1.51])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l8C79TtE027176
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 03:09:29 -0400
Mime-Version: 1.0
Message-Id: <a06240411c30cd5dee72c@[129.98.90.227]>
Date: Wed, 12 Sep 2007 03:09:14 -0400
From: Maurice Volaski <mvolaski@aecom.yu.edu>
Subject: [linux-lvm] Can LVM block I/O and hang a system?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: linux-kernel@vger.kernel.org

A working system begins hanging and it seems to be stuck on I/O 
processes that use ext3 partitions that are running on top of LVM. 
The system is AMD 64-bit running Gentoo. Kernel is Gentoo 2.6.22-r3 
and LVM lvm2-2.02.27. Here is the disk setup:

Boot disk, attached to motherboard via SATA
1) some partitions accessed via ext3 -> hardware partition.
2) some partitions accessed via ext3 -> drbd, which is version 8.0.5, 
-> hardware partition.

External SATA-SCSI RAID, attached to via an LSI Logic card,
3) one partition accessed via ext3 -> drbd -> hardware partition.
4) some partitions accessed via ext3 -> LVM -> drbd -> hardware partition.

On repeated reboots, #1) boots fine, and I can fsck #2) no problem. I 
can also fsck #3, but the fsck processes on #4, which all are trying 
to recover the journals, just seem to not do anything. There is no 
evidence of I/O and there are no errors reported anywhere. The frozen 
fsck processes cannot even be killed and the system ignores the 
shutdown command.

That the hanging fsck processes are all occurring on just the LVM 
partitions seems to imply that LVM is responsible.

drbd had been unattached to its peer during this time, and when I 
reattached it, it had no trouble syncing to the peer. That system, 
which should basically be identical, however, has no trouble running 
running fsck everywhere. I'm not sure, though, if that lets LVM off 
the hook.
-- 

Maurice Volaski, mvolaski@aecom.yu.edu
Computing Support, Rose F. Kennedy Center
Albert Einstein College of Medicine of Yeshiva University
