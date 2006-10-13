Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9DCRL9J017638
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 08:27:21 -0400
Received: from mta10.adelphia.net (mta10.adelphia.net [68.168.78.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9DCREqN010964
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 08:27:15 -0400
Received: from mail.waldo.home ([69.175.168.186]) by mta10.adelphia.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20061013122704.WSDC10025.mta10.adelphia.net@mail.waldo.home>
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 08:27:04 -0400
Received: from office.waldo.home (office.waldo.home [10.0.0.153])
	by mail.waldo.home (Postfix) with ESMTP id 5AB70EBC2C
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 08:27:04 -0400 (EDT)
From: Paul Waldo <pwaldo@waldoware.com>
Date: Fri, 13 Oct 2006 08:27:41 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200610130827.42040.pwaldo@waldoware.com>
Subject: [linux-lvm] Unable to add new drive to LV
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

Hi all,

I'm trying to add a shiny new drive (/dev/hdd) to an existing Logical Volume 
to no avail.  The HOWTO says I should be able to do this.  Googling indicates 
that others have had this problem, but tells of no recorded resolution.   I 
was hoping someone could point me to solution.  Info below.  Thanks in 
advance!

Paul

root@backup:~# lvextend --size +149G -t /dev/ide_disks/bacula
  Test mode: Metadata will NOT be updated.
  Incorrect metadata area header checksum
  Using stripesize of last segment 4KB
  Rounding size (147200 extents) down to stripe boundary size for segment 
(147198 extents)
  Extending logical volume bacula to 574.99 GB
  Insufficient allocatable extents suitable for parallel use for logical 
volume bacula: 147198 required
root@backup:~# lvdisplay -vm /dev/ide_disks/bacula
    Using logical volume(s) on command line
  Incorrect metadata area header checksum
  --- Logical volume ---
  LV Name                /dev/ide_disks/bacula
  VG Name                ide_disks
  LV UUID                36N6XE-wDXh-8wZ1-uoVz-MW0h-6uvP-DWUiow
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                426.00 GB
  Current LE             109056
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:2

  --- Segments ---
  Logical extent 0 to 109055:
    Type                striped
    Stripes             3
    Stripe size         4 KB
    Stripe 0:
      Physical volume   /dev/hdb
      Physical extents  1750 to 38101
    Stripe 1:
      Physical volume   /dev/hdc
      Physical extents  1750 to 38101
    Stripe 2:
      Physical volume   /dev/hda2
      Physical extents  1750 to 38101

root@backup:~# vgdisplay ide_disks
  Incorrect metadata area header checksum
  --- Volume group ---
  VG Name               ide_disks
  System ID
  Format                lvm2
  Metadata Areas        4
  Metadata Sequence No  7
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               2
  Max PV                0
  Cur PV                4
  Act PV                4
  VG Size               595.99 GB
  PE Size               4.00 MB
  Total PE              152573
  Alloc PE / Size       114306 / 446.51 GB
  Free  PE / Size       38267 / 149.48 GB
  VG UUID               nbF5of-R5sV-u8mc-IVhK-GnAL-xZyO-7AQzh9

root@backup:~# pvdisplay
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  --- Physical volume ---
  PV Name               /dev/hda2
  VG Name               ide_disks
  PV Size               148.86 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              38109
  Free PE               7
  Allocated PE          38102
  PV UUID               E8EsjG-gvEw-vpMI-nPH5-4TSe-iY1N-kZERc2

  --- Physical volume ---
  PV Name               /dev/hdb
  VG Name               ide_disks
  PV Size               149.05 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              38156
  Free PE               54
  Allocated PE          38102
  PV UUID               910g9r-zVmg-ZMHR-Qe7y-rkyQ-7Jrg-iV6X4I

  --- Physical volume ---
  PV Name               /dev/hdc
  VG Name               ide_disks
  PV Size               149.05 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              38156
  Free PE               54
  Allocated PE          38102
  PV UUID               q4C4sK-bdLY-SfMX-1CnC-r2Yi-MaJU-29GWef

  --- Physical volume ---
  PV Name               /dev/hdd1
  VG Name               ide_disks
  PV Size               149.03 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              38152
  Free PE               38152
  Allocated PE          0
  PV UUID               XxOREs-3k4B-jhky-lhGD-zQx5-xhE3-HPqG0L

  --- NEW Physical volume ---
  PV Name               /dev/hda1
  VG Name
  PV Size               149.05 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               PWBpiN-xxgY-m0Ck-A67u-a78Z-JwCx-Arh4dG

root@backup:~# fdisk -l /dev/hdd

Disk /dev/hdd: 160.0 GB, 160029999616 bytes
255 heads, 63 sectors/track, 19455 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hdd1               1       19455   156272256   8e  Linux LVM
