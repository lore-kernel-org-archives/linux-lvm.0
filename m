Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6LL25mD014132
	for <linux-lvm@redhat.com>; Mon, 21 Jul 2008 17:02:05 -0400
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6LL1ruR021185
	for <linux-lvm@redhat.com>; Mon, 21 Jul 2008 17:01:54 -0400
From: Ross Boylan <ross@biostat.ucsf.edu>
Date: Mon, 21 Jul 2008 14:01:36 -0700
Message-Id: <1216674096.7888.5.camel@corn.betterworld.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Wisdom of multiple disks in one VG
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
To: LVM general discussion and development <linux-lvm@redhat.com>

If I have a Volume Group with partitions from 2 different physical disks
on it, and I confine my logical volumes to particular physical disks,
will I be able to recover the logical volumes on disk 1 if disk 2 fails?

I have several disks, but they are all different sizes and so don't seem
like good candidates for a scheme with redundancy (e.g., RAID 5).
Because of my concern that combining disks into the same volume group
would mean a failure of 1 would effectively wipe them all out, I have so
far used separate VG's for each disk.  However, this is awkward.

So, my general question is what the best approach would be in this
situation, multiple disks of much different sizes.  The existing disks
all have separate VG's on them.  The biggest disk is empty so far.

Thanks for any advice.
Ross Boylan
