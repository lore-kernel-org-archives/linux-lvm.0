Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DC0410018FF
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2018 16:02:40 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5BAFC052436
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2018 16:02:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 7841241EF0
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2018 16:02:25 +0000 (UTC)
From: "Hector Martin 'marcan'" <marcan@marcan.st>
Message-ID: <1300400d-f1a4-59e8-bc42-0be22752f581@marcan.st>
Date: Sat, 30 Jun 2018 01:02:22 +0900
MIME-Version: 1.0
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] PE misalignment on USB UAS 512e drives kills performance
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Some (many?)* USB UAS drives report an optimal IO size of 65535 sectors
(64K - 1), which is also the maximum value:

# sg_inq -p 0xb0 /dev/sda
VPD INQUIRY: Block limits page (SBC)
  Maximum compare and write length: 0 blocks
  Optimal transfer length granularity: 8 blocks
  Maximum transfer length: 65535 blocks
  Optimal transfer length: 65535 blocks
  Maximum prefetch transfer length: 65535 blocks
[...]

# cat /sys/block/sdb/queue/optimal_io_size
33553920

LVM decides that is a good 1st PE alignment value:

# pvcreate -vv /dev/sda4 2>&1 | grep -C1 optim
      Device /dev/sda4: queue/minimum_io_size is 4096 bytes.
      Device /dev/sda4: queue/optimal_io_size is 33553920 bytes.
      /dev/sda4: Setting PE alignment to 65535 sectors.

# pvs -o +pe_start --units s /dev/sda4
  PV         VG  Fmt  Attr PSize       PFree      1st PE
  /dev/sda4  eib lvm2 a--  1421557760S 412827648S  65535S

Unfortunately, this throws off the logical/physical sector alignment on
4K/512e sector drives, which completely kills performance:

# cat /sys/block/sdb/queue/physical_block_size
4096

(also "Optimal transfer length granularity" above)

I see this was already reported in November 2016, but apparently has not
been fixed:

https://www.redhat.com/archives/linux-lvm/2016-November/msg00035.html

# lvm version
  LVM version:     2.02.166(2) (2016-09-26)
  Library version: 1.02.135 (2016-09-26)
  Driver version:  4.37.0

I think LVM should always align the 1st PE offset up to the physical
sector size, or outright ignore the optimal_io_size if it isn't aligned.
As far as I can tell the goal here is to align to RAID stripe sizes
(which are reported as optimal_io_size), but if that and the physical
sector size are mismatched, it's probably not a RAID (at least not a
properly configured RAID).

The performance hit when this goes wrong is absolutely massive with
certain workloads. An rsync that takes 30 seconds with an aligned
filesystem takes 10 minutes without it (on one of my 2.5" SATA drives
behind a UAS bridge enclosure).

[*] At least two different enclosures I own, with different vendors of
USB-SATA UAS bridges in them.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
