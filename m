Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3JAh5O21549
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2005 06:43:05 -0400
Received: from ptb-relay02.plus.net (ptb-relay02.plus.net [212.159.14.213])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3JAgw7n013602
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2005 06:42:59 -0400
Message-Id: <200504191042.j3JAgw7n013602@mx3.redhat.com>
Received: from [212.159.74.68] (helo=Office)
	by ptb-relay02.plus.net with esmtp (Exim) id 1DNqBs-0001lV-BV
	for linux-lvm@redhat.com; Tue, 19 Apr 2005 10:42:48 +0000
From: "Robert Jenkins" <raj@jrw.co.uk>
Date: Tue, 19 Apr 2005 11:42:41 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Help with Resize please?
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

Hi,

I have a 200GB Raid 1 drive (md0)
On this I set up a group vg00 and two volumes, approx 80G (/dev/vg00/rhome)
& 120G (/dev/vg00/raid) 
These can be dismounted as required.

I've about run out of space on the larger volume and have plenty on the
smaller, so I resized the 80GB volume using
e2fsadm -L -20G /dev/vg00/rhome
This appears to have worked fine, the free space on that volume has reduced
by 20gb.


The problem is that I cannot now extend the other volume; both e2fsadm &
lvextend say there is no free space..
lvextend -- no free physical extents in volume group "vg00"

Vgck shows an apparent problem, but I'm not sure how to fix it:

vgck -- VGDA of "vg00" in lvmtab is consistent
vgck -- only found 30720 of 35840 LEs for LV /dev/vg00/raid (0)
vgck -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" reading data of
volume group "vg00" from physical volume(s)
vgck -- please DON'T run vgscan prior to vgcfgrestore

Vgdisplay shows:

VG Name               vg00
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                2
Open LV               2
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               186.30 GB
PE Size               4 MB
Total PE              47694
Alloc PE / Size       47694 / 186.30 GB
Free  PE / Size       0 / 0
VG UUID               xrNX8E-Is0c-Jvub-tGrB-OWUr-DMmw-M2aAXp

According to fdisk, md0 has 195,360,896 blocks.
I've seen a message with one command (I can't remember which) along the
lines of md0 not being associated with vg00 ???
System is EL3 with all updates to date via yum.

Any help greatly appreciated!

Thanks,
Robert Jenkins.
