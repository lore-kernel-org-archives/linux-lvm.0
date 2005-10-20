Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9K27mV25463
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 22:07:48 -0400
Received: from qproxy.gmail.com (qproxy.gmail.com [72.14.204.201])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9K27ghW023413
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 22:07:42 -0400
Received: by qproxy.gmail.com with SMTP id c12so265524qbc
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 19:07:42 -0700 (PDT)
Message-ID: <80d985600510191907na711430v24a1fe95264ebd48@mail.gmail.com>
Date: Thu, 20 Oct 2005 11:07:42 +0900
From: Craig Hagerman <craighagerman@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] setting up LVM, lost everything with a typo
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

Hi,

I recently got a new HD and thought it was about time I started using
LVM. Unfortunatly, I think I have ended up loosing all of my data due
to a typo. I would like to know if my data is lost forever. If not,
what can I do now to recover. Here is the whole story...

Craig

Originally it was set up with 2 HD like this:
   hda - containing  /  /home  /usr
   sda - containing one big partition (/dev/sda2) for data storage (SATA drive)

I added a new SATA drive and used cfdisk to format it and make one big
partition (ext3). My plan was to create a LV on the new HD, copy
everything over from the old HD, then add that old HD to the new LV.
I followed the LVM HOWTO to create a vg etc:

%  pvcreate /dev/sdb1

%  vgcreate media_vg /dev/sdb1

%  lvcreate -L 233G -n media_lv media_vg

%  mke2fs -j /dev/media_vg/media_lv

%  mount /dev/media_vg/media_lv /mnt/media

... and everything worked beautifully. I copied everything (188GB)
from sda2 onto the new LV successfully. So next was time to prep sda2
to be added to the LV.... this is where I screwed up.

% pvcreate /dev/sda2
  Physical volume "/dev/sda2" successfully created

% vgextend media_vg /dev/sda2
  Volume group "media_vg" successfully extended


... I was following some example on a web site, and typed in the wrong
device next. The web site had said to use fdisk to change the
partition type to 8e. This SHOULD have been sda, but I wrote sdb by
mistake:

$ fdisk /dev/sdb

Command (m for help): t
Selected partition 1
Hex code (type L to list codes): 8e
Changed system type of partition 1 to 8e (Linux LVM)

Command (m for help): p

Disk /dev/sdb: 251.0 GB, 251000193024 bytes
255 heads, 63 sectors/track, 30515 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1       30515   245111706   8e  Linux LVM

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.

WARNING: Re-reading the partition table failed with error 16: Device
or resource busy.
The kernel still uses the old table.
The new table will be used at the next reboot.
Syncing disks.


.... BUT.... I didn't notice the screw up. I wanted to see if the LV
would be automaticaly mounted on a reboot without having to add to
fstab or an init script (I have been told that this would happen on
Debian), so I rebooted.
Now neither disc can be seen or mounted. dmesg | tail shows this:

 % dmesg | tail
EXT3-fs error (device sda2): ext3_check_descriptors: Block bitmap for
group 0 not in group (block 3258811534)!
EXT3-fs: group descriptors corrupted !
EXT3-fs error (device sda2): ext3_check_descriptors: Block bitmap for
group 0 not in group (block 3258811534)!
EXT3-fs: group descriptors corrupted !
VFS: Can't find ext3 filesystem on dev sdb.

... vgchange can't help out....

% vgchange -a y media_vg
  Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
  Couldn't find all physical volumes for volume group media_vg.
  Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
  Couldn't find all physical volumes for volume group media_vg.
  Unable to find volume group "media_vg"

....vgdisplay can't see either disc (exact same story with lvdisplay)...

vgdisplay
  Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
  Couldn't find all physical volumes for volume group media_vg.
  Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
  Couldn't find all physical volumes for volume group media_vg.
  Volume group "media_vg" doesn't exist

... and pvdisplay gives me...

% pvdisplay
  Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               media_vg
  PV Size               233.75 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              59841
  Free PE               193
  Allocated PE          59648
  PV UUID               rlnV4y-B4eJ-Pyc0-RLJm-2Zbv-t04C-dxzU1A

  --- Physical volume ---
  PV Name               unknown device
  VG Name               media_vg
  PV Size               186.30 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              47694
  Free PE               47694
  Allocated PE          0
  PV UUID               ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6
