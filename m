Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0M1PaEI000703
	for <linux-lvm@redhat.com>; Sun, 21 Jan 2007 20:25:36 -0500
Received: from emililab.med.utoronto.ca (emililab.med.utoronto.ca
	[142.150.84.40])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0M1PZdI008975
	for <linux-lvm@redhat.com>; Sun, 21 Jan 2007 20:25:35 -0500
Received: from tin.emililab.edu (tin.emililab.edu [192.168.142.21])
	by emililab.med.utoronto.ca (Postfix) with ESMTP id 466D8C00149
	for <linux-lvm@redhat.com>; Sun, 21 Jan 2007 20:39:44 -0500 (EST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by tin.emililab.edu (Postfix) with ESMTP id 066B9E005CB3
	for <linux-lvm@redhat.com>; Sun, 21 Jan 2007 20:25:20 -0500 (EST)
Date: Sun, 21 Jan 2007 20:25:19 -0500 (EST)
From: Robert Brockway <robert.brockway@utoronto.ca>
Message-ID: <Pine.LNX.4.64.0701212001080.15980@tin.emililab.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Recreating logical volume
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
To: LVM List <linux-lvm@redhat.com>

Hi all.  I have a RH AS 4 box with 4 H/W RAID array (sdb, sdc, sdd & sde).

All 4 raid arrays were in a single volume group (vg0) which was then made 
in to a single logical volume (lv0).  Both sdb & sdd are now 
uncontactable (they don't even appear in fdisk).

I umounted the filesystem (/data) originally with the intend of running 
e2fsck on the filesystem (it's ext3).  This failed and I attempted to 
remoun the filesystem but was unable to.

I used vgreduce --test --removemissing vg0 and as it looked good I went 
ahead and used vgreduce --removemissing vg0

Of course this has removed lv0.

If I use lvcreate -Zn on the remaining PVs: sdc & sde can I recover the 
logical volume and then go on to mount /data again?

Here is some data:

$sudo pvdisplay
Password:
   /dev/sdb: read failed after 0 of 4096 at 0: Input/output error
   /dev/sdb1: read failed after 0 of 2048 at 0: Input/output error
   /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
   /dev/sdd1: read failed after 0 of 2048 at 0: Input/output error
   --- Physical volume ---
   PV Name               /dev/sdc1
   VG Name               vg0
   PV Size               1.64 TB / not usable 0
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              429149
   Free PE               429149
   Allocated PE          0
   PV UUID               i0kyjz-8U3i-fMCT-Trxs-vF7W-wnap-M4fBlP

   --- Physical volume ---
   PV Name               /dev/sde1
   VG Name               vg0
   PV Size               1.64 TB / not usable 0
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              429149
   Free PE               429149
   Allocated PE          0
   PV UUID               YR2tx7-PLFu-xAGJ-d4KP-RIW9-Nguh-KzjybH

$sudo vgdisplay
   /dev/sdb: read failed after 0 of 4096 at 0: Input/output error
   /dev/sdb1: read failed after 0 of 2048 at 0: Input/output error
   /dev/sdd: read failed after 0 of 4096 at 0: Input/output error
   /dev/sdd1: read failed after 0 of 2048 at 0: Input/output error
   --- Volume group ---
   VG Name               vg0
   System ID
   Format                lvm2
   Metadata Areas        2
   Metadata Sequence No  8
   VG Access             read/write
   VG Status             resizable
   MAX LV                256
   Cur LV                0
   Open LV               0
   Max PV                256
   Cur PV                2
   Act PV                2
   VG Size               3.27 TB
   PE Size               4.00 MB
   Total PE              858298
   Alloc PE / Size       0 / 0
   Free  PE / Size       858298 / 3.27 TB
   VG UUID               0MT3nn-xqM1-6ScL-XEM3-1Kyo-XDOp-SkhV8R


Thanks,

Rob

-- 
Robert Brockway B.Sc. email: robert.brockway@utoronto.ca
                       phone: +1-416-978-1829
Snr System Administrator, Linux & HPC, CCBR, University of Toronto
Contributing member of Software in the Public Interest
