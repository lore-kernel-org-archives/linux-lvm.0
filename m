Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2E7MC2E006826
	for <linux-lvm@redhat.com>; Fri, 14 Mar 2014 03:22:12 -0400
Received: from mail.gdp-group.com (mail.gdp-group.com [212.79.9.154])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id s2E7M7lV014037
	for <linux-lvm@redhat.com>; Fri, 14 Mar 2014 03:22:08 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.gdp-group.com (Postfix) with ESMTP id BD81A9E95A8
	for <linux-lvm@redhat.com>; Fri, 14 Mar 2014 08:22:05 +0100 (CET)
Received: from mail.gdp-group.com ([127.0.0.1])
	by localhost (mail.gdp-group.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25018-04 for <linux-lvm@redhat.com>;
	Fri, 14 Mar 2014 08:22:02 +0100 (CET)
Received: from [195.27.99.205] (unknown [195.27.99.205])
	by mail.gdp-group.com (Postfix) with ESMTP id 8AAB39E94EC
	for <linux-lvm@redhat.com>; Fri, 14 Mar 2014 08:22:02 +0100 (CET)
Message-ID: <5322AE1A.4010505@gdp-group.com>
Date: Fri, 14 Mar 2014 08:22:02 +0100
From: andreas nastke <nastke@gdp-group.com>
MIME-Version: 1.0
References: <CADPXwZP_wSC_C5ZFXR0igwbVqULKPJ2PYhpU_eH2vgNs5MqTWw@mail.gmail.com>
In-Reply-To: <CADPXwZP_wSC_C5ZFXR0igwbVqULKPJ2PYhpU_eH2vgNs5MqTWw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Expanded virtual disk for LVM: missing space? or
 free	space? or no space?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

you have 'set' the size to 229.99G

-L 229.99G

you want to 'increase' by 229.99G

-L +229.99G


Ogal Finklestein-Birl schrieb:
> Greetings gurus:
> 
> I do not deal with LVM on a daily basis, and I think my note-taking of
> previous LVM commands needs to be polished.
> 
> == Background ==
> Have a VM with 2 virtual disks, 30G (LVM only on 3rd partition) and 65G
> (all LVM) respectively.
> 
> A single VG on the server: VolGroup00; four LV's: LogVol00 to 03
> 
> 
> == Problem ==
> The 71G /usr/local (VolGroup00-LogVol02) hit 100%
> 
> I shut the server down and increased the 65G virtual disk up to 295G
> (+230G)  -- the thought process: take /usr/local from 71G to ~300G.
> 
> Booted into single and fdisk'ed a new /dev/sdb2
> 
> /dev/sda3            4298       30720    27057152   8e  Linux LVM
> /dev/sdb1               1        8485    68155731   83  Linux
> /dev/sdb2            8486       38509   241167780   83  Linux
> 
> 
> Consulted my notes and did the following:
> 
> pvcreate /dev/sdb2
> umount -vv /usr/local
> vgextend VolGroup00 /dev/sdb2
> lvextend -L 229.99G /dev/mapper/VolGroup00-LogVol02
> e2fsck -f /dev/mapper/VolGroup00-LogVol02
> resize2fs /dev/mapper/VolGroup00-LogVol02
> mount -vv /usr/local
> df -h
> 
> /dev/mapper/VolGroup00-LogVol02  227G   68G  148G  32% /usr/local
> 
> My confusion came in when I saw 227G total and not 300G.
> My suspicion was confirmed with pvdisplay -s (and pvs)
> 
>   Device "/dev/sda3" has a capacity of 0
>   Device "/dev/sdb1" has a capacity of 0
>   Device "/dev/sdb2" has a capacity of 71.83 GiB
> 
>  But I am confused even further; I thought pvdisplay was referring to the
> physical disks, but fdisk does not show a missing 71G for /dev/sdb2
> 
> pvs
>   PV         VG         Fmt  Attr PSize   PFree
>   /dev/sda3  VolGroup00 lvm2 a--   25.80g     0
>   /dev/sdb1  VolGroup00 lvm2 a--   65.00g     0
>   /dev/sdb2  VolGroup00 lvm2 a--  229.99g 71.83g
> 
> vgs
>   VG         #PV #LV #SN Attr   VSize   VFree
>   VolGroup00   3   4   0 wz--n- 320.79g 71.83g
> 
> 
> == Questions ==
> Where did I go wrong, or did I go wrong?
> 
> It obviously seems like I am missing 71G, but am I missing it and how do I
> go about reclaiming it?
> 
> 
> == Additional data ==
> pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/sda3
>   VG Name               VolGroup00
>   PV Size               25.80 GiB / not usable 3.00 MiB
>   Allocatable           yes (but full)
>   PE Size               4.00 MiB
>   Total PE              6605
>   Free PE               0
>   Allocated PE          6605
> 
>   --- Physical volume ---
>   PV Name               /dev/sdb1
>   VG Name               VolGroup00
>   PV Size               65.00 GiB / not usable 2.33 MiB
>   Allocatable           yes (but full)
>   PE Size               4.00 MiB
>   Total PE              16639
>   Free PE               0
>   Allocated PE          16639
> 
>   --- Physical volume ---
>   PV Name               /dev/sdb2
>   VG Name               VolGroup00
>   PV Size               230.00 GiB / not usable 3.41 MiB
>   Allocatable           yes
>   PE Size               4.00 MiB
>   Total PE              58878
>   Free PE               18389
>   Allocated PE          40489
> 
> 
> 
> vgdisplay -v
>     Finding all volume groups
>     Finding volume group "VolGroup00"
>   --- Volume group ---
>   VG Name               VolGroup00
>   System ID
>   Format                lvm2
>   Metadata Areas        3
>   Metadata Sequence No  9
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                4
>   Open LV               4
>   Max PV                0
>   Cur PV                3
>   Act PV                3
>   VG Size               320.79 GiB
>   PE Size               4.00 MiB
>   Total PE              82122
>   Alloc PE / Size       63733 / 248.96 GiB
>   Free  PE / Size       18389 / 71.83 GiB
> 
>   --- Logical volume ---
>   LV Path                /dev/VolGroup00/LogVol01
>   LV Name                LogVol01
>   VG Name                VolGroup00
>   LV Write Access        read/write
>   LV Creation host, time ,
>   LV Status              available
>   # open                 1
>   LV Size                5.86 GiB
>   Current LE             1500
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:1
> 
>   --- Logical volume ---
>   LV Path                /dev/VolGroup00/LogVol00
>   LV Name                LogVol00
>   VG Name                VolGroup00
>   LV Write Access        read/write
>   LV Creation host, time ,
>   LV Status              available
>   # open                 1
>   LV Size                7.32 GiB
>   Current LE             1875
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:0
> 
>   --- Logical volume ---
>   LV Path                /dev/VolGroup00/LogVol03
>   LV Name                LogVol03
>   VG Name                VolGroup00
>   LV Write Access        read/write
>   LV Creation host, time ,
>   LV Status              available
>   # open                 1
>   LV Size                5.78 GiB
>   Current LE             1480
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:2
> 
>   --- Logical volume ---
>   LV Path                /dev/VolGroup00/LogVol02
>   LV Name                LogVol02
>   VG Name                VolGroup00
>   LV Write Access        read/write
>   LV Creation host, time ,
>   LV Status              available
>   # open                 1
>   LV Size                229.99 GiB
>   Current LE             58878
>   Segments               3
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:3
> 
>   --- Physical volumes ---
>   PV Name               /dev/sda3
>   PV Status             allocatable
>   Total PE / Free PE    6605 / 0
> 
>   PV Name               /dev/sdb1
>   PV Status             allocatable
>   Total PE / Free PE    16639 / 0
> 
>   PV Name               /dev/sdb2
>   PV Status             allocatable
>   Total PE / Free PE    58878 / 18389
> 
> 
> 
> lvdisplay -m
>   --- Logical volume ---
>   LV Path                /dev/VolGroup00/LogVol01
>   LV Name                LogVol01
>   VG Name                VolGroup00
>   LV Write Access        read/write
>   LV Creation host, time ,
>   LV Status              available
>   # open                 1
>   LV Size                5.86 GiB
>   Current LE             1500
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:1
> 
>   --- Segments ---
>   Logical extent 0 to 1499:
>     Type                linear
>     Physical volume     /dev/sda3
>     Physical extents    0 to 1499
> 
> 
>   --- Logical volume ---
>   LV Path                /dev/VolGroup00/LogVol00
>   LV Name                LogVol00
>   VG Name                VolGroup00
>   LV Write Access        read/write
>   LV Creation host, time ,
>   LV Status              available
>   # open                 1
>   LV Size                7.32 GiB
>   Current LE             1875
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:0
> 
>   --- Segments ---
>   Logical extent 0 to 1874:
>     Type                linear
>     Physical volume     /dev/sda3
>     Physical extents    1500 to 3374
> 
> 
>   --- Logical volume ---
>   LV Path                /dev/VolGroup00/LogVol03
>   LV Name                LogVol03
>   VG Name                VolGroup00
>   LV Write Access        read/write
>   LV Creation host, time ,
>   LV Status              available
>   # open                 1
>   LV Size                5.78 GiB
>   Current LE             1480
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:2
> 
>   --- Segments ---
>   Logical extent 0 to 1479:
>     Type                linear
>     Physical volume     /dev/sda3
>     Physical extents    3375 to 4854
> 
> 
>   --- Logical volume ---
>   LV Path                /dev/VolGroup00/LogVol02
>   LV Name                LogVol02
>   VG Name                VolGroup00
>   LV Write Access        read/write
>   LV Creation host, time ,
>   LV Status              available
>   # open                 1
>   LV Size                229.99 GiB
>   Current LE             58878
>   Segments               3
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:3
> 
>   --- Segments ---
>   Logical extent 0 to 1749:
>     Type                linear
>     Physical volume     /dev/sda3
>     Physical extents    4855 to 6604
> 
>   Logical extent 1750 to 18388:
>     Type                linear
>     Physical volume     /dev/sdb1
>     Physical extents    0 to 16638
> 
>   Logical extent 18389 to 58877:
>     Type                linear
>     Physical volume     /dev/sdb2
>     Physical extents    0 to 40488
> 
> 
> Many thanks in advance!
> Ogal
> 
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
