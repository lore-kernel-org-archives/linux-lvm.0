Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0761Vr07807
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2005 01:01:31 -0500
Received: from ms-smtp-01-eri0.socal.rr.com (ms-smtp-01-qfe0.socal.rr.com
	[66.75.162.133])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0761U6l005271
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2005 01:01:30 -0500
Received: from [10.20.30.9] (cpe-24-94-86-107.hawaii.rr.com [24.94.86.107])
	by ms-smtp-01-eri0.socal.rr.com (8.12.10/8.12.7) with ESMTP id
	j0761OkM015786
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2005 22:01:25 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Message-Id: <853E1A0C-6071-11D9-A1E3-000A95AF6760@hawaii.rr.com>
From: Dean Takemori <deant@hawaii.rr.com>
Date: Thu, 6 Jan 2005 20:01:06 -1000
Subject: [linux-lvm] Resizing a volume group
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

Hello,

I'm running a Fedora Core 1 box using LVM on RAID (lvm-1.0.3-13)  I 
moved
from a pair of RAID1 hard drives to a larger pair of drives by 
strategically
failing and replacing the drives.

This has left me with the following situation : Volume group lv0 (26GB) 
resides
on /dev/md1, which are a pair of 250GB partitions.  But the lvm tools 
only see
/dev/md1 as being 26GB (which is what it was on the old hard drives).  
(Oddly,
vgdisplay does note that the maximum lv size is 250GB).

Is it possible to resize the pv and lv so that they use up the full 
space of
the partition?


~ > pvdisplay /dev/md1
--- Physical volume ---
PV Name               /dev/md1
VG Name               lv0
PV Size               26.44 GB [55453952 secs] / NOT usable 4.19 MB 
[LVM: 154 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                7
PE Size (KByte)       4096
Total PE              6768
Free PE               0
Allocated PE          6768
PV UUID               nrQNYO-Iva3-UP0M-64U5-M2L9-YT7o-tRhTBV

~ > vgdisplay lv0
--- Volume group ---
VG Name               lv0
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                7
Open LV               7
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               26.44 GB
PE Size               4 MB
Total PE              6768
Alloc PE / Size       6768 / 26.44 GB
Free  PE / Size       0 / 0
VG UUID               OLmdue-W62m-fr8z-Eo4N-gS0A-4Tfm-E9wuM4


-dean takemori
