Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jABCXnV19898
	for <linux-lvm@redhat.com>; Fri, 11 Nov 2005 07:33:49 -0500
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jABCXmwg032467
	for <linux-lvm@redhat.com>; Fri, 11 Nov 2005 07:33:49 -0500
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 93FC91F4053
	for <linux-lvm@redhat.com>; Fri, 11 Nov 2005 13:33:32 +0100 (CET)
Message-ID: <43748F99.2020100@conterra.de>
Date: Fri, 11 Nov 2005 13:33:29 +0100
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
References: <DE77E2FB6E674A40B1B661B4D91F1FE501AAA525@E2KMBX20VS.intranet.tim.it>
In-Reply-To: <DE77E2FB6E674A40B1B661B4D91F1FE501AAA525@E2KMBX20VS.intranet.tim.it>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] kernel Oops when activating my VG
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I started a pvmove last evening. This morning I found it stuck
with a kernel Oops. By now, I get this Oops each time during vgscan.
Thus I have no change even to look at the current state of my VG :-(

I disabled one of the disks and tried to access the remaining LVs
using --partial. I get my LV's listed, but when I try to access them
I again get the Oops and my system feezes.

I googeled about a recent "bio_clone bug", but I tried several kernels,
even a 2.6.14, but always got the same...

here comes the Oops:

Unable to handle kernel paging request at virtual address d0a47000
  printing eip:
d0a339a7
*pde = 0127b067
Oops: 0000 [#1]
Modules linked in: dm_mirror evdev joydev sg st sr_mod nvram nfsd exportfs
edd autofs speedstep_lib freq_table thermal processor fan button battery ipv6
ac e1000 i2c_viapro via_agp e100 mii i2c_core agpgart parport_pc uhci_hcd
parport usbcore capability commoncap ext3 jbd vfat fat dm_mod ide_cd cdrom
sata_promise libata ide_disk pdc202xx_old via82cxxx ide_core sd_mod scsi_mod
CPU:    0
EIP:    0060:[<d0a339a7>]    Not tainted VLI
EFLAGS: 00010246   (2.6.14-default-gf2c84c0e)
EIP is at core_in_sync+0x7/0x20 [dm_mirror]
eax: c958bdc0   ebx: d0a41000   ecx: 00000000   edx: 00030000
esi: cffc2900   edi: c97657e0   ebp: 00000000   esp: c84fda3c
ds: 007b   es: 007b   ss: 0068
Process udev_volume_id (pid: 12044, threadinfo=c84fc000 task=c554e5c0)
Stack: d0a38380 d0a35651 00000000 0000000a 00030000 00000000 c01608a9 c6a3f740
        c958be40 c6a3f738 cffc2900 d0a310b8 d087837c 0c000000 00000000 cffc2180
        c6a3f748 c84fdae8 d0878618 00000000 00000001 00000008 00000000 00000000
Call Trace:
  [<d0a35651>] mirror_map+0xa1/0x150 [dm_mirror]
  [<c01608a9>] bio_clone+0xc9/0xd0
  [<d087837c>] __map_bio+0x3c/0x100 [dm_mod]
  [<d0878618>] __clone_and_map+0xc8/0x320 [dm_mod]
  [<c0140f1a>] mempool_alloc+0x2a/0xc0
  [<d0878917>] __split_bio+0xa7/0x120 [dm_mod]
  [<d08789f6>] dm_request+0x66/0x90 [dm_mod]
  [<c025772b>] generic_make_request+0xeb/0x170
  [<c01608a9>] bio_clone+0xc9/0xd0
  [<d087837c>] __map_bio+0x3c/0x100 [dm_mod]
  [<d0878618>] __clone_and_map+0xc8/0x320 [dm_mod]
  [<c0140f1a>] mempool_alloc+0x2a/0xc0
  [<d0878917>] __split_bio+0xa7/0x120 [dm_mod]
  [<d08789f6>] dm_request+0x66/0x90 [dm_mod]
  [<c025772b>] generic_make_request+0xeb/0x170
  [<c0257800>] submit_bio+0x50/0xe0
  [<c01605e9>] bio_alloc_bioset+0xe9/0x1e0
  [<c015ff6d>] submit_bh+0x13d/0x190
  [<c015ef2a>] block_read_full_page+0x30a/0x320
  [<c0162e90>] blkdev_get_block+0x0/0x80
  [<c0144aec>] read_pages+0x4c/0x100
  [<c014247c>] __alloc_pages+0x17c/0x410
  [<c0144c44>] __do_page_cache_readahead+0xa4/0x100
  [<c0144df1>] blockable_page_cache_readahead+0x51/0xd0
  [<c0145031>] page_cache_readahead+0x101/0x1a0
  [<c013e516>] do_generic_mapping_read+0x326/0x490
  [<c013e912>] __generic_file_aio_read+0x1a2/0x210
  [<c013e680>] file_read_actor+0x0/0xf0
  [<c013ea85>] generic_file_read+0x95/0xc0
  [<c012ea20>] autoremove_wake_function+0x0/0x50
  [<c015b947>] vfs_read+0xd7/0x180
  [<c015bcd1>] sys_read+0x41/0x70
  [<c0102f29>] syscall_call+0x7/0xb


-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
