Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6R0M3uX026089
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 20:22:03 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.188])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6R0Lm3l020230
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 20:21:48 -0400
Received: from localhost.housecafe.de ([127.0.0.1] helo=localhost)
	by bogon.housecafe.de with esmtp (Exim 4.69)
	(envelope-from <lists@nerdbynature.de>) id 1MVDyC-0007Hs-AW
	for linux-lvm@redhat.com; Mon, 27 Jul 2009 02:21:36 +0200
Date: Sun, 26 Jul 2009 17:21:34 -0700 (PDT)
From: Christian Kujau <lists@nerdbynature.de>
Message-ID: <alpine.DEB.2.01.0907261703270.6426@bogon.housecafe.de>
MIME-Version: 1.0
Subject: [linux-lvm] lvm2 confused about double UUID
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

The subject says LVM is confused, but maybe it's me who is confused:

I once had a PV made from a single /dev/sdb and all was well. This sdb 
however was really a 2 disk RAID1 which is now split up, the system now 
sees both disks, sdb and sdc. Of course, sdb and sdc still have the same 
UUID:

# blkid  | egrep 'sd[bc]'
/dev/sdb1: UUID="1O2Tkq-9Jy8-VfuZ-uzFh-1f6v-iVBD-hcK6Vq" TYPE="lvm2pv" 
/dev/sdc1: UUID="1O2Tkq-9Jy8-VfuZ-uzFh-1f6v-iVBD-hcK6Vq" TYPE="lvm2pv"

I decided to continue to use the VG that was set up on the PV, but since 
lvm comlained[0] about finding the same UUID on more than one device, I 
tried to instruct lvm to just use sdb for the VG:

# grep filter /etc/lvm/lvm.conf | grep -v \#
   filter = [ "r|^/dev/sdc1$|", "r|/dev/.*/by-path/.*|", \
              "r|/dev/.*/by-id/.*|", "a/.*/" ]

Now everything looks fine, no more lvm warnings, vg02 seems to use sdb1, 
exactly as I wanted:

# pvs
  PV         VG   Fmt  Attr PSize   PFree  
  /dev/sda2  vg01 lvm2 a-   111.67G   9.27G
  /dev/sdb1  vg02 lvm2 a-   931.46G 137.46G


But when I access vg02, I can clearly see I/O to/from sdc! I'd really like 
to use sdc for something else now that sdb is used for vg02, but I'm afraid to 
do something to sdc, as it still being used - although I don't know why.

Any ideas?

Christian.

# lvm version
  LVM version:     2.02.26 (2007-06-15)
  Library version: 1.02.20 (2007-06-15)
  Driver version:  4.12.0
# uname -r
2.6.24-24-xen                      <-- Ubuntu/8.04

[0] e.g.
   Found duplicate PV 1O2Tkq9Jy8VfuZuzFh1f6viVBDhcK6Vq: using 
   /dev/disk/by-path/pci-fw1.1-scsi-0:0:0:1-part1 not /dev/sdb1
-- 
BOFH excuse #282:

High altitude condensation from U.S.A.F prototype aircraft has contaminated the primary subnet mask. Turn off your computer for 9 days to avoid damaging it.
