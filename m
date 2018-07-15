Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7438F5C689
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2018 19:47:59 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 462B336809
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2018 19:47:48 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id e7-v6so10261838wrs.9
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2018 12:47:48 -0700 (PDT)
References: <6f854f20-3e62-0536-40ea-9ec21e112a6d@bytefoundry.com.au>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <6c386d31-af38-93e7-dd29-14ebfb9eb0a9@gmail.com>
Date: Sun, 15 Jul 2018 21:47:38 +0200
MIME-Version: 1.0
In-Reply-To: <6f854f20-3e62-0536-40ea-9ec21e112a6d@bytefoundry.com.au>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Recovering from lvm thin metadata exhaustion
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Dean Hamstead <dean@bytefoundry.com.au>

Dne 8.7.2018 v 23:36 Dean Hamstead napsal(a):
> Hi All,
> 
> I hope someone with very high LVM wizardy can save me from a pickle...
> 
> Ok so this happened:
> ====
> Jul  3 13:16:24 saito kernel: [131695.910332] device-mapper: space map 
> metadata: unable to allocate new metadata b
> lock
> Jul  3 13:16:24 saito kernel: [131695.910762] device-mapper: thin: 253:4: 
> metadata operation 'dm_thin_remove_range' failed: error = -28
> Jul  3 13:16:24 saito kernel: [131695.911019] device-mapper: thin: 253:4: 
> aborting current metadata transaction
> Jul  3 13:16:24 saito kernel: [131695.974977] device-mapper: thin: 253:4: 
> switching pool to read-only mode
> Jul  3 13:16:33 saito kernel: [131705.274889] device-mapper: thin: 
> dm_thin_get_highest_mapped_block returned -61
> Jul  3 13:16:43 saito kernel: [131715.351896] device-mapper: thin: 
> dm_thin_get_highest_mapped_block returned -61
> Jul  3 13:16:53 saito kernel: [131725.446482] device-mapper: thin: 
> dm_thin_get_highest_mapped_block returned -61
> ====
> 
> And sure enough
> ====
> root@saito:/var/log# lvs -a
>    Failed to parse thin params: Error.
>    LV              VG  Attr       LSize   Pool Origin Data%  Meta% Move Log 
> Cpy%Sync Convert
>    data            pve twi-cotzM- 500.00g             37.28 96.39
>    [data_tdata]    pve Twi-ao---- 500.00g
>    [data_tmeta]    pve ewi-ao---- 100.00m
>    [lvol0_pmspare] pve ewi------- 100.00m
>    root            pve -wi-ao---- 93.13g
>    swap            pve -wi-ao---- 14.90g
>    vm-100-disk-1   pve Vwi-XXtzX- 200.00g data
>    vm-100-disk-2   pve Vwi-a-tz-- 100.00g data        23.25
> ====
> 
> So i added more:
> ====
> root@saito:/var/log# lvextend --poolmetadatasize +1G pve/data
>    Size of logical volume pve/data_tmeta changed from 100.00 MiB (25 extents) 
> to 1.10 GiB (281 extents).
>    Logical volume pve/data_tmeta successfully resized.
> ====
> 
> killed off the stuck qemu processess then
> 
> ====
> root@saito:/var/log# lvchange -an -v /dev/pve/vm-100-disk-1
>      Deactivating logical volume pve/vm-100-disk-1.
>      Removing pve-vm--100--disk--1 (253:6)
> root@saito:/var/log# lvchange -an -v /dev/pve/vm-100-disk-2
>      Deactivating logical volume pve/vm-100-disk-2.
>      Removing pve-vm--100--disk--2 (253:7)
> root@saito:/var/log# lvchange -an -v /dev/pve/data
>      Deactivating logical volume pve/data.
>      Not monitoring pve/data with libdevmapper-event-lvm2thin.so
>      Removing pve-data (253:5)
>      Removing pve-data-tpool (253:4)
>      Executing: /usr/sbin/thin_check -q --clear-needs-check-flag 
> /dev/mapper/pve-data_tmeta
>      /usr/sbin/thin_check failed: 1
>    WARNING: Integrity check of metadata for pool pve/data failed.
>      Removing pve-data_tdata (253:3)
>      Removing pve-data_tmeta (253:2)
> ====
> 
> then do repair
> ====
> root@saito:/var/log# lvconvert --repair pve/data
>    Using default stripesize 64.00 KiB.
>    WARNING: recovery of pools without pool metadata spare LV is not automated.
>    WARNING: If everything works, remove pve/data_meta0 volume.
>    WARNING: Use pvmove command to move pve/data_tmeta on the best fitting PV.
> ====
> 
> looks good i guess, bring it back up and check metadata state:
> ====
> root@saito:/var/log# lvchange -ay -v /dev/pve/data
>      Activating logical volume pve/data exclusively.
>      activation/volume_list configuration setting not defined: Checking only 
> host tags for pve/data.
>      Creating pve-data_tmeta
>      Loading pve-data_tmeta table (253:2)
>      Resuming pve-data_tmeta (253:2)
>      Creating pve-data_tdata
>      Loading pve-data_tdata table (253:3)
>      Resuming pve-data_tdata (253:3)
>      Executing: /usr/sbin/thin_check -q --clear-needs-check-flag 
> /dev/mapper/pve-data_tmeta
>      Creating pve-data-tpool
>      Loading pve-data-tpool table (253:4)
>      Resuming pve-data-tpool (253:4)
>      Creating pve-data
>      Loading pve-data table (253:5)
>      Resuming pve-data (253:5)
>      Monitoring pve/data
> root@saito:/var/log# lvs -a
>    LV            VG  Attr       LSize   Pool Origin Data%  Meta% Move Log 
> Cpy%Sync Convert
>    data          pve twi-aotz-- 500.00g             4.65 1.19
>    data_meta0    pve -wi------- 1.15g
>    [data_tdata]  pve Twi-ao---- 500.00g
>    [data_tmeta]  pve ewi-ao---- 1.15g
>    root          pve -wi-ao---- 93.13g
>    swap          pve -wi-ao---- 14.90g
>    vm-100-disk-1 pve Vwi---tz-- 200.00g data
>    vm-100-disk-2 pve Vwi---tz-- 100.00g data
> root@saito:/var/log# pvdisplay
> ====
> 
> good news for disk 2...
> ====
> root@saito:/var/log# lvchange -ay -v /dev/pve/vm-100-disk-2
>      Activating logical volume pve/vm-100-disk-2 exclusively.
>      activation/volume_list configuration setting not defined: Checking only 
> host tags for pve/vm-100-disk-2.
>      Loading pve-data_tdata table (253:3)
>      Suppressed pve-data_tdata (253:3) identical table reload.
>      Loading pve-data_tmeta table (253:2)
>      Suppressed pve-data_tmeta (253:2) identical table reload.
>      Loading pve-data-tpool table (253:4)
>      Suppressed pve-data-tpool (253:4) identical table reload.
>      Creating pve-vm--100--disk--2
>      Loading pve-vm--100--disk--2 table (253:6)
>      Resuming pve-vm--100--disk--2 (253:6)
>      pve/data already monitored.
> ====
> 
> now bad news for disk 1...
> ====
> root@saito:/var/log# lvchange -ay -v /dev/pve/vm-100-disk-1
>      Activating logical volume pve/vm-100-disk-1 exclusively.
>      activation/volume_list configuration setting not defined: Checking only 
> host tags for pve/vm-100-disk-1.
>      Loading pve-data_tdata table (253:3)
>      Suppressed pve-data_tdata (253:3) identical table reload.
>      Loading pve-data_tmeta table (253:2)
>      Suppressed pve-data_tmeta (253:2) identical table reload.
>      Loading pve-data-tpool table (253:4)
>      Suppressed pve-data-tpool (253:4) identical table reload.
>      Creating pve-vm--100--disk--1
>      Loading pve-vm--100--disk--1 table (253:7)
>    device-mapper: reload ioctl on (253:7) failed: No data available
>      Removing pve-vm--100--disk--1 (253:7)
> ====
> 
> and from dmesg regarding disk one:
> ====
> [481216.385943] device-mapper: table: 253:7: thin: Couldn't open thin internal 
> device
> [481216.386433] device-mapper: ioctl: error adding target to table
> ====
> 
> I think i may be in serious trouble
> ====
> root@saito:/var/log# thin_dump /dev/pve/data_meta0 > /tmp/foo.txt
> root@saito:/var/log# grep superblock /tmp/foo.txt
> <superblock uuid="" time="0" transaction="6" data_block_size="128" 
> nr_data_blocks="8192000">
> </superblock>
> ====
> 
> 
> any thoughts on how to bring this disk back? I would be delighted for someone 
> to be able to point me at how this disk might be saved?
>


Hi

Try to open BZ like i.e. this one:

https://bugzilla.redhat.com/show_bug.cgi?id=1532071

Add all possible details (lvm2 version, kernel version, lvm2 metadata,...)
and xz compressed dump  of _meta0  device.
There is small hope that some metadata can be possibly restored with 
'hand-extension' of thin_repair tool.

Regards

Zdenek
