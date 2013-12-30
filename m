Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id rBUGgWIs017553
	for <linux-lvm@redhat.com>; Mon, 30 Dec 2013 11:42:32 -0500
Received: from mail.funsoft.com (funsoft.funsoft.com [198.186.141.88])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBUGgV5h001691
	for <linux-lvm@redhat.com>; Mon, 30 Dec 2013 11:42:31 -0500
Received: from [192.168.249.249] (unknown [192.168.249.249])
	by mail.funsoft.com (Postfix) with ESMTP id E8BAA11C3AE
	for <linux-lvm@redhat.com>; Mon, 30 Dec 2013 08:42:15 -0800 (PST)
Message-ID: <52C1A267.4080700@funsoft.com>
Date: Mon, 30 Dec 2013 11:42:15 -0500
From: Gary Eheman <eheman@funsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Questions concerning large number of concurrent
	snapshots
Reply-To: eheman@funsoft.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Linux-lvm <linux-lvm@redhat.com>

I have a server on which I am implementing a backup scheme using LVM snapshots. The 
logical volumes that will be snapshotted contain a proprietary database format, not a 
conventional Linux filesystem. I point a /dev/raw/ device at the logical volumes 
through which normal I/O is accomplished. A few questions have come up as I implement 
the planned design of the backup procedures.

The logical volumes to be backed up are relatively small in their size (approx 2GB to 
3GB). The number of volumes that must be *concurrently* snapshotted is relatively 
large (approx 64+).  By "concurrently," I mean that each of the volumes to be backed 
up will have an "lvcreate --snapshot" command including a generous "-l 25%ORIGIN" 
option issued for it before the backups begin to get the best consistent view of the 
entire database. (My code checks the percent utilized of the snapshot before deletion 
and I hope to tune that 25%ORIGIN downward depending upon experience. There is over 
1TB available free space in the VG.)

When I initially created the volume group, I specified a metadatasize of 32M.

The simplified basic plan is to
   1) quiesce writes to each device in the database
   2) snapshot each logical volume in the set to be backed up
   3) resume write capability to the original volumes in the database
   4) create a /dev/raw/ device pointing at the snapshot logical block device
   5) serially backup each /dev/raw/<snapshot> device using a
      proprietary backup program to read it
   6) delete each /dev/raw/<snapshot> and /dev/<volume-group>/<snapshot>
      as its backup is completed.

Testing thus far has been successful, but I have some questions based on observations 
of the testing.

* Do I need to be concerned about the effects on the metadata of snapshotting so many 
devices concurrently? As it adds and deletes each snapshot device the space in the 
metadata is recovered, correct? Current backups of the metadata are less than 30K bytes.
* Do I need to be concerned with the number of archive files that I see are being 
created in the /etc/lvm/archive/ directory?  Will they be trimmed over time or should 
I implement something to remove older archive files?
* Anything else?
-- 
Gary Eheman
