Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6R5JUa20359
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 01:19:30 -0400
Received: from webmail.datafx.com.au (mail03.datafx.com.au [203.149.65.13]
	(may be forged))
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6R5JLXn014906
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 01:19:22 -0400
MIME-Version: 1.0
Content-class: urn:content-classes:message
Date: Tue, 27 Jul 2004 15:21:50 +1000
Message-ID: <7B5E506659A5D344A505F0F27972D87549CE0F@datafx-sbs.DataFX.local>
From: "Michael Bellears" <MBellears@staff.datafx.com.au>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Change PV size?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

We have a Hardware Raid 5, with one partition being LVM.

c0d0p1         Boot            Primary      Linux ReiserFS
98.71
c0d0p5                         Logical      Linux ReiserFS
10001.95
c0d0p6                         Logical      Linux LVM
429302.04

dfx-nas-01:~# pvdisplay /dev/cciss/c0d0p6
--- Physical volume ---
PV Name               /dev/cciss/c0d0p6
VG Name               nasvg
PV Size               399.82 GB [838480482 secs] / NOT usable 32.19 MB
[LVM: 177 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                6
PE Size (KByte)       32768
Total PE              12793
Free PE               2649
Allocated PE          10144
PV UUID               AY5IUI-0wto-lQpS-AoKb-SpQZ-ku3p-51nvIY

We will be adding additional physical disks to the Raid array as need
dictates - How would I go about making this new free space "available"
for use in the PV?

- Turn off server, add new HD's, boot into HP Top Tools and add the new
drives to the array (Giving additional space).
- cfdisk(or fdisk), delete the data partition(Making note of the
starting cylinder), then recreate the data partition with the same
starting cylinder, but incorporate the new free space.
- pvresize? (I do not seem to have this utility?)
- xfs_growfs

Thanks in advance.

Regards,
MB  
