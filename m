Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9R9lMr30391
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2004 05:47:22 -0400
Received: from smtp3.libero.it (smtp3.libero.it [193.70.192.127])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id i9R9lK7r019042
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2004 05:47:20 -0400
Received: from localhost (172.16.1.84) by smtp3.libero.it (7.0.027-DD01)
	id 4178F14A000FD1F3 for linux-lvm@redhat.com;
	Wed, 27 Oct 2004 11:47:14 +0200
Received: from [192.168.0.2] (151.41.144.63) by smtp3.libero.it (7.0.027-DD01)
	id 4178F0D300278127 for linux-lvm@redhat.com;
	Wed, 27 Oct 2004 11:47:14 +0200
From: "\"KieZz\"" <kiezz@libero.it>
Date: Wed, 27 Oct 2004 11:44:43 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200410271144.43706.kiezz@libero.it>
Subject: [linux-lvm] LVM DISK CRASH AND PVREMOVE -ff
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi
(sorry for poor english)
i have a lvm2 whit 4 disk, each 200 gb, yesterday one die (badblocks give me 
30 entries).
PV /dev/hdb   VG orange_vg   lvm2 [189.92 GB / 0    free]
PV /dev/hdc   VG orange_vg   lvm2 [189.92 GB / 0    free]
PV /dev/hde   VG orange_vg   lvm2 [189.92 GB / 0    free]
PV /dev/hdf   VG orange_vg   lvm2 [189.92 GB / 1.84 GB free] <----- diskdead

First i've tried to reduce reiserfs, lv and vg but this was unpossible because 
reiserfs can't be managed whit this disk error:

root@Orange:~# mount /dev/orange_vg/orange_lv
mount: wrong fs type, bad option, bad superblock on /dev/orange_vg/orange_lv,
       or too many mounted file systems

(also resize_reiserfs was unable to detect reiser partition)

from dmesg:
ReiserFS: dm-1: found reiserfs format "3.6" with standard journal
hdf: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdf: dma_intr: error=0x01 { AddrMarkNotFound }, LBAsect=364347782, high=21, 
low=12026246, sector=364347776
hdf: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdf: dma_intr: error=0x40 { UncorrectableError }, LBAsect=364347782, high=21, 
low=12026246, sector=364347776
end_request: I/O error, dev hdf, sector 364347776
[..]

So i've tried to add 200 gb, but i had no more 200G disk so i've plugged in a 
120 + 80 .
The pvmove tell me there is not enough PE, i think pvmove (but is not write 
anywhere) need a disk egual or bigger than disk to remove (this is a question 
to for expert too).
I was sure the 200 gb was inside the lv but whitout important data for me, so 
i've tried to pvremove -ff /dev/hdf.
This was a big mistake, the vg was unconsistent  and give me several error.
I've restored the vg doing pvcreate -u oldid /dev/hdf , and now the vg seams 
ok, but i'm@the initial point and  the metada are now inconsistent, i see 
i have now this error also:

ReiserFS: dm-1: warning: sh-2029: reiserfs read_bitmaps: bitmap block 
(#194904064) reading failed
ReiserFS: dm-1: warning: jmacd-8: reiserfs_fill_super: unable to read bitmap

At this point what i can do? Is there a way to save the data from disks, in 
particular hdb and hdc ? 
I know there is dd and dd_rescue but i don't know exactly how can i use this 2 
tools and if they can save my data.
Sorry, i'm a lvm newbie but an explenation can be usefull for understand how 
manage a disk crash on lvm (i've not found a good howto about that).
Thanks
