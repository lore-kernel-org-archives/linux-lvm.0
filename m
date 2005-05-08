Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j48IoNO13190
	for <linux-lvm@redhat.com>; Sun, 8 May 2005 14:50:23 -0400
Received: from opensolutions.ws (bookz.modestus.org [72.21.44.74] (may be
	forged))
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j48IoHro017428
	for <linux-lvm@redhat.com>; Sun, 8 May 2005 14:50:17 -0400
Received: from 000c41bd6f7a.click-network.com ([131.191.22.146]
	helo=[192.168.1.108])
	by opensolutions.ws with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.50)
	id 1DUqrL-000HzT-QX
	for linux-lvm@redhat.com; Sun, 08 May 2005 11:50:36 -0700
Message-ID: <427E5FC2.6070900@opensolutions.ws>
Date: Sun, 08 May 2005 11:51:46 -0700
From: Alex Matviychuk <alex@opensolutions.ws>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM metadata recovery
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

I've been searching the net and this mailing list for quite some time 
for a way to recover metadata without having access to any backups. I 
completely screwed up and forgot to backup or export my lvm settings 
when I reinstalled my operating system. Now I can see my volume group, 
but when I try to activate it I get:

  Volume group vg00 metadata is inconsistent
  Volume group for uuid not found: 
fhRVK5ZTwTOdTQpgF8oyAESEj8LYNRJy1P1jjdkNCV1WhYwfv9rxpnExXvNu13T6
  0 logical volume(s) in volume group "vg00" now active

If I run pvscan I get:
  PV /dev/hda3   VG vg00   lvm2 [128.54 GB / 0    free]
  PV /dev/hdd1   VG vg00   lvm2 [74.52 GB / 0    free]
  PV /dev/hdb1   VG vg00   lvm2 [186.30 GB / 29.36 GB free]
  Total: 3 [389.36 GB] / in use: 3 [389.36 GB] / in no VG: 0 [0   ]

and vgscan returns:
  Reading all physical volumes.  This may take a while...
  Found volume group "vg00" using metadata type lvm2

What are my options if any?

Thanks for your time,
Alex Matviychuk

p.s. Here is some more debug output:

vgdisplay:
  --- Volume group ---
  VG Name               vg00
  System ID            
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  13
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                1
  Open LV               0
  Max PV                255
  Cur PV                3
  Act PV                3
  VG Size               389.36 GB
  PE Size               4.00 MB
  Total PE              99676
  Alloc PE / Size       92160 / 360.00 GB
  Free  PE / Size       7516 / 29.36 GB
  VG UUID               fhRVK5-ZTwT-OdTQ-pgF8-oyAE-SEj8-LYNRJy

lvdisaply: 
--- Logical volume ---
  LV Name                /dev/vg00/home
  VG Name                vg00
  LV UUID                1P1jjd-kNCV-1WhY-wfv9-rxpn-ExXv-Nu13T6
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                360.00 GB
  Current LE             92160
  Segments               3
  Allocation             contiguous
  Read ahead sectors     0


pvdisplay:
  --- Physical volume ---
  PV Name               /dev/hda3
  VG Name               vg00
  PV Size               128.54 GB / not usable 0  
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              32905
  Free PE               0
  Allocated PE          32905
  PV UUID               Ivsdja-iGRK-RJhK-CODr-XaEB-tlag-tEcVOv

  --- Physical volume ---
  PV Name               /dev/hdd1
  VG Name               vg00
  PV Size               74.52 GB / not usable 0  
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              19077
  Free PE               0
  Allocated PE          19077
  PV UUID               SY7qDO-YtlS-mZBw-5Pi2-53nF-vXOu-9mZI7t
  
  --- Physical volume ---
  PV Name               /dev/hdb1
  VG Name               vg00
  PV Size               186.30 GB / not usable 0  
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              47694
  Free PE               7516
  Allocated PE          40178
  PV UUID               5GBueV-Rmxu-thR6-jaoU-00Yg-49gs-A0slTr
