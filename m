Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0MCRR128939
	for <linux-lvm@redhat.com>; Sun, 22 Jan 2006 07:27:27 -0500
Received: from crusaders.powertech.no (www2.gathering.org [195.159.31.10])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id k0MCRPvq013722
	for <linux-lvm@redhat.com>; Sun, 22 Jan 2006 07:27:26 -0500
Date: Sun, 22 Jan 2006 13:27:06 +0100
From: Per Kristiansen <per@gathering.org>
Message-ID: <20060122122706.GA24243@gathering.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] System slow down , weird partition info
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm running LVM 2 on Fedora Core 3 on an Intel P4 w 1GB ram.
I have 2 A16U-G2421 (http://www.infortrend.com/main/2_product/a16u-g2421-1.asp) hooked up to it.

2 LVM's made, both seems to be working, but very slowly.

Today I noticed that the server was VERY slow. After checking around I find that the exported disks on one of the 
raid boxes has weird partition info.

I have exported 3 disks from this box.

I'm going insane trying to resolve this without loosing this weekends jobs.

I'm a bit leery about just changing things in the partition befor I can get a dump of the file system thou :)

anyone got any tips?

--- Volume group ---
  VG Name               main_vg
  System ID             
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                1
      Setting activation/missing_stripe_filler to /dev/ioerror
  Open LV               1
  Max PV                255
  Cur PV                3
  Act PV                3
  VG Size               3.18 TB
  PE Size               128.00 MB
  Total PE              26053
  Alloc PE / Size       26051 / 3.18 TB
  Free  PE / Size       2 / 256.00 MB
  VG UUID               dlnHW9-oyLJ-iys5-d7Q5-dotC-TL58-9j3ZQH
   
  --- Logical volume ---
  LV Name                /dev/main_vg/lv_work
  VG Name                main_vg
  LV UUID                r7JgCs-t2KY-3s8f-2ntP-Um1P-b411-opy2hG
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                3.18 TB
  Current LE             26051
  Segments               3
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0
   
  --- Physical volumes ---
  PV Name               /dev/sdi     
  PV UUID               S4bjCg-bJDO-y8bC-y5Es-zvn1-lboB-p6tIAI
  PV Status             allocatable
  Total PE / Free PE    11718 / 0
   
  PV Name               /dev/sdj     
  PV UUID               x2FoJO-Jg0l-OMLS-8XSW-4F0g-r6tF-IXJ1jr
  PV Status             allocatable
  Total PE / Free PE    11718 / 0
   
  PV Name               /dev/sdk     
  PV UUID               VVLXFm-UhPt-SFct-3i74-bB2B-7Li5-C3SOgm
  PV Status             allocatable
  Total PE / Free PE    2617 / 2

and doing an fdisk on the 3 devices shows this:

sdi:

Disk /dev/sdi: 1572.8 GB, 1572864000000 bytes
255 heads, 63 sectors/track, 191223 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdi1   *           1      203971  1638397026    6  FAT16


sdj:

Warning: invalid flag 0x0000 of partition table 4 will be corrected by w(rite)

Command (m for help): p

Disk /dev/sdj: 1572.8 GB, 1572864000000 bytes
255 heads, 63 sectors/track, 191223 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System

sdk:
Warning: invalid flag 0x0000 of partition table 4 will be corrected by w(rite)

Command (m for help): p

Disk /dev/sdk: 351.2 GB, 351268765696 bytes
255 heads, 63 sectors/track, 42705 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System






-- 
Per Kristiansen
per@gathering.org
