Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2B0YVn05961
	for <linux-lvm@redhat.com>; Thu, 10 Mar 2005 19:34:31 -0500
Received: from pd3mo1so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2B0YQPB006910
	for <linux-lvm@redhat.com>; Thu, 10 Mar 2005 19:34:26 -0500
Received: from pd5mr5so.prod.shaw.ca
	(pd5mr5so-qfe3.prod.shaw.ca [10.0.141.181]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0ID50023YW8JAR50@l-daemon> for linux-lvm@redhat.com; Thu,
	10 Mar 2005 17:33:55 -0700 (MST)
Received: from pn2ml10so.prod.shaw.ca ([10.0.121.80])
	by pd5mr5so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0ID50099LW8JQPF0@pd5mr5so.prod.shaw.ca> for
	linux-lvm@redhat.com; Thu, 10 Mar 2005 17:33:55 -0700 (MST)
Received: from [192.168.1.124]
	(S01060050ba84447c.vc.shawcable.net [24.86.200.241])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0ID500BA7W8JUA@l-daemon> for linux-lvm@redhat.com; Thu,
	10 Mar 2005 17:33:55 -0700 (MST)
Date: Thu, 10 Mar 2005 16:33:54 -0800
From: Terry Rigby <t-rigby@shaw.ca>
Message-id: <200503101633.54212.t-rigby@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
Subject: [linux-lvm] LVM Broken on boot.
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

Today I rebooted my system and upon reboot my LVM wouldnt mount saying "you 
must specify filesystem".  So I tried specifying the filesystem and I got the 
error "mount: special device /dev/4474/storage does not exist".

I am pretty new to LVM so I did some googling and found that pvscan should 
show my PV's.  This returned the following;
fileserver:~# pvscan
  Couldn't find device with uuid 'pvifBp-Fii0-wKCx-gM4m-VxGz-Q6Ee-oyNKL4'.
  Couldn't find device with uuid 'pvifBp-Fii0-wKCx-gM4m-VxGz-Q6Ee-oyNKL4'.
  Couldn't find device with uuid 'pvifBp-Fii0-wKCx-gM4m-VxGz-Q6Ee-oyNKL4'.
  PV /dev/hda2        VG 4474   lvm2 [18.18 GB / 18.18 GB free]
  PV /dev/hdb         VG 4474   lvm2 [74.52 GB / 74.52 GB free]
  PV /dev/hdc         VG 4474   lvm2 [74.52 GB / 74.52 GB free]
  PV unknown device   VG 4474   lvm2 [74.52 GB / 74.52 GB free]
  Total: 4 [241.75 GB] / in use: 4 [241.75 GB] / in no VG: 0 [0   ]

the "unknown" device is /dev/hdd.  When I have a look at /dev/hdd using 
pvdisplay it shows the following.
fileserver:~# pvdisplay /dev/hdd
  --- Physical volume ---
  PV Name               /dev/hdd
  VG Name               4474
  PV Size               74.52 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              19078
  Free PE               19078
  Allocated PE          0
  PV UUID               pvifBp-Fii0-wKCx-gM4m-VxGz-Q6Ee-oyNKL4.

I really have no idea where to go from here.  Thanks to anyone that responds.  
I'll keep the mailing list updated for archiving purposes.

Terry Rigby
