Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6SFHpV04447
	for <linux-lvm@redhat.com>; Thu, 28 Jul 2005 11:17:51 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6SFHlc7024331
	for <linux-lvm@redhat.com>; Thu, 28 Jul 2005 11:17:47 -0400
From: Ming Zhang <mingz@ele.uri.edu>
Date: Thu, 28 Jul 2005 11:17:41 -0400
Message-Id: <1122563861.9888.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] how to access the partition on LV?
Reply-To: mingz@ele.uri.edu,
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
To: LVM <linux-lvm@redhat.com>

I think this is a very common question but i can not find the answer.
any idea on how to access the partition on these lv since no device
node?


[root@fc3-i386-2 ~]# fdisk /dev/vg1/v1 -l

Disk /dev/vg1/v1: 469 MB, 469762048 bytes
255 heads, 63 sectors/track, 57 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

       Device Boot      Start         End      Blocks   Id  System
/dev/vg1/v1p1               1          13      104391   83  Linux
/dev/vg1/v1p2              14          57      353430   83  Linux

Thanks!

Ming
