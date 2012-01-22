Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q0MD9hNf013215
	for <linux-lvm@redhat.com>; Sun, 22 Jan 2012 08:09:43 -0500
Received: from silence.tlabs.ac.za (silence.tlabs.ac.za [196.21.124.19])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0MD9eNd020741
	for <linux-lvm@redhat.com>; Sun, 22 Jan 2012 08:09:41 -0500
Received: from lee.tlabs.ac.za ([196.21.127.123]:50634)
	by silence.tlabs.ac.za with esmtp (Exim 4.73)
	(envelope-from <funnyvoice@tlabs.ac.za>) id 1RoxAk-0003sk-GO
	for linux-lvm@redhat.com; Sun, 22 Jan 2012 15:09:26 +0200
Message-ID: <4F1C0A86.1080605@tlabs.ac.za>
Date: Sun, 22 Jan 2012 15:09:26 +0200
From: lee <funnyvoice@tlabs.ac.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm missing uuid
Reply-To: lcpool@tlabs.ac.za,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi


Im having trouble with a drive. I complains of a missing uuid.

I removed the drive from my server, and inserted a new clean drive for
testing. The removed drive was placed in cover for protection.
It contained the OS ( Scientific Linux 4.9 ). I reinserted the drive
after my tests.

I then got kernel panic, as the uuid of the one partition was missing.
Its import that i can at least recover data from this drive.

In the meantime I have put in place a replacement. So now the most
important part is to obtain the data from it.

#vgs
  Couldn't find device with uuid b6FYR1-4AJo-zYYy-7Rro-4d36-QbEK-G9L8hP.
  VG         #PV #LV #SN Attr   VSize   VFree 
  VolGroup00   2   2   0 wz-pn- 297.97g 224.00m
  myvg         1   1   0 wz--n- 465.56g      0

#vgchange -a y VolGroup00
  Couldn't find device with uuid b6FYR1-4AJo-zYYy-7Rro-4d36-QbEK-G9L8hP.
  Refusing activation of partial LV LogVol00. Use --partial to override.
  1 logical volume(s) in volume group "VolGroup00" now active


#vgscan --partial
  Partial mode. Incomplete logical volumes will be processed.
  Reading all physical volumes.  This may take a while...
  /dev/VolGroup00/LogVol00: read failed after 0 of 4096 at 0:
Input/output error
  /dev/VolGroup00/LogVol00: read failed after 0 of 4096 at 4096:
Input/output error
  Couldn't find device with uuid b6FYR1-4AJo-zYYy-7Rro-4d36-QbEK-G9L8hP.
  Found volume group "VolGroup00" using metadata type lvm2
  Found volume group "myvg" using metadata type lvm2

#lvscan --partial
  Partial mode. Incomplete logical volumes will be processed.
  /dev/VolGroup00/LogVol00: read failed after 0 of 4096 at 0:
Input/output error
  /dev/VolGroup00/LogVol00: read failed after 0 of 4096 at 4096:
Input/output error
  Couldn't find device with uuid b6FYR1-4AJo-zYYy-7Rro-4d36-QbEK-G9L8hP.
  ACTIVE            '/dev/VolGroup00/LogVol00' [295.81 GiB] inherit
  ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GiB] inherit
  ACTIVE            '/dev/myvg/rootvol' [465.56 GiB] inherit

#sfdisk -l /dev/sdc


sfdisk -l /dev/sdc

Disk /dev/sdc: 19457 cylinders, 255 heads, 63 sectors/track
Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0

   Device Boot Start     End   #cyls    #blocks   Id  System
/dev/sdc1   *      0+     12      13-    104391   83  Linux
/dev/sdc2         13   19456   19444  156183930   8e  Linux LVM
/dev/sdc3          0       -       0          0    0  Empty
/dev/sdc4          0       -       0          0    0  Empty


I tried to use pvcreate --restorefile etc, but did not use -ff.

#Reference:
http://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/mdatarecover.html

Anymore information I can provide...???

Regards
Lee
