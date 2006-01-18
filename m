Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0I0qq122699
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2006 19:52:52 -0500
Received: from cvo1.cvo.roguewave.com (cvo-ext.roguewave.com [12.22.36.198])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0I0qndw014482
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2006 19:52:49 -0500
Message-ID: <D486606E7AD20947BDB7E56862E04C390185A28E@cvo1.cvo.roguewave.com>
From: Poul Petersen <petersp@roguewave.com>
Subject: RE: [linux-lvm] Strange reduction in Total PE upon multiple vgred
	uce+vgextend
Date: Tue, 17 Jan 2006 16:52:43 -0800
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

> WHATS_NEW:
>   Version 2.01.10 - 3rd May 2005
>   ==============================
> ...
>     Reinstate full PV size when removing from VG.

	Ah, fair enough. I upgraded to LVM-2.01.15 but now I have a related
problem. If I force the physical volume size using --setphysicalvolumesize,
then doing vgreduce/vgextend resets it to the maximum size: 

# pvcreate -f -M2 --setphysicalvolumesize=10000 /dev/sd[pq]1
  Physical volume "/dev/sdp1" successfully created
  Physical volume "/dev/sdq1" successfully created

# vgcreate vg20 -s32M -M2 /dev/sdp1 /dev/sdq1
  Volume group "vg20" successfully created

# vgdisplay -v vg20
<cut>
  --- Physical volumes ---
  PV Name               /dev/sdp1     
  PV UUID               8H24mH-k5TA-n3O0-sQUF-e8sB-dteF-luHLJF
  PV Status             allocatable
  Total PE / Free PE    312 / 312
   
  PV Name               /dev/sdq1     
  PV UUID               M13ArL-7b9d-SvLJ-ik6H-pRYO-hqgg-WWaPRP
  PV Status             allocatable
  Total PE / Free PE    312 / 312
   
# vgreduce vg20 /dev/sdp1 ; vgextend vg20 /dev/sdp1
  Removed "/dev/sdp1" from volume group "vg20"
  Volume group "vg20" successfully extended

# vgdisplay -v vg20
<cut>
  --- Physical volumes ---
  PV Name               /dev/sdq1     
  PV UUID               M13ArL-7b9d-SvLJ-ik6H-pRYO-hqgg-WWaPRP
  PV Status             allocatable
  Total PE / Free PE    312 / 312
   
  PV Name               /dev/sdp1     
  PV UUID               8H24mH-k5TA-n3O0-sQUF-e8sB-dteF-luHLJF
  PV Status             allocatable
  Total PE / Free PE    469 / 469

	   
-poul
