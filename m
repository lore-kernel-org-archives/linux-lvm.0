Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i430xGv17135
	for <linux-lvm@redhat.com>; Sun, 2 May 2004 20:59:16 -0400
Received: from workbeast.weetniksbeters.nl (c115176.upc-c.chello.nl
	[212.187.115.176])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i430xFkG002029
	for <linux-lvm@redhat.com>; Sun, 2 May 2004 20:59:15 -0400
Received: from weetniksbeters.nl (prutsbeast.roel.ath.cx [192.168.1.170])
	by workbeast.weetniksbeters.nl (Postfix) with ESMTP id 3697A80009
	for <linux-lvm@redhat.com>; Mon,  3 May 2004 02:59:15 +0200 (CEST)
Message-ID: <40959978.1070304@weetniksbeters.nl>
Date: Mon, 03 May 2004 02:59:36 +0200
From: Roel Adriaans <roel@weetniksbeters.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2, RAID-5 and resizing
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello!

I have been playing with LVM2 and Sofwareraid 5 the last days. My plan 
is to have
a software raid5 array with one PV and multiple LV's.

This works perfect, but I also want to enlarge the raid-5 array. This 
works perfect
when I have one LV. To resize I do this:

- vgcfgbackup
- Enlarge raidarray with raidreconf tools
- pvcreate -u original UUID /dev/md0
- Edit pe_count in the backup created by vgcfbackup
- vgcfgrestore
- Resize the filesystem.

This works for me with one LV.

But when I add two LV's it goes wrong and the LV's get corrupt.
(I get the pe_count by running pvdisplay, before I run vgcfgrestore, and 
multiply
it with 255. This seems to work)

Is there a way to do this with more succes?
Even dirty hacks are fine by me :)

Thanx,

Roel Adriaans
