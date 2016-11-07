Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA79eFdo027137
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 7 Nov 2016 04:40:16 -0500
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D97DB83F3C
	for <linux-lvm@redhat.com>; Mon,  7 Nov 2016 09:40:09 +0000 (UTC)
Message-ID: <582049AF.7010905@strike.wu.ac.at>
Date: Mon, 07 Nov 2016 10:30:23 +0100
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] very slow sequential writes on lvm raid1 (bitmap?)
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

Hi!

I am experiencing a dramatic degradation of the sequential write speed
on a raid1 LV that resides on two USB-3 connected harddisks (UAS
enabled), compared to parallel access to both drives without raid or
compared to MD raid:

- parallel sequential writes LVs on both disks: 140 MB/s per disk
- sequential write to MD raid1 without bitmap: 140 MB/s
- sequential write to MD raid1 with bitmap: 48 MB/s
- sequential write to LVM raid1: 17 MB/s !!

According to the kernel messages, my 30 GB raid1-test-LV gets equipped
with a 61440 bit write-intent bitmap (1 bit per 512 byte data?!) whereas
a default MD raid1 bitmap only has 480 bit size. (1 bit per 64 MB).
Maybe the dramatic slowdown is caused by this much too fine grained
bitmap and its updates, which are random IO?

Is there a way to configure the bitmap size?

Cheers,
--leo


My tests:
---------

# parallel writes to independent LVs on both disks:
dd if=/dev/zero of=/dev/vg_t/lv_traw-d1 bs=1M count=1000 oflag=direct &\
  dd if=/dev/zero of=/dev/vg_t/lv_traw-d2 bs=1M count=1000 oflag=direct
1048576000 bytes (1,0 GB, 1000 MiB) copied, 7,51632 s, 140 MB/s
1048576000 bytes (1,0 GB, 1000 MiB) copied, 7,51926 s, 139 MB/s

# using MD raid1 without a bitmap
mdadm -C /dev/md/t --level=1 --raid-devices=2 \
  /dev/vg_t/lv_md_d1 /dev/vg_t/lv_md_d2
dd if=/dev/zero of=/dev/md/t bs=1M count=1000 oflag=direct
1048576000 bytes (1,0 GB, 1000 MiB) copied, 7,4604 s, 141 MB/s

# using a bitmap:
mdadm --grow --bitmap=internal /dev/md/t
dd if=/dev/zero of=/dev/md/t bs=1M count=1000 oflag=direct
1048576000 bytes (1,0 GB, 1000 MiB) copied, 22,0277 s, 47,6 MB/s

# lvm raid1
dd if=/dev/zero of=/dev/vg_t/lv_raid1 bs=1M count=1000 oflag=direct
1048576000 bytes (1,0 GB, 1000 MiB) copied, 63,7003 s, 16,5 MB/s


# MD raid bitmap
[1781588.277129] md127: bitmap initialized from disk: read 1 pages, set
480 of 480 bits

# LVM-Raid bitmap:
[1776745.608956] mdX: bitmap initialized from disk: read 2 pages, set 0
of 61440 bits


-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
