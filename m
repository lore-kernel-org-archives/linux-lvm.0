Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6EB0iFW002716
	for <linux-lvm@redhat.com>; Fri, 14 Jul 2006 07:00:44 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6EB0UoG004303
	for <linux-lvm@redhat.com>; Fri, 14 Jul 2006 07:00:36 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id EC1491F423E
	for <linux-lvm@redhat.com>; Fri, 14 Jul 2006 13:00:23 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27425-06 for <linux-lvm@redhat.com>;
	Fri, 14 Jul 2006 13:00:12 +0200 (CEST)
Message-ID: <44B77938.9020601@conterra.de>
Date: Fri, 14 Jul 2006 13:00:08 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM question on move and resize
References: <20060713182227.8697.qmail@web50714.mail.yahoo.com>
In-Reply-To: <20060713182227.8697.qmail@web50714.mail.yahoo.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

John Koshi wrote:
> I assume the next steps will be (from a rescue CD):
> 
> 1) Use fdisk to format the unused 25 Gb space in the
>    extended partition, to a new type 8E partition.
> 2) Use pvcreate to create a new physical vol there.
> 3) Use vgextend to extend VolGroup00 to include the
>    new physical volume.
> 4) Use lvextend to extend LogVol00 by the XX Gb.
> 5) Do a file system check of LogVol00.
> 
> Does this look right? Am I missing any steps?

after you grow LogVol00 you also have to expand the
ext2/ext2 filesystem inside (step 4a)

resize2fs -p /dev/mapper/VolGroup00-LogVol00

This actually does the real work. resize2fs recommends
to perform an fsck before. If you are in doubt, do it,
else you may skip this using "resize2fs -f -p".

You don't have to supply a size, resize2fs will find
the current size of the extended volume auomatically

Will you perform this while booting from a rescue CD?
If this is your root filesystem you have to, anyway.
Else you possibly have to reboot, after changing the
partition table, because it may be locked by the system
while it is in use.

Tip: you may rename your VG and your LVs to get expressive
names like "/dev/mapper/Sonota-Root". Imo this is less 
error prone than working with technical names like "LogVol42".

> Disk /dev/hda: 80.0 GB, 80026361856 bytes
> 255 heads, 63 sectors/track, 9729 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
>    Device Boot      Start         End      Blocks   Id  System
> /dev/hda1   *           1        5201    41777001    7  HPFS/NTFS
> /dev/hda2            9704        9729      208845   88  Linux plaintext
> /dev/hda3            5202        5214      104422+  83  Linux
> /dev/hda4            5215        9703    36057892+   f  W95 Ext'd (LBA)
> /dev/hda5            8425        9703    10273536   8e  Linux LVM
> Partition table entries are not in disk order

So you end up with an extended partition containing your LVM.
Even if this works, it is an ugly solution. This Win95 extended
partition hack is something like a poor-mans LVM with partition
magic as its management tool.
 
It would be much better, to REPLACE the extended partition by LVM. Unfortunately I don't see any easy migration path without an external
disk. If you have any spare disk, to temporary hold the 8.2Gb root
volume, I may point out an other solution.

Dieter.
