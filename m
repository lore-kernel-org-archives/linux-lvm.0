Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iALIFHr12858
	for <linux-lvm@redhat.com>; Sun, 21 Nov 2004 13:15:17 -0500
Received: from bender.bawue.de (bender.bawue.de [193.7.176.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iALIFG9J027178
	for <linux-lvm@redhat.com>; Sun, 21 Nov 2004 13:15:16 -0500
Received: from bear.sommrey.de (jo@bear.sommrey.de [127.0.0.1])
	by bear.sommrey.de (8.13.1/8.13.1/Debian-15) with ESMTP id
	iALIF9kk007768
	for <linux-lvm@redhat.com>; Sun, 21 Nov 2004 19:15:09 +0100
Received: (from jo@localhost)
	by bear.sommrey.de (8.13.1/8.13.1/Submit) id iALIF93J007764
	for linux-lvm@redhat.com; Sun, 21 Nov 2004 19:15:09 +0100
Date: Sun, 21 Nov 2004 19:15:09 +0100
From: Joerg Sommrey <jo@sommrey.de>
Message-ID: <20041121181509.GA6315@sommrey.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] errors when creating snapshots
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

last night's backup failed on two LVs creating snapshots.  The LVs are
in different VGs and on different physical disks.  Any ideas?

-jo

jo@bear:~:0$ sudo lvm version
  LVM version:     2.00.24 (2004-09-16)
  Library version: 1.00.19-ioctl (2004-07-03)
  Driver version:  4.1.0
jo@bear:~:0$ uname -a
Linux bear 2.6.9-ac8 #2 SMP Sun Nov 14 16:38:45 CET 2004 i686 GNU/Linux

syslog:
Nov 21 03:00:48 bear kernel: lvcreate: page allocation failure. order:4, mode:0xd0
Nov 21 03:00:48 bear kernel:  [__alloc_pages+457/912] __alloc_pages+0x1c9/0x390
Nov 21 03:00:48 bear kernel:  [check_poison_obj+47/480] check_poison_obj+0x2f/0x1e0
Nov 21 03:00:48 bear kernel:  [__get_free_pages+37/64] __get_free_pages+0x25/0x40
Nov 21 03:00:48 bear kernel:  [kmem_getpages+33/208] kmem_getpages+0x21/0xd0
Nov 21 03:00:48 bear kernel:  [dbg_redzone1+21/48] dbg_redzone1+0x15/0x30
Nov 21 03:00:48 bear kernel:  [cache_grow+176/352] cache_grow+0xb0/0x160
Nov 21 03:00:48 bear kernel:  [cache_alloc_refill+428/640] cache_alloc_refill+0x1ac/0x280
Nov 21 03:00:48 bear kernel:  [__kmalloc+188/240] __kmalloc+0xbc/0xf0
Nov 21 03:00:48 bear kernel:  [mempool_resize+156/416] mempool_resize+0x9c/0x1a0
Nov 21 03:00:48 bear kernel:  [resize_pool+100/224] resize_pool+0x64/0xe0
Nov 21 03:00:48 bear kernel:  [dm_create_persistent+40/320] dm_create_persistent+0x28/0x140
Nov 21 03:00:48 bear kernel:  [snapshot_ctr+804/912] snapshot_ctr+0x324/0x390
Nov 21 03:00:48 bear kernel:  [dm_table_add_target+262/432] dm_table_add_target+0x106/0x1b0
Nov 21 03:00:48 bear kernel:  [populate_table+130/224] populate_table+0x82/0xe0
Nov 21 03:00:48 bear kernel:  [table_load+104/320] table_load+0x68/0x140
Nov 21 03:00:48 bear kernel:  [ctl_ioctl+241/336] ctl_ioctl+0xf1/0x150
Nov 21 03:00:48 bear kernel:  [table_load+0/320] table_load+0x0/0x140
Nov 21 03:00:48 bear kernel:  [sys_ioctl+253/640] sys_ioctl+0xfd/0x280
Nov 21 03:00:48 bear kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Nov 21 03:00:48 bear kernel: device-mapper: : Couldn't create exception store
Nov 21 03:00:48 bear kernel: 
Nov 21 03:00:48 bear kernel: device-mapper: error adding target to table
Nov 21 03:00:48 bear kernel: lvcreate: page allocation failure. order:4, mode:0xd0
Nov 21 03:00:48 bear kernel:  [__alloc_pages+457/912] __alloc_pages+0x1c9/0x390
Nov 21 03:00:48 bear kernel:  [check_poison_obj+47/480] check_poison_obj+0x2f/0x1e0
Nov 21 03:00:48 bear kernel:  [__get_free_pages+37/64] __get_free_pages+0x25/0x40
Nov 21 03:00:48 bear kernel:  [kmem_getpages+33/208] kmem_getpages+0x21/0xd0
Nov 21 03:00:48 bear kernel:  [dbg_redzone1+21/48] dbg_redzone1+0x15/0x30
Nov 21 03:00:48 bear kernel:  [cache_grow+176/352] cache_grow+0xb0/0x160
Nov 21 03:00:48 bear kernel:  [cache_alloc_refill+428/640] cache_alloc_refill+0x1ac/0x280
Nov 21 03:00:48 bear kernel:  [__kmalloc+188/240] __kmalloc+0xbc/0xf0
Nov 21 03:00:48 bear kernel:  [mempool_resize+156/416] mempool_resize+0x9c/0x1a0
Nov 21 03:00:48 bear kernel:  [resize_pool+100/224] resize_pool+0x64/0xe0
Nov 21 03:00:48 bear kernel:  [dm_create_persistent+40/320] dm_create_persistent+0x28/0x140
Nov 21 03:00:48 bear kernel:  [snapshot_ctr+804/912] snapshot_ctr+0x324/0x390
Nov 21 03:00:48 bear kernel:  [dm_table_add_target+262/432] dm_table_add_target+0x106/0x1b0
Nov 21 03:00:48 bear kernel:  [populate_table+130/224] populate_table+0x82/0xe0
Nov 21 03:00:48 bear kernel:  [table_load+104/320] table_load+0x68/0x140
Nov 21 03:00:48 bear kernel:  [ctl_ioctl+241/336] ctl_ioctl+0xf1/0x150
Nov 21 03:00:48 bear kernel:  [table_load+0/320] table_load+0x0/0x140
Nov 21 03:00:48 bear kernel:  [sys_ioctl+253/640] sys_ioctl+0xfd/0x280
Nov 21 03:00:48 bear kernel:  [smp_apic_timer_interrupt+151/272] smp_apic_timer_interrupt+0x97/0x110
Nov 21 03:00:48 bear kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Nov 21 03:00:48 bear kernel: device-mapper: : Couldn't create exception store
Nov 21 03:00:48 bear kernel: 
Nov 21 03:00:48 bear kernel: device-mapper: error adding target to table
