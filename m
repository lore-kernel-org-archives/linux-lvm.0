Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5FGjeu31330
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2005 12:45:40 -0400
Received: from osl1smout1.broadpark.no (osl1smout1.broadpark.no [80.202.4.58])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5FGjYG2022381
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2005 12:45:35 -0400
Received: from osl1sminn1.broadpark.no ([80.202.4.59])
	by osl1smout1.broadpark.no
	(Sun Java System Messaging Server 6.1 HotFix 0.05 (built Oct 21 2004))
	with ESMTP id <0II400MH0X85TR20@osl1smout1.broadpark.no> for
	linux-lvm@redhat.com; Wed, 15 Jun 2005 18:45:41 +0200 (CEST)
Received: from [10.0.0.7] ([80.203.83.189]) by osl1sminn1.broadpark.no
	(Sun Java System Messaging Server 6.1 HotFix 0.05 (built Oct 21 2004))
	with ESMTP id <0II400ALZXDQYV01@osl1sminn1.broadpark.no> for
	linux-lvm@redhat.com; Wed, 15 Jun 2005 18:49:03 +0200 (CEST)
Date: Wed, 15 Jun 2005 18:45:25 +0200
From: =?windows-1252?Q?Bj=F8rn?= <bjjorgen@broadpark.no>
Message-id: <42B05B25.3030406@broadpark.no>
MIME-version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Problems with LVM after updating from FC 3 to FC4.
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hi, I have one LVM volume of 3 hard disks. The box did have Fedora Core 
3, I did upgrade it to Fedora Core 4.
Now I can�t mount my LVM.
I�m new to LVM, but here is what I have tried to do.

# /usr/sbin/lvmdiskscan -v

Wiping cache of LVM-capable devices

/dev/hda1 [ 101.94 MB]

/dev/hda2 [ 4.77 GB]

/dev/hda3 [ 1.17 GB]

/dev/hdd [ 57.27 GB] LVM physical volume

/dev/hdb1 [ 57.25 GB] LVM physical volume

0 disks

3 partitions

1 LVM physical volume whole disk

1 LVM physical volume

#/usr/sbin/vgchange -ay

Couldn't find device with uuid 'b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu'.

Couldn't find all physical volumes for volume group vg.

Couldn't find device with uuid 'b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu'.

Couldn't find all physical volumes for volume group vg.

Couldn't find device with uuid 'b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu'.

Couldn't find all physical volumes for volume group vg.

Couldn't find device with uuid 'b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu'.

Couldn't find all physical volumes for volume group vg.

Unable to find volume group "vg"

#/usr/sbin/vgscan -P

Partial mode. Incomplete volume groups will be activated read-only.

Reading all physical volumes. This may take a while...

Couldn't find device with uuid 'b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu'.

Couldn't find device with uuid 'b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu'.

Found volume group "vg" using metadata type lvm2


#/usr/sbin/vgchange -ay -P

Partial mode. Incomplete volume groups will be activated read-only.

Couldn't find device with uuid 'b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu'.

Couldn't find device with uuid 'b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu'.

Couldn't find device with uuid 'b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu'.

Couldn't find device with uuid 'b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu'.

1 logical volume(s) in volume group "vg" now active


#/usr/sbin/pvdisplay

Couldn't find device with uuid 'b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu'.

Couldn't find device with uuid 'b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu'.

--- Physical volume ---

PV Name unknown device

VG Name vg

PV Size 186.31 GB / not usable 0

Allocatable yes (but full)

PE Size (KByte) 4096

Total PE 47695

Free PE 0

Allocated PE 47695

PV UUID b0cIJv-QXRU-H7AC-TOjN-6S25-CCqc-dQMATu

--- Physical volume ---

PV Name /dev/hdd

VG Name vg

PV Size 57.27 GB / not usable 0

Allocatable yes (but full)

PE Size (KByte) 4096

Total PE 14660

Free PE 0

Allocated PE 14660

PV UUID Gf1g9B-STFy-N4CG-z52b-S8fd-tKUE-7ShFeq

--- Physical volume ---

PV Name /dev/hdb1

VG Name vg

PV Size 57.25 GB / not usable 0

Allocatable yes (but full)

PE Size (KByte) 4096

Total PE 14656

Free PE 0

Allocated PE 14656

PV UUID Y5uNb3-WpX9-4frk-D0Q2-XaJ4-RDyK-EU5KoA



# mount -t reiserfs /dev/vg/vg /var/58m/

mount: special device /dev/vg/vg does not exist

#ls /dev/vg

ls: /dev/vg: No such file or directory

# /sbin/fdisk -l /dev/hdc

Warning: ignoring extra data in partition table 5

Warning: ignoring extra data in partition table 5

Warning: ignoring extra data in partition table 5

Warning: invalid flag 0x01e1 of partition table 5 will be corrected by 
w(rite)

Disk /dev/hdc: 200.0 GB, 200049647616 bytes

16 heads, 63 sectors/track, 387621 cylinders

Units = cylinders of 1008 * 512 = 516096 bytes

Device Boot Start End Blocks Id System

/dev/hdc1 2 387621 195360480 f W95 Ext'd (LBA)

/dev/hdc5 ? 128214 256491 64651632+ e1 DOS access

Well, I don�t know what to do now? Have I lost all my data on the LVM 
or? Or what is it with /dev/hdc ?


I have found one that might have the same problem.

http://www.lugod.org/mailinglists/archives/vox-tech/2005-03/msg00301.html

Bj�rn J�rgensen.
