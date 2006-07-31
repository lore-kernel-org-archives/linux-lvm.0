Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6VIfbBt012310
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 14:41:37 -0400
Received: from av.lukas.com.pl (av.lukas.com.pl [193.0.242.36])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6VIfU9H028271
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 14:41:30 -0400
Received: from av.lukas.com.pl (localhost [127.0.0.1])
	by localhost.lukas.com.pl (Postfix) with ESMTP id 5401318035
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 20:49:16 +0200 (CEST)
Received: from pia01.lukas (unknown [172.16.16.134])
	by av.lukas.com.pl (Postfix) with ESMTP id 2F8E418033
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 20:49:16 +0200 (CEST)
Message-Id: <s4ce6af4.001@pia01.lukas>
Date: Mon, 31 Jul 2006 20:41:08 +0200
From: "Bartosz Brewinski" <BBrewinski@lukas.com.pl>
Subject: Odp: [linux-lvm] Using pvcreate with file...
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

connect "vm1disk" file to "/dev/loop0" device:
# losetup /dev/loop0 vm1disk
display info about /dev/loop0:
# losetup /dev/loop0
use it to create pv:
# pvcreate /dev/loop0

later delete the /dev/loop0 <-> vm1disk binding by issuing command:
# losetup -d /dev/loop0
(do it after "pvremove /dev/loop0")

cheers,
bartek

>>> ahairape@mail.cern.ch 2006-07-31 19:59:27 >>>
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

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com 
https://www.redhat.com/mailman/listinfo/linux-lvm 
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
