Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3UEd2KP005315
	for <linux-lvm@redhat.com>; Mon, 30 Apr 2007 10:39:02 -0400
Received: from mail02.broadsign.com (mail02.broadsign.net [216.187.127.7])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3UEd0oN008296
	for <linux-lvm@redhat.com>; Mon, 30 Apr 2007 10:39:00 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail02.broadsign.com (Postfix) with ESMTP id BE41E9C8025
	for <linux-lvm@redhat.com>; Mon, 30 Apr 2007 10:38:55 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail02.broadsign.com (Postfix) with ESMTP id 97DA09C8028
	for <linux-lvm@redhat.com>; Mon, 30 Apr 2007 10:38:55 -0400 (EDT)
Received: from mail02.broadsign.com ([127.0.0.1])
	by localhost (mail02.broadsign.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 21953-05 for <linux-lvm@redhat.com>;
	Mon, 30 Apr 2007 10:38:55 -0400 (EDT)
Received: from vlad.local (unknown [192.168.35.5])
	by mail02.broadsign.com (Postfix) with ESMTP id 631C29C8025
	for <linux-lvm@redhat.com>; Mon, 30 Apr 2007 10:38:55 -0400 (EDT)
From: Vladislav Tchernev <vladislav.tchernev@broadsign.com>
Date: Mon, 30 Apr 2007 10:38:37 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200704301038.37362.vladislav.tchernev@broadsign.com>
Subject: [linux-lvm] Volume and snapshot unusable after a kernel panic
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

Hello all,
Recently my mailserver running Ubuntu 6.0.6 went on kernel panic and I had to 
cold reset it. After the system booted I discovered that I can't use one of 
my lvm volumes and the associated snapshot. All metadata regarding the lvm 
groups, physical and logical volumes were still available and a I was able to 
start using the problematic volume with evms but still  would like to know 
what the problem with the lvm is and how it could  be fixed.   After a little 
bit of digging I found that the volume devise  was  listed in the /dev/mapper 
dir but the sym link to it in the/dev/Vg00 was missing. Also using 'dmsetup 
info' a saw that the volume state was active but there was no mapping table 
for it and the open count was 0 .. here is the exact output from  dmsetup:

Name:              Vg00-kolab
State:             ACTIVE
Tables present:    None
Open count:        0
Event number:      0
Major, minor:      253, 2
Number of targets: 0
UUID: LVM-1RpKM9Gv2KWwLcMd2AqSEdK6QaCJf51TZ7f1fA8D3Pq9EgkBPKI3BcHtEOCQwris


Here is also the output from vgdisplay -vv:

      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Finding all volume groups
      /dev/ram0: No label detected
      /dev/Vg00/mailman: No label detected
      /dev/ram1: No label detected
      /dev/sda1: No label detected
      /dev/mapper/Vg00-kolab-real: No label detected
      /dev/ram2: No label detected
      /dev/sda2: No label detected
      /dev/ram3: No label detected
      /dev/sda3: No label detected
      /dev/ram4: No label detected
      /dev/ram5: No label detected
      /dev/sda5: No label detected
      /dev/evms/lvm2/Vg00/kolab: No label detected
      /dev/ram6: No label detected
      /dev/sda6: No label detected
      /dev/evms/lvm2/Vg00/ksnapshot: No label detected
      /dev/ram7: No label detected
      /dev/sda7: No label detected
      /dev/evms/lvm2/Vg00/mailman: No label detected
      /dev/ram8: No label detected
      /dev/sda8: No label detected
      /dev/evms/sda2: No label detected
      /dev/ram9: No label detected
      /dev/sda9: lvm2 label detected
      /dev/evms/sda3: No label detected
      /dev/ram10: No label detected
      /dev/evms/sda5: No label detected
      /dev/ram11: No label detected
      /dev/evms/sda6: No label detected
      /dev/ram12: No label detected
      /dev/evms/sda7: No label detected
      /dev/ram13: No label detected
      /dev/evms/sda8: No label detected
      /dev/ram14: No label detected
      /dev/ram15: No label detected
      /dev/sdb1: lvm2 label detected
      Locking /var/lock/lvm/V_Vg00 RB
    Finding volume group "Vg00"
      /dev/sda9: lvm2 label detected
      /dev/sdb1: lvm2 label detected
      /dev/sda9: lvm2 label detected
      /dev/sdb1: lvm2 label detected
      /dev/sda9: lvm2 label detected
      /dev/sdb1: lvm2 label detected
  --- Volume group ---
  VG Name               Vg00
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  25
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               1
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               246.68 GB
  PE Size               4.00 MB
  Total PE              63150
  Alloc PE / Size       56308 / 219.95 GB
  Free  PE / Size       6842 / 26.73 GB
  VG UUID               1RpKM9-Gv2K-WwLc-Md2A-qSEd-K6Qa-CJf51T

  --- Logical volume ---
  LV Name                /dev/Vg00/mailman
  VG Name                Vg00
  LV UUID                M9bt9V-lRpc-xEpy-Sspt-9L1i-IzAz-a3dSoO
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                10.00 GB
  Current LE             2560
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

  --- Logical volume ---
  LV Name                /dev/Vg00/kolab
  VG Name                Vg00
  LV UUID                Z7f1fA-8D3P-q9Eg-kBPK-I3Bc-HtEO-CQwris
  LV Write Access        read/write
  LV snapshot status     source of
      Setting activation/missing_stripe_filler to /dev/ioerror
                         /dev/Vg00/ksnapshot [INACTIVE]
  LV Status              available
  # open                 0
  LV Size                199.95 GB
  Current LE             51188
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:2

  --- Logical volume ---
  LV Name                /dev/Vg00/ksnapshot
  VG Name                Vg00
  LV UUID                FtmEXv-w1PG-korm-Aa9O-NTwq-YeF0-AQrizF
  LV Write Access        read/write
  LV snapshot status     INACTIVE destination for /dev/Vg00/kolab
  LV Status              NOT available
  LV Size                199.95 GB
  Current LE             51188
  COW-table size         10.00 GB
  COW-table LE           2560
  Snapshot chunk size    8.00 KB
  Segments               1
  Allocation             inherit
  Read ahead sectors     0

  --- Physical volumes ---
  PV Name               /dev/sda9
  PV UUID               GVvFM2-Lmf0-pRwA-brcg-yOcu-c8km-TaNVx1
  PV Status             allocatable
  Total PE / Free PE    28148 / 0

  PV Name               /dev/sdb1
  PV UUID               FxeV1H-thz8-LEaT-9iID-M3oj-oYbs-FWVWNA
  PV Status             allocatable
  Total PE / Free PE    35002 / 6842

      Unlocking /var/lock/lvm/V_Vg00


Any help will be greatly appreciated

Cheers 
Vlad
