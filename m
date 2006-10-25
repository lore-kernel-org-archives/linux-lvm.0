Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9PA1ZvH008985
	for <linux-lvm@redhat.com>; Wed, 25 Oct 2006 06:01:35 -0400
Received: from mail.reagi.com (mail.reagi.com [195.60.188.80])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9PA1W1c018670
	for <linux-lvm@redhat.com>; Wed, 25 Oct 2006 06:01:32 -0400
Message-ID: <453F35F3.9090505@oxeva.fr>
Date: Wed, 25 Oct 2006 12:01:23 +0200
From: Gabriel Barazer <gabriel@oxeva.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Yet another problem with snapshots
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

I have found another kernel bug related to LVM snapshots. This time it's
better than previously : It doesn't freeze the LVM system, but segfaults
anyway. Here is the scenario :

- Make a snapshot from an online volume.
- Wait until the snapshot is full
- Without deleting the first snapshot (say, I forgot it), create another
from the online main volume.
- Wait until the second snapshot becomes full

Then try to remove any snapshot (I tried to remove the #2). lvremove ask
me if I'm sure to remove the snapshot, I confirm and then the tool
segfaults. When I retry the same command after, lvremove removes the
snapshot without asking confirmation this time. (the first snapshot
removal does the same).

Here is the kernel debug :
----------- [cut here ] --------- [please bite here ] ---------
Kernel BUG at mm/slab.c:595
invalid opcode: 0000 [1] SMP
CPU 1
Modules linked in:
Pid: 29422, comm: lvremove Not tainted 2.6.18 #1
RIP: 0010:[<ffffffff802074cd>]  [<ffffffff802074cd>]
kmem_cache_free+0x5e/0xba
RSP: 0018:ffff8100101a1c48  EFLAGS: 00010246
RAX: 000000000001086c RBX: ffffc200115beec0 RCX: ffff8100010f02c8
RDX: ffff810001aa7788 RSI: ffff810030b47198 RDI: ffff81007eceb800
RBP: 0000000000000000 R08: ffffffff80663388 R09: 0000000000000001
R10: ffff81007ae72b40 R11: ffff810048e89660 R12: ffff810030b47198
R13: 00000000000004ec R14: ffff81006df85828 R15: 0000000000004000
FS:  00002afb962776e0(0000) GS:ffff810002f3a5c0(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: 0000000000451400 CR3: 0000000003b5b000 CR4: 00000000000006e0
Process lvremove (pid: 29422, threadinfo ffff8100101a0000, task
ffff81007f662ae0)
Stack:  ffffc200115beec0 0000000000000000 ffff81007eceb800 ffffffff804d5f38
 0000000000000000 ffff81006df857c0 ffffc20010ec3080 0000000000000000
 ffffc20010643000 ffffffff804cf725 ffffc20010643000 ffffffff804d659f
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
 RSP <ffff8100101a1c48>

Then second lvremove :

 ----------- [cut here ] --------- [please bite here ] ---------
Kernel BUG at mm/slab.c:595
invalid opcode: 0000 [2] SMP
CPU 3
Modules linked in:
Pid: 29423, comm: lvremove Not tainted 2.6.18 #1
RIP: 0010:[<ffffffff802074cd>]  [<ffffffff802074cd>]
kmem_cache_free+0x5e/0xba
RSP: 0018:ffff81005150fc48  EFLAGS: 00010246
RAX: 000000000001086c RBX: ffffc2001138fd40 RCX: ffff8100019812f0
RDX: ffff8100012ebc50 RSI: ffff81000d5a6828 RDI: ffff81007eceb800
RBP: 0000000000000000 R08: ffff81007ae72340 R09: ffff81007caf3540
R10: ffff81007caf35e0 R11: ffff81007ae722c0 R12: ffff81000d5a6828
R13: 00000000000017d4 R14: ffff810042063ce8 R15: 0000000000004000
FS:  00002b28456376e0(0000) GS:ffff81007ff35840(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: 00007fff659b8db0 CR3: 000000004e4bc000 CR4: 00000000000006e0
Process lvremove (pid: 29423, threadinfo ffff81005150e000, task
ffff81007b067000)
Stack:  ffffc2001138fd40 0000000000000000 ffff81007eceb800 ffffffff804d5f38
 0000000000000000 ffff810042063c80 ffffc20010ebb080 0000000000000000
 ffffc20010648000 ffffffff804cf725 ffffc20010648000 ffffffff804d659f
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
 RSP <ffff81005150fc48>

It looks like the same bug is hit on the 2 commands.

This is not as annoying as before, when lvm froze when lvremove-ing
snapshot, but the tool segfaults anyway.

Some plateform info :
Kernel 2.6.18 SMP x86_64
LVM version 2.02.10
Library version : 1.02.10
Driver version : 4.7.0

Hardware is Dual Xeon EM64T and the storage array is 3ware (native scsi
driver)

Does this help anyone ?

Gabriel
