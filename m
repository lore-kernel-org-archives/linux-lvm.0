Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i56Ekf005138
	for <linux-lvm@redhat.com>; Sun, 6 Jun 2004 10:46:41 -0400
Received: from mail.jct.ac.il ([147.161.1.14])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i56EkYXn012279
	for <linux-lvm@redhat.com>; Sun, 6 Jun 2004 10:46:35 -0400
Message-ID: <40C32E02.9070902@jct.ac.il>
Date: Sun, 06 Jun 2004 17:45:22 +0300
From: Yedidia Klein <yedidia@jct.ac.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] can't create snapshot on FC2
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi list,

I'm trying to create snapshot on lvm2 rinning on a fresh Fedora Core 2 
linux machine
kernel 2.6.5-1 lvm versions (pvdisplay --version output)
  LVM version:     2.00.15 (2004-04-19)
  Library version: 1.00.14-ioctl (2004-04-06)
  Driver version:  4.1.0

I did the followings:
-- snip --
pvcreate /dev/sdb
vgcreate extdisk /dev/sdb
lvcreate -L500g -npart1 extdisk
mke2fs -j /dev/extdisk/part1
-- snap --
till here everything was fine - I could mount the partition and use it 
w/o any problem...
then I unmounted the partition and tried to create a snapshot using this 
syntax :
lvcreate -L50g -s -n userssnap /dev/extdisk/part1
then I got this:
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'extdisk-userssnap'.
  Problem reactivating origin part1

and then I could not mount the partiton again (the mount command just 
hang..)

here is my lvdisplay output:
-- snip --
  --- Logical volume ---
  LV Name                /dev/extdisk/part1
  VG Name                extdisk
  LV UUID                NNuptN-60Hx-B403-c1uc-FVp6-Kr03-AqJ8CE
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/extdisk/userssnap [INACTIVE]
  LV Status              suspended
  # open                 0
  LV Size                500.00 GB
  Current LE             128000
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           253:1

  --- Logical volume ---
  LV Name                /dev/extdisk/userssnap
  VG Name                extdisk
  LV UUID                gU4N1Y-0CWf-F6Oo-fRuZ-EpAX-fRFg-pgtAn4
  LV Write Access        read/write
  LV snapshot status     INACTIVE destination for /dev/extdisk/part1
  LV Status              available
  # open                 0
  LV Size                500.00 GB
  Current LE             128000
  Segments               1
  Snapshot chunk size    8.00 KB
  Allocated to snapshot  100.00%
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           253:4
-- snap --

any idea how to debug it / how to create a snapshot ??

thanks

--Yedidia Klein
Jerusalem College of Technology
Computing Center
