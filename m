Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBQDOLxh001449
	for <linux-lvm@redhat.com>; Tue, 26 Dec 2006 08:24:21 -0500
Received: from mail.reagi.com (mail.reagi.com [195.60.188.80])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBQDOKDE003256
	for <linux-lvm@redhat.com>; Tue, 26 Dec 2006 08:24:21 -0500
Message-ID: <4591227C.9060605@oxeva.fr>
Date: Tue, 26 Dec 2006 14:24:12 +0100
From: Gabriel Barazer <gabriel@oxeva.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM full snapshot deletion bug - again
Reply-To: gabriel@oxeva.fr,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

This bug has been reported about a few weeks ago, but I don't know if it 
has been noticed ?
This is about a segfault with lvremove which occurs when deleting a 
corrupted snapshot (because COW space is full, attributes are "Swi-I-")

Additionally I get a kernel bug notification :
----------- [cut here ] --------- [please bite here ] ---------
Kernel BUG at mm/slab.c:595
invalid opcode: 0000 [1] SMP
CPU 3
Modules linked in:
Pid: 5544, comm: lvremove Not tainted 2.6.18 #1
RIP: 0010:[<ffffffff802074cd>]  [<ffffffff802074cd>] 
kmem_cache_free+0x5e/0xba
RSP: 0018:ffff81001b62bc48  EFLAGS: 00010246
RAX: 000000000001002c RBX: ffffc20010f734b0 RCX: ffff810002a42808
RDX: ffff810001ccb740 RSI: ffff81003a7d8c88 RDI: ffff81007ed0e380
RBP: 0000000000000000 R08: ffffffff80663388 R09: 0000000000000001
R10: ffff8100780a52e0 R11: ffff810078034840 R12: ffff81003a7d8c88
R13: 0000000000000b4b R14: ffff81007a99d628 R15: 0000000000004000
FS:  00002b760ae936e0(0000) GS:ffff81007ff35840(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: 00007fffa015b4f0 CR3: 000000001d470000 CR4: 00000000000006e0
Process lvremove (pid: 5544, threadinfo ffff81001b62a000, task 
ffff81007ee02140)
Stack:  ffffc20010f734b0 0000000000000000 ffff81007ed0e380 ffffffff804d5f38
 ffff81007de90480 ffff81007a99d5c0 ffffc20010659080 0000000000000000
 ffffc2001064d000 ffffffff804cf725 ffffc2001064d000 ffffffff804d659f
Call Trace:
 [<ffffffff804d5f38>] exit_exception_table+0x45/0x77
 [<ffffffff804cf725>] dev_remove+0x0/0xbb
 [<ffffffff804d659f>] snapshot_dtr+0xaa/0xfb
 [<ffffffff804cd422>] dm_table_put+0x6e/0xd8
 [<ffffffff804ccb30>] dm_put+0x9a/0x132
 [<ffffffff804cf7ca>] dev_remove+0xa5/0xbb
 [<ffffffff804d066f>] ctl_ioctl+0x26f/0x2ae
 [<ffffffff8024004d>] do_ioctl+0x6d/0x82
 [<ffffffff8022de9e>] vfs_ioctl+0x28e/0x2b0
 [<ffffffff80214ff2>] vfs_write+0x122/0x160
 [<ffffffff8024a91c>] sys_ioctl+0x3c/0x60
 [<ffffffff8025aa0e>] system_call+0x7e/0x83


Code: 0f 0b 68 72 dc 5e 80 c2 53 02 48 39 7a 28 3e 74 0a 0f 0b 68
RIP  [<ffffffff802074cd>] kmem_cache_free+0x5e/0xba
 RSP <ffff81001b62bc48>
-----

The command line entered is :
# lvremove -d -v filer1/backup_stor_7
    Using logical volume(s) on command line
  /dev/dm-16: read failed after 0 of 4096 at 0: Input/Output error
Do you really want to remove active logical volume "backup_stor_7"? [y/n]: y
    Archiving volume group "filer1" metadata (seqno 197).
    Found volume group "filer1"
    Removing filer1-backup_stor_7 (254:16)
Segmentation Fault

"lvs" still display the "failed-to-remove" device :
# lvs | grep backup_stor_7
  /dev/dm-16: open failed: No such device or address
  backup_stor_7              filer1 swi---  20.00G stor

"dmsetup status" may help understanding what's going on :
# dmsetup status
[output with unused thing wiped]
filer1-backup_stor_1: 0 734003200 snapshot 31583232/62914560
filer1-backup_stor_1-cow: 0 62914560 linear
filer1-backup_stor_7-cow: 0 41943040 linear
filer1-stor: 0 734003200 snapshot-origin
filer1-stor-real: 0 314572800 linear
filer1-stor-real: 314572800 293601280 linear
filer1-stor-real: 608174080 62914560 linear
filer1-stor-real: 671088640 62914560 linear

Remarks: filer1-backup_stor_7 is missing. The COW storage is still 
present, but not the snapshot device.

More informations following :
- VG is "filer1" storage LV is "stor", snapshot LV is "backup_stor_7"
- It may be useful to know that there is already another snapshot device 
present: filer1/backup_stor_1 (snapshot: dm-14, COW: dm-13).
- /dev/dm-16 is the snapshot device input/output on causes errors 
because the snapshot is full, nothing wrong here.
- /dev/dm-15 is the COW snapshot device (here : 
/dev/mapper/filer1-backup_stor_7-cow)
- /dev/dm-11 is the real storage device (here: /dev/mapper/filer1-stor-real)
- /dev/dm-12 is the snapshot origin (here: /dev/mapper/filer1-stor)

- environment is SMP (dual xeon) server running on Linux 2.6.18 x86_64
- LVM version: 2.02.10 (2006-09-19)
- Library version: 1.02.10 (2006-09-19)
- Driver version: 4.7.0

I can provide other useful informations if needed.

Gabriel
