Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3KEHFiw026101
	for <linux-lvm@redhat.com>; Thu, 20 Apr 2006 10:17:15 -0400
Received: from uldns1.unil.ch (uldns1.unil.ch [130.223.8.20])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3KEHCE4031304
	for <linux-lvm@redhat.com>; Thu, 20 Apr 2006 10:17:12 -0400
Received: from iris.unil.ch ([130.223.27.23])
	by uldns1.unil.ch with esmtp (Exim 4.44) id 1FWZxq-0006vY-KY
	for linux-lvm@redhat.com; Thu, 20 Apr 2006 16:16:58 +0200
Message-ID: <444797DA.8080704@unil.ch>
Date: Thu, 20 Apr 2006 16:16:58 +0200
From: Dominique Frise <Dominique.Frise@unil.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] multiple snapshots and deactivate
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

Hi,

Our system RHEL4:
	# uname -r
	2.6.9-22.EL
	# rpm -qa | grep lvm
	system-config-lvm-1.0.16-1.0
	lvm2-2.02.01-1.3.RHEL4


We would like to make up to 8 snapshots/day of the same original LV.
To be able to keep all the snapshots for an entire day, we thougt that we could 
deactivate a snapshot before creating a new active one.

----current VG/LV config----
# lvdisplay
   --- Logical volume ---
   LV Name                /dev/vg1/lv1
   VG Name                vg1
   LV UUID                SjIv1d-XedO-o9mZ-7EKa-zNcj-bX6m-BhfAZQ
   LV Write Access        read/write
   LV snapshot status     source of
                          /dev/vg1/snap1 [active]
   LV Status              available
   # open                 1
   LV Size                3.16 GB
   Current LE             810
   Segments               1
   Allocation             inherit
   Read ahead sectors     0
   Block device           253:0

   --- Logical volume ---
   LV Name                /dev/vg1/snap1
   VG Name                vg1
   LV UUID                U7DjZJ-HTDZ-5L0P-QxWD-moxK-KqRG-o03wQf
   LV Write Access        read/write
   LV snapshot status     active destination for /dev/vg1/lv1
   LV Status              available
   # open                 0
   LV Size                3.16 GB
   Current LE             810
   COW-table size         424.00 MB
   COW-table LE           106
   Allocated to snapshot  47.46%
   Snapshot chunk size    8.00 KB
   Segments               1
   Allocation             inherit
   Read ahead sectors     0
   Block device           253:3
--------------------------------


Using lvchange to deactivate the current snapshot reports errors:-(

# lvchange -v -an /dev/vg1/snap1
     Using logical volume(s) on command line
   Can't change snapshot logical volume "snap1"


Are we missing something?
