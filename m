Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4TAiCJd005288
	for <linux-lvm@redhat.com>; Fri, 29 May 2009 06:44:12 -0400
Received: from violent.skystorm.net (lan-84-240-51-34.vln.skynet.lt
	[84.240.51.34])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n4TAhxgU003007
	for <linux-lvm@redhat.com>; Fri, 29 May 2009 06:43:59 -0400
Received: from [127.0.0.1] (helo=violent.skystorm.net ident=www-data)
	by violent.skystorm.net with esmtp (Exim 4.63)
	(envelope-from <lvm@violent.skystorm.net>) id 1M9zZ8-0001Q6-P8
	for linux-lvm@redhat.com; Fri, 29 May 2009 13:43:58 +0300
Message-ID: <46869.212.59.11.18.1243593838.squirrel@violent.skystorm.net>
Date: Fri, 29 May 2009 13:43:58 +0300 (EEST)
From: "Da Ma" <lvm@violent.skystorm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM problem after RAID resync
Reply-To: lvm@violent.skystorm.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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

After problems with linux software raid have been fixed, I am unable to
start using LVM again - no device nodes are created for logical volumes
and virtual groups.

My system is debian etch

Please help - I am attaching vgdisplay and lvdisplay outputs


root:/root# vgdisplay -vv
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Finding all volume groups
      /dev/ram0: No label detected
      /dev/md0: No label detected
      /dev/ram1: No label detected
      /dev/md1: No label detected
      /dev/ram2: No label detected
      /dev/sda2: No label detected
      /dev/md2: lvm2 label detected
  Incorrect metadata area header checksum
      /dev/ram3: No label detected
      /dev/ram4: No label detected
      /dev/ram5: No label detected
      /dev/ram6: No label detected
      /dev/ram7: No label detected
      /dev/ram8: No label detected
      /dev/ram9: No label detected
      /dev/ram10: No label detected
      /dev/ram11: No label detected
      /dev/ram12: No label detected
      /dev/ram13: No label detected
      /dev/ram14: No label detected
      /dev/ram15: No label detected
      /dev/sdb2: No label detected
      /dev/sdc2: No label detected
      Locking /var/lock/lvm/V_vg-array5 RB
    Finding volume group "vg-array5"
      /dev/md2: lvm2 label detected
  Incorrect metadata area header checksum
      /dev/md2: lvm2 label detected
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  WARNING: Volume group "vg-array5" inconsistent
  --- Volume group ---
  VG Name               vg-array5
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  6
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               594.17 GB
  PE Size               4.00 MB
  Total PE              152107
  Alloc PE / Size       152107 / 594.17 GB
  Free  PE / Size       0 / 0
  VG UUID               89aSmX-bREo-1nEu-yW7s-0UAF-adKn-sIOJ1D

  --- Logical volume ---
  LV Name                /dev/vg-array5/lv-array5
  VG Name                vg-array5
  LV UUID                aStagy-newt-4p75-XM25-EOlx-mfS7-mRAKbI
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                594.17 GB
  Current LE             152107
  Segments               1
  Allocation             inherit
  Read ahead sectors     0

  --- Physical volumes ---
  PV Name               /dev/md2
  PV UUID               0QcJ3N-gT87-U00u-DWP1-zBLM-6Rff-PdwxSe
  PV Status             allocatable
  Total PE / Free PE    152107 / 0

      Unlocking /var/lock/lvm/V_vg-array5


root:/root# lvdisplay -vv
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Finding all logical volumes
      /dev/ram0: No label detected
      /dev/md0: No label detected
      /dev/ram1: No label detected
      /dev/md1: No label detected
      /dev/ram2: No label detected
      /dev/sda2: No label detected
      /dev/md2: lvm2 label detected
  Incorrect metadata area header checksum
      /dev/ram3: No label detected
      /dev/ram4: No label detected
      /dev/ram5: No label detected
      /dev/ram6: No label detected
      /dev/ram7: No label detected
      /dev/ram8: No label detected
      /dev/ram9: No label detected
      /dev/ram10: No label detected
      /dev/ram11: No label detected
      /dev/ram12: No label detected
      /dev/ram13: No label detected
      /dev/ram14: No label detected
      /dev/ram15: No label detected
      /dev/sdb2: No label detected
      /dev/sdc2: No label detected
      Locking /var/lock/lvm/V_vg-array5 RB
      /dev/md2: lvm2 label detected
  Incorrect metadata area header checksum
      /dev/md2: lvm2 label detected
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
      Unlocking /var/lock/lvm/V_vg-array5
  Volume group "vg-array5" inconsistent
      Locking /var/lock/lvm/V_vg-array5 WB
      /dev/md2: lvm2 label detected
  Incorrect metadata area header checksum
      /dev/md2: lvm2 label detected
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Inconsistent metadata copies found - updating to use version 6
  Incorrect metadata area header checksum
  Automatic metadata correction failed
      Unlocking /var/lock/lvm/V_vg-array5
  Device '/dev/md2' has been left open.
