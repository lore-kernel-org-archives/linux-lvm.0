Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB1BxdV27607
	for <linux-lvm@redhat.com>; Thu, 1 Dec 2005 06:59:39 -0500
Received: from lab1.brl.univie.ac.at (lab1.psy.univie.ac.at [131.130.64.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB1BxRki001272
	for <linux-lvm@redhat.com>; Thu, 1 Dec 2005 06:59:32 -0500
Received: from localhost (localhost.brl.univie.ac.at [127.0.0.1])
	by lab1.brl.univie.ac.at (Postfix) with ESMTP id 3B7D321183D
	for <linux-lvm@redhat.com>; Thu,  1 Dec 2005 12:59:17 +0100 (CET)
Received: from lab1.brl.univie.ac.at ([127.0.0.1])
	by localhost (lab1.psy.univie.ac.at [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 31110-09 for <linux-lvm@redhat.com>;
	Thu,  1 Dec 2005 12:59:15 +0100 (CET)
Received: from lab1.brl.univie.ac.at (lab1.brl.univie.ac.at [192.168.1.1])
	by lab1.brl.univie.ac.at (Postfix) with ESMTP id 8467A21183B
	for <linux-lvm@redhat.com>; Thu,  1 Dec 2005 12:59:15 +0100 (CET)
Date: Thu, 1 Dec 2005 12:59:15 +0100 (CET)
From: Ulrich Leodolter <ulrich@lab1.psy.univie.ac.at>
Message-ID: <Pine.LNX.4.63.0512011238170.3045@lab1.psy.univie.ac.at>
MIME-Version: 1.0
Subject: [linux-lvm] linear to stripes 
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hello,

Is it possible to change an existing logical volume to use "stripes" ?

Below ist the output from "lvdisplay -m /dev/vg1/data"
There are only hundreds of free PE on both physical volumes 
(/dev/sda3,/dev/sdb3)
Theortically it should be possible by using a series of pvmove commands

pvmove /dev/sda3:0 /dev/sdb3:<free PE>
pvmove /dev/sdb3:0 /dev/sda3:0
pvmove /dev/sdb3:<free PE> /dev/sdb3:0

pvmove /dev/sda3:2 /dev/sdb3:<free PE>
pvmove /dev/sdb3:2 /dev/sda3:2
pvmove /dev/sdb3:<free PE> /dev/sdb3:2

....

Will that work?
Is this result compareable to

lvceate --stripes 2 -I 9 -L 1T -n data vg1 /dev/sda3 /dev/sdb3"

One difference i see ist that my PE size ist 16384Kb and that maximum
stripe size ist 512Kb.

Thanks


   --- Logical volume ---
   LV Name                /dev/vg1/data
   VG Name                vg1
   LV UUID                MZxsoQ-37nY-NbZu-qk9C-x5Oa-V5d9-L7DFZO
   LV Write Access        read/write
   LV Status              available
   # open                 1
   LV Size                1000.28 GB
   Current LE             64018
   Segments               2
   Allocation             inherit
   Read ahead sectors     0
   Block device           253:0

   --- Segments ---
   Logical extent 0 to 31249:
     Type                linear
     Physical volume     /dev/sda3
     Physical extents    0 to 31249

   Logical extent 31250 to 64017:
     Type                linear
     Physical volume     /dev/sdb3
     Physical extents    0 to 32767

-- 
Ulrich Leodolter
