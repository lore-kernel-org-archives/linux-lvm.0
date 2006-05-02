Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k429WQAY017912
	for <linux-lvm@redhat.com>; Tue, 2 May 2006 05:32:26 -0400
Received: from mail.reagi.com (mail.reagi.com [195.60.188.80])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k429WOKL025340
	for <linux-lvm@redhat.com>; Tue, 2 May 2006 05:32:24 -0400
From: "Gabriel Barazer" <gabriel@oxeva.fr>
Date: Tue, 2 May 2006 11:32:23 +0200
Message-ID: <01b701c66dcb$5176d9d0$0101000a@jack>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Snapshot segfaults lvremove + bug kernel
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

Hello,

I recently posted a LVM freeze while deleting snapshot, which could be workaround-ed by issuing a dmsetup resume command.

I was replied on the list that my tools weren't up to date (i had the stable versions, the up to date are devel), so I retried the whole thing (adding/deleting snapshot) with the new tools 
Versions are :
Kernel 2.6.16.1
LVM 2.02.05
Livdevmapper 1.02.05
Driver 4.5.0

The lvcreate has been successfully created , but the lvremove after gave me a segfault. Then the whole LVM system froze. After hard-rebooting, the snapshot is still here. Anyone got the same , or found a solution ?

Here is the kernel bug detail :

May  2 11:01:19 filer1 kernel: ----------- [cut here ] --------- [please bite here ] ---------
May  2 11:01:19 filer1 kernel: Kernel BUG at drivers/md/kcopyd.c:146
May  2 11:01:19 filer1 kernel: invalid opcode: 0000 [1] SMP
May  2 11:01:19 filer1 kernel: CPU 2
May  2 11:01:19 filer1 kernel: Modules linked in:
May  2 11:01:19 filer1 kernel: Pid: 22328, comm: lvremove Not tainted 2.6.16.1 #1
May  2 11:01:19 filer1 kernel: RIP: 0010:[<ffffffff80378628>] <ffffffff80378628>{client_free_pages+12}
May  2 11:01:19 filer1 kernel: RSP: 0000:ffff810056effcb8  EFLAGS: 00010287
May  2 11:01:19 filer1 kernel: RAX: 0000000000000100 RBX: ffff810011a46cc0 RCX: 000000000000004c
May  2 11:01:19 filer1 kernel: RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff810011a46cc0
May  2 11:01:19 filer1 kernel: RBP: ffffc20000029080 R08: ffff810002f97c18 R09: 0000000000000000
May  2 11:01:19 filer1 kernel: R10: ffff81007b489200 R11: ffff8100474d13c0 R12: 0000000000000000
May  2 11:01:19 filer1 kernel: R13: 00000000c138fd04 R14: 00000000005a81f0 R15: ffffffff80377031
May  2 11:01:19 filer1 kernel: FS:  00002b71ca6386e0(0000) GS:ffff81007ff11340(0000) knlGS:0000000000000000
May  2 11:01:19 filer1 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
May  2 11:01:19 filer1 kernel: CR2: 000000000043c3c0 CR3: 0000000050ee8000 CR4: 00000000000006e0
May  2 11:01:19 filer1 kernel: Process lvremove (pid: 22328, threadinfo ffff810056efe000, task ffff81007f0c37a0)
May  2 11:01:19 filer1 kernel: Stack: ffff810011a46cc0 ffffffff80378fe3 ffff81001b976bc0 ffffffff8037cd87
May  2 11:01:19 filer1 kernel:        ffff8100641ef8c8 ffffc20000029080 ffff81007f381e00 ffffffff803750b9
May  2 11:01:19 filer1 kernel:        ffff81007f381e00 ffff8100474d11c0
May  2 11:01:19 filer1 kernel: Call Trace: <ffffffff80378fe3>{kcopyd_client_destroy+20}
May  2 11:01:19 filer1 kernel:        <ffffffff8037cd87>{snapshot_dtr+217} <ffffffff803750b9>{dm_table_put+95}
May  2 11:01:19 filer1 kernel:        <ffffffff8037685e>{__hash_remove+124} <ffffffff80377077>{dev_remove+70}
May  2 11:01:19 filer1 kernel:        <ffffffff80377d6b>{ctl_ioctl+600} <ffffffff80451bc1>{__sched_text_start+1473}
May  2 11:01:19 filer1 kernel:        <ffffffff80180865>{do_ioctl+93} <ffffffff80180ae1>{vfs_ioctl+618}
May  2 11:01:19 filer1 kernel:        <ffffffff80180b2e>{sys_ioctl+60} <ffffffff8010a9a6>{system_call+126}
May  2 11:01:19 filer1 kernel:
May  2 11:01:19 filer1 kernel: Code: 0f 0b 68 06 93 4b 80 c2 92 00 48 8b 7b 18 e8 b6 ff ff ff 48
May  2 11:01:19 filer1 kernel: RIP <ffffffff80378628>{client_free_pages+12} RSP <ffff810056effcb8>
May  2 11:01:19 filer1 kernel:  <1>Unable to handle kernel NULL pointer dereference at 0000000000000040 RIP:
May  2 11:01:19 filer1 kernel: <ffffffff80174ca6>{bio_add_page+22}
May  2 11:01:19 filer1 kernel: PGD 0
May  2 11:01:19 filer1 kernel: Oops: 0000 [2] SMP
May  2 11:01:19 filer1 kernel: CPU 0
May  2 11:01:19 filer1 kernel: Modules linked in:
May  2 11:01:19 filer1 kernel: Pid: 2775, comm: kcopyd Not tainted 2.6.16.1 #1
May  2 11:01:19 filer1 kernel: RIP: 0010:[<ffffffff80174ca6>] <ffffffff80174ca6>{bio_add_page+22}
May  2 11:01:19 filer1 kernel: RSP: 0018:ffff81007af9bcf0  EFLAGS: 00010206
May  2 11:01:19 filer1 kernel: RAX: 0000000000000000 RBX: ffff810078152d00 RCX: 0000000000001000
May  2 11:01:19 filer1 kernel: RDX: ffff810002284bc8 RSI: ffff810002284bc8 RDI: ffff810078152d00
May  2 11:01:19 filer1 kernel: RBP: 0000000000000010 R08: 0000000000000000 R09: ffff81007fbd68e0
May  2 11:01:19 filer1 kernel: R10: ffff810078152d00 R11: ffff81007f837958 R12: ffff81007af9bdc8
May  2 11:01:19 filer1 kernel: R13: ffff81007af96380 R14: ffff81005bb73500 R15: 0000000000000001
May  2 11:01:19 filer1 kernel: FS:  0000000000000000(0000) GS:ffffffff80600000(0000) knlGS:0000000000000000
May  2 11:01:19 filer1 kernel: CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
May  2 11:01:19 filer1 kernel: CR2: 0000000000000040 CR3: 000000007b1d2000 CR4: 00000000000006e0
May  2 11:01:19 filer1 kernel: Process kcopyd (pid: 2775, threadinfo ffff81007af9a000, task ffff81007fbd68e0)
May  2 11:01:19 filer1 kernel: Stack: ffffffff803781ef 0000000000000246 ffff81007af96380 000000017fafb6c0
May  2 11:01:19 filer1 kernel:        ffff810002284bc8 0000000000001000 0000000080150ab2 ffffffff80377f95
May  2 11:01:19 filer1 kernel:        ffffffff80377fb6 ffff810000000000
May  2 11:01:19 filer1 kernel: Call Trace: <ffffffff803781ef>{dispatch_io+344} <ffffffff80377f95>{list_get_page+0}
May  2 11:01:19 filer1 kernel:        <ffffffff80377fb6>{list_next_page+0} <ffffffff80378722>{complete_io+0}
May  2 11:01:19 filer1 kernel:        <ffffffff803783e5>{async_io+172} <ffffffff80378722>{complete_io+0}
May  2 11:01:19 filer1 kernel:        <ffffffff80378508>{dm_io_async+64} <ffffffff80377f95>{list_get_page+0}
May  2 11:01:19 filer1 kernel:        <ffffffff80377fb6>{list_next_page+0} <ffffffff80378800>{run_io_job+0}
May  2 11:01:19 filer1 kernel:        <ffffffff803789f6>{do_work+0} <ffffffff80378844>{run_io_job+68}
May  2 11:01:19 filer1 kernel:        <ffffffff8037891c>{process_jobs+28} <ffffffff8013fdfa>{run_workqueue+155}
May  2 11:01:19 filer1 kernel:        <ffffffff8013fe41>{worker_thread+0} <ffffffff80143248>{keventd_create_kthread+0}
May  2 11:01:19 filer1 kernel:        <ffffffff8013ff46>{worker_thread+261} <ffffffff8012a872>{default_wake_function+0}
May  2 11:01:19 filer1 kernel:        <ffffffff80143248>{keventd_create_kthread+0} <ffffffff8012a872>{default_wake_function+0}
May  2 11:01:19 filer1 kernel:        <ffffffff80143248>{keventd_create_kthread+0} <ffffffff8014321f>{kthread+200}
May  2 11:01:19 filer1 kernel:        <ffffffff8010b89e>{child_rip+8} <ffffffff80143248>{keventd_create_kthread+0}
May  2 11:01:19 filer1 kernel:        <ffffffff80143157>{kthread+0} <ffffffff8010b896>{child_rip+0}
May  2 11:01:19 filer1 kernel:
May  2 11:01:19 filer1 kernel: Code: 48 8b 78 40 4c 89 d6 44 0f b7 8f 54 02 00 00 e9 e6 fd ff ff
May  2 11:01:19 filer1 kernel: RIP <ffffffff80174ca6>{bio_add_page+22} RSP <ffff81007af9bcf0>
May  2 11:01:19 filer1 kernel: CR2: 0000000000000040
----

Hardware is dual xeon em64t on 64bit fedora3-based distro.

-- 
Gabriel Barazer <gabriel@oxeva.fr>
OXEVA
Tel: +33 (0) 478 37 12 05
Fax: +33 (0) 472 56 50 49
