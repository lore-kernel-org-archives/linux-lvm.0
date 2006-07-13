Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DFv48W001735
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 11:57:04 -0400
Received: from mail2.designassembly.de (mail2.designassembly.de [217.11.62.46])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6DFuvFo010092
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 11:56:58 -0400
Message-ID: <44B66D47.4000001@designassembly.de>
Date: Thu, 13 Jul 2006 17:56:55 +0200
From: Michael Heyse <mhk@designassembly.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: LVM Performance effects?
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
To: linux-lvm@redhat.com, bretm@boneheads.us

(sorry for disrupting the thread - copied this message from the archives)

> I have set up a file server with LVM on top of RAID 5, and seem to be
> having LVM related performance issue.

Me too.

> raid device: 118.2 MB/s
> lvm device: 49.43 MB/s
> file system: 40.83 MB/s

Have you found an answer to that problem? I couldn't find anything
helpful in the archives. Is this a general LVM on software RAID issue?

I'm measuring a similar performance degradation on my system:

plain Software RAID-5:

# hdparm -t /dev/md3

/dev/md3:
 Timing buffered disk reads:  884 MB in  3.00 seconds = 294.49 MB/sec


LVM2 logical volume:

# hdparm -t /dev/data/temp

/dev/data/temp:
 Timing buffered disk reads:  316 MB in  3.01 seconds = 105.15 MB/sec

I tried changing the physical extent size, but this has almost no effect.

Some short system information, I'll gladly provide more if needed:

- kernel 2.6.17
- lvm2

  LVM version:     2.02.06 (2006-05-12)
  Library version: 1.02.07 (2006-05-11)
  Driver version:  4.5.0

- 2x dual core xeon, 3 GHz
- 6x WD360GD 36,7 GB SATA Disk
- Software RAID-5 (chunk size: 256kB)

  --- Physical volume ---
  PV Name               /dev/md3
  VG Name               data
  PV Size               167.45 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              42868
  Free PE               4468
  Allocated PE          38400

  --- Volume group ---
  VG Name               data
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  11
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                6
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               167.45 GB
  PE Size               4.00 MB
  Total PE              42868
  Alloc PE / Size       38400 / 150.00 GB
  Free  PE / Size       4468 / 17.45 GB

  --- Logical volume ---
  LV Name                /dev/data/temp
  VG Name                data
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                10.00 GB
  Current LE             2560
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:5

Any hints are greatly appreciated.

Thanks,
Michael
