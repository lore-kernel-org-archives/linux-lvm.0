Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j875NhV12046
	for <linux-lvm@redhat.com>; Wed, 7 Sep 2005 01:23:43 -0400
Received: from isp.becroft.co.nz (isp.becroft.co.nz [202.89.33.33])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j875Ne4E013753
	for <linux-lvm@redhat.com>; Wed, 7 Sep 2005 01:23:41 -0400
From: Mario Becroft <mb@gem.win.co.nz>
Message-Id: <1126070609.23525.40.camel@server.ak.quickcircuit.co.nz>
Mime-Version: 1.0
Date: Wed, 07 Sep 2005 17:23:29 +1200
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] XFS and snapshot with external log problem
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
Cc: mb@gem.win.co.nz

Hello,

I am using XFS on LVM2 and I have a problem creating snapshots.

I will only be mounting the snapshot read-only, and when the XFS
filesystem is frozen, the log is flushed (is this true?), so I believe I
should not need to snapshot the log, only the data device.

Problem: if I try to mount the filesystem without specifying a logdev=
option, even with ro,norecovery, mount complains with error 990.

So I created a dummy log filled with 0's to use when mounting read-only
snapshots. Strange thing: if the dummy log device is read only, mount
complains, even though I am specifying the ro option. So I had to make
the dummy log device writable--but I note that XFS never actually writes
anything to it.

This approach sort of works, but if files are being modified when the
snapshot is made, they can be corrupt in the snapshot. So I guess the
filesystem is not being frozen properly, or else freezing does not
completely flush the log, and so I would need to snapshot the log too
(but that seems silly).

Anyway, I cannot snapshot the log, because there is no way to atomically
freeze the filesystem, create two snapshots (log and data device) and
then unfreeze. I tried using xfs_freeze to do this, but then lvcreate
hangs, as described elsewhere on linux-lvm.

Can anyone shed some light on these problems? Any suggestions will be
much appreciated.

For reference, I am using kernel 2.6.12.5 on AMD64, device-mapper
1.01.04. and LVM2 2.01.09, which I believe are the latest stable
versions. I am about to try kernel 2.6.13.

The commands I use to create and mount the snapshot are, for example:

mkdir -p /export/home_backup
lvcreate -L4G -s -pr -nhome_backup /dev/vg0/home
mount -t xfs -o nouuid,ro,norecovery,logdev=/dev/log0/dummy_log /dev/vg0/home_backup /export/home_backup

The original filesystem that I am trying to make a snapshot of is
mounted like this:

mount -t xfs -o logbufs=8,logdev=/dev/log0/homelog /dev/vg0/home /export/home

Further information:

# lvdisplay /dev/vg0/home
  --- Logical volume ---
  LV Name                /dev/vg0/home
  VG Name                vg0
  LV UUID                hegvc2-MIwz-iSmN-m2af-LObQ-pfVp-A3UlWy
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                32.00 GB
  Current LE             8192
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

# xfs_info /export/home
meta-data=/export/home           isize=256    agcount=18, agsize=491520
blks
         =                       sectsz=512
data     =                       bsize=4096   blocks=8388608, imaxpct=25
         =                       sunit=0      swidth=0 blks, unwritten=1
naming   =version 2              bsize=4096
log      =external               bsize=4096   blocks=32768, version=1
         =                       sectsz=512   sunit=0 blks
realtime =none                   extsz=65536  blocks=0, rtextents=0

# vgdisplay
  --- Volume group ---
  VG Name               vg0
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  124
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                5
  Open LV               4
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               223.52 GB
  PE Size               4.00 MB
  Total PE              57221
  Alloc PE / Size       29440 / 115.00 GB
  Free  PE / Size       27781 / 108.52 GB
  VG UUID               N0Vkgh-i7Zn-ohXQ-M64S-GQxa-bncH-JWPxGG

  --- Volume group ---
  VG Name               log0
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  15
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                4
  Open LV               3
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               16.85 GB
  PE Size               4.00 MB
  Total PE              4314
  Alloc PE / Size       128 / 512.00 MB
  Free  PE / Size       4186 / 16.35 GB
  VG UUID               vDyLlP-dwfW-9Nj5-dmHh-Ya7O-zUAo-81rUf9

# pvdisplay
  --- Physical volume ---
  PV Name               /dev/md20
  VG Name               vg0
  PV Size               223.52 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              57221
  Free PE               27781
  Allocated PE          29440
  PV UUID               f47Jdk-arEl-RpRL-MI7f-E6H4-sVSL-xVK4CC

  --- Physical volume ---
  PV Name               /dev/md11
  VG Name               log0
  PV Size               16.85 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              4314
  Free PE               4186
  Allocated PE          128
  PV UUID               pFQgKc-RrM1-M5Ui-ChnC-t3Md-Qo0E-nqu9oW

-- 
Mario Becroft <mb@gem.win.co.nz>
