Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB3Htpr14465
	for <linux-lvm@redhat.com>; Fri, 3 Dec 2004 12:55:51 -0500
Received: from www.austinlogistics.com (mail.austinlogistics.com
	[69.150.203.234])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iB3Htjb6018961
	for <linux-lvm@redhat.com>; Fri, 3 Dec 2004 12:55:45 -0500
In-Reply-To: <OF44682A09.C6D944AC-ON86256F5B.005FCD50-86256F5B.00636C35@austinlogistics.com>
Message-ID: <OFF09DC32C.3675605C-ON86256F5F.005FB33E-86256F5F.006275BC@austinlogistics.com>
From: Jetkins@austinlogistics.com
Date: Fri, 3 Dec 2004 11:55:32 -0600
MIME-Version: 1.0
Subject: [linux-lvm] Replacing a physical volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>


The response to my last question was somewhat underwhelming, and I wonder
if I scared people off by introducing RAID into the equation, so let's
rephrase it as if we were dealing with individual disks (since that's
exactly how the OS sees them anyway)...

*  Let's assume I have three SCSI disks, /dev/sda through sdc, and I'm
running LVM1.

*  /dev/sda contains my non-LVM system partitions and doesn't enter into
the discussion.

*  I originally created a PV on the entire second disk (/dev/sdb) and
created several LV's on it.

*  Subsequently, I created a second PV on a partition on the third disk
(/dev/sdc1), and pvmove'd all the LVM data to that PV.  I then used
vgreduce to remove /dev/sdb from the VG.  I now have the following:

      # pvscan
      pvscan -- reading all physical volumes (this may take a while...)
      pvscan -- inactive PV "/dev/sdb"  is in no VG  [819.73 GB]
      pvscan -- ACTIVE   PV "/dev/sdc1" of VG "vg01" [956.31 GB / 136.62 GB
free]
      pvscan -- total: 2 [1.73 TB] / in use: 1 [956.35 GB] / in no VG: 1
[819.73 GB]


*  I now want to replace /dev/sdb with a new, larger drive.  The HOW-TO
simply says that the drive can now be removed or reallocated, but before I
do so, I would like reassurance in the form of answers to the following:

What will happen when the system reboots and finds /dev/sdb is now blank?
Will LVM get upset, or will it simply forget about the PV that used to be
there, so that I can create a new PV on a partition on the new disk
(/dev/sdb1)?

I guess what I need to confirm is that since the /dev/sdb PV is not in any
VG, then the only record of its existence is in the partition table of that
disk, and thus when that disk is removed, all trace of the old PV goes with
it.  I'm afraid this area is not well documented, so any assistance would
be greatly appreciated.

Thanks in advance,

Jon Etkins
IT Administration & Support
Austin Logistics, Inc
ph:  (512) 651-5641
fax: (512) 329-5625
