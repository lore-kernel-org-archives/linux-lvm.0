Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9TBk91G025705
	for <linux-lvm@redhat.com>; Sun, 29 Oct 2006 06:46:09 -0500
Received: from karakal.cosy.sbg.ac.at (karakal.cosy.sbg.ac.at [141.201.2.175])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9TBk7dd032282
	for <linux-lvm@redhat.com>; Sun, 29 Oct 2006 06:46:08 -0500
Received: from webmail.cosy.sbg.ac.at (localhost.localdomain [127.0.0.1])
	by karakal.cosy.sbg.ac.at (Postfix) with ESMTP id EA1268D4751
	for <linux-lvm@redhat.com>; Sun, 29 Oct 2006 12:46:15 +0100 (CET)
Message-ID: <2813.62.99.165.114.1162122375.squirrel@webmail.cosy.sbg.ac.at>
Date: Sun, 29 Oct 2006 12:46:15 +0100 (CET)
From: gklima@cosy.sbg.ac.at
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Lost partition table --> Lost 4th PV partition on disk
 - how to find the partition bounderies
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

Hi!

I've a laptop with root lvm2 and lost my partitioning table (all zeros).
But the data on the disk (4th partition) should be fine since I've only
messed with the primary patition table.

The main problem is that the partitions don't start at the cylinder
bounderies anymore (repartitioned the first partition with win xp (made it
smaller)). and copied data over to the fist partition with ghost 2003.

the layout of the disk was/is as follows:
1) ntfs ~10G
2) ntfs ~10G
3) ext3 36mb linux-boot
4) PV of lvm2 which had 72046800 blocks as of /proc/partition the last
time lvm2 worked

layout by fdisk after the win xp partitoning and ghost coping with a still
working lvm2 PV on partition 4

1) 1-1703
2) 1704-3186
3) 3187-3192
4) 3192-12161

fdisk did complain about partitions not starting and ending at cylinder
bounderies

!!!!!then I completely messed up the partition table and now have one with
all zeros (erased)

So how do I find the correct partitioning parameters for the fourth
partition!!!?

The VG is called "vg"

and the approximately layout is as follows:

root lv 500M (bin, sbin, etc, lib, ......)
swap lv 1500M encrypted
and then var usr opt distfiles portage and so on.....


what fdisk says about the disk:

Disk /dev/hda: 100.0 GB, 100030242816 bytes
255 heads, 63 sectors/track, 12161 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/hda: 100.0 GB, 100030242816 bytes
255 heads, 63 sectors/track, 12161 cylinders, total 195371568 sectors
Units = sectors of 1 * 512 = 512 bytes


Thanks in advance for every help the could bring back my data an saves me
a lot of work!

Georg
