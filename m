Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7TI1dKb001842
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 14:01:39 -0400
Received: from swlx167.swmed.edu (swlx167.swmed.edu [199.165.152.167])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7TI1cCO011997
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 14:01:38 -0400
Received: from peters.swmed.org ([129.112.118.137])
	by swlx167.swmed.edu with esmtp (Exim 4.44) id 1GI7tq-0000HV-Ri
	for linux-lvm@redhat.com; Tue, 29 Aug 2006 13:01:28 -0500
Message-ID: <44F480F2.7070600@utsouthwestern.edu>
Date: Tue, 29 Aug 2006 13:01:22 -0500
From: Peter Smith <peter.smith@utsouthwestern.edu>
MIME-Version: 1.0
References: <EED09BB41EE72044BCEE8156094FCE8F0183821F@EVS4.its.caregroup.org>
In-Reply-To: <EED09BB41EE72044BCEE8156094FCE8F0183821F@EVS4.its.caregroup.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Problem with vgreduce on LVM1
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

Well, that is interesting. When I do a "pvdata", it does show an extent 
in use, one for each of the other LVs, but that is true for all the PVs 
for some reason. Any ideas on how to stop that? I've already tried a 
"pvmove" and it says the disk is empty.

[root@linux archive]# pvdata /dev/emcpowera
--- Physical volume ---
PV Name /dev/emcpowera
VG Name data
PV Size 785.10 GB [1646481408 secs] / NOT usable 1 GB [LVM: 127 KB]
PV# 1
PV Status available
Allocatable NO
Cur LV 4
PE Size (KByte) 1048576
Total PE 784
Free PE 784
Allocated PE 0
PV UUID JpYFFb-NUqC-trBf-oFm7-tbdF-65If-GZ56fw

--- Volume group ---
VG Name
VG Access read/write
VG Status NOT available/resizable
VG # 0
MAX LV 256
Cur LV 5
Open LV 0
MAX LV Size 2 TB
Max PV 256
Cur PV 8
Act PV 1
VG Size 12.21 TB
PE Size 1 GB
Total PE 12507
Alloc PE / Size 9078 / 886 GB
Free PE / Size 3429 / 3.35 TB
VG UUID 5Xw9D6-qqfu-0FTg-P9pD-40NH-wRgR-wN03ip

--- List of logical volumes ---

pvdata -- logical volume struct at offset 0 is empty
pvdata -- logical volume "/dev/data/data2" at offset 1
pvdata -- logical volume "/dev/data/data3" at offset 2
pvdata -- logical volume "/dev/data/data4" at offset 3
pvdata -- logical volume "/dev/data/data5" at offset 4
pvdata -- logical volume "/dev/data/data6" at offset 5
pvdata -- logical volume struct at offset 6 is empty
pvdata -- logical volume struct at offset 7 is empty
pvdata -- logical volume struct at offset 8 is empty
pvdata -- logical volume struct at offset 9 is empty
<SNIP>
pvdata -- logical volume struct at offset 254 is empty
pvdata -- logical volume struct at offset 255 is empty
--- List of physical volume UUIDs ---

001: JpYFFb-NUqC-trBf-oFm7-tbdF-65If-GZ56fw
002: ABNwWZ-h4la-KTcv-VukV-T8vV-PIEP-mm38cy
003: oyjw8S-B1gu-snoN-k54q-bCEy-daqn-BYdDmK
004: URW9Kt-ZbOn-Ov3h-ZiT5-i7aC-8Lpq-c0fp4l
005: y16lho-UgMJ-1lfJ-GNTi-VXWH-Pot1-iIsOc0
006: WEC9g3-fTKD-k8pV-Nnxq-Kwn3-EkNd-qV3lUE
007: TCxHIb-uvjC-6xap-bLaM-lVJU-N82x-XWd10g
008: fZkmf8-jaYW-1gZ6-WBqp-eNu2-s1xr-IBLQTe

Thanks,
Peter


mghofran@caregroup.harvard.edu wrote:

>You show lv=4 so don't you need to check if any of those lvols were
>using that particular disk, remove the lvol and then proceed?
>
>-----Original Message-----
>From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
>On Behalf Of Peter Smith
>Sent: Tuesday, August 29, 2006 12:21 PM
>To: linux-lvm@redhat.com
>Subject: [linux-lvm] Problem with vgreduce on LVM1
>
>I can't seem to remove two physical volumes.  I've removed the LVs on 
>them.  I've deactivated the PVs.  But I can not remove the PVs from the
>VG.
>
>Here's an example of what I'm seeing:
>
>[root@linux archive]# pvmove -v /dev/emcpowera
>pvmove -- checking name of source physical volume "/dev/emcpowera"
>pvmove -- locking logical volume manager
>pvmove -- reading data of source physical volume from "/dev/emcpowera"
>pvmove -- checking volume group existence
>pvmove -- reading data of volume group "data" from lvmtab
>pvmove -- checking volume group consistency of "data"
>pvmove -- searching for source physical volume "/dev/emcpowera" in 
>volume group "data"
>pvmove -- no logical volumes on empty source physical volume 
>"/dev/emcpowera"
>
>[root@linux archive]# vgreduce data /dev/emcpowera
>vgreduce -- ERROR: can't reduce volume group "data" by used physical 
>volume "/dev/emcpowera"
>
>[root@linux archive]# pvdisplay /dev/emcpowera
>--- Physical volume ---
>PV Name               /dev/emcpowera
>VG Name               data
>PV Size               785.10 GB [1646481408 secs] / NOT usable 1 GB 
>[LVM: 127 KB]
>PV#                   1
>PV Status             available
>Allocatable           NO
>Cur LV                4
>PE Size (KByte)       1048576
>Total PE              784
>Free PE               784
>Allocated PE          0
>PV UUID               JpYFFb-NUqC-trBf-oFm7-tbdF-65If-GZ56fw
>
>Does anyone have any idea why I can't complete a reduce?
>
>Thanks,
>Peter
>
>Note:
>Logical Volume Manager 1.0.8-13
>Heinz Mauelshagen, Red Hat  03/05/2005 (IOP 10)
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  
>
