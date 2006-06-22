Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5MK0a7F023905
	for <linux-lvm@redhat.com>; Thu, 22 Jun 2006 16:00:36 -0400
Received: from einhorn.in-berlin.de (root@einhorn.in-berlin.de [192.109.42.8])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5MK0UEZ009126
	for <linux-lvm@redhat.com>; Thu, 22 Jun 2006 16:00:30 -0400
Received: from jarada.farpoint.de (p54BF6DF1.dip.t-dialin.net [84.191.109.241])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	k5MK0R0Y022584
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 22 Jun 2006 22:00:28 +0200
From: Stefan Lucke <stefan@lucke.in-berlin.de>
Date: Thu, 22 Jun 2006 22:00:26 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606222200.26702.stefan@lucke.in-berlin.de>
Subject: [linux-lvm] lvm1.0.8: vgcfgrestore does not seem to work
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
To: linux-lvm@redhat.com

Hi, I know I'm running an old system, but yesterday I got some troubles.
It started with a simple read I/O error on an lvm disk. There are 2 x 300GB
disks in that VG. Next step was that first 8 sectors were zeroed on the first
disk in that VG. pvscan showed only the 2nd of this VG and disks of other
VGs. Doing a: 
./vgcfgrestore -ll -n vg01 -v -f /etc/lvmconf/vg01.conf  /dev/sde
shows expected values for this VG:
vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "vg01" from "/etc/lvmconf/vg01.conf"
vgcfgrestore -- checking existence of "/etc/lvmconf/vg01.conf"
vgcfgrestore -- reading volume group data for "vg01" from "/etc/lvmconf/vg01.conf"
vgcfgrestore -- reading physical volume data for "vg01" from "/etc/lvmconf/vg01.conf"
vgcfgrestore -- reading logical volume data for "vg01" from "/etc/lvmconf/vg01.conf"
vgcfgrestore -- checking volume group consistency of "vg01"
vgcfgrestore -- checking volume group consistency of "vg01"
--- Volume group ---
VG Name               vg01
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                255
Cur LV                1
Open LV               0
MAX LV Size           1.00 TB
Max PV                255
Cur PV                2
Act PV                2
VG Size               558.78 GB
PE Size               32.00 MB
Total PE              17881
Alloc PE / Size       16356 / 511.12 GB
Free  PE / Size       1525 / 47.66 GB
VG UUID               QOShhy-bTvW-sBL6-z9L8-aEgS-q9rt-Kd8lMw

--- Logical volume ---
LV Name                /dev/vg01/lv02
VG Name                vg01
LV Write Access        read/write
LV Status              NOT available
LV #                   1
# open                 0
LV Size                511.12 GB
Current LE             16356
Allocated LE           16356
Allocation             next free
Read ahead sectors     120
Block device           58:1


--- Physical volume ---
PV Name               /dev/sde
VG Name               vg01
PV Size               279.40 GB / NOT usable 55.67 MB [LVM: 158.00 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       32768
Total PE              8939
Free PE               0
Allocated PE          8939
PV UUID               IheqIs-8lN7-GoSh-YTvX-LJdk-gtib-xSH6uY

--- Physical volume ---
PV Name               /dev/sdb
VG Name               vg01
PV Size               279.48 GB / NOT usable 44.82 MB [LVM: 158.00 KB]
PV#                   2
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       32768
Total PE              8942
Free PE               1525
Allocated PE          7417
PV UUID               ptD8W7-aPU9-G7kU-TLtw-8g71-orH0-KwzYdm



vgcfgrestore -- unlocking logical volume manager

but a subsequent vgscan only finds my other VG

Hopefully I havn't lost the entire video data :-( .
Really need some advice.

-- 
Stefan Lucke
