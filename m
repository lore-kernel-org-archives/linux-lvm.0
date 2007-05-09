Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l49EHGV3007499
	for <linux-lvm@redhat.com>; Wed, 9 May 2007 10:17:16 -0400
Received: from emailgate2.cpvie.co.at (smtp.cargo-partner.com [195.234.151.28])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l49EHDTO020808
	for <linux-lvm@redhat.com>; Wed, 9 May 2007 10:17:13 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by emailgate2.cpvie.co.at (Postfix) with ESMTP id B013740C67
	for <linux-lvm@redhat.com>; Wed,  9 May 2007 16:17:07 +0200 (CEST)
Received: from [10.10.55.2] (eisenkoe.cp.int [10.10.55.2])
	by emailgate2.cpvie.co.at (Postfix) with ESMTP id 18E8F40C5F
	for <linux-lvm@redhat.com>; Wed,  9 May 2007 16:17:07 +0200 (CEST)
Message-ID: <4641D81D.1040009@cargo-partner.com>
Date: Wed, 09 May 2007 16:18:05 +0200
From: =?ISO-8859-15?Q?Michael_Eisenk=F6lbl_/_FIS?=
	<michael.eisenkoelbl@cargo-partner.com>
MIME-Version: 1.0
References: <4641D430.1010101@cargo-partner.com>
In-Reply-To: <4641D430.1010101@cargo-partner.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] mirrored lv with 6TB
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

*i am currently using the kernel 2.6.9-42.0.3.ELsmp and 
lvm2-2.02.06-6.0.RHEL4 on RHEL4.4 (32bitCPU) and i have three disks:*
/dev/sdb: 6497.8 GB
/dev/sdc: 6497.8 GB
/dev/sdd: 283 MB

*i want to create a volumegroup with a mirrored lv. but this is only 
possible up to 4TB.
if i want to create a mirrored lv with 6TB, i got kernel panic with 
following in the /var/log/messages:*

kernel: ------------[ cut here ]------------
kernel: kernel BUG at drivers/md/dm-io.c:148!
kernel: invalid operand: 0000 [#1]
kernel: SMP
kernel: Modules linked in: dlm(U) cman(U) ipv6 sunrpc crc32c libcrc32c 
md5 iscsi_sfnet scsi_transport_iscsi dm_mirror dm_mod button bat
tery ac ohci_hcd tg3 bonding(U) floppy sg ext3 jbd mptscsih mptsas 
mptspi mptfc mptscsi mptbase sd_mod scsi_mod
kernel: CPU:    3
kernel: EIP:    0060:[<f892e424>]    Not tainted VLI
kernel: EFLAGS: 00010206   (2.6.9-42.0.3.ELsmp)
kernel: EIP is at bio_set_alloc+0x95/0x11c [dm_mod]
kernel: eax: f532c700   ebx: 0000081f   ecx: f7073980   edx: f531a000
kernel: esi: 00000000   edi: 00000105   ebp: f532c700   esp: f5b85e20
kernel: ds: 007b   es: 007b   ss: 0068
kernel: Process vgchange (pid: 3266, threadinfo=f5b85000 task=f54ca0b0)
kernel: Stack: 00000004 00000000 00000010 f8937bc0 0000081f 00000000 
00000000 00000000
kernel:        f892e810 c2b3b164 00000000 00000010 00000019 c283dde0 
f5b539b0 f5b85ee8
kernel:        00000010 00000000 00000000 f892e957 f5b85ee8 f5b85eb0 
c2b3b164 00000001
kernel: Call Trace:
kernel:  [<f892e810>] do_region+0x40/0x104 [dm_mod]
kernel:  [<f892e957>] dispatch_io+0x83/0xa4 [dm_mod]
kernel:  [<f892e773>] vm_get_page+0x0/0x2a [dm_mod]
kernel:  [<f892e79d>] vm_next_page+0x0/0x17 [dm_mod]
kernel:  [<f892e9f3>] sync_io+0x7b/0xdf [dm_mod]
kernel:  [<f892eb85>] dm_io_sync_vm+0x2a/0x32 [dm_mod]
kernel:  [<f892e773>] vm_get_page+0x0/0x2a [dm_mod]
kernel:  [<f892e79d>] vm_next_page+0x0/0x17 [dm_mod]
kernel:  [<f88b929b>] read_bits+0x16/0x1a [dm_mirror]
kernel:  [<f88b9760>] disk_resume+0x2c/0x184 [dm_mirror]
kernel:  [<f88b9734>] disk_resume+0x0/0x184 [dm_mirror]
kernel:  [<f88bbe12>] mirror_resume+0x14/0x2c [dm_mirror]
kernel:  [<f892b6e5>] dm_table_resume_targets+0x27/0x37 [dm_mod]
kernel:  [<f892a538>] dm_resume+0x68/0x102 [dm_mod]
kernel:  [<f892cf8e>] do_resume+0x158/0x178 [dm_mod]
kernel:  [<f892df16>] ctl_ioctl+0xd9/0x13c [dm_mod]
kernel:  [<f892cfae>] dev_suspend+0x0/0x10 [dm_mod]
kernel:  [<c016add6>] sys_ioctl+0x227/0x269
kernel:  [<c02d47cb>] syscall_call+0x7/0xb
kernel: Code: 04 24 00 00 00 00 4f 74 31 eb 20 c7 04 24 04 00 00 00 81 
ff 80 00 00 00 76 20 81 ff 00 01 00 00 77 09 c7 04 24 05 00 00 0
0 eb 0f <0f> 0b 94 00 59 04 93 f8 c7 04 24 00 00 00 00 8b 04 24 8b 74 24
kernel:  <0>Fatal exception: panic in 5 seconds

*is there any patch outside, which i can use to create bigger volumes?
*
michael
