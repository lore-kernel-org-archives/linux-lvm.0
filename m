Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9E1jdhb015040
	for <linux-lvm@redhat.com>; Tue, 13 Oct 2009 21:45:39 -0400
Received: from kcout01.prserv.net (kcout01.prserv.net [12.154.55.31])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9E1jSdl017562
	for <linux-lvm@redhat.com>; Tue, 13 Oct 2009 21:45:28 -0400
Message-ID: <4AD52D2D.70202@attglobal.net>
Date: Tue, 13 Oct 2009 18:45:17 -0700
From: Eddie <stunnel@attglobal.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to Fix Bad PV Allocation
Reply-To: stunnel@attglobal.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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

I have a PV allocated, that is larger than the actual volume it resides on.

Somehow, and I've not been able to ascertain how, when fdisk was run, on 
a new RAID array it produced the following partition size:

fdisk -l -u /dev/sda

Disk /dev/sda: 1499.9 GB, 1499999502336 bytes
255 heads, 63 sectors/track, 182364 cylinders, total 2929686528 sectors
Units = sectors of 1 * 512 = 512 bytes
Disk identifier: 0x0003d809

  Device Boot      Start         End      Blocks   Id  System
/dev/sda1              63  2930304194  1465152066   8e  Linux LVM

The complete /dev/sda1 was then allocated to a PV.

Later, at boot time, I noticed warnings about the partition allocation 
being larger than the actual disk, which led me to investigate what was 
wrong.  After correcting this, fisk now reports the correct size for the 
partition:

fdisk -l -u /dev/sda

Disk /dev/sda: 1499.9 GB, 1499999502336 bytes
255 heads, 63 sectors/track, 182364 cylinders, total 2929686528 sectors
Units = sectors of 1 * 512 = 512 bytes
Disk identifier: 0x0003d809

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1              63  2929677659  1464838798+  8e  Linux LVM

However, the PV allocations are still based on the "incorrect" partition 
sizing, and hence, they are also incorrect:

pvdisplay
  --- Physical volume ---
  PV Name               /dev/sda1
  VG Name               raid_vg
  PV Size               1.36 TB / not usable 2.97 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              357627
  Free PE               76027
  Allocated PE          281600
  PV UUID               OOBb0e-8fyt-mhfr-Oshw-mS8d-Mcay-t2ixBb

This shows a "Total PE" of 357627, which according to my maths, comes 
out to 1,464,840,102 Blocks, or 2,929,680,384 Sectors, on the device.  
This is larger that the actual disk.

How can I correct the PV allocations, so that they reflect the actual 
device, not the "incorrect" sizes, that were present when PVCREATE was 
originally run.

Cheers,
Eddie
