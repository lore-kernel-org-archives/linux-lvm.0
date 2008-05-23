Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4NMV9Xe019189
	for <linux-lvm@redhat.com>; Fri, 23 May 2008 18:31:09 -0400
Received: from IAICOLOEXCH1.iai.local (mail.interactivate.com [207.158.40.201])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4NMUoAc008481
	for <linux-lvm@redhat.com>; Fri, 23 May 2008 18:30:52 -0400
Message-ID: <48374599.9090705@ultraviolet.org>
Date: Fri, 23 May 2008 15:30:49 -0700
From: Tracy R Reed <treed@ultraviolet.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] WARNING: Duplicate VG name sysvg
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
To: LVM general discussion and development <linux-lvm@redhat.com>



This machine has been working perfectly for a couple of months. Suddenly 
yesterday I started getting messages about a duplicate VG name sysvg.
sysvg is a two disk hardware RAID mirror and has only one physical 
volume as far as lvm is concerned.

Then today I got a message about how it can't find all physical volumes 
for volume group sysvg. There is only one physical volume as far as lvm 
is concerned. So how could it come up with this?

The machine has a single sysvg disk which is sda which is actually a two 
disk hardware mirror. Then it has 13 other disks each of which is its 
own vg.

Anyone know what could be going on here?

Linux disk01.company.com 2.6.18-53.1.14.el5 #1 SMP Wed Mar 5 11:36:49 
EST 2008 i686 i686 i386 GNU/Linux

[root@disk01 ~]# pvdisplay
   WARNING: Duplicate VG name sysvg: Existing 
G4aL63-U2aj-lTti-AdU0-TfYa-6OvK-APFe10 (created here) takes precedence 
over bbA5oA-xGKM-nZx2-058c-qrjg-D237-Z8dp1d
   Couldn't find device with uuid 'WZ7kmA-hBof-LhzV-kDvl-GfVD-3Wc5-6CfVfH'.
   Couldn't find device with uuid 'WZ7kmA-hBof-LhzV-kDvl-GfVD-3Wc5-6CfVfH'.
   --- Physical volume ---
   PV Name               /dev/sdn
   VG Name               swap
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               178822
   Allocated PE          0
   PV UUID               iBQUaC-y3PM-zBWo-XJWV-38at-UZ2e-sboggF

   --- Physical volume ---
   PV Name               /dev/sdm
   VG Name               vgm
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               153222
   Allocated PE          25600
   PV UUID               v2jcti-FZSg-upiG-XNag-g9mg-XscK-Xu4ETi

   --- Physical volume ---
   PV Name               /dev/sdl
   VG Name               vgl
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               153222
   Allocated PE          25600
   PV UUID               RwOETB-7m5b-JmlQ-EK7m-wSzf-rZUm-UDkw8h

   --- Physical volume ---
   PV Name               /dev/sdk
   VG Name               vgk
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               155782
   Allocated PE          23040
   PV UUID               5lzVh4-TCq6-xIpe-SLdo-tncX-g1it-fQETjD

   --- Physical volume ---
   PV Name               /dev/sdj
   VG Name               vgj
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               89222
   Allocated PE          89600
   PV UUID               gH8Jpd-0luD-BSAb-xga5-DcYM-Cybx-VBaiTV

   --- Physical volume ---
   PV Name               /dev/sdi
   VG Name               vgi
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               166022
   Allocated PE          12800
   PV UUID               xr40rt-BKuO-sT4H-3y1I-tSGl-Yj2H-BGXD4f

   --- Physical volume ---
   PV Name               /dev/sdh
   VG Name               vgh
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               166022
   Allocated PE          12800
   PV UUID               7SC3Tn-aGni-j3CI-QFRt-erPi-ck1j-z12sEa

   --- Physical volume ---
   PV Name               /dev/sdg
   VG Name               vgg
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               166022
   Allocated PE          12800
   PV UUID               ZE14ky-3HXb-7aWl-dltR-M13K-yHW7-lDb0v8

   --- Physical volume ---
   PV Name               /dev/sdf
   VG Name               vgf
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               173702
   Allocated PE          5120
   PV UUID               MgmQLl-3jqJ-tLLf-SLuv-nv0i-qyQy-ppkzN4

   --- Physical volume ---
   PV Name               /dev/sde
   VG Name               vge
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               173702
   Allocated PE          5120
   PV UUID               1EY3q9-ZJKs-YJ3I-lDps-FrUl-oHIq-2FpM9o

   --- Physical volume ---
   PV Name               /dev/sdd
   VG Name               vgd
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               173702
   Allocated PE          5120
   PV UUID               XjM0Ej-0oAp-FipW-SvyB-h82k-GLMi-dzsw15

   --- Physical volume ---
   PV Name               /dev/sdc
   VG Name               vgc
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               166022
   Allocated PE          12800
   PV UUID               6TXNPO-ie5L-m2H6-tsdD-7lXW-EIcW-8LphOZ

   Couldn't find device with uuid 'WZ7kmA-hBof-LhzV-kDvl-GfVD-3Wc5-6CfVfH'.
   Couldn't find all physical volumes for volume group sysvg.
   Couldn't find device with uuid 'WZ7kmA-hBof-LhzV-kDvl-GfVD-3Wc5-6CfVfH'.
   Couldn't find all physical volumes for volume group sysvg.
   Can't read sysvg: skipping
   Couldn't find device with uuid 'WZ7kmA-hBof-LhzV-kDvl-GfVD-3Wc5-6CfVfH'.
   Couldn't find all physical volumes for volume group sysvg.
   Couldn't find device with uuid 'WZ7kmA-hBof-LhzV-kDvl-GfVD-3Wc5-6CfVfH'.
   Couldn't find all physical volumes for volume group sysvg.
   Can't read sysvg: skipping
   --- Physical volume ---
   PV Name               /dev/sdb
   VG Name               vgb
   PV Size               698.53 GB / not usable 2.00 MB
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              178822
   Free PE               166022
   Allocated PE          12800
   PV UUID               apCNFn-6YG2-3KcO-WSao-iOfU-8Xya-NcdSdq

   --- Physical volume ---
   PV Name               /dev/sda2
   VG Name               sysvg
   PV Size               694.61 GB / not usable 20.15 MB
   Allocatable           yes
   PE Size (KByte)       32768
   Total PE              22227
   Free PE               7974
   Allocated PE          14253
   PV UUID               N0F9Rk-R1GP-r9XM-pITC-ZQRq-ycmG-qZyP1t
