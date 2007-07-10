Received: from o.ww.redhat.com (vpn-4-3.str.redhat.com [10.32.4.3])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6AEpoBk025526
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2007 10:51:56 -0400
Received: from o.ww.redhat.com (localhost [127.0.0.1])
	by o.ww.redhat.com (8.14.1/8.13.8) with ESMTP id l6AEpooW005390
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2007 16:51:50 +0200
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.14.1/8.14.1/Submit) id l6AEpodA005388
	for linux-lvm@redhat.com; Tue, 10 Jul 2007 16:51:50 +0200
Date: Tue, 10 Jul 2007 16:51:50 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Logical Volume on two disk, one is broken: how to
	restore data from the good disk?
Message-ID: <20070710145150.GA2984@redhat.com>
References: <1cd18cb0707100731h7cef5a91qcab1051f234c61bb@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cd18cb0707100731h7cef5a91qcab1051f234c61bb@mail.gmail.com>
Reply-To: mauelshagen@redhat.com,
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jul 10, 2007 at 04:31:51PM +0200, Marco Antonelli wrote:
> Hello,
> I have one LV (/home/hom_vg/home_lv) spanning over two PV. The PVs
> were created on /dev/hdc1 and /dev/hdd1, both covering the entire
> disks hdc (120 gb) and hdd (200 gb) respectively.
> The mapping is linear.
> 
> My hdc is physically damaged... I could not even run fsck, badblocks
> and dd_rescue. All of them give an output like this (from dmesg):

You got to put the PVs on MD RAID >= 1 or use LVM mirring to avoid this.
Reach out for your backups :(

Regards,
Heinz    -- The LVM Guy --

> 
> 
> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=512, high=0,
> low=512, sector=512
> ide: failed opcode was: unknown
> end_request: I/O error, dev hdc, sector 512
> Buffer I/O error on device hdc, logical block 64
> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=512, high=0,
> low=512, sector=512
> ide: failed opcode was: unknown
> end_request: I/O error, dev hdc, sector 512
> Buffer I/O error on device hdc, logical block 64
> Adding 690784k swap on /dev/hda4.  Priority:-1 extents:1 across:690784k
> EXT3 FS on hda3, internal journal
> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=447, high=0,
> low=447, sector=447
> ide: failed opcode was: unknown
> end_request: I/O error, dev hdc, sector 447
> Buffer I/O error on device dm-0, logical block 0
> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=455, high=0,
> low=455, sector=455
> ide: failed opcode was: unknown
> end_request: I/O error, dev hdc, sector 455
> Buffer I/O error on device dm-0, logical block 1
> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=463, high=0,
> low=463, sector=463
> ide: failed opcode was: unknown
> end_request: I/O error, dev hdc, sector 463
> Buffer I/O error on device dm-0, logical block 2
> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=471, high=0,
> low=471, sector=471
> ide: failed opcode was: unknown
> end_request: I/O error, dev hdc, sector 471
> Buffer I/O error on device dm-0, logical block 3
> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=447, high=0,
> low=447, sector=447
> ide: failed opcode was: unknown
> end_request: I/O error, dev hdc, sector 447
> Buffer I/O error on device dm-0, logical block 0
> fuse init (API version 7.8)
> kjournald starting.  Commit interval 5 seconds
> EXT3 FS on hda2, internal journal
> EXT3-fs: mounted filesystem with ordered data mode.
> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x40 { UncorrectableError }, LBAsect=449, high=0,
> low=449, sector=449
> ide: failed opcode was: unknown
> end_request: I/O error, dev hdc, sector 449
> EXT3-fs: unable to read superblock
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
