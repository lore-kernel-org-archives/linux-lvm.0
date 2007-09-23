Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8N1cXPn030399
	for <linux-lvm@redhat.com>; Sat, 22 Sep 2007 21:38:33 -0400
Received: from mail.memcpy.com (whistler.memcpy.com [69.36.243.53])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8N1cW5E016758
	for <linux-lvm@redhat.com>; Sat, 22 Sep 2007 21:38:32 -0400
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 22 Sep 2007 18:36:41 -0700
From: Kelly Byrd <kbyrd-lvm@memcpy.com>
Message-ID: <5cbd03f56b69e61e1407530930bb5939@memcpy.com>
Subject: [linux-lvm] LVM2 striping or md raid0
Reply-To: kbyrd-lvm@memcpy.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com


Two questions really:

I'm going to use lvm to partition up 4 equal size partitions.
I can either use the md driver to RAID0 them the make /dev/md0
my PV, or just use the 4 partitions as PVs and stripe across
them.

How does lvm2 striping compare with md's RAID0 as far as speed?
I don't quite get how it stripes on chunk sizes smaller than
a PE, but a 4MB stripe size seems crazy.

Finally, what's the tuning advice for LVM2 striping? I usually
create my RAID0 or RAID5 with 128k chunk sizes, is it similar
for LVM2 striping?
