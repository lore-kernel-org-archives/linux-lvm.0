Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jARKITV13326
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 15:18:29 -0500
Received: from romy.inter.net.il (romy.inter.net.il [192.114.186.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jARKINVw013984
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 15:18:28 -0500
Received: from localhost (localhost [127.0.0.1])
	by firefang.net (Postfix) with ESMTP id 5D7773917B
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 22:18:06 +0200 (IST)
Received: from firefang.net ([127.0.0.1])
	by localhost (tv.firefang.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20659-03 for <linux-lvm@redhat.com>;
	Sun, 27 Nov 2005 22:17:49 +0200 (IST)
Received: from [10.0.0.1] (main.firefang.net [10.0.0.1])
	by firefang.net (Postfix) with ESMTP id BFE673E51
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 22:17:48 +0200 (IST)
Message-ID: <438A1461.2000809@firefang.net>
Date: Sun, 27 Nov 2005 22:17:37 +0200
From: Omry Yadan <omry@firefang.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lv became unmountable - "bad blocks" appeared.
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

some background:

I have a volume group that spans on two drives.

one drive has a partition table, and one partion is LVM, and it contain 
one lv.

the other has two lv's which overs it all (no partition table).

each lv sits on a single drive.

I started with a single huge lv, but decided to change things to this way

to minimize the damage in an event of a drive failure).


I started to get io errors from the lv on the first disk (the one which 
is on the drive with the partition table).

just as I decided to backup the stuff, the lv became unmountable.

I suspected bad blocks in the drive, so I ran badblocks in non 
destructable mode on the drive.

it didn't find anything.

I tried to run badblocks on the partition itself (badblocks /dev/hde3), 
just to be sure.

still nothing.

this convinced me that the problem is not physical.

I decided to have badblocks access the blocks via lvm, meaning badblocks 
/dev/data_vg/data

this found about 40K bad blocks.

I am now in the stage before I attemp to fix the file system (reiserfs) 
using the bad blocks list. to recover whatever can be recovered.

do you guys have any better idea, because this will surely cost me some 
data - and I am not convinced that

there is nothing else at lvm level that can make things more optimistic.


another thing:

this is a very serious problem, which looks like its originating from LVM.

I would be glad to share whatever info (lvm metadata etc) you guys will 
need to identify it, in hope this problem will be eliminated, for the

sake of future victims.


Thanks,

    Omry.
