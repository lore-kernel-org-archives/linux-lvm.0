Message-ID: <3EA82C3C.6060707@beep.mine.nu>
From: Beppe <lvm@beep.mine.nu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] BadBlocks. Need assistance.
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Apr 24 13:26:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi all,

I have run in to trouble.
I have 4 disks 3*76.34GB and 1*31.87GB setup as one vg(/dev/vg_pub/pub) 
with ext3.

One day, the performance went down radically, so i check the log seeing..
Apr 13 13:59:56 fukke kernel: hdb: dma_intr: status=0x51 { DriveReady 
SeekComplete Error }
Apr 13 13:59:56 fukke kernel: hdb: dma_intr: error=0x40 { 
UncorrectableError }, LBAsect=33063360, sector=33063360
Apr 13 13:59:56 fukke kernel: end_request: I/O error, dev 03:40 (hdb), 
sector 33063360
Apr 13 13:59:58 fukke kernel: hdb: dma_intr: status=0x51 { DriveReady 
SeekComplete Error }
Apr 13 13:59:58 fukke kernel: hdb: dma_intr: error=0x40 { 
UncorrectableError }, LBAsect=33063360, sector=33063360
Apr 13 13:59:58 fukke kernel: end_request: I/O error, dev 03:40 (hdb), 
sector 33063360

continuous......with different sectors....

I umount it and run fsck.ext3 -f -c -v /dev/vg_pub/pub
e2fsch reports:(e2fsck 1.32 (09-Nov-2002))
Pass 1: Checking inodes, blocks, and sizes
Group 64's block bitmap (2097152) is bad.  Relocate<y>? yes

Bad block 0 used as bad block indirect block?!?

This inconsistency can not be fixed with e2fsck; to fix it, use
dumpe2fs -b to dump out the bad block list and e2fsck -L filename
to read it back in again.
Continue<y>?

doing as it says.
dumpe2fs -b /dev/vg_pub/pub > ./badblocks.txt
fsck.ext3 -f -c -v -L ./badblocks.txt /dev/vg_pub/pub
ending up with the same suggestion, do a dumpe2fs -b and e2fsck -L filename.

What will happend if i move the extend with pvmove to a new disk.
e2fsck can't fix the disk AFAI tried or?

Logical Volume Manager 1.0.7
kernal 2.4.20 with LVM patch.

grateful for help.

regards,
::Beppe
