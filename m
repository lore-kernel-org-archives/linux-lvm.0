Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5AEPi015759
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 10:25:44 -0400
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5AEPfi5008859
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 10:25:41 -0400
Received: from localhost (lucy.ukfsn.org [127.0.0.1])
	by mail.ukfsn.org (Postfix) with ESMTP id 8F2A3E6A9E
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 15:23:31 +0100 (BST)
Received: from mail.ukfsn.org ([127.0.0.1])
	by localhost (lucy.ukfsn.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07517-19 for <linux-lvm@redhat.com>;
	Thu, 10 Jun 2004 15:23:31 +0100 (BST)
Received: from oak.dgreaves.com (modem-4077.karuhiruhi.dialup.pol.co.uk
	[81.78.143.237]) by mail.ukfsn.org (Postfix) with ESMTP id C2A34E6A8E
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 15:23:28 +0100 (BST)
Received: from ash.dgreaves.com.dgreaves.com ([10.0.0.126])
	by oak.dgreaves.com with esmtp (Exim 4.20) id 1BYQWJ-0007Sq-A5
	for linux-lvm@redhat.com; Thu, 10 Jun 2004 15:27:07 +0100
Message-ID: <40C86F52.4090500@dgreaves.com>
Date: Thu, 10 Jun 2004 15:25:22 +0100
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 seems to chop performance by 33%
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

Hi

I didn't think lvm2 had such a big performance hit?

65Mb/s on the raid5 device
44Mb/s on the lv

Is this expected?

Kernel 2.6.6

representative dd's:

cu:/huge/editing/tmp# time dd if=/dev/video_vg/video_lv of=/dev/null 
bs=1024k count=4k
4096+0 records in
4096+0 records out
4294967296 bytes transferred in 97.363340 seconds (44112777 bytes/sec)

real    1m37.437s
user    0m0.027s
sys     0m27.126s

yet:
cu:/huge/editing/tmp# time dd if=/dev/md0 of=/dev/null bs=1024k count=4k
4096+0 records in
4096+0 records out
4294967296 bytes transferred in 65.715222 seconds (65357267 bytes/sec)

real    1m5.770s
user    0m0.026s
sys     0m27.524s


cu:/huge/editing/tmp# lvdisplay /dev/video_vg/video_lv
  --- Logical volume ---
  LV Name                /dev/video_vg/video_lv
  VG Name                video_vg
  LV UUID                hyCwfR-d7ZG-lptP-XJFK-vMUb-JWE8-LgQSbb
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                935.00 GB
  Current LE             14960
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

Changing Read ahead makes no difference (actually it slows it down a 
touch with values of 10 + 100)

cu:/huge/editing/tmp# vgdisplay /dev/video_vg
  --- Volume group ---
  VG Name               video_vg
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  6
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               935.00 GB
  PE Size               64.00 MB
  Total PE              14960
  Alloc PE / Size       14960 / 935.00 GB
  Free  PE / Size       0 / 0
  VG UUID               kFVbcB-UgLa-XQjy-mF7R-BT2D-sUaA-uGUmeK

cu:/huge/editing/tmp# pvdisplay /dev/md0
  --- Physical volume ---
  PV Name               /dev/md0
  VG Name               video_vg
  PV Size               935.00 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       65536
  Total PE              14960
  Free PE               0
  Allocated PE          14960
  PV UUID               pEWAKP-tbaH-DSXP-W2jF-Pg6H-2z35-k1adQj



David
