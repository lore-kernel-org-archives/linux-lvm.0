Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i59KYa008792
	for <linux-lvm@redhat.com>; Wed, 9 Jun 2004 16:34:36 -0400
Received: from ip66-106-138-51.z138-106-66.customer.algx.net
	(65.106.88.139.ptr.us.xo.net [65.106.88.139])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i59KYYi5011528
	for <linux-lvm@redhat.com>; Wed, 9 Jun 2004 16:34:35 -0400
Received: from [192.168.1.126] (rich [192.168.1.126])
	by ip66-106-138-51.z138-106-66.customer.algx.net (Postfix) with ESMTP
	id EA999183D
	for <linux-lvm@redhat.com>; Wed,  9 Jun 2004 13:34:33 -0700 (PDT)
From: Rich Turner <rich@storix.com>
Message-Id: <1086813273.1391.12.camel@rich>
Mime-Version: 1.0
Date: Wed, 09 Jun 2004 13:34:33 -0700
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate not overwriting partition table
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
To: LVM general discussion and development <linux-lvm@redhat.com>

from what i can remember, pvcreate should be unable (without "force") to
create a physical volume on an entire disk if there was a partition
table on that disk. something must have changed because now it seems it
doesnt even check, and worse, it doesnt remove the partition table. what
happens is you end up with a pv on the entire disk as well as a
partition table on the disk.

here are some details:
[root@linuxclone root]# lvm version
  LVM version:     2.00.15 (2004-04-19)
  Library version: 1.00.14-ioctl (2004-04-06)
  Driver version:  4.1.0
distribution: fedora core 2

pvscan shows 2 pv's, one on the entire disk the other on a partition on
the same disk. how can that happen?
[root@linuxclone root]# pvscan
  PV /dev/hda    VG vault_vg   lvm2 [37.27 GB / 36.27 GB free]
  PV /dev/hda2                 lvm2 [37.01 GB]
  Total: 2 [74.28 GB] / in use: 1 [37.27 GB] / in no VG: 1 [37.01 GB]

[root@linuxclone root]# sfdisk -l /dev/hda
 
Disk /dev/hda: 77545 cylinders, 16 heads, 63 sectors/track
Warning: The partition table looks like it was made
  for C/H/S=*/255/63 (instead of 77545/16/63).
For this listing I'll assume that geometry.
Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from
0
 
   Device Boot Start     End   #cyls    #blocks   Id  System
/dev/hda1   *      0+     32      33-    265041   82  Linux swap
/dev/hda2         33    4864    4832   38813040   8e  Linux LVM
/dev/hda3          0       -       0          0    0  Empty
/dev/hda4          0       -       0          0    0  Empty
