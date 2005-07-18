Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6I92fV10984
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2005 05:02:41 -0400
Received: from sklave3.rackland.de (sklave3.rackland.de [213.133.101.23])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6I92aKI006590
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2005 05:02:40 -0400
Received: (from hadmut@localhost)
	by sklave3.rackland.de (8.13.2/8.13.2/Debian-1) id j6I92Qg9004377
	for linux-lvm@redhat.com; Mon, 18 Jul 2005 11:02:26 +0200
From: Hadmut Danisch <hadmut@danisch.de>
Date: Mon, 18 Jul 2005 11:02:26 +0200
Message-ID: <20050718090226.GA4083@danisch.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM can't detect raid-1 mirrors?
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

Hi,

I need some help with a strange lvm problem:

I want to put LVM on a Linux Raid-1 device. I already did this several
times successfully. But this time I have a strange problem:

The raid device is /dev/md3, and it should consist of the two partitions
/dev/hda3 and /dev/hdc3.

I created the raid device with just /dev/hdc3, second missing,
then pvcreate /dev/md3 and created the volume group 'raid'. 
Works well. 

pvscan correctly shows the raid device instead of /dev/hdc3:

sodom# pvscan
  PV /dev/hdc4   VG nord   lvm2 [58,59 GB / 33,59 GB free]
  PV /dev/md3    VG raid   lvm2 [54,35 GB / 21,35 GB free]
  Total: 2 [112,94 GB] / in use: 2 [112,94 GB] / in no VG: 0 [0   ]




(ignore hdc4, it is just another lvm because hdc is larger than 
hda, there is no problem with hdc4)



But as soon as I add /dev/hda3 to the raid system (mdad /dev/md3 -a
/dev/hda3), lvm confuses the partitions. It does not detect /dev/md3
anymore and complains that there are two different partitions with the
same ID:

sodom# pvscan
  Found duplicate PV 39jeBxsxpKtJrwP6FN3Yvq6zB7khU6Pa: using /dev/hdc3
  not /dev/hda3
  PV /dev/hdc4   VG nord   lvm2 [58,59 GB / 33,59 GB free]
  PV /dev/hda3   VG raid   lvm2 [54,35 GB / 21,35 GB free]
  Total: 2 [112,94 GB] / in use: 2 [112,94 GB] / in no VG: 0 [0   ]


The volume group can't then be used. As soon as I take out /dev/hda3
and wipe the first sectors, everything is ok again.



Any idea what's going wrong here?



Just in case it matters, the partition tables:

sodom# sfdisk -l /dev/hda

Disk /dev/hda: 116301 cylinders, 16 heads, 63 sectors/track
Warning: The partition table looks like it was made
  for C/H/S=*/255/63 (instead of 116301/16/63).
For this listing I'll assume that geometry.
Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting
from 0

   Device Boot Start     End   #cyls    #blocks   Id  System
/dev/hda1          0+    100     101-    811251   fd  Linux raid autodetect
/dev/hda2        101     201     101     811282+  fd  Linux raid autodetect
/dev/hda3        202    7296    7095   56990587+  fd  Linux raid autodetect
/dev/hda4          0       -       0          0    0  Empty






sodom# sfdisk -l /dev/hdc

Disk /dev/hdc: 238216 cylinders, 16 heads, 63 sectors/track
Warning: The partition table looks like it was made
  for C/H/S=*/255/63 (instead of 238216/16/63).
For this listing I'll assume that geometry.
Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting
from 0

   Device Boot Start     End   #cyls    #blocks   Id  System
/dev/hdc1          0+    100     101-    811251   fd  Linux raid autodetect
/dev/hdc2        101     201     101     811282+  fd  Linux raid autodetect
/dev/hdc3        202    7296    7095   56990587+  fd  Linux raid autodetect
/dev/hdc4       7297   14945    7649   61440592+  8e  Linux LVM

regards
Hadmut
