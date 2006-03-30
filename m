Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2U8AL53003723
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 03:10:21 -0500
Received: from mailgateway.unetix.nl (a213-84-10-61.adsl.xs4all.nl
	[213.84.10.61])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2U8AE39003488
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 03:10:14 -0500
Received: from mailgateway.unetix.nl (localhost [127.0.0.1])
	by mailgateway.unetix.nl (Postfix) with SMTP id CF12D1EF17D
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 10:10:08 +0200 (CEST)
Received: from knoflook.unetix.nl (unknown [192.168.253.129])
	by mailgateway.unetix.nl (Postfix) with ESMTP id C1B921EF17D
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 10:10:08 +0200 (CEST)
From: Wim Bakker <wim@unetix.nl>
Date: Thu, 30 Mar 2006 09:09:22 +0100
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200603301009.22548.wim@unetix.nl>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] snapshot error with xfs and disk I/O
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
To: linux-lvm@redhat.com


Hello ,

There seem to be serious problems with snapshots , lvm2 and xfs.
As soon as there is a slight amount of disk I/O during snapshotting
a logical volume with xfs , the following kind of kernel panic occurs:
--------------------------------------------------------------------------------------------
root@test.cashnet.nl [/root]# umount /backup
root@test.cashnet.nl [/root]# lvremove -f /dev/data/dbackup
Segmentation fault

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel: Oops: 0000 [#1]

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel: SMP

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel: CPU:    0

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel: EIP is at exit_exception_table+0x48/0x8e [dm_snapshot]
root@test.cashnet.nl [/root]#
Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel: eax: 00000000   ebx: e0b62c70   ecx: 00000000   edx: dfbdaf40

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel: esi: 00000000   edi: dfbdaf40   ebp: 00001c70   esp: cdfb9e9c

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel: ds: 007b   es: 007b   ss: 0068

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel: Process lvremove (pid: 14480, threadinfo=cdfb8000 task=df97aa90)

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel: Stack: <0>dfbdaf40 d03cbf88 00002000 0000038e db2fa40c db2fa3c0 
e0ade080 00000040

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:        00000001 e0ab098f db2fa40c dfbdaf40 e0ade080 df4c1480 
e0abc13b e0ade080

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:        dc276d80 df4c1480 00000004 080e2888 e0abb5ed df4c1480 
df4c1480 c9ff2440

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel: Call Trace:

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:  [<e0ab098f>] snapshot_dtr+0x33/0x7c [dm_snapshot]

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:  [<e0abc13b>] table_destroy+0x5b/0xbf [dm_mod]

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:  [<e0abb5ed>] dm_put+0x4c/0x72 [dm_mod]

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:  [<e0abe286>] __hash_remove+0x82/0xb1 [dm_mod]

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:  [<e0abec26>] dev_remove+0x3b/0x85 [dm_mod]

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:  [<e0abfc82>] ctl_ioctl+0xde/0x141 [dm_mod]

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:  [<e0abebeb>] dev_remove+0x0/0x85 [dm_mod]

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:  [<c0176e63>] do_ioctl+0x6f/0xa9

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:  [<c0177046>] vfs_ioctl+0x65/0x1e1

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:  [<c0177247>] sys_ioctl+0x85/0x92

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel:  [<c0102cd9>] syscall_call+0x7/0xb

Message from syslogd@test at Thu Mar 30 09:27:37 2006 ...
test kernel: Code: 83 c2 01 39 54 24 0c 89 54 24 08 7d 4d 8b 50 04 31 ed 8d 1c 
2a 8b 03 39 d8 8b 30 74 1b 89 44 24 04 89 3c 24 e8 bd 00 6b df 89 f0 <8b> 36 
39 d8 75 ec 8b 44 24 10 8b 50 04 83 44 24 0c 01 8b 44 24
----------------------------------------------------------------------------------------------------------------
The system contains two disks , each 80 Gb , with two volume groups :
    PV /dev/md3    VG data     lvm2 [55.30 GB / 4.52 GB free]
  PV /dev/sda3   VG shares   lvm2 [9.32 GB / 0    free]
  PV /dev/sdb3   VG shares   lvm2 [9.32 GB / 3.02 GB free]
  Total: 3 [73.94 GB] / in use: 3 [73.94 GB] / in no VG: 0 [0   ]

one vg is created with a pv of a software raid device , /dev/md3
the other on a pv consisting of two partitions on each disk.
Both have a lv of the same name, data and shares.
From each logical volume every ten minutes a snapshot was taken
from cron , meanwhile I was running a script that caused increasing disk I/O
very slowly. After two days running , the following happened :
6:50am  up 2 days 19:13,  1 user,  load average: 2.53, 3.06, 4.27
---------------
  Logical volume "dbackup" already exists in volume group "data"
mount: /dev/data/dbackup already mounted or /backup busy
mount: according to mtab, /dev/mapper/data-dbackup is already mounted 
on /backup
  Can't remove open logical volume "dbackup"
---------------
The script couldn't do anything anymore with the dbackup snapshot (snapshot
of the data LV).
I stopped the script and unmounted manually /backup whereafter I gave
the command :
lvremove -f /dev/data/dbackup and then the kernel panic , as shown above
happened. The same happened on the original server , that has an areca
hw raid controller , the snapshotting of a LV with xfs goes fine , until at a 
certain point when moderate disk I/O happens , then the kernel panics
and oopses out of service.
Are there patches to fix this problem?

TIA

sincerely
Wim bakker
