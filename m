Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4PIsGO23765
	for <linux-lvm@redhat.com>; Wed, 25 May 2005 14:54:16 -0400
Received: from ctg-msnexc01.staff.berbee.com (msn-office-flr2.binc.net
	[64.73.12.254])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4PIsF6E031696
	for <linux-lvm@redhat.com>; Wed, 25 May 2005 14:54:15 -0400
Message-ID: <4294C9CD.8080107@berbee.com>
Date: Wed, 25 May 2005 13:54:05 -0500
From: Alan Jurgensen <jurgensen@berbee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] PV unknown after vgexport
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

I intended to move a 4 disk VG to another box... So I did a vgexport.
It complained about cant find uuid such and such...
Put the disks back in original box, and have same problem!
Suggestions on howto get this lvm2 VG back on-line?!

root@arch: pvscan
  Couldn't find device with uuid 'eEnVHA-L0Ac-hjLq-boW4-KNjT-QS5K-ZNX1nY'.
  Couldn't find device with uuid 'F9eOFx-rSYZ-0qfk-D5r0-xxv2-eB60-GlFGx5'.
  PV /dev/sda3        VG vg0   lvm2 [11.16 GB / 0    free]
  PV unknown device   VG vg0   lvm2 [16.95 GB / 0    free]
  PV /dev/sdc1        VG vg0   lvm2 [16.95 GB / 0    free]
  PV unknown device   VG vg0   lvm2 [33.89 GB / 968.00 MB free]
  PV /dev/sdd1                 lvm2 [16.95 GB]
  PV /dev/sde1                 lvm2 [16.95 GB]
  Total: 6 [112.84 GB] / in use: 4 [78.95 GB] / in no VG: 2 [33.90 GB]
root@arch: pvdisplay
  Couldn't find device with uuid 'eEnVHA-L0Ac-hjLq-boW4-KNjT-QS5K-ZNX1nY'.
  Couldn't find device with uuid 'F9eOFx-rSYZ-0qfk-D5r0-xxv2-eB60-GlFGx5'.
  --- Physical volume ---
  PV Name               /dev/sda3
  VG Name               vg0
  PV Size               11.16 GB / not usable 0   
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              2857
  Free PE               0
  Allocated PE          2857
  PV UUID               juNpRy-aBAc-1no7-67L2-xj3H-3qga-ZsYOxG
   
  --- Physical volume ---
  PV Name               unknown device
  VG Name               vg0
  PV Size               16.95 GB / not usable 0   
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              4338
  Free PE               0
  Allocated PE          4338
  PV UUID               eEnVHA-L0Ac-hjLq-boW4-KNjT-QS5K-ZNX1nY
   
  --- Physical volume ---
  PV Name               /dev/sdc1
  VG Name               vg0
  PV Size               16.95 GB / not usable 0   
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              4339
  Free PE               0
  Allocated PE          4339
  PV UUID               OOPH4q-Z324-eD9t-10Tr-NevF-vOVL-kynkJ1
   
  --- Physical volume ---
  PV Name               unknown device
  VG Name               vg0
  PV Size               33.89 GB / not usable 0   
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              8676
  Free PE               242
  Allocated PE          8434
  PV UUID               F9eOFx-rSYZ-0qfk-D5r0-xxv2-eB60-GlFGx5
   
  --- NEW Physical volume ---
  PV Name               /dev/sdd1
  VG Name               
  PV Size               16.95 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               ECh4uk-x6FN-f0Ay-QP03-XrT3-U3wH-qEe0bE
   
  --- NEW Physical volume ---
  PV Name               /dev/sde1
  VG Name               
  PV Size               16.95 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               F5DXKv-lIt8-IaC7-qG3w-jpM2-6aOk-4jNSdI
   



-- 

----------------------------------------------------------------------
Alan W. Jurgensen - Berbee Information Networks - jurgensen@berbee.com 
