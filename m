Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBAMtXr12173
	for <linux-lvm@redhat.com>; Fri, 10 Dec 2004 17:55:33 -0500
Received: from mb2i1.ns.pitt.edu (mb2i1.ns.pitt.edu [136.142.11.140])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBAMtMxg024105
	for <linux-lvm@redhat.com>; Fri, 10 Dec 2004 17:55:27 -0500
Received: from [136.142.147.90] by pitt.edu (PMDF V6.2-X27 #30902)
	with ESMTP id <01LI8QGHUNVS0013H1@mb2i1.ns.pitt.edu> for
	linux-lvm@redhat.com; Fri, 10 Dec 2004 17:55:11 -0500 (EST)
Date: Fri, 10 Dec 2004 17:55:09 -0500
From: Ilya Goldin <goldin+@pitt.edu>
Message-id: <41BA294D.5090605@pitt.edu>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] shrink pv without pvresize (FC3 LVM)
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-lvm@redhat.com

I did something stupid, and I need help.

The goal is to have a single hard drive with four partitions: NTFS,
FAT32 (/home), swap, and LVM ext3 (/). What I have now is NTFS, Swap,
and one LVM VG that contains both / and /home, and both are ext3.

First,

# pvresize
Command not implemented yet.

Is there a workaround (short of writing pvresize)?

Second, I had a feeble hope that Windows XP (booted off the NTFS
partition) would deign to see a FAT32 LV under LVM. That is, if I change
/home to be FAT32, Windows might see it, so I figured I'd give it a
shot. (Is this futile?)

# mkdosfs -F 32 /dev/VolGroup00/LogVol02
mkdosfs 2.8 (28 Feb 2001)
mkdosfs: Unable to get drive geometry for '/dev/VolGroup00/LogVol02'

Why can't it get the geometry? Does LVM support FAT32 LVs? Does mkdosfs
support LVM?

Thanks!
