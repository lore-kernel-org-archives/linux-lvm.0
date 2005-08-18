Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7IA8iV22793
	for <linux-lvm@redhat.com>; Thu, 18 Aug 2005 06:08:44 -0400
Received: from smtp-ft5.fr.colt.net (smtp-ft5.fr.colt.net [213.41.78.199])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7IA8TZ0014568
	for <linux-lvm@redhat.com>; Thu, 18 Aug 2005 06:08:33 -0400
Received: from [10.33.254.56] (noc-bes.adm.fr.colt.net [195.68.1.120])
	by smtp-ft5.fr.colt.net (8.13.4/8.13.4/Debian-3) with ESMTP id
	j7IA8I8l031071
	for <linux-lvm@redhat.com>; Thu, 18 Aug 2005 12:08:18 +0200
Message-ID: <43045DFF.1050105@chwing.com>
Date: Thu, 18 Aug 2005 12:07:59 +0200
From: Antoine <lists@chwing.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vg works fine under FC3, but not FC4
References: <20050816190423.GN29587@agk.surrey.redhat.com>	<20050816194027.34305.qmail@web52201.mail.yahoo.com>
	<20050816194210.GO29587@agk.surrey.redhat.com>
In-Reply-To: <20050816194210.GO29587@agk.surrey.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

from my experience, this doesn't help, it seems that pvscan, vgscan 
doesn't recognize whole device as lvm capable device and then remove it 
from .cache (so your vg seems to disappear but if you manually put your 
device in .cache, it fixes everything)


see output for exemple :
pitch:/etc/lvm# pvs
  PV         VG   Fmt  Attr PSize   PFree
  /dev/hdc   vg0  lvm2 a-    19.11G 19.11G
  /dev/hdd   vg0  lvm2 a-   149.05G  4.05G
pitch:/etc/lvm#
pitch:/etc/lvm#
pitch:/etc/lvm# pvscan
  Couldn't find device with uuid 'iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs'.
  PV unknown device   VG vg0   lvm2 [149.05 GB / 4.05 GB free]
  PV /dev/hdc         VG vg0   lvm2 [19.11 GB / 19.11 GB free]
  Total: 2 [168.16 GB] / in use: 2 [168.16 GB] / in no VG: 0 [0   ]
pitch:/etc/lvm# pvs
  Couldn't find device with uuid 'iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs'.
  Couldn't find device with uuid 'iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs'.
  Couldn't find all physical volumes for volume group vg0.
  Can't read vg0: skipping
  Couldn't find device with uuid 'iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs'.
  Couldn't find all physical volumes for volume group vg0.
  Can't read vg0: skipping

note that it doesn't happen on both disks, but they were set up identically.

see also this output, pvdisplay on the faulty device seems to fix it :
pitch:/etc/lvm# vgdisplay
  Couldn't find device with uuid 'iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs'.
  Couldn't find all physical volumes for volume group vg0.
  Volume group "vg0" doesn't exist
pitch:/etc/lvm# pvdisplay
  Couldn't find device with uuid 'iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs'.
  --- Physical volume ---
  PV Name               unknown device
  VG Name               vg0
  PV Size               149.05 GB / not usable 0  
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              38156
  Free PE               1036
  Allocated PE          37120
  PV UUID               iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs
  
  --- Physical volume ---
  PV Name               /dev/hdc
  VG Name               vg0
  PV Size               19.11 GB / not usable 0  
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              4892
  Free PE               4892
  Allocated PE          0
  PV UUID               vzCHIG-WqYt-w2Kv-qGog-vK74-GEBu-svsWBm
  
pitch:/etc/lvm# pvdisplay /dev/hdd
  --- Physical volume ---
  PV Name               /dev/hdd
  VG Name               vg0
  PV Size               149.05 GB / not usable 0  
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              38156
  Free PE               1036
  Allocated PE          37120
  PV UUID               iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs
  

pitch:/etc/lvm#
pitch:/etc/lvm# pvdisplay
  --- Physical volume ---
  PV Name               /dev/hdd
  VG Name               vg0
  PV Size               149.05 GB / not usable 0  
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              38156
  Free PE               1036
  Allocated PE          37120
  PV UUID               iZzizb-LmBD-0wx1-QD3g-76aO-1zJI-d61tNs
  
  --- Physical volume ---
  PV Name               /dev/hdc
  VG Name               vg0
  PV Size               19.11 GB / not usable 0  
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              4892
  Free PE               4892
  Allocated PE          0
  PV UUID               vzCHIG-WqYt-w2Kv-qGog-vK74-GEBu-svsWBm
  
pitch:/etc/lvm# vgs
  VG   #PV #LV #SN Attr  VSize   VFree
  vg0    2   1   0 wz--n 168.16G 23.16G

so for me at least, the best practice for now is to set a partition on 
the whole disk (hdd1) set its type '8e' and use it instead of the whole 
device. I didnt have any problem working like this.

fyi: debian sarge with :
pitch:~# vgscan --version
  LVM version:     2.01.04 (2005-02-09)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.1.1

Alasdair G Kergon wrote:

>No - I'm suggesting you need to check if any *whole device* PVs like hdd 
>actually have partition tables on them, and if so, remove them.
>
>Alasdair
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>  
>
