Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67D4B60C8F
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 13:25:52 +0000 (UTC)
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E03181DFC
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 13:25:41 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id w8-v6so2041157ply.8
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 06:25:41 -0700 (PDT)
Received: from ?IPv6:2402:f000:1:1a01:68b5:9361:5007:bee9?
	([2402:f000:1:1a01:68b5:9361:5007:bee9])
	by smtp.gmail.com with ESMTPSA id
	y33-v6sm5854380pga.41.2018.07.18.06.25.38 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jul 2018 06:25:39 -0700 (PDT)
From: runappz <runappz@gmail.com>
Message-ID: <3ec4e4af-8109-ca19-2a57-8e8cf6d67737@gmail.com>
Date: Wed, 18 Jul 2018 21:25:37 +0800
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Got only half the space of RAID10 LV with 4 PVs
 (similar to RAID1 cause LV shows it has 4 'Mirrored volumes')
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

Hello, guys,

I'm trying to build an raid10 lv for root fs. I used these commands:

     lvcreate --type raid10 -m 1 -i 2 -l 24576 pve # created lvol1
     lvcreate --type raid10 -m 1 -i 2 -l 8 pve # created lvol2
     lvcreate --type raid10 -m 1 -i 2 -l 8 pve # created lvol3

     lvcreate --type raid10 -m 1 -i 2 -l 8 pve # created lvol4
     lvcreate --type raid10 -m 1 -l 8 pve # created lvol5

Last two commands was runned in rescue mode of openSuSE Leap 15.0, with
a slightly newer lvm version (about 2017-09-xx). While first 3 commands
was runned in Proxmox VE 5.2, whoes lvm is 2.02.168(2016-11-30).

The default LE size was 4MiB, so that I expect lvol1 to be 2*4*24576
MiB, while other 4 are all 2*4*8 MiB. However, I only got 4*24576 MiB
and 4*8 MiB partitions. I tried to run `mkfs.ext4` on lvol3 and mount
it. `df` shows clearly that lvol3 is a 32MiB volume.

Output of `lvdisplay -m`is as follow. Note that all lvol1-5 has a
"Mirrored volumes" value of 4. I suppose that this value should be 2 for
a 4-PV RAID10 setup.Any suggestions?

       --- Logical volume ---
       LV Path                /dev/pve/swap
       LV Name                swap
       VG Name                pve
       LV UUID EcMef2-ld3E-088a-sK1n-Ld8Q-Oies-EhzjUu
       LV Write Access        read/write
       LV Creation host, time proxmox, 2018-07-18 00:55:20 +0800
       LV Status              available
       # open                 2
       LV Size                8.00 GiB
       Current LE             2048
       Segments               1
       Allocation             inherit
       Read ahead sectors     auto
       - currently set to     256
       Block device           253:0

       --- Segments ---
       Logical extents 0 to 2047:
         Type        linear
         Physical volume    /dev/sda3
         Physical extents    0 to 2047


       --- Logical volume ---
       LV Path                /dev/pve/root
       LV Name                root
       VG Name                pve
       LV UUID AfNvKq-K9Z3-hX3M-06jh-DcbA-1VDo-HZg4w9
       LV Write Access        read/write
       LV Creation host, time proxmox, 2018-07-18 00:55:20 +0800
       LV Status              available
       # open                 1
       LV Size                96.00 GiB
       Current LE             24576
       Segments               1
       Allocation             inherit
       Read ahead sectors     auto
       - currently set to     256
       Block device           253:1

       --- Segments ---
       Logical extents 0 to 24575:
         Type        linear
         Physical volume    /dev/sda3
         Physical extents    2048 to 26623


       --- Logical volume ---
       LV Name                data
       VG Name                pve
       LV UUID cs33YQ-RVgl-6TH2-59Dz-9oev-eMtB-cTfoh9
       LV Write Access        read/write
       LV Creation host, time proxmox, 2018-07-18 00:55:21 +0800
       LV Pool metadata       data_tmeta
       LV Pool data           data_tdata
       LV Status              available
       # open                 0
       LV Size                372.15 GiB
       Allocated pool data    0.00%
       Allocated metadata     0.04%
       Current LE             95271
       Segments               1
       Allocation             inherit
       Read ahead sectors     auto
       - currently set to     256
       Block device           253:53

       --- Segments ---
       Logical extents 0 to 95270:
         Type        thin-pool
         Monitoring        monitored
         Chunk size        64.00 KiB
         Discards        passdown
         Thin count        0
         Transaction ID    0
         Zero new blocks    yes


       --- Logical volume ---
       LV Path                /dev/pve/root2
       LV Name                root2
       VG Name                pve
       LV UUID lM45gq-h9r2-HarB-wUlL-fnhd-8Wwp-blD0fo
       LV Write Access        read/write
       LV Creation host, time rescue, 2018-07-18 01:13:18 +0800
       LV Status              available
       # open                 0
       LV Size                3.12 GiB
       Current LE             800
       Segments               1
       Allocation             inherit
       Read ahead sectors     auto
       - currently set to     256
       Block device           253:2

       --- Segments ---
       Logical extents 0 to 799:
         Type        linear
         Physical volume    /dev/sda3
         Physical extents    123841 to 124640


       --- Logical volume ---
       LV Path                /dev/pve/boot
       LV Name                boot
       VG Name                pve
       LV UUID wcAt0f-MgMY-MKRf-uFmW-fs6K-c8rE-EFgmsu
       LV Write Access        read/write
       LV Creation host, time rescue, 2018-07-18 01:20:33 +0800
       LV Status              available
       # open                 0
       LV Size                512.00 MiB
       Current LE             128
       Mirrored volumes       4
       Segments               1
       Allocation             inherit
       Read ahead sectors     auto
       - currently set to     256
       Block device           253:54

       --- Segments ---
       Logical extents 0 to 127:
         Type        raid1
         Monitoring        monitored
         Raid Data LV 0
           Logical volume    boot_rimage_0
           Logical extents    0 to 127
         Raid Data LV 1
           Logical volume    boot_rimage_1
           Logical extents    0 to 127
         Raid Data LV 2
           Logical volume    boot_rimage_2
           Logical extents    0 to 127
         Raid Data LV 3
           Logical volume    boot_rimage_3
           Logical extents    0 to 127
         Raid Metadata LV 0    boot_rmeta_0
         Raid Metadata LV 1    boot_rmeta_1
         Raid Metadata LV 2    boot_rmeta_2
         Raid Metadata LV 3    boot_rmeta_3


       --- Logical volume ---
       LV Path                /dev/pve/lvol1
       LV Name                lvol1
       VG Name                pve
       LV UUID xh5aWn-vD7f-17S4-erB0-WP1L-PIa3-dWMLw0
       LV Write Access        read/write
       LV Creation host, time pve, 2018-07-18 01:42:07 +0800
       LV Status              available
       # open                 0
       LV Size                96.00 GiB
       Current LE             24576
       Mirrored volumes       4
       Segments               1
       Allocation             inherit
       Read ahead sectors     auto
       - currently set to     1024
       Block device           253:55

       --- Segments ---
       Logical extents 0 to 24575:
         Type        raid10
         Monitoring        monitored
         Raid Data LV 0
           Logical volume    lvol1_rimage_0
           Logical extents    0 to 24575
         Raid Data LV 1
           Logical volume    lvol1_rimage_1
           Logical extents    0 to 24575
         Raid Data LV 2
           Logical volume    lvol1_rimage_2
           Logical extents    0 to 24575
         Raid Data LV 3
           Logical volume    lvol1_rimage_3
           Logical extents    0 to 24575
         Raid Metadata LV 0    lvol1_rmeta_0
         Raid Metadata LV 1    lvol1_rmeta_1
         Raid Metadata LV 2    lvol1_rmeta_2
         Raid Metadata LV 3    lvol1_rmeta_3


       --- Logical volume ---
       LV Path                /dev/pve/lvol2
       LV Name                lvol2
       VG Name                pve
       LV UUID sx0AEz-sOG0-KtRb-0df9-7axD-9HmH-e3T0G0
       LV Write Access        read/write
       LV Creation host, time pve, 2018-07-18 01:51:04 +0800
       LV Status              available
       # open                 0
       LV Size                32.00 MiB
       Current LE             8
       Mirrored volumes       4
       Segments               1
       Allocation             inherit
       Read ahead sectors     auto
       - currently set to     1024
       Block device           253:56

       --- Segments ---
       Logical extents 0 to 7:
         Type        raid10
         Monitoring        monitored
         Raid Data LV 0
           Logical volume    lvol2_rimage_0
           Logical extents    0 to 7
         Raid Data LV 1
           Logical volume    lvol2_rimage_1
           Logical extents    0 to 7
         Raid Data LV 2
           Logical volume    lvol2_rimage_2
           Logical extents    0 to 7
         Raid Data LV 3
           Logical volume    lvol2_rimage_3
           Logical extents    0 to 7
         Raid Metadata LV 0    lvol2_rmeta_0
         Raid Metadata LV 1    lvol2_rmeta_1
         Raid Metadata LV 2    lvol2_rmeta_2
         Raid Metadata LV 3    lvol2_rmeta_3


       --- Logical volume ---
       LV Path                /dev/pve/lvol3
       LV Name                lvol3
       VG Name                pve
       LV UUID XIsMPd-WYOt-IOOc-F16M-O18D-foI3-RiAR57
       LV Write Access        read/write
       LV Creation host, time pve, 2018-07-18 01:56:46 +0800
       LV Status              available
       # open                 0
       LV Size                32.00 MiB
       Current LE             8
       Mirrored volumes       4
       Segments               1
       Allocation             inherit
       Read ahead sectors     auto
       - currently set to     1024
       Block device           253:57

       --- Segments ---
       Logical extents 0 to 7:
         Type        raid10
         Monitoring        monitored
         Raid Data LV 0
           Logical volume    lvol3_rimage_0
           Logical extents    0 to 7
         Raid Data LV 1
           Logical volume    lvol3_rimage_1
           Logical extents    0 to 7
         Raid Data LV 2
           Logical volume    lvol3_rimage_2
           Logical extents    0 to 7
         Raid Data LV 3
           Logical volume    lvol3_rimage_3
           Logical extents    0 to 7
         Raid Metadata LV 0    lvol3_rmeta_0
         Raid Metadata LV 1    lvol3_rmeta_1
         Raid Metadata LV 2    lvol3_rmeta_2
         Raid Metadata LV 3    lvol3_rmeta_3


       --- Logical volume ---
       LV Path                /dev/pve/lvol4
       LV Name                lvol4
       VG Name                pve
       LV UUID 0Iqsan-2Apb-JwUW-DMLU-k4AO-NOrJ-DSQYu9
       LV Write Access        read/write
       LV Creation host, time rescue, 2018-07-18 02:01:52 +0800
       LV Status              available
       # open                 0
       LV Size                32.00 MiB
       Current LE             8
       Mirrored volumes       4
       Segments               1
       Allocation             inherit
       Read ahead sectors     auto
       - currently set to     1024
       Block device           253:58

       --- Segments ---
       Logical extents 0 to 7:
         Type        raid10
         Monitoring        monitored
         Raid Data LV 0
           Logical volume    lvol4_rimage_0
           Logical extents    0 to 7
         Raid Data LV 1
           Logical volume    lvol4_rimage_1
           Logical extents    0 to 7
         Raid Data LV 2
           Logical volume    lvol4_rimage_2
           Logical extents    0 to 7
         Raid Data LV 3
           Logical volume    lvol4_rimage_3
           Logical extents    0 to 7
         Raid Metadata LV 0    lvol4_rmeta_0
         Raid Metadata LV 1    lvol4_rmeta_1
         Raid Metadata LV 2    lvol4_rmeta_2
         Raid Metadata LV 3    lvol4_rmeta_3


       --- Logical volume ---
       LV Path                /dev/pve/lvol5
       LV Name                lvol5
       VG Name                pve
       LV UUID jwPC0n-HmOY-NBO6-KIJC-jHen-7sFb-pEMVQb
       LV Write Access        read/write
       LV Creation host, time rescue, 2018-07-18 02:02:03 +0800
       LV Status              available
       # open                 0
       LV Size                32.00 MiB
       Current LE             8
       Mirrored volumes       4
       Segments               1
       Allocation             inherit
       Read ahead sectors     auto
       - currently set to     1024
       Block device           253:59

       --- Segments ---
       Logical extents 0 to 7:
         Type        raid10
         Monitoring        monitored
         Raid Data LV 0
           Logical volume    lvol5_rimage_0
           Logical extents    0 to 7
         Raid Data LV 1
           Logical volume    lvol5_rimage_1
           Logical extents    0 to 7
         Raid Data LV 2
           Logical volume    lvol5_rimage_2
           Logical extents    0 to 7
         Raid Data LV 3
           Logical volume    lvol5_rimage_3
           Logical extents    0 to 7
         Raid Metadata LV 0    lvol5_rmeta_0
         Raid Metadata LV 1    lvol5_rmeta_1
         Raid Metadata LV 2    lvol5_rmeta_2
         Raid Metadata LV 3    lvol5_rmeta_3


Regards,

Ben Ma
