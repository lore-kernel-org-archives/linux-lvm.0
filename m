Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2U0C3bk005560
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2008 20:12:03 -0400
Received: from mta21.charter.net (mta21.charter.net [216.33.127.81])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2U0BoHl020918
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2008 20:11:51 -0400
Received: from aarprv06.charter.net ([10.20.200.76]) by mta21.charter.net
	(InterMail vM.7.08.03.00 201-2186-126-20070710) with ESMTP
	id <20080330001141.KVQP23078.mta21.charter.net@aarprv06.charter.net>
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2008 20:11:41 -0400
Received: from stringer.lotuscat.com ([24.196.91.180])
	by aarprv06.charter.net with ESMTP id
	<20080330001140.ETPL11293.aarprv06.charter.net@stringer.lotuscat.com>
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2008 20:11:40 -0400
Message-ID: <47EEDB6E.7080207@lotuscat.com>
Date: Sat, 29 Mar 2008 19:14:38 -0500
From: Chris Black <chris@lotuscat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove hung at 100%
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

I did a pvmove between two PVs of equal size (both 4TB on different 
raids) and it seems to have finished (shows 100%) yet pvdisplay commands 
show that the source is still allocated and lvdisplay -m on the LV that 
used the source PV shows that logical extents are still on the logical 
volume pvmove0. My goal is to get this PV and the other PV this LV uses 
(lv03) totally off the system and disconnected.
Does anyone have any advice/clues on how to resolve/unstick this?

Details:
Source disk is /dev/mapper/VOL04_4TB which is /dev/dm-1
Destination disk is /dev/mapper/FN00_01_4TB which is /dev/dm-10
Both are exactly 953673 PEs, source was totally allocated before pvmove 
and destination was totally empty.
The command I used was:
pvmove -v -i 900 /dev/mapper/VOL04_4TB /dev/mapper/FN00_01_4TB

Subsequent pvmoves still show /dev/dm-1 100%.

lvs -av:
    Finding all logical volumes
  LV        VG   #Seg Attr   LSize   Maj Min KMaj KMin Origin Snap%  
Move      Copy%  Log LV UUID                              
  bioinfo   vg01    4 -wi-ao  10.56T  -1  -1 253  
16                                      
1QbcmS-tt8J-zuMB-DCUn-dAAI-pVFi-HPBUWA
  lv03      vg01    2 -wI-ao   4.55T  -1  -1 253  
14                                      
OXgokc-vqd7-Bcgm-8ccF-vgUo-Awfu-CNmFMo
  pipeline  vg01    1 -wi-ao 500.00G  -1  -1 253  
17                                      
dQ3JCe-vU2m-VS7C-2VTy-nXZ4-aGdk-kbpYd6
  [pvmove0] vg01    1 p-C-ao   3.64T  -1  -1 253  15                 
/dev/dm-1 100.00     dvl7Gn-sgWk-m3Wl-hGKM-Ow6E-7j51-394T6r
  rnd       vg01    2 -wi-ao   7.28T  -1  -1 253  
18                                      
HWBhgP-1plT-d1fu-pGdH-7Ii6-gEQN-hpu4k2
  system    vg01    1 -wi-ao 220.00G  -1  -1 253  
13                                      
0LRNrB-TrZV-iK64-dm5C-pMTb-e8Dh-8wAVLy

lvdisplay -m /dev/vg01/lv01 shows segments:
  --- Segments ---
  Logical extent 0 to 953672:
    Type                linear
    Logical volume      pvmove0
    Logical extents     0 to 953672
  
  Logical extent 953673 to 1192090:
    Type                linear
    Physical volume     /dev/dm-2
    Physical extents    0 to 238417

pvdisplay of /dev/dm-1 and /dev/dm-10 (source and destination) show both 
as full.

Kernel version: 2.6.18.8-0.5 (SuSE 10.2 on x64)
LVM version:     2.02.13 (2006-10-27)
Library version: 1.02.12 (2006-10-13)
Driver version:  4.7.0

Thanks in advance,
Chris
