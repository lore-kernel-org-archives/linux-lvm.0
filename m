Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0HKMLGu019694
	for <linux-lvm@redhat.com>; Sat, 17 Jan 2009 15:22:21 -0500
Received: from pluto.sivell.com (pluto-t3.sivell.com [65.112.245.197])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0HKM6Nr011405
	for <linux-lvm@redhat.com>; Sat, 17 Jan 2009 15:22:07 -0500
Received: from [192.168.235.40] ([192.168.235.40]) (authenticated bits=0)
	by pluto.sivell.com (8.13.1/8.13.1) with ESMTP id n0HKZb1R025354
	for <linux-lvm@redhat.com>; Sat, 17 Jan 2009 14:35:37 -0600
Message-ID: <49723DEE.9020808@sivell.com>
Date: Sat, 17 Jan 2009 14:22:06 -0600
From: Vu Pham <vu@sivell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] extend the root vg to an md 
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

When I extend my root vg ( the VG that has the root lv ) to an PV on the 
md0 device, the system boots into a panic complaining that the UUID of 
PV on the md device does not exist. But before I extend it, the system 
boots normally, showing the md0 and its pv is up.

Any advice is greatly appreciate.

Below is my disk configuration before running the vgextend g1volgroup00 
/dev/md0


[root@g1 ~]# pvdisplay
   --- Physical volume ---
   PV Name               /dev/xvda2
   VG Name               g1volgroup00
   PV Size               9.90 GB / not usable 6.76 MB
   Allocatable           yes (but full)
   PE Size (KByte)       8192
   Total PE              1266
   Free PE               0
   Allocated PE          1266
   PV UUID               H0owWs-k8Li-w0Mb-3CgN-5gsM-haJy-BYYkrh

   --- Physical volume ---
   PV Name               /dev/md0
   VG Name               g1volgroup00
   PV Size               156.19 MB / not usable 4.19 MB
   Allocatable           yes
   PE Size (KByte)       8192
   Total PE              19
   Free PE               19
   Allocated PE          0
   PV UUID               4m2GFx-QDv0-Gb8q-qxAG-QMIc-If9i-b1ge12

[root@g1 ~]# vgdisplay
   --- Volume group ---
   VG Name               g1volgroup00
   System ID
   Format                lvm2
   Metadata Areas        2
   Metadata Sequence No  5
   VG Access             read/write
   VG Status             resizable
   MAX LV                0
   Cur LV                2
   Open LV               2
   Max PV                0
   Cur PV                2
   Act PV                2
   VG Size               10.04 GB
   PE Size               8.00 MB
   Total PE              1285
   Alloc PE / Size       1266 / 9.89 GB
   Free  PE / Size       19 / 152.00 MB
   VG UUID               EFxLNW-31H9-lyLD-oprg-UvLB-lVNF-3Qv6zG



Vu
