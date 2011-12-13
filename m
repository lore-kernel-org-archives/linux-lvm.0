Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pBDIZxqt021771
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2011 13:35:59 -0500
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBDIZvNp014047
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2011 13:35:58 -0500
Received: from c-66-30-139-20.hsd1.nh.comcast.net ([66.30.139.20]
	helo=[192.168.1.128]) by youngberry.canonical.com with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.71)
	(envelope-from <peter.petrakis@canonical.com>) id 1RaXCm-0000XP-Lx
	for linux-lvm@redhat.com; Tue, 13 Dec 2011 18:35:56 +0000
Message-ID: <4EE79B02.5050709@canonical.com>
Date: Tue, 13 Dec 2011 13:35:46 -0500
From: "Peter M. Petrakis" <peter.petrakis@canonical.com>
MIME-Version: 1.0
References: <20111213114558.7acbf2e9@bettercgi.com>
In-Reply-To: <20111213114558.7acbf2e9@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] access through LVM causes D state lock up
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>



On 12/13/2011 12:45 PM, Ray Morris wrote:
> I've been struggling for some time with a problem wherein at times
> the machine locks up, with access throgh LVM hanging. I can read and 
> write the physical volumes with "dd", but trying to read or write 
> the logical volume hangs. pvdisplay also hangs. The PVs, which seem 
> to accept writes just fine, are mdadm raid volumes.
> 
> I experienced this before under 5.7 and am now experiencing the same
> with 6.0 using lvm2-2.02.72-8.el6_0.4.x86_64. I've also experienced 
> it on entirely different hardware, with different controller chipsets.
> 
> I'm pretty much at my wits end and would appreciate any pointers as 
> to where to look next.

> The differences between our current lvm.conf and the default are as
> follows:
> 
>  53c53
> <     filter = [ "a/.*/" ]
> ---
> 54a55
>>    filter = [ "a|^/dev/md.*|", "a|^/dev/sd.*|", "a|^/dev/etherd/.*|","r|^/dev/ram.*|", "r|block|", "r/.*/" ]
>

Is it intentional to include sd devices? Just because the MD uses them doesn't mean you have
to make allowances for them here.

> 101,104d101
> < 
> 118,120c115,117
> ---
> 129d125
> 139,144d134
> <     disable_after_error_count = 0
> < 
> 
> 
> Extra logging
> 191c162
> <     level = 0
> ---
>>     level = 5
> 198c169
> <     command_names = 0
> ---
>>     command_names = 1
> 270c241
> <     units = "h"
> ---
>>     units = "G"
> 331c302
> <     locking_dir = "/var/lock/lvm"
> ---
>>     locking_dir = "/dev/shm"

Why?


> 356,362d326
> < 
> <     metadata_read_only = 0
> 407c371
> < 
> ---
> 
> 535a481
>>     pvmetadatasize = 32768
> 
> 
> When the machine locks up, /var/log/messages shows processes "blocked 
> for more than 120 seconds" as shown below.  What other information 
> should I be loooking to diagnose and resolve this issue?
> 
> 
> Dec 13 09:13:26 clonebox3 lvm[32461]: Using logical volume(s) on command line
> Dec 13 09:15:52 clonebox3 kernel: INFO: task kdmflush:31627 blocked for more than 120 seconds.
> Dec 13 09:15:52 clonebox3 kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> Dec 13 09:15:52 clonebox3 kernel: kdmflush      D ffff88007b824300     0 31627      2 0x00000080
> Dec 13 09:15:52 clonebox3 kernel: ffff8800372af9f0 0000000000000046 ffff8800372af9b8 ffff8800372af9b4
> Dec 13 09:15:52 clonebox3 kernel: ffff8800372af9e0 ffff88007b824300 ffff880001e96980 00000001083f7318
> Dec 13 09:15:52 clonebox3 kernel: ffff880076f27ad8 ffff8800372affd8 0000000000010518 ffff880076f27ad8
> Dec 13 09:15:52 clonebox3 kernel: Call Trace:
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa01feca5>] raid5_quiesce+0x125/0x1a0 [raid456]
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8105c580>] ? default_wake_function+0x0/0x20
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff810563f3>] ? __wake_up+0x53/0x70
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa02070c1>] make_request+0x501/0x520 [raid456]
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8102ea69>] ? native_smp_send_reschedule+0x49/0x60
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff810508e8>] ? resched_task+0x68/0x80
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff813d09fb>] md_make_request+0xcb/0x230
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8105c484>] ? try_to_wake_up+0x284/0x380
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff81241982>] generic_make_request+0x1b2/0x4f0
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8110e925>] ? mempool_alloc_slab+0x15/0x20
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8110ea33>] ? mempool_alloc+0x63/0x140
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa00016bd>] __map_bio+0xad/0x130 [dm_mod]
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa00017ef>] __issue_target_requests+0xaf/0xd0 [dm_mod]
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa000351f>] __split_and_process_bio+0x59f/0x630 [dm_mod]
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8109225c>] ? remove_wait_queue+0x3c/0x50
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa00029c4>] ? dm_wait_for_completion+0xd4/0x100 [dm_mod]
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa0003836>] dm_flush+0x56/0x70 [dm_mod]
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa00038a4>] dm_wq_work+0x54/0x200 [dm_mod]
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa0003850>] ? dm_wq_work+0x0/0x200 [dm_mod]
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8108c7d0>] worker_thread+0x170/0x2a0
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff81091ea0>] ? autoremove_wake_function+0x0/0x40
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8108c660>] ? worker_thread+0x0/0x2a0
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff81091b36>] kthread+0x96/0xa0
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff810141ca>] child_rip+0xa/0x20
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff81091aa0>] ? kthread+0x0/0xa0
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff810141c0>] ? child_rip+0x0/0x20
> Dec 13 09:15:52 clonebox3 kernel: INFO: task kcopyd:31629 blocked for more than 120 seconds.
> Dec 13 09:15:52 clonebox3 kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> Dec 13 09:15:52 clonebox3 kernel: kcopyd        D ffff88007b824700     0 31629      2 0x00000080
> Dec 13 09:15:52 clonebox3 kernel: ffff880044aa7ac0 0000000000000046 ffff880044aa7a88 ffff880044aa7a84
> Dec 13 09:15:52 clonebox3 kernel: ffff880044aa7ae0 ffff88007b824700 ffff880001e16980 00000001083f7280
> 

Do you by any chance have active LVM snapshots? If so how many and how long have they been provisioned for?

Peter
