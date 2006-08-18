Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7IETTVu028492
	for <linux-lvm@redhat.com>; Fri, 18 Aug 2006 10:29:29 -0400
Received: from xyz.pp.se (postfix@xyz.pp.se [212.31.160.244])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7IETSGR002006
	for <linux-lvm@redhat.com>; Fri, 18 Aug 2006 10:29:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by xyz.pp.se (Postfix) with ESMTP id CC6BF1CC00C
	for <linux-lvm@redhat.com>; Fri, 18 Aug 2006 16:29:27 +0200 (CEST)
Received: from xyz.pp.se ([127.0.0.1])
	by localhost (xyz.pp.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0Oudmjiy1Y5 for <linux-lvm@redhat.com>;
	Fri, 18 Aug 2006 16:29:24 +0200 (CEST)
Received: from thomas (33.242.216.81.static.h-borg.siwnet.net [81.216.242.33])
	by xyz.pp.se (Postfix) with ESMTP id D1E721CC00A
	for <linux-lvm@redhat.com>; Fri, 18 Aug 2006 16:29:23 +0200 (CEST)
From: "Thomas Novin" <thnov@xyz.pp.se>
Date: Fri, 18 Aug 2006 16:29:26 +0200
Message-ID: <000001c6c2d2$b5ceafa0$0a00000a@thomas>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Ran vgreduce --missing to remove broken disk,
	am I screwed?
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

Hi all,

I had a disk that stopped working. After booting I could see with pvdisplay
that the disk was missing. After reading everything I could find via google
I thought that you were supposed to run 'vgreduce --remove-missing volgrp0'
to remove the missing disk from the group.

After this the volume group looks OK but the entire logical volume got
removed! Am I screwed now or is there any way to salvage the data which is
on the remaining three disks?

[root@mistik ~]# pvdisplay
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  --- Physical volume ---
  PV Name               /dev/sda
  VG Name               volgrp0
  PV Size               189.92 GB / not usable 0   
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              48620
  Free PE               0
  Allocated PE          48620
  PV UUID               zyELIl-MgM6-9zoD-G0PI-c1Wy-CZ1i-Sps8EV
   
  --- Physical volume ---
  PV Name               /dev/hdd
  VG Name               volgrp0
  PV Size               115.04 GB / not usable 0   
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              29449
  Free PE               0
  Allocated PE          29449
  PV UUID               yIgADr-5HXP-lFZC-KtZq-onX2-vaNG-aFiLLI
   
  --- Physical volume ---
  PV Name               unknown device
  VG Name               volgrp0
  PV Size               115.04 GB / not usable 0   
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              29449
  Free PE               0
  Allocated PE          29449
  PV UUID               dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53
   
  --- Physical volume ---
  PV Name               /dev/hda4
  VG Name               volgrp0
  PV Size               111.17 GB / not usable 0   
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              28460
  Free PE               0
  Allocated PE          28460
  PV UUID               Lh7KKJ-OGDQ-Gv4A-4l7U-TRGS-mfma-R2LrPt

[root@mistik ~]# vgreduce --removemissing volgrp0
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find all physical volumes for volume group volgrp0.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find all physical volumes for volume group volgrp0.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find all physical volumes for volume group volgrp0.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find all physical volumes for volume group volgrp0.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find all physical volumes for volume group volgrp0.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find all physical volumes for volume group volgrp0.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Couldn't find device with uuid 'dvPVGp-9Vcg-b6Gp-s4cC-2pwK-cvyc-ATbE53'.
  Wrote out consistent volume group volgrp0
[root@mistik ~]# vgdisplay 
  --- Volume group ---
  VG Name               volgrp0
  System ID             
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  9
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               416.13 GB
  PE Size               4.00 MB
  Total PE              106529
  Alloc PE / Size       0 / 0   
  Free  PE / Size       106529 / 416.13 GB
  VG UUID               5C4Hnl-YVct-jtv9-HM5Z-J63D-XePc-ANcpx8
[root@mistik ~]# lvdisplay 
[root@mistik ~]# 

[root@mistik ~]# pvdisplay 
  --- Physical volume ---
  PV Name               /dev/sda
  VG Name               volgrp0
  PV Size               189.92 GB / not usable 0   
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              48620
  Free PE               48620
  Allocated PE          0
  PV UUID               zyELIl-MgM6-9zoD-G0PI-c1Wy-CZ1i-Sps8EV
   
  --- Physical volume ---
  PV Name               /dev/hdd
  VG Name               volgrp0
  PV Size               115.04 GB / not usable 0   
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              29449
  Free PE               29449
  Allocated PE          0
  PV UUID               yIgADr-5HXP-lFZC-KtZq-onX2-vaNG-aFiLLI
   
  --- Physical volume ---
  PV Name               /dev/hda4
  VG Name               volgrp0
  PV Size               111.17 GB / not usable 0   
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              28460
  Free PE               28460
  Allocated PE          0
  PV UUID               Lh7KKJ-OGDQ-Gv4A-4l7U-TRGS-mfma-R2LrPt

Thanks for any help on this,

Thomas
