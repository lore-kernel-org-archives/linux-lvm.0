Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n596dbOk021419
	for <linux-lvm@redhat.com>; Tue, 9 Jun 2009 02:39:37 -0400
Received: from csmtp2.one.com (csmtp2.one.com [195.47.247.206])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n596dMjK015612
	for <linux-lvm@redhat.com>; Tue, 9 Jun 2009 02:39:22 -0400
Received: from [10.61.95.174] (64-103-25-233.cisco.com [64.103.25.233])
	by csmtp2.one.com (Postfix) with ESMTP id E197B160097BA
	for <linux-lvm@redhat.com>; Tue,  9 Jun 2009 06:39:19 +0000 (UTC)
Message-ID: <4A2E0396.4030006@nektulos.de>
Date: Tue, 09 Jun 2009 08:39:18 +0200
From: Stefan Radovanovici <stefan@nektulos.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvremove won't work
Reply-To: stefan@nektulos.de,
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
To: linux-lvm@redhat.com

Hi All, 

I have a LVM over 3 partitions (3 separate disks) and one of them is failing so I need to remove it from the group. I moved the content to the rest of the disks (pvmove) and now pvdisplay shows:

root@neriak:~# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               storage
  PV Size               186.31 GB / not usable 4.00 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              47694
  Free PE               0
  Allocated PE          47694
  PV UUID               QUmigK-SCow-nMKo-NEcC-cOQY-bAO9-3k6g9K

  --- Physical volume ---
  PV Name               /dev/sdc1
  VG Name               storage
  PV Size               149.05 GB / not usable 1.31 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              38156
  Free PE               19483
  Allocated PE          18673
  PV UUID               idHUfs-rd5i-fVf7-UzE0-YGJT-X1k4-mrp3be

  "/dev/sda4" is a new physical volume of "200.87 GB"
  --- NEW Physical volume ---
  PV Name               /dev/sda4
  VG Name
  PV Size               200.87 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               TNsOa7-2Ibb-IW9i-C1s5-1NI9-L5e3-WlKnSH


However, I can't remove /dev/sda4 (the partition on the failing disk) from the group: 

root@neriak:~# pvremove /dev/sda4
  Can't open /dev/sda4 exclusively - not removing. Mounted filesystem?

I don't see it mounted anywhere. The LVM is also unmounted. Any ideas of what I might be doing wrong ? I am running LVM 2.02.39 on Ubuntu 9.04 64bit

Thanks in advance,
Stefan
