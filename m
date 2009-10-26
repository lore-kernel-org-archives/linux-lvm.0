Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9Q909Ig002499
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 05:00:09 -0400
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9Q8xw1E011405
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 04:59:59 -0400
From: Nicholas Robinson <npr@bottlehall.co.uk>
Date: Mon, 26 Oct 2009 08:59:58 +0000
Message-Id: <1256547598.22335.32.camel@elm.bottlehall.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Removing a very old physical drive
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

Hi

I've been using lvm for quite a few years, but only occasionally when I
need to add/remove new drives. So, my knowledge is limited and a bit
rusty! I should have removed the old drive when I added a new one a
couple of years ago, but for reasons I cannot remember, I didn't.

I only know how to remove a drive when there is a new drive about to
move the stuff onto. My problem now is that the new drive is fully
allocated and so this route won't work. There is plenty of free space on
the new drive so it should be possible to move everything that might be
on the old physical drive and then remove it from the lvg. I just can't
work out how. The HOWTOs and threads don't seem to cover this starting
point.

My questions are:

1. Can I do move the data off the old drive to the new drive without
adding another new drive?

2. I don't understand the output from pvdisplay - why is it telling me
about /dev/sda1 at the bottom when this partition is a boot partition
and tiny?

3. Where has the LogVol01 come from and what is it doing? Can I remove
it?

4. Can I rename the volgroup/logvols to the same pattern used by new
installations? e.g. vg_hostname and lv_root, etc.

If you've read this far, then thank you! I hope the following extracts
are sufficient.

Best Wishes

Nick

# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdb2
  VG Name               VolGroup00
  PV Size               27.76 GB / not usable 13.73 MB
  Allocatable           yes 
  PE Size (KByte)       32768
  Total PE              888
  Free PE               30
  Allocated PE          858
  PV UUID               V7XQmw-wMkv-fA4H-UUzn-d4CR-sfju-jHYjNZ
   
  --- Physical volume ---
  PV Name               /dev/sda2
  VG Name               VolGroup00
  PV Size               315.00 GB / not usable 31.81 MB
  Allocatable           yes 
  PE Size (KByte)       32768
  Total PE              10079
  Free PE               987
  Allocated PE          9092
  PV UUID               tXBnAO-0D0U-yLvg-XhaA-vEw3-Niz7-p23dAt
   
  "/dev/sda1" is a new physical volume of "298.09 GB"
  --- NEW Physical volume ---
  PV Name               /dev/sda1
  VG Name               
  PV Size               298.09 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               T1XNow-VO83-JVW5-8NBh-1fiF-VzWT-m5mj2P

# fdisk -l /dev/sda

Disk /dev/sda: 320.0 GB, 320072933376 bytes
255 heads, 63 sectors/track, 38913 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x30b7d346

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1           6       48163+  83  Linux
/dev/sda2               7       38913   312520477+  83  Linux

# lvdisplay
  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol00
  VG Name                VolGroup00
  LV UUID                LPxYrN-E62m-L8uh-Ms0O-vZNI-EWM6-GlBD4E
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                310.00 GB
  Current LE             9920
  Segments               3
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0
   
  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol01
  VG Name                VolGroup00
  LV UUID                u3rWh0-NHxf-pn3F-o0Du-Mbnw-LG5V-2l2t3T
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                960.00 MB
  Current LE             30
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:1

# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
                     314908972 145080044 153584540  49% /
/dev/sdb1               198129     13938    173962   8% /boot
tmpfs                   239080         0    239080   0% /dev/shm
