Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F3B917538
	for <linux-lvm@redhat.com>; Thu,  1 Jun 2017 11:35:55 +0000 (UTC)
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 298198553D
	for <linux-lvm@redhat.com>; Thu,  1 Jun 2017 11:35:54 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id 99so24754364lfu.1
	for <linux-lvm@redhat.com>; Thu, 01 Jun 2017 04:35:54 -0700 (PDT)
Received: from [192.168.1.103] (89-70-247-150.dynamic.chello.pl.
	[89.70.247.150]) by smtp.googlemail.com with ESMTPSA id
	2sm4275729lju.0.2017.06.01.04.35.51 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 04:35:51 -0700 (PDT)
From: =?UTF-8?Q?Daniel_=c5=81askowski?= <danniello@gmail.com>
Message-ID: <29712c7c-0d4d-2ad3-8eec-380b38ff3589@gmail.com>
Date: Thu, 1 Jun 2017 13:35:50 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Subject: [linux-lvm] Problem with mount QNAP disks in Linux
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hello,

I'm trying mount three disks from QNAP TS-469L in Linux (Fedora 25).
System correctly recognised disks and RAID5, but I have problem with 
activate LVM with data.

In QNAP QTS system it was look this way:
Storage Pool 1          5,44 TB
├─DataVol1 (System)     5,38 TB         (Free Size: ~300,00 GB)
└─DataVol2              509,46 GB       (Free Size: ~400,00 GB)

In Fedora it looks that disks and RAID are recognised OK.

$ lsblk
NAME            MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
sdb               8:16   0   2,7T  0 disk
├─sdb4            8:20   0 517,7M  0 part
│ └─md123         9:123  0 448,1M  0 raid1
├─sdb2            8:18   0 517,7M  0 part
│ └─md127         9:127  0 517,7M  0 raid1
├─sdb5            8:21   0     8G  0 part
│ └─md125         9:125  0   6,9G  0 raid1
├─sdb3            8:19   0   2,7T  0 part
│ └─md124         9:124  0   5,5T  0 raid5
│   └─vg1-lv544 253:3    0    20G  0 lvm
└─sdb1            8:17   0 517,7M  0 part
   └─md126         9:126  0 517,7M  0 raid1
sdc               8:32   0   2,7T  0 disk
├─sdc2            8:34   0 517,7M  0 part
│ └─md127         9:127  0 517,7M  0 raid1
├─sdc5            8:37   0     8G  0 part
│ └─md125         9:125  0   6,9G  0 raid1
├─sdc3            8:35   0   2,7T  0 part
│ └─md124         9:124  0   5,5T  0 raid5
│   └─vg1-lv544 253:3    0    20G  0 lvm
├─sdc1            8:33   0 517,7M  0 part
│ └─md126         9:126  0 517,7M  0 raid1
└─sdc4            8:36   0 517,7M  0 part
   └─md123         9:123  0 448,1M  0 raid1
sda               8:0    0   2,7T  0 disk
├─sda4            8:4    0 517,7M  0 part
│ └─md123         9:123  0 448,1M  0 raid1
├─sda2            8:2    0 517,7M  0 part
│ └─md127         9:127  0 517,7M  0 raid1
├─sda5            8:5    0     8G  0 part
│ └─md125         9:125  0   6,9G  0 raid1
├─sda3            8:3    0   2,7T  0 part
│ └─md124         9:124  0   5,5T  0 raid5
│   └─vg1-lv544 253:3    0    20G  0 lvm
└─sda1            8:1    0 517,7M  0 part
   └─md126         9:126  0 517,7M  0 raid1

$ cat /proc/mdstat
Personalities : [raid1] [raid6] [raid5] [raid4]
md123 : active (auto-read-only) raid1 sda4[2] sdc4[1] sdb4[0]
       458880 blocks super 1.0 [24/3] [UUU_____________________]
       bitmap: 1/1 pages [4KB], 65536KB chunk

md124 : active (auto-read-only) raid5 sdb3[0] sdc3[1] sda3[2]
       5840623232 blocks super 1.0 level 5, 64k chunk, algorithm 2 [3/3] 
[UUU]

md125 : active (auto-read-only) raid1 sda5[2] sdc5[1] sdb5[0]
       7168000 blocks super 1.0 [3/3] [UUU]
       bitmap: 0/1 pages [0KB], 65536KB chunk

md126 : active (auto-read-only) raid1 sda1[2] sdc1[1] sdb1[0]
       530112 blocks super 1.0 [24/3] [UUU_____________________]
       bitmap: 1/1 pages [4KB], 65536KB chunk

md127 : active raid1 sda2[2](S) sdb2[0] sdc2[1]
       530112 blocks super 1.0 [2/2] [UU]
       bitmap: 0/1 pages [0KB], 65536KB chunk

$ sudo pvs
   PV             VG     Fmt  Attr PSize   PFree
   /dev/md124     vg1    lvm2 a--    5,44t    0

$ sudo vgs
   VG     #PV #LV #SN Attr   VSize   VFree
   vg1      1   4   0 wz--n-   5,44t    0

$ sudo lvs
   LV    VG     Attr       LSize   Pool Origin Data% Meta%  Move Log 
Cpy%Sync Convert
   lv1   vg1    Vwi---tz--   5,42t tp1
   lv2   vg1    Vwi---tz-- 512,00g tp1
   lv544 vg1    -wi-a----- 20,00g
   tp1   vg1    twi---tz-- 5,40t

$ sudo lvscan
   ACTIVE            '/dev/vg1/lv544' [20,00 GiB] inherit
   inactive          '/dev/vg1/tp1' [5,40 TiB] inherit
   inactive          '/dev/vg1/lv1' [5,42 TiB] inherit
   inactive          '/dev/vg1/lv2' [512,00 GiB] inherit

If I understand correctly:
/dev/vg1/tp1 - it is QNAP "Storage Pool 1" (with real size 5,40 TiB)
/dev/vg1/lv1 - it is QNAP "DataVol1" (with virtual size 5,42 TiB)
/dev/vg1/lv2 - it is QNAP "DataVol2" (with virtual size 512 GiB)

So my data are on /dev/vg1/lv1 and /dev/vg1/lv2 but they are "inactive", 
so they cannot be mounted.
$ sudo mount /dev/vg1/lv2 /mnt/lv2
mount: special device /dev/vg1/lv2 does not exist

I tried to activate it with lvchange but there is message that manual 
repair of vg1/tp1 is required:
$ sudo lvchange -ay vg1/lv2
   Check of pool vg1/tp1 failed (status:1). Manual repair required!

I tried command lvconvert --repair vg1/tp1 with no success:
$ sudo lvconvert --repair vg1/tp1
   Using default stripesize 64,00 KiB.
   Volume group "vg1" has insufficient free space (0 extents): 4096 
required.

Please help howto repair/mount this LVM...

Best Regards,
Daniel
