Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA2KSlV17302
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2005 15:28:47 -0500
Received: from storm.itahost.com (storm.itahost.com [83.148.74.3])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id jA2KSfo2018813
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2005 15:28:45 -0500
From: Delian Krustev <linux-lvm@krustev.net>
Date: Wed, 2 Nov 2005 22:28:20 +0200
MIME-Version: 1.0
Message-Id: <200511012135.50701.krustev@krustev.net>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Unable to remove a pvmove LV
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


The problem appeared after I've had a problem with this controller:

0000:00:0e.0 RAID bus controller: Silicon Image, Inc. (formerly CMD Technology Inc) PCI0680 Ultra ATA-133 Host Controller (rev 02)

I've added two more disks to this controller and to the volume group
and messages similar to this:

Oct 26 20:28:21 serv0 kernel: hda: dma_intr: status=0x7f { DriveReady DeviceFault SeekComplete DataRequest CorrectedError Index Error }
Oct 26 20:28:21 serv0 kernel: hda: dma_intr: error=0x00 { }
Oct 26 20:28:21 serv0 kernel: hda: DMA disabled
Oct 26 20:28:21 serv0 kernel: hdb: DMA disabled
Oct 26 20:28:21 serv0 kernel: ide0: reset: success

began to appiear in the logs. I've tried removing the new disks but this LV
became invincible. The machine is running Debian sarge. Details follow:

serv0:/# dpkg -s lvm2 |grep Version
Version: 2.01.04-5
serv0:/# uname -a
Linux serv0 2.6.8-2-k7 #1 Thu May 19 18:03:29 JST 2005 i686 GNU/Linux
serv0:/# lvdisplay
  --- Logical volume ---
  LV Name                /dev/s0_data/data
  VG Name                s0_data
  LV UUID                Wzs9Lu-5IUj-DK88-UVnZ-QJpj-gHuD-3a01jq
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.02 TB
  Current LE             4164
  Segments               23
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:0

  --- Logical volume ---
  LV Name                /dev/s0_data/pvmove0
  VG Name                s0_data
  LV UUID                H8As4Y-m61V-krSa-lGTd-pNRh-Ef1e-UStXSC
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                46.50 GB
  Current LE             186
  Segments               1
  Allocation             contiguous
  Read ahead sectors     0

serv0:/# lvremove -v -f -d /dev/s0_data/pvmove0
    Using logical volume(s) on command line
  Can't remove locked LV pvmove0
serv0:/# pvmove --abort -v
    Finding all volume groups
    Finding volume group "s0_data"
serv0:/# lvdisplay
  --- Logical volume ---
  LV Name                /dev/s0_data/data
  VG Name                s0_data
  LV UUID                Wzs9Lu-5IUj-DK88-UVnZ-QJpj-gHuD-3a01jq
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.02 TB
  Current LE             4164
  Segments               23
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:0

  --- Logical volume ---
  LV Name                /dev/s0_data/pvmove0
  VG Name                s0_data
  LV UUID                H8As4Y-m61V-krSa-lGTd-pNRh-Ef1e-UStXSC
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                46.50 GB
  Current LE             186
  Segments               1
  Allocation             contiguous
  Read ahead sectors     0

serv0:/#

Additionally the pvmove process was killed several times by the OOM
killer, since in my opinion it was leaking memory. The PVs are 50 GBs
each, and at some time at over 90 % the pvmove process was eating
all the memory(512 MBs). Surprisingly after trying to resume some minutes
later I've found the move had completed successfully.

Cheers,
Delian
