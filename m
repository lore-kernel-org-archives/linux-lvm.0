Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBOCHNr23205
	for <linux-lvm@redhat.com>; Fri, 24 Dec 2004 07:17:23 -0500
Received: from io.sync-intertainment.com (io.sync-intertainment.com
	[66.79.188.10])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBOCHIir002438
	for <linux-lvm@redhat.com>; Fri, 24 Dec 2004 07:17:23 -0500
Received: from 80-26-155-200.adsl.nuria.telefonica-data.net ([80.26.155.200]
	helo=[192.168.1.50])
	by io.sync-intertainment.com with esmtpa (Exim 4.43)
	id 1ChoNg-0000JQ-3k
	for linux-lvm@redhat.com; Fri, 24 Dec 2004 13:17:17 +0100
Message-ID: <41CC0953.8020209@olmo.org>
Date: Fri, 24 Dec 2004 13:19:31 +0100
From: =?ISO-8859-1?Q?Olmo_Gonz=E1lez?= <olmo@olmo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Extending a stripped Logical Volume
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

Hi,

I am new to this list, seeking for some help.

 I have setup LVM2 under debian sarge (2.6.8-k7 kernel).

I originally created a volumen group (nasvg) on 4 x ST3200822A ATA DISK 
drives. I created a stripped logical volume spanning these 4 disks and 
using up al PE's available. I then attached two aditional ST3200822A ATA 
DISK drives and I would now want to resive my logical volumen to use al 
the PE's provided by the two new disks. The problem is I can't extend 
the logical volume, getting the following error:

gollum:~# lvextend -L+1G /dev/nasvg/naslv
  Using stripesize of last segment 64KB
  Extending logical volume naslv to 746.23 GB
  Insufficient allocatable extents suitable for parallel use for logical 
volume naslv: 191036 required

I have been googl'ing and it seems that this has to do with restrictions 
on resizing sttriped LV's. However, the information I have found says 
the restrictions no longer apply to LVM2.

Any help would be appreciated. I'm thinking of creating a linear lv 
spanning al 6 disks but this would mean backing up ~600gb of data which 
could be a pain...

Here is my output for both vgdisplay and lvdisplay.


gollum:~# vgdisplay
  --- Volume group ---
  VG Name               nasvg
  System ID
  Format                lvm2
  Metadata Areas        6
  Metadata Sequence No  25
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                6
  Act PV                6
  VG Size               1.09 TB
  PE Size               4.00 MB
  Total PE              286168
  Alloc PE / Size       190780 / 745.23 GB
  Free  PE / Size       95388 / 372.61 GB
  VG UUID               LWqtTF-F8vA-yjXt-AYwK-yFQr-skDa-s9UVRC

  --- Logical volume ---
  LV Name                /dev/nasvg/naslv
  VG Name                nasvg
  LV UUID                GMm5PD-6Rdk-h8lG-35Fw-rZp3-L42s-N6k9QC
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                745.23 GB
  Current LE             190780
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:0

Thanks, and merry Christmas!
Olmo.
