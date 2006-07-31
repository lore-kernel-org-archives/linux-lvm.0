Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6VHxk6o032647
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 13:59:46 -0400
Received: from cernmxlb.cern.ch (cernmx05.cern.ch [137.138.166.161])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6VHxYCm018190
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 13:59:35 -0400
Date: Mon, 31 Jul 2006 19:59:27 +0200 (CEST)
From: Arsen Hayrapetyan <ahairape@mail.cern.ch>
Message-ID: <Pine.LNX.4.58.0607311951040.16463@lxplus020.cern.ch>
MIME-Version: 1.0
Subject: [linux-lvm] Using pvcreate with file...
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

I am newbe to the lvm and I have the following issue:
My system is partitioned in the following way:

===============================================================
   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1          16      128488+  83  Linux
/dev/hda2              17        4767    38162407+  83  Linux
/dev/hda3            4768        4865      787185   82  Linux swap
===============================================================
There is no free space left on the disk.

I created the separate files, which I want to be lvm-enabled; I 
used the following commands:

==============================================================
#> cd /
#> dd if=/dev/zero  of=vm1disk bs=1k seek=16384k count=1
#> mkfs -t ext3 vm1disk

#> dd if=/dev/zero of=vm1swap bs=1024k count=1 
#> mkswap vm1swap
==============================================================

Now I want to initialize that "disk" for lvm-use.
So what I need to do?

pvcrete ..........................?

I had a look at the documentation, but they deal with real partitions
and disks (as far as I understood), not with files...

Thanks in advance to everyone who responds,
Arsen. 
