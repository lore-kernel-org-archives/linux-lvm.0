Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBUMWC101651
	for <linux-lvm@redhat.com>; Fri, 30 Dec 2005 17:32:12 -0500
Received: from pne-smtpout2-sn2.hy.skanova.net
	(pne-smtpout2-sn2.hy.skanova.net [81.228.8.164])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBUMW1Ul032647
	for <linux-lvm@redhat.com>; Fri, 30 Dec 2005 17:32:06 -0500
Received: from X.vanlid.eu.org (81.236.176.223) by
	pne-smtpout2-sn2.hy.skanova.net (7.2.069.1)
	id 43B3E4A6000556B6 for linux-lvm@redhat.com;
	Fri, 30 Dec 2005 23:31:55 +0100
Received: from [192.168.0.241] ([192.168.0.241])
	by X.vanlid.eu.org (8.13.4/8.13.4) with ESMTP id jBUMVqqw019629
	for <linux-lvm@redhat.com>; Fri, 30 Dec 2005 23:31:52 +0100
Date: Fri, 30 Dec 2005 23:32:02 +0100
From: Willy Vanlid <wiva@home.se>
Message-Id: <20051230231941.B976.WIVA@home.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] extended lv doesn't show correct size
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

Hi,
I ran lvextend on a lv to extend it from 1.1TB to 2.66TB and there where
no errors given and lvdisplay shows it as 2.66TB but now it is only
listed as 679.27 GB if I run lvmdiskscan is there anyway to fix this?
I have tried removing and adding a few extents but that doesn't change
the size.
I'll include some printouts if that can be of any help:
The lv is /dev/site/ftp and I'm running Slackware 10 with a 2.6.12.6
kernel.
Yours Sincerely
Willy Vanlid

root@X:~# lvdisplay --version
  LVM version:     2.01.15 (2005-10-16)
  Library version: 1.01.05 (2005-09-26)
  Driver version:  4.4.0

root@X:~# lvmdiskscan 
  /dev/sda          [      372.61 GB] 
  /dev/hdc          [      189.92 GB] 
  /dev/mapper/swap0 [      258.83 MB] 
  /dev/hda1         [      258.83 MB] 
  /dev/mapper/sde1  [      372.61 GB] LVM physical volume
  /dev/hda2         [        9.77 GB] 
  /dev/mapper/sdf1  [      372.61 GB] LVM physical volume
  /dev/hda3         [      101.77 GB] 
  /dev/mapper/sdc1  [      372.61 GB] LVM physical volume
  /dev/mapper/hdc   [      189.92 GB] LVM physical volume
  /dev/mapper/sdb1  [      372.61 GB] LVM physical volume
  /dev/mapper/sda   [      372.61 GB] LVM physical volume
  /dev/mapper/sdd   [      372.61 GB] LVM physical volume
  /dev/mapper/hdb   [      111.79 GB] LVM physical volume
  /dev/mapper/hdd   [      189.92 GB] LVM physical volume
  /dev/site/ftp     [      679.27 GB] 
  /dev/sdb1         [      372.61 GB] 
  /dev/sdc1         [      372.61 GB] 
  /dev/sdd          [      372.61 GB] 
  /dev/hdb          [      111.79 GB] 
  /dev/hdd          [      189.92 GB] 
  /dev/hdf          [       93.16 GB] LVM physical volume
  /dev/sde1         [      372.61 GB] 
  /dev/sdf1         [      372.61 GB] 
  6 disks
  8 partitions
  6 LVM physical volume whole disks
  4 LVM physical volumes

root@X:~# vgdisplay site    
  --- Volume group ---
  VG Name               site
  System ID             
  Format                lvm2
  Metadata Areas        9
  Metadata Sequence No  68
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                9
  Act PV                9
  VG Size               2.66 TB
  PE Size               4.00 MB
  Total PE              698182
  Alloc PE / Size       698182 / 2.66 TB
  Free  PE / Size       0 / 0   
  VG UUID               yX18kB-L8hl-gwD6-07c7-hfrl-kj21-YF3Nq2

root@X:~# lvdisplay site/ftp
  --- Logical volume ---
  LV Name                /dev/site/ftp
  VG Name                site
  LV UUID                nevRwC-Dt1U-e4rg-pNFY-AqfI-8dzw-Nz3kVn
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                2.66 TB
  Current LE             698182
  Segments               12
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:10
