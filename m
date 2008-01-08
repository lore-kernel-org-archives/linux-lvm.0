Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m08IMrWJ025734
	for <linux-lvm@redhat.com>; Tue, 8 Jan 2008 13:22:53 -0500
Received: from snefru.openlib.org (wuecon195.wustl.edu [128.252.177.195])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m08IMVuo022832
	for <linux-lvm@redhat.com>; Tue, 8 Jan 2008 13:22:31 -0500
Received: from krichel by snefru.openlib.org with local (Exim 4.68)
	(envelope-from <krichel@openlib.org>) id 1JCJ5q-0001f8-Vb
	for linux-lvm@redhat.com; Tue, 08 Jan 2008 12:22:30 -0600
Date: Tue, 8 Jan 2008 12:22:30 -0600
From: Thomas Krichel <krichel@openlib.org>
Subject: Re: [linux-lvm] uuid already in use
Message-ID: <20080108182230.GA6223@openlib.org>
References: <20080108175528.GA6100@openlib.org> <4783BB2C.5060803@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4783BB2C.5060803@redhat.com>
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


  Bryn M. Reeves writes

> If the command above is exactly what you ran, I'd guess that it is
> complaining because you are trying to create the new PV on *hdb* (whole
> disk), but there is already a PV with that UUID present on *hdb1*
> (partition).

  Ahh!

raneb:/etc/lvm/archive# pvcreate --uuid v3HXpi-d5QN-OGiW-VFBG-TNIY-qTun-bFhlVd  --restorefile vg1_00026.vg /dev/hdb1
  Warning: Volume group vg1 is not consistent
  Physical volume "/dev/hdb1" successfully created

  BTW, I never understood if I should use disks or
  partitions is lvms.

raneb:/etc/lvm/archive# pvcreate --uuid v3HXpi-d5QN-OGiW-VFBG-TNIY-qTun-bFhlVd  --restorefile vg1_00026.vg /dev/hdb1
  Warning: Volume group vg1 is not consistent
  Physical volume "/dev/hdb1" successfully created
raneb:/etc/lvm/archive# pvdisplay 
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
   
  --- NEW Physical volume ---
  PV Name               /dev/hdb1
  VG Name               
  PV Size               186.31 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               v3HXpi-d5QN-OGiW-VFBG-TNIY-qTun-bFhlVd
   
raneb:/etc/lvm/archive# vgdisplay 
  --- Volume group ---
  VG Name               vg1
  System ID             
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  17
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               652.06 GB
  PE Size               4.00 MB
  Total PE              166928
  Alloc PE / Size       0 / 0   
  Free  PE / Size       166928 / 652.06 GB
  VG UUID               Hm2mZH-jACj-gxQI-tbZM-H6pm-ovfr-TVgurC
   
raneb:/etc/lvm/archive# lvdisplay 
raneb:/etc/lvm/archive#

  I presume I have to restore the lv somehow. But this
  has got me a step foward.

  Big thank and cheers,

  Thomas Krichel                    http://openlib.org/home/krichel
                                RePEc:per:1965-06-05:thomas_krichel
                                               skype: thomaskrichel
