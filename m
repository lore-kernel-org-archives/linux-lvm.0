Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0F0TPLw008914
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 19:29:25 -0500
Received: from yx-out-2324.google.com (yx-out-2324.google.com [74.125.44.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0F0TAnr001474
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 19:29:10 -0500
Received: by yx-out-2324.google.com with SMTP id 31so329206yxl.81
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 16:29:09 -0800 (PST)
Message-ID: <496E8353.50207@gmail.com>
Date: Wed, 14 Jan 2009 17:29:07 -0700
From: Colin Faber <cfaber@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Major problems after soft raid 5 failure
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
To: linux-lvm@redhat.com, cfaber@gmail.com

Hi Folks,

I'm writing you in the hopes that someone can give me some advise on 
some big problems I'm having with a 1.8TB LV. If this is the wrong place 
for this kind of question and you happen to know the right place to ask, 
please direct me there.

First let me explain what has happened and my setup.

I have (had) 2 software raid 5 arrays generated with mdadm on a 2.6.22 
based system. Each array contained 3 disks - though the sets were of 
different sizes.

md0 (RAID 5):
 /dev/sde1 (1TB)
 /dev/sdf1 (1TB)
 /dev/sdg1 (1TB)

md1 (RAID 5):
 /dev/sda1 (750GB)
 /dev/sdb1 (750GB)
 /dev/sdc1 (750GB)

Initially I started out with a simple LVM called 'array' in the volume 
group 'raid' sitting on md0. Over time this disk was populated to 90% 
capacity.

So following the steps outlined on various how-to's through out the 
internet I managed to extend the volume group 'raid' and then extend the 
logical volume 'array' with the additional space. I then used resize2fs 
to resize the file system (while it was offline of course).

I then remounted the file system successfully and it had grown to 
roughly 3.1TB of usable space (great). After remounting I did a few 
simple test writes to it and copied a few ISO images over to make sure 
everything was working.

Well to my great luck I awoke this morning to find that md1 had 
degraded. Last night the second disk in the set (/dev/sdb1) threw a few 
sector errors (nothing critical - or so I thought). Examining 
/proc/mdstat indicated that the entire md1 array had failed. Both 
/dev/sdb1 and /dev/sdc1 were marked as failed and offline. This had me 
worried but I wasn't too concerned as i had not yet written any critical 
data to LVM (at least nothing I couldn't recover). So after messing 
around with md1 for nearly 2 hours trying to figure out why both disks 
fell out of the array (I have yet to determine why it booted /dev/sdc1 
out - as there were no errors found on it, reported, etc). I decided 
that I would try and reboot to see if some thread was hung, something 
unexplained could be corrected by a restart. At this point things went 
from problematic to down right horrible.

As soon as the system came back online md1 was still no where to be 
found, md0 was there and still in tact. However because md1 was missing 
from the volume group, the volume group could not start and thus the 
logical volume was unavailable. After searching around I kept coming 
back to suggestions stating that removal of the missing device from the 
volume group was the solution to getting thing back online again. So 
using 'vgreduce --removemissing raid' then 'lvchange -ay raid' to update 
the changes - Neither command errored and vgreduce noted that 'raid' was 
not available again.

So as it stands now I have no logical volume, I have a volume group and 
I have a functional md0 array. If I dump the first 50 or so megs of the 
md0 raid array I can see the volume group information, as well as the lv 
information including various bits of file system information.

At this point I'm wondering can I recover the logical volume and recover 
this 1.8TB of data.

For completeness here is the results of various display and scan commands:

root@Aria:/dev/disk/by-id# pvscan
  PV /dev/md0   VG raid   lvm2 [1.82 TB / 1.82 TB free]
  Total: 1 [1.82 TB] / in use: 1 [1.82 TB] / in no VG: 0 [0   ]

root@Aria:/dev/disk/by-id# pvdisplay
  --- Physical volume ---
  PV Name               /dev/md0
  VG Name               raid
  PV Size               1.82 TB / not usable 2.25 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              476933
  Free PE               476933
  Allocated PE          0
  PV UUID               oI1oXp-NOSk-BJn0-ncEN-HaZr-NwSn-P9De9b

root@Aria:/dev/disk/by-id# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "raid" using metadata type lvm2

root@Aria:/dev/disk/by-id# vgdisplay
  --- Volume group ---
  VG Name               raid
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  11
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               1.82 TB
  PE Size               4.00 MB
  Total PE              476933
  Alloc PE / Size       0 / 0
  Free  PE / Size       476933 / 1.82 TB
  VG UUID               quRohP-EcsI-iheW-lbU5-rBjO-TnqS-JbjmZA

root@Aria:/dev/disk/by-id# lvscan
root@Aria:/dev/disk/by-id#

root@Aria:/dev/disk/by-id# lvdisplay
root@Aria:/dev/disk/by-id#


Thank you.

-cf
