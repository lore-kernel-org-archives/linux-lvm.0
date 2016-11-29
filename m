Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAT4fvIX023494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2016 23:41:57 -0500
Received: from mps1.wohnheimg.uni-frankfurt.de
	(mps1.wohnheimg.uni-frankfurt.de [141.2.118.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3B1B80F7B
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2016 04:41:55 +0000 (UTC)
Received: from p4fcefcb9.dip0.t-ipconnect.de ([79.206.252.185]
	helo=[192.168.0.11]) (Authed sender Sven 'DarKRaveR' Eschenberg)
	by mps1.wohnheimg.uni-frankfurt.de via ESMTPSA
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1cBZuK-0007Tx-UA
	for linux-lvm@redhat.com; Tue, 29 Nov 2016 05:20:41 +0100
References: <3846371a-93ab-1222-5237-925138028405@strike.wu.ac.at>
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
Message-ID: <76a7aa17-723b-16b0-7a14-b45b1d7af042@whgl.uni-frankfurt.de>
Date: Tue, 29 Nov 2016 05:20:41 +0100
MIME-Version: 1.0
In-Reply-To: <3846371a-93ab-1222-5237-925138028405@strike.wu.ac.at>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] PE alignment
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
To: linux-lvm@redhat.com


The problem is related to inconsistent io hinting semantics:
minimum io size = preferred random io size.
optimal io size = preferred streaming io size.

For a RAID this would be chunk and stripe sizes and you certainly want 
your first PE stripe aligned. On the other hand, in your example (usb 
attached drive by any chance?) the prefferred streaming io size is not 
relevant for alignment.

IMHO this needs to be rectified by cleary stating the semantics on IO 
hinting.

Regards

-Sven

Am 27.11.2016 um 19:52 schrieb Alexander 'Leo' Bergolth:
> Hi!
>
> I noticed that a newly created PV on a 512k sector SATA disk uses a PE
> alignment of 65535, which seems rather strange...
>
> # pvs -o +pe_start --units s
>   PV         VG      Fmt  Attr PSize       PFree       1st PE
>   /dev/sda2  vg_sys  lvm2 a--   117211136S   45907968S   2048S
>   /dev/sdb1          lvm2 ---  3221225472S 3221225472S  65535S
>   /dev/sde1  vg_data lvm2 a--  1953513472S  879771648S   2048S
>
> Looking at the verbose output of pvcreate, this seems to be derived from
> /sys/block/sdb/queue/optimal_io_size:
>
> # grep . /sys/block/sdb/queue/*size
> /sys/block/sdb/queue/hw_sector_size:512
> /sys/block/sdb/queue/logical_block_size:512
> /sys/block/sdb/queue/max_segment_size:4096
> /sys/block/sdb/queue/minimum_io_size:4096
> /sys/block/sdb/queue/optimal_io_size:33553920
> /sys/block/sdb/queue/physical_block_size:512
>
> I can manually set a correct value of dataalignment of course.
> However, shouldn't lvm assure that PE alignment is set to a multiple of
> the minimum_io_size?
>
> Cheers,
> --leo
>
>
> I am using lvm2-2.02.130-5.el7_2.5.x86_64
>
> This is the disk:
>
> Disk /dev/sdb: 5860533168 sectors, 2.7 TiB
> Logical sector size: 512 bytes
> Disk identifier (GUID): D28E3352-7CE6-4AAB-802A-59270088604E
> Partition table holds up to 128 entries
> First usable sector is 34, last usable sector is 5860533134
> Partitions will be aligned on 2048-sector boundaries
> Total free space is 2639307629 sectors (1.2 TiB)
>
> Number  Start (sector)    End (sector)  Size       Code  Name
>    1            2048      3221227519   1.5 TiB     8E00  Linux LVM
>
>
> # sg_inq -p 0xb0 /dev/sdb
> VPD INQUIRY: Block limits page (SBC)
>   Maximum compare and write length: 0 blocks
>   Optimal transfer length granularity: 8 blocks
>   Maximum transfer length: 65535 blocks
>   Optimal transfer length: 65535 blocks
>   Maximum prefetch, xdread, xdwrite transfer length: 65535 blocks
>   Maximum unmap LBA count: 0
>   Maximum unmap block descriptor count: 0
>   Optimal unmap granularity: 0
>   Unmap granularity alignment valid: 0
>   Unmap granularity alignment: 0
>
>
> # pvcreate -vv /dev/sdb1
>       Setting activation/monitoring to 1
>       Setting global/locking_type to 1
>       Setting global/wait_for_locks to 1
>       File-based locking selected.
>       Setting global/prioritise_write_locks to 1
>       Setting global/locking_dir to /run/lock/lvm
>       Setting global/use_lvmlockd to 0
>       metadata/pvmetadataignore not found in config: defaulting to 0
>       metadata/pvmetadatasize not found in config: defaulting to 255
>       metadata/pvmetadatacopies not found in config: defaulting to 1
>       Locking /run/lock/lvm/P_orphans WB
>       Setting response to OK
>       Setting response to OK
>       Setting id to Atul0q-kVgc-yptP-NAbb-ulm9-zx8l-bu8cei
>       Setting vgid to xhIC4u-hJk7-hR0y-1nvw-wJal-wRbz-gYuICd
>       Setting vgname to vg_data
>       Setting format to lvm2
>       Setting device to 2113
>       Setting dev_size to 1000202771968
>       Setting label_sector to 1
>       Setting size to 1044480
>       Setting start to 4096
>       Setting ignore to 0
>       Setting id to 0d3kX3-SnUS-eKfx-M47m-rQFG-50DV-apC1d6
>       Setting vgid to uRefqt-U56B-c343-q7DS-DDtt-m3Wz-nVnihu
>       Setting vgname to vg_sys
>       Setting format to lvm2
>       Setting device to 2050
>       Setting dev_size to 60014075392
>       Setting label_sector to 1
>       Setting size to 1044480
>       Setting start to 4096
>       Setting ignore to 0
>       Setting response to OK
>       Setting response to OK
>       Setting name to vg_sys
>       Setting metadata/format to lvm2
>       Setting id to 0d3kX3-SnUS-eKfx-M47m-rQFG-50DV-apC1d6
>       Setting format to lvm2
>       Setting device to 2050
>       Setting dev_size to 117214991
>       Setting label_sector to 1
>     Found same device /dev/sda2 with same pvid
> 0d3kX3SnUSeKfxM47mrQFG50DVapC1d6
>       Setting size to 1044480
>       Setting start to 4096
>       Setting ignore to 0
>       Setting response to OK
>       Setting response to OK
>       Setting response to OK
>       Setting response to OK
>       Setting name to vg_data
>       Setting metadata/format to lvm2
>       Setting id to Atul0q-kVgc-yptP-NAbb-ulm9-zx8l-bu8cei
>       Setting format to lvm2
>       Setting device to 2113
>       Setting dev_size to 1953521039
>       Setting label_sector to 1
>     Found same device /dev/sde1 with same pvid
> Atul0qkVgcyptPNAbbulm9zx8lbu8cei
>       Setting size to 1044480
>       Setting start to 4096
>       Setting ignore to 0
>       Setting response to OK
>       Setting response to OK
>       /dev/sdb1: size is 3221225472 sectors
>       /dev/sdb1: size is 3221225472 sectors
>       Setting allocation/use_blkid_wiping to 1
>       /dev/sdb1: size is 3221225472 sectors
>       /dev/sdb1: size is 3221225472 sectors
>       /dev/sdb1: size is 3221225472 sectors
>       Setting devices/data_alignment to 0
>       devices/default_data_alignment not found in config: defaulting to 1
>       Setting devices/md_chunk_alignment to 1
>       Setting devices/data_alignment_detection to 1
>       Device /dev/sdb1: queue/minimum_io_size is 4096 bytes.
>       Device /dev/sdb1: queue/optimal_io_size is 33553920 bytes.
>       /dev/sdb1: Setting PE alignment to 65535 sectors.
>       Setting devices/data_alignment_offset_detection to 1
>       Device /dev/sdb1: alignment_offset is 0 bytes.
>       /dev/sdb1: Setting PE alignment offset to 0 sectors.
>     Set up physical volume for "/dev/sdb1" with 3221225472 available sectors
>       Scanning for labels to wipe from /dev/sdb1
>     Zeroing start of device /dev/sdb1
>     Writing physical volume data to disk "/dev/sdb1"
>       /dev/sdb1: Writing label to sector 1 with stored offset 32.
>       Setting response to OK
>       Setting response to OK
>   Physical volume "/dev/sdb1" successfully created
>       Unlocking /run/lock/lvm/P_orphans
>
