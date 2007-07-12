Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6C5XQDh008336
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 01:33:26 -0400
Received: from smtp-3.hut.fi (smtp-3.hut.fi [130.233.228.93])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6C5XOSC025271
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 01:33:25 -0400
Received: from localhost (putosiko.hut.fi [130.233.228.114])
	by smtp-3.hut.fi (8.13.6/8.12.10) with ESMTP id l6C5XIwc028367
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 08:33:18 +0300
Received: from smtp-3.hut.fi ([130.233.228.93])
	by localhost (putosiko.hut.fi [130.233.228.114]) (amavisd-new,
	port 10024) with LMTP id 22612-18-2 for <linux-lvm@redhat.com>;
	Thu, 12 Jul 2007 08:33:17 +0300 (EEST)
Received: from aski.hut.fi (aski.hut.fi [130.233.79.196])
	by smtp-3.hut.fi (8.13.6/8.12.10) with ESMTP id l6C5X5so028291
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 08:33:05 +0300
Received: from localhost (localhost [127.0.0.1])
	by aski.hut.fi (Postfix) with ESMTP id 0F4BB33B18
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 08:33:05 +0300 (EEST)
Date: Thu, 12 Jul 2007 08:33:04 +0300 (EEST)
From: Vesa-Pekka Palmu <palmu@aski.hut.fi>
Message-ID: <Pine.LNX.4.62.0707120828240.22959@aski.hut.fi>
MIME-Version: 1.0
Subject: [linux-lvm] pvmove fails with "Failure parsing mirror status
	fraction: 1 core"
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm trying to move data away from a raid1 array in a volume group to a 
raid5 array and pvmove fails with error "Failure parsing mirror status 
fraction: 1 core".

Any ideas?

Info:
Kernel 2.6.22.1 Core 2 SMP

LVM version:     2.02.26 (2007-06-15)
Library version: 1.02.20 (2007-06-15)
Driver version:  4.11.0

     Finding volume group "raid1"
     Archiving volume group "raid1" metadata (seqno 11).
     Creating logical volume pvmove0
     Moving 22538 extents of logical volume raid1/backup
     Found volume group "raid1"
     Updating volume group metadata
     Creating volume group backup "/etc/lvm/backup/raid1" (seqno 12).
     Found volume group "raid1"
     Found volume group "raid1"
     Suspending raid1-backup (253:3) without device flush
     Found volume group "raid1"
     Creating raid1-pvmove0
     Loading raid1-pvmove0 table
     Resuming raid1-pvmove0 (253:9)
     Found volume group "raid1"
     Loading raid1-pvmove0 table
     Suppressed raid1-pvmove0 identical table reload.
     Loading raid1-backup table
     Resuming raid1-backup (253:3)
     Checking progress every 15 seconds
   Failure parsing mirror status fraction: 1 core
   Failure parsing mirror status fraction: 1 core
   ABORTING: Mirror percentage check failed.
