Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9JLQUV26750
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 17:26:30 -0400
Received: from mail.inostor.com (w130.z209220038.sjc-ca.dsl.cnc.net
	[209.220.38.130])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9JLQPnt000639
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 17:26:29 -0400
From: "James G. Sack (jim)" <jsack@inostor.com>
Date: Wed, 19 Oct 2005 14:27:22 -0700
Message-Id: <1129757242.4968.169.camel@jgs4.ino.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Segfault & BUG/OOPS during lvremove snapshot
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
To: LVM LIST <linux-lvm@redhat.com>

I'm assuming that lvm2 snapshots really work and am trying to find the
proper usage recipes, I get a repeatable Segmentation fault on the
command line and a BUG/OOPS to syslog.


The dmesg output is below, the environment and procedural background is
as follows:

tools
  LVM version:     2.01.08 (2005-03-22)
  Library version: 1.01.02 (2005-05-17)
  Driver version:  4.4.0
dmsetup
  Library version:   1.01.02 (2005-05-17)
  Driver version:    4.4.0

 Running Fedora Core 4 (standard yum-updated kernel 2.6.13-1.1526_FC4)
 P3 1200MHz
 1MB RAM
 aic7xxx, 9 disks, but I'm only testing with one partition of one disk
    IBM      Model: IC35L146UCDY10-0 Rev: S21D
 after reboot or prior to a test-run.. 
  pvs shows: /dev/sdh11 VGh11 lvm2 a-   134.71G 74.71G
  vgs shows: VGh11   1   2   1 wz--n 134.71G 74.71G
  lvs shows: 
   L1   VGh11 owi-ao  50.00G
   S1   VGh11 swi-a-  10.00G L1      26.96
  dmsetup info shows 4 ACTIVE devices
 
During my test I repeatedly create a second snapshot "SS" , sleep 10
seconds, and remove the SS snapshot. While this is looping forever, I
repeatedly examine status via dmsetup info commands, and in a third
loop, I repeatedly read the directory tree from the ext3 fs on the
origin volume (L1).

I am not issuing any explicit dmsetup suspend or resume commands in my
test script.


It may take several hundred snapshot create/remove cycles to crash when
only doing filesystem read operations. 
NOTE, HOWEVER: If I substitute a read/write operation for the read
operation, it seems to crash on the first create/remove loop. I believe
it's always during the lvremove call.

NEW NOTE: I had a nagging thought that my test might have been done on
an old test volume with possibly corrupt metadata from previous testing,
so I repeated my experiment on a fresh PV/VG/LV and with only a single
snapshot. I first tried without multiple snapshots and couldn't get a
crash even after considerable read/write activity --UNTIL after I
manually started another snapshot, whereupon the test loop then
triggered the same BUG after only a little more i/o. More oopses will be
furnished on request.


typical dmesg output follows
------------[ cut here ]------------
kernel BUG at drivers/md/kcopyd.c:145!
invalid operand: 0000 [#1]
Modules linked in: xfs exportfs dm_snapshot ipv6 parport_pc lp parport
autofs4 rfcomm l2cap bluetooth sunrpc ohci_hcd i2c_piix4 i2c_core tulip
e100 mii floppy ext3 jbd raid1 dm_mod aic7xxx scsi_transport_spi sd_mod
scsi_mod
CPU:    0
EIP:    0060:[<f886da1a>]    Not tainted VLI
EFLAGS: 00010287   (2.6.13-1.1526_FC4) 
EIP is at client_free_pages+0x2a/0x40 [dm_mod]
eax: 00000100   ebx: f3074a20   ecx: f7fff060   edx: 00000000
esi: f9167080   edi: 00000000   ebp: 00000000   esp: f6230f1c
ds: 007b   es: 007b   ss: 0068
Process lvremove (pid: 10432, threadinfo=f6230000 task=f66b7aa0)
Stack: f3074a20 f886efc2 c1ac65c0 f89c296f f9167080 f59e6280 f8868d3b
f6384b80 
       f89e8000 00000004 f886b460 f886acba f8875860 f886b4af f6230000
00000000 
       f886c96d f89e8000 f886c8a0 f666dec0 08642188 f6230000 c01affee
08642188 
Call Trace:
 [<f886efc2>] kcopyd_client_destroy+0x12/0x26 [dm_mod]
 [<f89c296f>] snapshot_dtr+0x4f/0x60 [dm_snapshot]
 [<f8868d3b>] table_destroy+0x3b/0x90 [dm_mod]
 [<f886b460>] dev_remove+0x0/0xd0 [dm_mod]
 [<f886acba>] __hash_remove+0x5a/0xa0 [dm_mod]
 [<f886b4af>] dev_remove+0x4f/0xd0 [dm_mod]
 [<f886c96d>] ctl_ioctl+0xcd/0x110 [dm_mod]
 [<f886c8a0>] ctl_ioctl+0x0/0x110 [dm_mod]
 [<c01affee>] do_ioctl+0x4e/0x60
 [<c01b00ff>] vfs_ioctl+0x4f/0x1c0
 [<c01b02c4>] sys_ioctl+0x54/0x70
 [<c01041e9>] syscall_call+0x7/0xb
Code: 00 53 89 c3 8b 40 24 39 43 28 75 1f 8b 43 20 e8 6d ff ff ff c7 43
20 00 00 00 00 c7 43 24 00 00 00 00 c7 43 28 00 00 00 00 5b c3 <0f> 0b
91 00 cb f3 86 f8 eb d7 8d b6 00 00 00 00 8d bf 00 00 00 
 <1>Unable to handle kernel NULL pointer dereference at virtual address
00000034
 printing eip:
c019b50c
*pde = 00000000
Oops: 0000 [#2]
Modules linked in: xfs exportfs dm_snapshot ipv6 parport_pc lp parport
autofs4 rfcomm l2cap bluetooth sunrpc ohci_hcd i2c_piix4 i2c_core tulip
e100 mii floppy ext3 jbd raid1 dm_mod aic7xxx scsi_transport_spi sd_mod
scsi_mod
CPU:    0
EIP:    0060:[<c019b50c>]    Not tainted VLI
EFLAGS: 00010287   (2.6.13-1.1526_FC4) 
EIP is at bio_add_page+0xc/0x30
eax: 00000000   ebx: f6558740   ecx: 00001000   edx: c1663080
esi: 00000000   edi: f6558740   ebp: f6b1ef30   esp: f6b1ee90
ds: 007b   es: 007b   ss: 0068
Process kcopyd (pid: 3975, threadinfo=f6b1e000 task=f6548000)
Stack: 00000010 f886d02e 00000000 f6592608 00000000 00000001 00000000
00001000 
       c1663080 f6b1ef30 00000000 00000001 00000010 f886d10b f6b1ef30
f63844c0 
       f886ce40 f63844c0 f6592608 00000001 00000001 f886ce60 00000000
f3805560 
Call Trace:
 [<f886d02e>] do_region+0xde/0x110 [dm_mod]
 [<f886d10b>] dispatch_io+0xab/0xd0 [dm_mod]
 [<f886ce40>] list_get_page+0x0/0x20 [dm_mod]
 [<f886ce60>] list_next_page+0x0/0x10 [dm_mod]
 [<f886db60>] complete_io+0x0/0x360 [dm_mod]
 [<f886d28e>] async_io+0x5e/0xb0 [dm_mod]
 [<f886d3d4>] dm_io_async+0x34/0x40 [dm_mod]
 [<f886db60>] complete_io+0x0/0x360 [dm_mod]
 [<f886ce40>] list_get_page+0x0/0x20 [dm_mod]
 [<f886ce60>] list_next_page+0x0/0x10 [dm_mod]
 [<f886dec0>] run_io_job+0x0/0x60 [dm_mod]
 [<f886df12>] run_io_job+0x52/0x60 [dm_mod]
 [<f886db60>] complete_io+0x0/0x360 [dm_mod]
 [<f886e1a6>] process_jobs+0x16/0x590 [dm_mod]
 [<f886e720>] do_work+0x0/0x30 [dm_mod]
 [<c0142c81>] worker_thread+0x271/0x520
 [<c0120170>] default_wake_function+0x0/0x10
 [<c0142a10>] worker_thread+0x0/0x520
 [<c014a935>] kthread+0x85/0x90
 [<c014a8b0>] kthread+0x0/0x90
 [<c01012f1>] kernel_thread_helper+0x5/0x14
Code: 07 00 00 00 00 c7 47 04 00 00 00 00 c7 47 08 00 00 00 00 31 c0 5b
5e 5f 5d c3 90 8d 74 26 00 53 89 c3 8b 40 0c 8b 80 80 00 00 00 <8b> 40
34 ff 74 24 08 51 89 d1 89 da e8 b3 fe ff ff 5a 59 5b c3 
------------------------------------------------------------------------


Regards,
..jim
