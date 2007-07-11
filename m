Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6B4chkO005610
	for <linux-lvm@redhat.com>; Wed, 11 Jul 2007 00:38:43 -0400
Received: from mail.futurelabusa.com (c-67-165-227-32.hsd1.co.comcast.net
	[67.165.227.32])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6B4cej4006020
	for <linux-lvm@redhat.com>; Wed, 11 Jul 2007 00:38:40 -0400
Received: from i0.futurelabusa.com (i0.fu-lab.com [192.168.0.101])
	by mail.futurelabusa.com (Postfix) with ESMTP id 1596A77714
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2007 22:38:39 -0600 (MDT)
Date: Tue, 10 Jul 2007 22:38:53 -0600
From: Jim Schatzman <james.schatzman@futurelabusa.com>
Subject: Re: [linux-lvm] Logical Volume on two disk, one is broken: how
	to restore data from the good disk?
In-Reply-To: <1cd18cb0707100731h7cef5a91qcab1051f234c61bb@mail.gmail.com
 >
References: <1cd18cb0707100731h7cef5a91qcab1051f234c61bb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Message-Id: <20070711043839.1596A77714@mail.futurelabusa.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

 From me the amateur. You appear to have lost some data. You probably have some files that are recoverable. You have a few choices:

1) Send your disks to a professional. See http://myharddrivedied.com, for example.

2) Replace the electronics PC board on your drive. See the same above website for more info on that. This might recover all your data. It also may make no change.

3) Use dmsetup to enable a partial VG (use vgchange -Pay as explained in the article). See
http://e2salvage.sourceforge.net/florian2.html
Retrieve what files you can.

You can also remove the bad drive entirely and do a partial VG.

4) Use dd ignoring errors to do a raw copy off the bad drive to an identical good drive. 
Use vgcfgbackup. Remove the bad drive. Install the new drive.

Edit the vgcfg backup, edit the id in the logical_volumes
sections, check your work carefully, and vgcfgrestore

as mentioned by Ryan Nelson.  This is probably going to get you about what #3 does.

Good luck-

Jim







At 08:31 AM 7/10/2007, you wrote:
>Hello,
>I have one LV (/home/hom_vg/home_lv) spanning over two PV. The PVs
>were created on /dev/hdc1 and /dev/hdd1, both covering the entire
>disks hdc (120 gb) and hdd (200 gb) respectively.
>The mapping is linear.
>
>My hdc is physically damaged... I could not even run fsck, badblocks
>and dd_rescue. All of them give an output like this (from dmesg):
>
>
>hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=512, high=0,
>low=512, sector=512
>ide: failed opcode was: unknown
>end_request: I/O error, dev hdc, sector 512
>Buffer I/O error on device hdc, logical block 64
>hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=512, high=0,
>low=512, sector=512
>ide: failed opcode was: unknown
>end_request: I/O error, dev hdc, sector 512
>Buffer I/O error on device hdc, logical block 64
>Adding 690784k swap on /dev/hda4.  Priority:-1 extents:1 across:690784k
>EXT3 FS on hda3, internal journal
>hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=447, high=0,
>low=447, sector=447
>ide: failed opcode was: unknown
>end_request: I/O error, dev hdc, sector 447
>Buffer I/O error on device dm-0, logical block 0
>hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=455, high=0,
>low=455, sector=455
>ide: failed opcode was: unknown
>end_request: I/O error, dev hdc, sector 455
>Buffer I/O error on device dm-0, logical block 1
>hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=463, high=0,
>low=463, sector=463
>ide: failed opcode was: unknown
>end_request: I/O error, dev hdc, sector 463
>Buffer I/O error on device dm-0, logical block 2
>hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=471, high=0,
>low=471, sector=471
>ide: failed opcode was: unknown
>end_request: I/O error, dev hdc, sector 471
>Buffer I/O error on device dm-0, logical block 3
>hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=447, high=0,
>low=447, sector=447
>ide: failed opcode was: unknown
>end_request: I/O error, dev hdc, sector 447
>Buffer I/O error on device dm-0, logical block 0
>fuse init (API version 7.8)
>kjournald starting.  Commit interval 5 seconds
>EXT3 FS on hda2, internal journal
>EXT3-fs: mounted filesystem with ordered data mode.
>hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=449, high=0,
>low=449, sector=449
>ide: failed opcode was: unknown
>end_request: I/O error, dev hdc, sector 449
>EXT3-fs: unable to read superblock
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
