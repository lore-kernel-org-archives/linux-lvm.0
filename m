Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7B69Ctn030191
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 02:09:12 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7B694H3006114
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 02:09:04 -0400
Received: from r74-192-76-102.vctrcmta01.vctatx.tl.dh.suddenlink.net
	([74.192.76.102] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1Oj4Ug-00053X-Fq
	for linux-lvm@redhat.com; Tue, 10 Aug 2010 23:08:58 -0700
Date: Wed, 11 Aug 2010 01:10:31 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <AANLkTinkg_uy8YdHtKGHrZZW4qCzERQGNXMA4fn4y=_S@mail.gmail.com>
	(from rpnabar@gmail.com on Tue Aug 10 21:25:15 2010)
Message-Id: <1281507031.21952.1@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] calculating free capacity from pvdisplay and
 lvdisplay
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> B. Thus the total full space would come to 4.89 TB. But the sum of  
> full
> space of all my LV's is only around 3 TB (based on the output of df)

It's the same thing as making a new partition covering your whole drive,
then wondering why fdisk says you can't make another partition.  Just
because you haven't stored files in that partition, it's still takes
up the whole drive.

df shows that your LVs take up 8.6TB: 6TB + 600 GB + 2 TB.
Therefore, you are using 8.6TB of disk space for those LVs.
Some of the space WITHIN each LV might not be used for files,
but it has been dedicated to that LV.

df also shows that the filesystems on the LVs have free space for
more files.  So you can put more files on those LVs, which is a
different thing than having space to make more LVs.

I'm not good at explaining things, so sometimes I try explaining three
different ways.  I have six cereal boxes, each half empty.  I put the
boxes in a bag.  The bag is now full.  The cereal boxes may not be full,
but they fill up the bag.  The cereal boxes are your half empty LVs and
the bag is your drives.

Layers:

hard drive
partition (can be skipped)
physical volume
volume group
logical volume
file system
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 08/10/2010 09:25:15 PM, Rahul Nabar wrote:
> Some of the physical volumes show "Allocatable           yes (but
> full)" while others don't. How does one relate this to the actual
> capacity? THe reason I am confused is that 3 of my PV's show up as
> full and each is 1.63 TB. Thus the total full space would come to 4.89
> TB. But the sum of full space of all my LV's is only around 3 TB
> (based on the output of df)
> 
> I've reproduced the outputs of pvdisplay, lvdisplay and df below.
> 
> I'm confused! Any pointers?
> 
> --
> Rahul
> 
> 
> [root@eustorage ~]# pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/sdb
>   VG Name               euclid_highperf_storage
>   PV Size               1.63 TB / not usable 4.00 MB
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              428351
>   Free PE               0
>   Allocated PE          428351
>   PV UUID               wDdbmP-2n5m-98HD-Ewqk-Q3y0-lnMf-rsaVXt
> 
>   --- Physical volume ---
>   PV Name               /dev/sdc
>   VG Name               euclid_highperf_storage
>   PV Size               1.63 TB / not usable 4.00 MB
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              428351
>   Free PE               0
>   Allocated PE          428351
>   PV UUID               75i75q-2rec-2FMf-eyPa-W0nF-zFHH-PIAvvc
> 
>   --- Physical volume ---
>   PV Name               /dev/sdd
>   VG Name               euclid_highperf_storage
>   PV Size               1.63 TB / not usable 4.00 MB
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              428351
>   Free PE               0
>   Allocated PE          428351
>   PV UUID               vo2Jh2-PfFC-eOj4-GYnP-Jx1I-Sisu-2nY4lC
> 
>   --- Physical volume ---
>   PV Name               /dev/sde
>   VG Name               euclid_highperf_storage
>   PV Size               1.63 TB / not usable 4.00 MB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              428351
>   Free PE               38140
>   Allocated PE          390211
>   PV UUID               EK7cvF-IZjf-PJVw-d2RR-lCdt-kOSD-iqFtOf
> 
>   --- Physical volume ---
>   PV Name               /dev/sdf
>   VG Name               euclid_highperf_storage
>   PV Size               1.63 TB / not usable 4.00 MB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              428351
>   Free PE               140607
>   Allocated PE          287744
>   PV UUID               fQXN8S-HhYu-weoq-kbuz-BrxZ-6WQk-6ydBDw
> 
>   --- Physical volume ---
>   PV Name               /dev/sdg
>   VG Name               euclid_highperf_storage
>   PV Size               1.63 TB / not usable 4.00 MB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              428351
>   Free PE               140607
>   Allocated PE          287744
>   PV UUID               i7GD1d-rbd2-efKd-uK3u-D3S2-BxJv-UkrNve
> 
> [root@eustorage ~]# df -h
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/sda2              76G  8.6G   64G  12% /
> /dev/sda6              19G  365M   17G   3% /var
> /dev/sda5              15G  165M   14G   2% /tmp
> /dev/sda1             487M   17M  445M   4% /boot
> tmpfs                  24G     0   24G   0% /dev/shm
> /dev/mapper/euclid_highperf_storage-LV_home
>                       6.0T  1.4T  4.4T  24% /home
> /dev/mapper/euclid_highperf_storage-LV_export
>                       591G   17G  550G   3% /opt
> /dev/mapper/euclid_highperf_storage-LV_polhome
>                       2.0T  1.5T  386G  80% /polhome
> [root@eustorage ~]# lvdisplay
>   --- Logical volume ---
>   LV Name                /dev/euclid_highperf_storage/LV_home
>   VG Name                euclid_highperf_storage
>   LV UUID                gu7yo1-TYYr-ucHG-QSDk-y8HD-ETrs-Z5kCk9
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                6.00 TB
>   Current LE             1572864
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     1536
>   Block device           253:0
> 
>   --- Logical volume ---
>   LV Name                /dev/euclid_highperf_storage/LV_export
>   VG Name                euclid_highperf_storage
>   LV UUID                1lktLy-Hgn3-qS1m-41VJ-5kNY-DMyb-1ri4Th
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                600.00 GB
>   Current LE             153600
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     1536
>   Block device           253:1
> 
>   --- Logical volume ---
>   LV Name                /dev/euclid_highperf_storage/LV_polhome
>   VG Name                euclid_highperf_storage
>   LV UUID                xqpOX5-HFey-H0qi-NgjP-NVS7-FwDb-zbiK8m
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                2.00 TB
>   Current LE             524288
>   Segments               4
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:2
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
