Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAFIlar31401
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 13:47:36 -0500
Received: from www.austinlogistics.com (mail.austinlogistics.com
	[69.150.203.234])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAFIlTkx026571
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 13:47:30 -0500
Message-ID: <OF921189DB.5199A5A6-ON86256F4D.0063CB48-86256F4D.00673909@austinlogistics.com>
From: Jetkins@austinlogistics.com
Date: Mon, 15 Nov 2004 12:47:28 -0600
MIME-Version: 1.0
Subject: [linux-lvm] Expanding a PV on a hardware RAID
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi, folks.

I think I may have painted myself into a corner, but I thought I'd ask here
before I undo what I've done so far.  My configuration is as follows:

I have a hardware RAID with 2 logical drives defined.  The second logical
drive (/dev/sdb) is dedicated entirely to LVM.  When I set up LVM, I used
      pvcreate /dev/sdb
to allocate the entire logical drive, rather than creating a partition
table and using
      pvcreate /dev/sdb1

I then created a VG with just the single PV, and several LV's.  It's all
working great, but I need to expand the available capacity.

Thinking this would be a simple operation, I added three new drives to the
RAID5 array, taking the available space from ~850GB to ~1.25TB.  The RAID
controller dynamically expanded /dev/sdb to the new size, which the OS
recognized after a reboot:

      SCSI device sdb: 2578636800 512-byte hdwr sectors (1320262 MB)
       sdb: unknown partition table

I thought I would simply be able to expand the PV to take up the newly
available space on the "new larger disk".  However, I can't seem to find
any way to expand a PV, and therein lies my problem.  It seems that without
a pvexpand or pvresize command, I have no way of utilizing the additional
space.

Without that ability, it seems that I have no alternative but to remove the
additional drives (taking /dev/sdb back to its original size), create a new
RAID5 array (/dev/sdc), and create a new PV on that logical drive.  Total
bummer because I lose another 147GB drive to parity for the new array, but
I don't see any other way out.

So my questions are twofold:

1)  Am I missing something, or is there currently no way to expand a PV?,
and

2)  Would I have been better off creating a partition table and
pvcreate'ing on /dev/sdb1instead of pvcreate'ing the entire /dev/sdb disk
initially, given that I could now have created a new partition on the extra
space and pvreate'd a new PV alongside the old?

Thanks in advance,

Jon Etkins
IT Administration & Support
Austin Logistics, Inc
ph:  (512) 651-5641
fax: (512) 329-5625
