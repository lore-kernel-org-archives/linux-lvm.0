Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i19FaWa26415
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2004 10:36:32 -0500
Received: from foo.oppositelock.org (foo.oppositelock.org [66.92.146.148])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i19FaWb30632
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2004 10:36:32 -0500
Received: from oppositelock.org (hawke.oppositelock.org [66.92.146.47])
	by foo.oppositelock.org (8.12.8/8.12.5) with ESMTP id i19FaQVB000411
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2004 10:36:26 -0500
Message-ID: <4027A8D6.7000103@oppositelock.org>
From: Douglas Kilpatrick <kilpatds@oppositelock.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 on top of RAID1? (x86_64)
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb  9 10:36:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I'm trying to setup a new box the same way my current box is setup. 
I've split the drives into two sections, one of which I'm combining into 
a RAID0 stripe, the other a RAID1 mirror set. (sorry for the redundancy.)

The Stripe seems to work fine.  The mirror isn't getting past the 
pvcreate stage.

The system is mostly a FC1 test1 x86_64 box.  I've got a stock 2.6.2 
kernel compiled on it.

mkraid appears to have worked fine.
lvm pvcreate /dev/md1

appears to work, but

lvm pvs

complains about seeing 3 extra instances of the id, and decides that the 
PV is actually on /dev/sda (or /dev/sdb, depending on boot), not /dev/md1.

Um?  Anyway to fix this?  Help?

Thanks,
Doug
-- 
kilpatds@oppositelock.org
Outta Control Racing, Inc.
