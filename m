Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5LF4tPn022075
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 11:04:56 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.178])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5LF4m55021455
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 11:04:48 -0400
Received: by py-out-1112.google.com with SMTP id c30so1823672pyc
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 08:04:47 -0700 (PDT)
Message-ID: <5485940d0606210803s32f2d7f7k1f83d24ef2325f9b@mail.gmail.com>
Date: Wed, 21 Jun 2006 16:03:11 +0100
From: "C'est Pierre" <cestpierre@gmail.com>
Subject: Re: [linux-lvm] newbie lvm question
In-Reply-To: <44996028.20389.1201CC27@dermot.sciencephoto.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <44996028.20389.1201CC27@dermot.sciencephoto.co.uk>
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

Hi,

try running vgmknodes and/or vgchange -a y volgrp0 and try again.
Alternatively try mkfs /dev/mapper/volume1


Cheers,
Pierre

On 6/21/06, Beginner <dermot@sciencephoto.co.uk> wrote:
> Hi,
>
> Fedora Core release 4 (Stentz)
>
> I am trying to have a play around with LVM and have hit a snag when I came to formatting the LV.
>
> I have a fresh install on a single 18GB disk. The root (/dev/hda1) partition is 6.1G, and there is
> about 300MB swap. That leaves about 12GB spare on hda3. I created hda3 and set the partition
> type 8e. I created the PV:
>
>   --- Physical volume ---
>   PV Name               /dev/hda3
>   VG Name               volgrp0
>   PV Size               12.48 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              3196
>   Free PE               1660
>   Allocated PE          1536
>   PV UUID               ttjcMK-tNnb-59xe-qGtl-7oAn-XGMT-eBvRky
>
> Created a volume group with hda3 in:
>
>   --- Volume group ---
>   VG Name               volgrp0
>   System ID
>   Format                lvm2
>   Metadata Areas        1
>   Metadata Sequence No  6
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                1
>   Open LV               0
>   Max PV                0
>   Cur PV                1
>   Act PV                1
>   VG Size               12.48 GB
>   PE Size               4.00 MB
>   Total PE              3196
>   Alloc PE / Size       1536 / 6.00 GB
>   Free  PE / Size       1660 / 6.48 GB
>   VG UUID               JK7RNE-DHM2-KNtf-Scua-jOs5-5x11-396xaY
>
> and then a 6GB logical volume:
>
>   LV Name                /dev/volgrp0/volume1
>   VG Name                volgrp0
>   LV UUID                msRAz9-8A4e-dWGO-C9JG-c08Z-R1xG-iYUWoe
>   LV Write Access        read/write
>   LV Status              available
>   # open                 0
>   LV Size                6.00 GB
>   Current LE             1536
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           253:0
>
> However I can not format '/dev/volgrp0/volume1', I get Permission denied.
>
> >mkfs -t ext3 /dev/volgrp0/volume1
> Could not stat /dev/volgrp0/volume1 --- Permission denied.
>
> I notice the VG status is resizable, should that be available? When I try and change it, it reports
> that it's already available.
>
>     Finding all volume groups
>     Finding volume group "volgrp0"
>     1 logical volume(s) in volume group "volgrp0" already active
>     Found volume group "volgrp0"
>     Activated logical volumes in volume group "volgrp0"
>   1 logical volume(s) in volume group "volgrp0" now active
>
> Am I missing something?
> TIA. Dp.
>
> Dermot Paikkos
>
> Network Administrator @ Science Photo Library
> Phone: 0207 432 1100
> Fax: 0207 286 8668
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
