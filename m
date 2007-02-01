Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l11GLE0W022895
	for <linux-lvm@redhat.com>; Thu, 1 Feb 2007 11:21:14 -0500
Received: from cmpmail.ucsf.edu (cmpmail.ucsf.edu [169.230.18.155])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l11GL4YB013327
	for <linux-lvm@redhat.com>; Thu, 1 Feb 2007 11:21:04 -0500
Received: from [169.230.6.46] (account nico HELO [10.54.0.6])
	by cmpmail.ucsf.edu (CommuniGate Pro SMTP 5.0.8)
	with ESMTPSA id 3244290 for linux-lvm@redhat.com;
	Thu, 01 Feb 2007 08:18:16 -0800
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Message-Id: <C40752F5-E7A4-4B4A-98F1-3DFF485DD152@cmpmail.ucsf.edu>
From: Nico Stuurman <nico@cmpmail.ucsf.edu>
Date: Thu, 1 Feb 2007 08:21:00 -0800
Subject: [linux-lvm] pvscan does not detect lvm1 exported volume group
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-lvm@redhat.com

While trying to upgrade from RedHat 9 (2.4 kernel) to Mandriva 2007  
(2.6 kernel) I needed to export and re-import a lvm volume group.   
The volume group is build from two RAID5 volumes on 3ware RAID  
cards.  In RedHat 9 (using lvm tools version 1.0.3) I can inactivate  
and export the volume group (using vgchange -an and vgexport).   
However, this exported volume group is not detected using the  
Mandriva 2007 system (which, I presume, uses a recent version of  
lvm2).  pvscan simply does not detect the volume group.

The relevant output of pvscan -vvvv is copied below.  The volume  
group consists of /dev/sdb1 and /dev/sdc1.  Apparently, pvscan sees  
some kind of md raid information on /dev/sdb1 and decides to skip it?

After rebooting in RedHat 9, pvscan (1.0.3) sees the volume group  
and  vgimport imports it fine.

Is there any way I can move this volume group to a kernel 2.6 system  
that uses the lvm2 tools?

Thanks!


Nico


#device/dev-io.c:437         Opened /dev/sdb RO
#device/dev-io.c:264       /dev/sdb: size is 2734359936 sectors
#device/dev-io.c:134         /dev/sdb: block size is 4096 bytes
#filters/filter.c:112         /dev/sdb: Skipping: Partition table  
signature found
#device/dev-io.c:483         Closed /dev/sdb
#device/dev-io.c:437         Opened /dev/sdb1 RO
#device/dev-io.c:264       /dev/sdb1: size is 2734359327 sectors
#device/dev-io.c:483         Closed /dev/sdb1
#device/dev-io.c:264       /dev/sdb1: size is 2734359327 sectors
#device/dev-io.c:437         Opened /dev/sdb1 RO O_DIRECT
#device/dev-io.c:134         /dev/sdb1: block size is 512 bytes
#device/dev-io.c:483         Closed /dev/sdb1
#filters/filter-md.c:39         /dev/sdb1: Skipping md component device
#filters/filter-sysfs.c:251         /dev/fd0h360: Skipping (sysfs)
#filters/filter-sysfs.c:251         /dev/fd0h720: Skipping (sysfs)
#filters/filter-sysfs.c:251         /dev/fd0u1440: Skipping (sysfs)
#filters/filter-sysfs.c:251         /dev/fd0u2880: Skipping (sysfs)
#device/dev-io.c:437         Opened /dev/sdc RO
#device/dev-io.c:264       /dev/sdc: size is 2734359936 sectors
#device/dev-io.c:134         /dev/sdc: block size is 4096 bytes
#filters/filter.c:112         /dev/sdc: Skipping: Partition table  
signature found
#device/dev-io.c:483         Closed /dev/sdc
#device/dev-io.c:437         Opened /dev/sdc1 RO
#device/dev-io.c:264       /dev/sdc1: size is 1367195697 sectors
#device/dev-io.c:483         Closed /dev/sdc1
#device/dev-io.c:264       /dev/sdc1: size is 1367195697 sectors
#device/dev-io.c:437         Opened /dev/sdc1 RO O_DIRECT
#device/dev-io.c:134         /dev/sdc1: block size is 512 bytes
#device/dev-io.c:483         Closed /dev/sdc1
#filters/filter-md.c:39         /dev/sdc1: Skipping md component device
#device/dev-io.c:437         Opened /dev/sdc2 RO
#device/dev-io.c:264       /dev/sdc2: size is 1367163630 sectors
#device/dev-io.c:483         Closed /dev/sdc2
#device/dev-io.c:264       /dev/sdc2: size is 1367163630 sectors
#device/dev-io.c:437         Opened /dev/sdc2 RO O_DIRECT
#device/dev-io.c:134         /dev/sdc2: block size is 512 bytes
#device/dev-io.c:483         Closed /dev/sdc2
#filters/filter-composite.c:31         Using /dev/sdc2
#device/dev-io.c:437         Opened /dev/sdc2 RO O_DIRECT
#device/dev-io.c:134         /dev/sdc2: block size is 512 bytes
#label/label.c:180       /dev/sdc2: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:483         Closed /dev/sdc2
