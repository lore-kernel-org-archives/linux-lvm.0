Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j71HtWV27602
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 13:55:32 -0400
Received: from itspmx1.state.ms.us (e3000a.state.ms.us [205.144.224.140])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j71HtLQp024857
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 13:55:21 -0400
Received: from tcmail.mstc.state.ms.us (tcmail.mstc.state.ms.us [10.3.60.220])
	by itspmx1.state.ms.us (8.12.11/8.12.11) with ESMTP id j71HtIVG021341
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 12:55:19 -0500 (CDT)
	(envelope-from rray@mstc.state.ms.us)
Received: from rray.drdc.mstc.ms.gov (localhost.localdomain [127.0.0.1])
	by rray.drdc.mstc.ms.gov (8.13.1/8.13.1) with ESMTP id j71Hr5PX031928
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 12:53:05 -0500
Received: from localhost (rray@localhost)
	by rray.drdc.mstc.ms.gov (8.13.1/8.13.1/Submit) with ESMTP id
	j71Hr5ed031925
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 12:53:05 -0500
Date: Mon, 1 Aug 2005 12:53:05 -0500 (CDT)
From: Richard Ray <rray@mstc.state.ms.us>
Subject: Re: [linux-lvm] vgexport/vgimport fails
In-Reply-To: <20050801133852.GI4985@agk.surrey.redhat.com>
Message-ID: <Pine.LNX.4.62.0508011241470.27345@rray.drdc.mstc.ms.gov>
References: <Pine.LNX.4.62.0508010816320.27345@rray.drdc.mstc.ms.gov>
	<20050801133852.GI4985@agk.surrey.redhat.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 1 Aug 2005, Alasdair G Kergon wrote:

> Run vgscan -vvvv and look for the reason it
> gives for ignoring the disks.

..
#device/dev-io.c:250       /dev/hdg: size is 490234752 sectors
#device/dev-io.c:134         /dev/hdg: block size is 4096 bytes
#filters/filter.c:109         /dev/hdg: Skipping: Partition table 
signature found
#device/dev-io.c:408         Closed /dev/hdg
..
#device/dev-io.c:377         Opened /dev/hdh RO
#device/dev-io.c:250       /dev/hdh: size is 488397168 sectors
#device/dev-io.c:134         /dev/hdh: block size is 4096 bytes
#filters/filter.c:109         /dev/hdh: Skipping: Partition table 
signature found
#device/dev-io.c:408         Closed /dev/hdh

I used these two drives seperately prior to adding them to a volume group
When I pvcreated them I used the whole disk not partitions
If I fdisk /dev/hdg I see there is still a partition but in Fedora 2 
vgscan -v shows

     Finding all volume groups
     Finding volume group "vg00"
   --- Volume group ---
   VG Name               vg00
   System ID
   Format                lvm2
   Metadata Areas        2
   Metadata Sequence No  12
   VG Access             read/write
   VG Status             resizable
   MAX LV                255
   Cur LV                1
   Open LV               1
   Max PV                255
   Cur PV                2
   Act PV                2
   VG Size               466.64 GB
   PE Size               4.00 MB
   Total PE              119461
   Alloc PE / Size       119460 / 466.64 GB
   Free  PE / Size       1 / 4.00 MB
   VG UUID               niUNqx-iivo-V5J6-2M1o-yzNv-Jh1S-mQCxtn

   --- Logical volume ---
   LV Name                /dev/vg00/lvol0
   VG Name                vg00
   LV UUID                wWDoA5-AsMp-JDX0-4GAS-1PvM-9y6P-nb1Gve
   LV Write Access        read/write
   LV Status              available
   # open                 1
   LV Size                466.64 GB
   Current LE             119460
   Segments               2
   Allocation             next free (default)
   Read ahead sectors     0
   Block device           253:0

   --- Physical volumes ---
   PV Name               /dev/hdg
   PV UUID               CnAXVt-EufA-th1V-c16y-FCPB-s4qN-jicISO
   PV Status             allocatable
   Total PE / Free PE    59843 / 0

   PV Name               /dev/hdh
   PV UUID               7KH5ls-3YAS-d4VZ-MIrD-1V6d-JQO4-tJtTsx
   PV Status             allocatable
   Total PE / Free PE    59618 / 1

In Fedora 2 I have lvm2-2.00.15-2 package
In Fedora 4 I have lvm2-2.01.08-2.1 package

How do I get rid of the partiton without losing data
I don't have a backup

Richard

>
> Alasdair
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
