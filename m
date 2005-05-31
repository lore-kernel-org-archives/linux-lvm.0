Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4VGYAO26046
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 12:34:10 -0400
Received: from bender.bawue.de (bender.bawue.de [193.7.176.20])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4VGY3Qt005691
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 12:34:04 -0400
Received: from bear.sommrey.de (jo@bear.sommrey.de [127.0.0.1])
	by bear.sommrey.de (8.13.4/8.13.4/Debian-1) with ESMTP id
	j4VGXpZ7013649
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 18:33:51 +0200
Received: (from jo@localhost)
	by bear.sommrey.de (8.13.4/8.13.4/Submit) id j4VGXpFB013645
	for linux-lvm@redhat.com; Tue, 31 May 2005 18:33:51 +0200
Date: Tue, 31 May 2005 18:33:51 +0200
From: Joerg Sommrey <jo@sommrey.de>
Message-ID: <20050531163351.GA11742@sommrey.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM snapshots causing SATA disk failures
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

the subject sounds strange - I know.  However, all the tests I did lead
me to this conclusion.

The setup consist of:
- two identical SATA disk /dev/sdb and /dev/sdc connected to a Promise
  SATA150 TX4 controller
- both disks are identically partitioned into /dev/sd[bc][1-4]
- each pair of corresponding partitions are members of a MD-RAID0 or
  MD-RAID1 device /dev/md[0-3]
- each MD-RAID device is the only physical volume of a LVM volume group
- there are several logical volumes within these volume groups
  containing reiser filesystems.

So far everything works fine.

Now I create a snapshot of one of the logical volumes in a RAID-1 vg
(and mount it) and do some "heavy" memory-mapped i/o on either the
original or the snapshot filesystem (e.g. starting mutt on a large maildir
folder).  This causes the system to fail in a absolutely repeatable way.
Syslog gets flooded with errors and the RAID-1 continues operation on one
partition.  Need to reboot (reset!) at this point.  I am able to
raidhotadd the failed partition without problems after reboot.

This problem appeared between kernel 2.6.10 and 2.6.11 and persists
until recent 2.6.12-rc5.

Does anybody have an idea what's going on here?

TIA
-jo

syslog:

May 31 17:08:13 bear kernel: ata1: status=0x51 { DriveReady SeekComplete Error }May 31 17:08:13 bear kernel: ata1: called with no error (51)!
May 31 17:08:13 bear kernel: ata1: status=0x51 { DriveReady SeekComplete Error }May 31 17:08:13 bear kernel: ata1: called with no error (51)!
May 31 17:08:13 bear kernel: ata1: status=0x51 { DriveReady SeekComplete Error }May 31 17:08:13 bear kernel: ata1: called with no error (51)!
May 31 17:08:13 bear kernel: ata1: status=0x51 { DriveReady SeekComplete Error }May 31 17:08:13 bear kernel: ata1: called with no error (51)!
May 31 17:08:13 bear kernel: ata1: status=0x51 { DriveReady SeekComplete Error }May 31 17:08:13 bear kernel: ata1: called with no error (51)!
May 31 17:08:13 bear kernel: SCSI error : <1 0 0 0> return code = 0x8000002
May 31 17:08:13 bear kernel: sdb: Current: sense key: Medium Error
May 31 17:08:13 bear kernel:     Additional sense: Unrecovered read error - auto reallocate failed
May 31 17:08:13 bear kernel: end_request: I/O error, dev sdb, sector 80684237
May 31 17:08:13 bear kernel: ata1: status=0x51 { DriveReady SeekComplete Error }May 31 17:08:13 bear kernel: ata1: called with no error (51)!
May 31 17:08:13 bear kernel: SCSI error : <1 0 0 0> return code = 0x8000002
May 31 17:08:13 bear kernel: sdb: Current: sense key: Medium Error
May 31 17:08:13 bear kernel:     Additional sense: Unrecovered read error - auto reallocate failed
May 31 17:08:13 bear kernel: end_request: I/O error, dev sdb, sector 80684245
May 31 17:08:13 bear kernel: raid1: Disk failure on sdb3, disabling device.
May 31 17:08:13 bear kernel: ^IOperation continuing on 1 devices
May 31 17:08:13 bear kernel: raid1: sdb3: rescheduling sector 278912
May 31 17:08:13 bear kernel: ata1: status=0x51 { DriveReady SeekComplete Error }May 31 17:08:13 bear kernel: ata1: called with no error (51)!
May 31 17:08:13 bear kernel: SCSI error : <1 0 0 0> return code = 0x8000002
May 31 17:08:13 bear kernel: sdb: Current: sense key: Medium Error
May 31 17:08:13 bear kernel:     Additional sense: Unrecovered read error - auto reallocate failed
May 31 17:08:13 bear kernel: end_request: I/O error, dev sdb, sector 80684253
May 31 17:08:13 bear kernel: raid1: sdb3: rescheduling sector 278928
May 31 17:08:13 bear kernel: RAID1 conf printout:
May 31 17:08:13 bear kernel:  --- wd:1 rd:2
May 31 17:08:13 bear kernel:  disk 0, wo:1, o:0, dev:sdb3
May 31 17:08:13 bear kernel:  disk 1, wo:0, o:1, dev:sdc3
May 31 17:08:13 bear kernel: RAID1 conf printout:
May 31 17:08:13 bear kernel:  --- wd:1 rd:2
May 31 17:08:13 bear kernel:  disk 1, wo:0, o:1, dev:sdc3
May 31 17:08:13 bear kernel: raid1: sdc3: redirecting sector 278912 to another mirror
May 31 17:08:13 bear kernel: raid1: sdc3: redirecting sector 278928 to another mirror

[etc. until reboot]
