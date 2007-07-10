Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6AEVrut008161
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2007 10:31:53 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.176])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6AEVpmr014671
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2007 10:31:52 -0400
Received: by py-out-1112.google.com with SMTP id p76so2720628pyb
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2007 07:31:51 -0700 (PDT)
Message-ID: <1cd18cb0707100731h7cef5a91qcab1051f234c61bb@mail.gmail.com>
Date: Tue, 10 Jul 2007 16:31:51 +0200
From: "Marco Antonelli" <marcoantonelli82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Logical Volume on two disk,
	one is broken: how to restore data from the good disk?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello,
I have one LV (/home/hom_vg/home_lv) spanning over two PV. The PVs
were created on /dev/hdc1 and /dev/hdd1, both covering the entire
disks hdc (120 gb) and hdd (200 gb) respectively.
The mapping is linear.

My hdc is physically damaged... I could not even run fsck, badblocks
and dd_rescue. All of them give an output like this (from dmesg):


hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=512, high=0,
low=512, sector=512
ide: failed opcode was: unknown
end_request: I/O error, dev hdc, sector 512
Buffer I/O error on device hdc, logical block 64
hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=512, high=0,
low=512, sector=512
ide: failed opcode was: unknown
end_request: I/O error, dev hdc, sector 512
Buffer I/O error on device hdc, logical block 64
Adding 690784k swap on /dev/hda4.  Priority:-1 extents:1 across:690784k
EXT3 FS on hda3, internal journal
hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=447, high=0,
low=447, sector=447
ide: failed opcode was: unknown
end_request: I/O error, dev hdc, sector 447
Buffer I/O error on device dm-0, logical block 0
hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=455, high=0,
low=455, sector=455
ide: failed opcode was: unknown
end_request: I/O error, dev hdc, sector 455
Buffer I/O error on device dm-0, logical block 1
hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=463, high=0,
low=463, sector=463
ide: failed opcode was: unknown
end_request: I/O error, dev hdc, sector 463
Buffer I/O error on device dm-0, logical block 2
hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=471, high=0,
low=471, sector=471
ide: failed opcode was: unknown
end_request: I/O error, dev hdc, sector 471
Buffer I/O error on device dm-0, logical block 3
hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=447, high=0,
low=447, sector=447
ide: failed opcode was: unknown
end_request: I/O error, dev hdc, sector 447
Buffer I/O error on device dm-0, logical block 0
fuse init (API version 7.8)
kjournald starting.  Commit interval 5 seconds
EXT3 FS on hda2, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=449, high=0,
low=449, sector=449
ide: failed opcode was: unknown
end_request: I/O error, dev hdc, sector 449
EXT3-fs: unable to read superblock
