Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m08Hu025007323
	for <linux-lvm@redhat.com>; Tue, 8 Jan 2008 12:56:00 -0500
Received: from snefru.openlib.org (wuecon195.wustl.edu [128.252.177.195])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m08HtS8Q006461
	for <linux-lvm@redhat.com>; Tue, 8 Jan 2008 12:55:28 -0500
Date: Tue, 8 Jan 2008 11:55:28 -0600
From: Thomas Krichel <krichel@openlib.org>
Message-ID: <20080108175528.GA6100@openlib.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] uuid already in use
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
To: Linux LVM <linux-lvm@redhat.com>
Cc: Bob Parks <bparks@wustl.edu>


  Hi,

  I have a disk /dev/hdb that appears to be physically
  damaged. It is in a volume group vg1. At some 
  stage it was so bad that I could not see it

raneb:# fdisk /dev/hdb

Unable to open /dev/hdb

  I ran 

raneb:# vgreduce vg1 --removemissing

  but could not restore the volume group to run,
  it kept complaing that /dev/hdb was missing.

  I read 

http://www.novell.com/communities/node/1502/recovering+lost+lvm+volume+disk

  and tried to apply the procedure described in the
  section "disk permanently removed". I first had
  to order a new disk. A new 500G disk arrived today.

  After a long shutdown, today the disk appears
  visible again, miraculously. 

raneb:/etc/lvm/archive# fdisk -l /dev/hdb

Disk /dev/hdb: 200.0 GB, 200049647616 bytes
255 heads, 63 sectors/track, 24321 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x00000000

   Device Boot      Start         End      Blocks   Id  System
/dev/hdb1               1       24321   195358401   83  Linux

  So I try to see it in lvm

raneb:/etc/lvm/archive# pvdisplay 
  Warning: Volume Group vg1 is not consistent
  --- Physical volume ---
  PV Name               /dev/hdd1
  VG Name               vg1
  PV Size               186.31 GB / not usable 3.69 MB
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              47694
  Free PE               47694
  Allocated PE          0
  PV UUID               vy3MOc-47sl-zUal-nhdO-FFX3-ispO-Rl0h8p
   
  --- Physical volume ---
  PV Name               /dev/hdc
  VG Name               vg1
  PV Size               465.76 GB / not usable 4.02 MB
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              119234
  Free PE               119234
  Allocated PE          0
  PV UUID               NxRIE1-ROxx-pfjJ-QHzh-7B80-F7wt-kRCmSK
   

  I try to recover the metadata. The correct one is in 
  vg1_00026.vg, because this is the version before the
  "vgreduce vg1 --removemissing". But

raneb:/etc/lvm/archive# pvcreate --uuid v3HXpi-d5QN-OGiW-VFBG-TNIY-qTun-bFhlVd  --restorefile vg1_00026.vg /dev/hdb
  uuid v3HXpi-d5QN-OGiW-VFBG-TNIY-qTun-bFhlVd already in use on "/dev/hdb1"

  I am puzzled. pvdisplay does not see the uuid value but
  pvcreate says it is is use?? What am I missing here?



  Cheers,

  Thomas Krichel                    http://openlib.org/home/krichel
                                RePEc:per:1965-06-05:thomas_krichel
                                               skype: thomaskrichel
