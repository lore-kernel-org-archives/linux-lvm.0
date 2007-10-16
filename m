Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9GNUDVq029905
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 19:30:13 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9GNU6f2022601
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 19:30:06 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1IhvrO-0006KI-C3
	for linux-lvm@redhat.com; Tue, 16 Oct 2007 23:30:02 +0000
Received: from brian.lafayette.switchmanagement.com ([198.144.213.21])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 23:30:02 +0000
Received: from bstrand by brian.lafayette.switchmanagement.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 23:30:02 +0000
From: Brian Strand <bstrand@switchmanagement.com>
Date: Tue, 16 Oct 2007 23:27:42 +0000
Message-ID: <ff3hde$7rt$2@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] pvmove obliterates filesystem (Opensuse 10.2, x86-64)
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
To: linux-lvm@redhat.com

(Apologies in advance if this is the wrong place for this.)  Yesterday I
ran a pvmove of a mounted filesystem, but something went wrong and the
filesystem was very badly damaged.  The box is a 2x quad-core box with
16gb running Opensuse 10.2 x86-64; it is under heavy load 24x7 (typical
 load average 15-20).  The storage is connected to a san via a QLogic
2462 dual-port FC HBA, using qla2400 (no dm-multipath).  Note:  I had
just completed a successful pvmove of another lv about 30 minutes prior
to this incident.


# pvmove --version
  LVM version:     2.02.13 (2006-10-27)
  Library version: 1.02.12 (2006-10-13)
  Driver version:  4.7.0

# uname -a
Linux somebox 2.6.18.2-34-default #1 SMP Mon Nov 27 11:46:27 UTC 2006
x86_64 x86_64 x86_64 GNU/Linux


Here is the output from attempting to pvmove a 100gb lv:

# (time pvmove --verbose -n archlogs /dev/sdc @sata) >>
pvmove-archlogs.log-20071009 2>&1 </dev/null &

# cat pvmove-archlogs.log-20071009
    Wiping cache of LVM-capable devices
    Finding volume group "switch"
    Archiving volume group "switch" metadata (seqno 248).
    Creating logical volume pvmove0
    Moving 800 extents of logical volume switch/archlogs
    Found volume group "switch"
    Updating volume group metadata
    Creating volume group backup "/etc/lvm/backup/switch" (seqno 249).
    Found volume group "switch"
    Found volume group "switch"
    Suspending switch-archlogs (253:13)
    Found volume group "switch"
    Found volume group "switch"
    Creating switch-pvmove0
  device-mapper: create ioctl failed: Device or resource busy
    Loading switch-archlogs table
  device-mapper: reload ioctl failed: Invalid argument
    Checking progress every 15 seconds
  WARNING: dev_open(/dev/sdc) called while suspended
  WARNING: dev_open(/dev/sdc) called while suspended
  WARNING: dev_open(/dev/sdc) called while suspended
  WARNING: dev_open(/dev/sda2) called while suspended
  WARNING: dev_open(/dev/sdb) called while suspended
  WARNING: dev_open(/dev/sdc) called while suspended
  WARNING: dev_open(/dev/sda2) called while suspended
  WARNING: dev_open(/dev/sdb) called while suspended
  WARNING: dev_open(/dev/sda2) called while suspended
  WARNING: dev_open(/dev/sdb) called while suspended
  WARNING: dev_open(/dev/sdc) called while suspended
  WARNING: dev_open(/dev/sdb) called while suspended
  WARNING: dev_open(/dev/sda2) called while suspended
  WARNING: dev_open(/dev/sdc) called while suspended
  WARNING: dev_open(/dev/sdc) called while suspended
  WARNING: dev_open(/dev/sda2) called while suspended
  WARNING: dev_open(/dev/sdb) called while suspended
    Updating volume group metadata
    Creating volume group backup "/etc/lvm/backup/switch" (seqno 250).
    Found volume group "switch"
    Found volume group "switch"
    Found volume group "switch"
    Found volume group "switch"
    Suspending switch-pvmove0 (253:14)
    Found volume group "switch"
    Creating switch-pvmove0
  device-mapper: create ioctl failed: Device or resource busy
  Unable to reactivate logical volume "pvmove0"
    Found volume group "switch"
    Creating switch-pvmove0
  device-mapper: create ioctl failed: Device or resource busy
    Loading switch-archlogs table
  device-mapper: reload ioctl failed: Invalid argument
  ABORTING: Segment progression failed.
    Found volume group "switch"
    Found volume group "switch"
    Found volume group "switch"
    Found volume group "switch"
    Found volume group "switch"
    Creating switch-pvmove0
  device-mapper: create ioctl failed: Device or resource busy
  Unable to reactivate logical volume "pvmove0"
    Found volume group "switch"
    Loading switch-archlogs table
    Resuming switch-archlogs (253:13)
    Found volume group "switch"
    Removing switch-pvmove0 (253:14)
    Found volume group "switch"
    Removing temporary pvmove LV
    Writing out final volume group after pvmove
    Creating volume group backup "/etc/lvm/backup/switch" (seqno 252).
  /dev/sdc: Moved: 60.0%

real    0m21.789s
user    0m0.108s
sys     0m0.052s


Kernel messages from /var/log/messages:

Oct  9 22:33:21 somebox kernel: device-mapper: table: 253:13: linear:
dm-linear: Device lookup failed
Oct  9 22:33:21 somebox kernel: device-mapper: ioctl: error adding
target to table
Oct  9 22:33:21 somebox kernel: klogd 1.4.1, ---------- state change
----------
Oct  9 22:33:36 somebox kernel: device-mapper: table: 253:13: linear:
dm-linear: Device lookup failed
Oct  9 22:33:36 somebox kernel: device-mapper: ioctl: error adding
target to table
Oct  9 22:40:01 somebox kernel: ReiserFS: dm-13: warning: vs-4080:
reiserfs_free_block: free_block (dm-13:13061735)[dev:blocknr]: bit
already cleared
Oct  9 22:40:01 somebox kernel: ReiserFS: dm-13: warning: vs-4080:
reiserfs_free_block: free_block (dm-13:13061734)[dev:blocknr]: bit
already cleared

...and many thousands more complaints from reiserfs.  Given the error
messages (especially "/dev/sdc: Moved: 60.0%") and the speed with which
the destruction occurred, my working hypothesis is that the first 60% of
the lv got repointed to the destination pv, but that the data got left
behind.

Are there any known issues with pvmove?  Is pvmove a supported
operation?  I had many pvmove-induced kernel oopses under Suse 9.3, but
up until this instance it had worked fine under Opensuse 10.2 for at
least 10 pvmoves on various boxes, all under load.

Thanks,
Brian
