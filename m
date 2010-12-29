Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oBT2fVJL019661
	for <linux-lvm@redhat.com>; Tue, 28 Dec 2010 21:41:31 -0500
Received: from BLADE3.ISTI.CNR.IT (blade3.isti.cnr.it [194.119.192.19])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBT2fKHi006297
	for <linux-lvm@redhat.com>; Tue, 28 Dec 2010 21:41:21 -0500
Received: from SCRIPT-SPFWL-DAEMON.mx.isti.cnr.it by mx.isti.cnr.it
	(PMDF V6.5-x5 #31825) id <01NVZ8NC8VR4NG531N@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Wed, 29 Dec 2010 03:40:42 +0100 (MET)
Received: from conversionlocal.isti.cnr.it by mx.isti.cnr.it
	(PMDF V6.5-x5 #31825) id <01NVZ8NBTBCWNG5296@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Wed, 29 Dec 2010 03:40:40 +0100 (MET)
Received: from [151.80.172.18] by mx.isti.cnr.it (PMDF V6.5-x5 #31826)
	with ESMTPSA id <01NVZ8NAKJJUNOTVUD@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Wed, 29 Dec 2010 03:40:40 +0100 (MET)
Date: Wed, 29 Dec 2010 03:40:47 +0100
From: Spelic <spelic@shiftmail.org>
Message-id: <4D1A9FAF.6050401@shiftmail.org>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] pvmove painfully slow on parity RAID
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-lvm@redhat.com

Hello list

pvmove is painfully slow if the destination is on a 6-disks MD raid-5, 
it performs at 200-500Kbytes/sec! (kernel 2.6.36.2)
Same for lvconvert add mirror.

Instead, if the destination is on a 4 devices MD raid10near, it performs 
at 60MBytes/sec which is much more reasonable. (this is a 120-fold 
difference at least!)
Same for lvconvert add mirror.

How come such a difference?
Are you using barriers every tiny block of data maybe? (This could 
explain the slowness on parity raid)
If yes, could you use barriers (and hence checkpointing) every, like, 100MB?
(However please note that with lvconvert add mirror I also tried various 
--regionsize settings but they don't improve the speed much, i.e. +50% 
at most)

Thanks for any information
