Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBRJ7D106523
	for <linux-lvm@redhat.com>; Tue, 27 Dec 2005 14:07:13 -0500
Received: from mail.cira.colostate.edu (mail.cira.colostate.edu
	[129.82.108.252])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBRJ7DWb025561
	for <linux-lvm@redhat.com>; Tue, 27 Dec 2005 14:07:13 -0500
Message-ID: <43B190D9.9020805@cira.colostate.edu>
Date: Tue, 27 Dec 2005 12:07:05 -0700
From: Adam Carheden <carheden@cira.colostate.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot not resized after lvresize
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I'm having trouble resizing an lvm snapshot. I do the following:

linux-util3 ~ # lvdisplay /dev/vg2/backup1
   --- Logical volume ---
   LV Name                /dev/vg2/backup1
   VG Name                vg2
   LV UUID                qVH4Dm-OWX7-QpCL-u1rk-lnWj-PysQ-GFk0VF
   LV Write Access        read/write
   LV Status              available
   # open                 0
   LV Size                10.00 GB
   Current LE             2560
   Segments               1
   Allocation             inherit
   Read ahead sectors     0
   Block device           253:0

linux-util3 ~ # lvcreate -s -L 10G  -n mysnapshot1 /dev/vg2/backup1
   Logical volume "mysnapshot1" created
linux-util3 ~ # lvdisplay /dev/vg2/mysnapshot1
   --- Logical volume ---
   LV Name                /dev/vg2/mysnapshot1
   VG Name                vg2
   LV UUID                HXKS1i-JDbx-oIes-TcS6-vuud-WT7G-snJpcM
   LV Write Access        read/write
   LV snapshot status     active destination for /dev/vg2/backup1
   LV Status              available
   # open                 0
   LV Size                10.00 GB
   Current LE             2560
   Segments               1
   Snapshot chunk size    8.00 KB
   Allocated to snapshot  0.00%
   Allocation             inherit
   Read ahead sectors     0
   Block device           253:16

linux-util3 ~ # lvextend -L 20G /dev/vg2/mysnapshot1
   Extending logical volume mysnapshot1 to 20.00 GB
   Logical volume mysnapshot1 successfully resized
linux-util3 ~ # lvdisplay /dev/vg2/mysnapshot1
   --- Logical volume ---
   LV Name                /dev/vg2/mysnapshot1
   VG Name                vg2
   LV UUID                HXKS1i-JDbx-oIes-TcS6-vuud-WT7G-snJpcM
   LV Write Access        read/write
   LV snapshot status     active destination for /dev/vg2/backup1
   LV Status              available
   # open                 0
   LV Size                10.00 GB
   Current LE             2560
   Segments               1
   Snapshot chunk size    8.00 KB
   Allocated to snapshot  0.00%
   Allocation             inherit
   Read ahead sectors     0
   Block device           253:16

linux-util3 ~ # lvscan
   ...snip...
   ACTIVE   Original '/dev/vg2/backup1' [10.00 GB] inherit
   ACTIVE   Snapshot '/dev/vg2/mysnapshot1' [20.00 GB] inherit
   ...snip...
linux-util3 ~ # lvresize -L 20G /dev/vg2/mysnapshot1
   New size (5120 extents) matches existing size (5120 extents)
...snip (lvresize help)...
linux-util3 ~ #

Note that lvdisplay report 10G before and after lvextend, but lvscan 
reports 20G after lvextend. The same things happens when I use the -l or 
-L to resize when creating the snapshot. resize_reiserfs also refuses to 
accept the 20G size, so the OS sees the block device the same way 
lvdisplay does (probably a good thing).

I'm using a Xen Linux 2.6.12.6 kernel with the devicemapper built in but 
dm_snapshot compiled as a module and LVM2 2.01.09 (Gentoo Linux). 
Everything is AMD64.

I can successfully resize non-snpshot volumes. I can't, of course, 
resize my origins, as LVM doesn't support that yet according to lvresize.

Any ideas?

Thanks
-- 
Adam Carheden
