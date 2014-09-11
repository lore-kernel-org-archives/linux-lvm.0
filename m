Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8BAsdUc010382
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2014 06:54:39 -0400
Received: from mail.gdp-group.com (mail.gdp-group.com [212.79.9.154])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id s8BAsYIj013756
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2014 06:54:35 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.gdp-group.com (Postfix) with ESMTP id 723BEB0653F
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2014 12:54:32 +0200 (CEST)
Received: from mail.gdp-group.com ([127.0.0.1])
	by localhost (mail.gdp-group.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09468-08 for <linux-lvm@redhat.com>;
	Thu, 11 Sep 2014 12:54:27 +0200 (CEST)
Received: from [195.27.99.205] (unknown [195.27.99.205])
	by mail.gdp-group.com (Postfix) with ESMTP id 37FC1B0632E
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2014 12:54:27 +0200 (CEST)
Message-ID: <54117F63.9010608@gdp-group.com>
Date: Thu, 11 Sep 2014 12:54:27 +0200
From: Andreas Nastke <nastke@gdp-group.com>
MIME-Version: 1.0
References: <5410138C.9010603@cemery.org.uk>
In-Reply-To: <5410138C.9010603@cemery.org.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Replace small drive with bigger, using LVM?
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

are you sure you want to work with a 4TB storage without any kind of
redundancy?

Craig schrieb:
> I have a workstation that can only take 2 hard drives.
> The one that's in there is a 500GB drive and I'd like to bring a new 4TB 
> drive in and use LVMto migrate a live running system over to the new 
> drive, remove the old one from the setup, reboot and bing, have the 
> large drive running,without having to re-install my OS and set up 
> everything afresh.
> It's an Ubuntu 14.04.1 install where I ticked the "Use LVM" tick box
> 
> # fdisk -l
> 
> Disk /dev/sda: 500.1 GB, 500107862016 bytes
> 255 heads, 63 sectors/track, 60801 cylinders, total 976773168 sectors
> Units = sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x0005d771
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sda1   *        2048      499711      248832   83  Linux
> /dev/sda2          501758   976771071   488134657    5  Extended
> /dev/sda5          501760   976771071   488134656   8e  Linux LVM
> 
> Disk /dev/sdb: 4000.8 GB, 4000787030016 bytes
> 255 heads, 63 sectors/track, 486401 cylinders, total 7814037168 sectors
> Units = sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 4096 bytes
> I/O size (minimum/optimal): 4096 bytes / 4096 bytes
> Disk identifier: 0xc73f6184
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sdb1            2048      499711      248832   83  Linux
> /dev/sdb2          499712  4294967294  2147233791+   5  Extended
> /dev/sdb5          501760  4294967294  2147232767+  8e  Linux LVM
> 
> Disk /dev/mapper/ubuntu--vg-root: 493.4 GB, 493363396608 bytes
> 255 heads, 63 sectors/track, 59981 cylinders, total 963600384 sectors
> Units = sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
> 
> Disk /dev/mapper/ubuntu--vg-root doesn't contain a valid partition table
> 
> Disk /dev/mapper/ubuntu--vg-swap_1: 6438 MB, 6438256640 bytes
> 255 heads, 63 sectors/track, 782 cylinders, total 12574720 sectors
> Units = sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
> 
> Disk /dev/mapper/ubuntu--vg-swap_1 doesn't contain a valid partition table
> 
> So /dev/sda is the original install disk and /dev/sdb in my shiny new WD 
> Black 4TB drive.
> 
> # vgdisplay
>   --- Volume group ---
>   VG Name               ubuntu-vg
>   System ID
>   Format                lvm2
>   Metadata Areas        1
>   Metadata Sequence No  7
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                2
>   Open LV               2
>   Max PV                0
>   Cur PV                1
>   Act PV                1
>   VG Size               465.52 GiB
>   PE Size               4.00 MiB
>   Total PE              119173
>   Alloc PE / Size       119162 / 465.48 GiB
>   Free  PE / Size       11 / 44.00 MiB
>   VG UUID               tFSX8N-c3zG-j9BW-yqx2-Or63-AXMg-Sho5tD
> 
> root@home:~# lvdisplay
>   --- Logical volume ---
>   LV Path                /dev/ubuntu-vg/root
>   LV Name                root
>   VG Name                ubuntu-vg
>   LV UUID                rqvzFC-b1I2-sLRm-oq6w-fTEP-UGSe-7E7fwz
>   LV Write Access        read/write
>   LV Creation host, time ubuntu, 2014-08-15 14:24:31 +0100
>   LV Status              available
>   # open                 1
>   LV Size                459.48 GiB
>   Current LE             117627
>   Segments               2
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           252:0
> 
>   --- Logical volume ---
>   LV Path                /dev/ubuntu-vg/swap_1
>   LV Name                swap_1
>   VG Name                ubuntu-vg
>   LV UUID                y9fXgx-ceMm-lss0-ZZi8-d2us-KdGT-ipUQQ4
>   LV Write Access        read/write
>   LV Creation host, time ubuntu, 2014-08-15 14:24:31 +0100
>   LV Status              available
>   # open                 2
>   LV Size                6.00 GiB
>   Current LE             1535
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           252:1
> 
> 
> So I've got /boot in a primary partition and then swap and / come via 
> LVM in the extended.
> 
> So I'd love to do something like
> * dd /dev/sda1 to /dev/sdb1 or something like that and have my /boot 
> volume set up
> * install grub into the MBR of /dev/sdb
> 
> The if I can make the right LVM setup, get / from my live system copied 
> to the new drive, remove the old drive lv from the vg and then 
> physically swap the HDDs round.
> 
> Can someone help me with the finer details of this or isn't it doable?
> TIA
> -C
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
