Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pBDMsFCS000834
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2011 17:54:15 -0500
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBDMsDkt026362
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2011 17:54:13 -0500
Received: from c-66-30-139-20.hsd1.nh.comcast.net ([66.30.139.20]
	helo=[192.168.1.128]) by youngberry.canonical.com with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.71)
	(envelope-from <peter.petrakis@canonical.com>) id 1RabEi-0001h8-S9
	for linux-lvm@redhat.com; Tue, 13 Dec 2011 22:54:12 +0000
Message-ID: <4EE7D78A.2080704@canonical.com>
Date: Tue, 13 Dec 2011 17:54:02 -0500
From: "Peter M. Petrakis" <peter.petrakis@canonical.com>
MIME-Version: 1.0
References: <20111213114558.7acbf2e9@bettercgi.com>
	<4EE79B02.5050709@canonical.com>
	<20111213141040.3b090df3@bettercgi.com>
In-Reply-To: <20111213141040.3b090df3@bettercgi.com>
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
To: linux-lvm@redhat.com



On 12/13/2011 03:10 PM, Ray Morris wrote:
> 
> On Tue, 13 Dec 2011 13:35:46 -0500
> "Peter M. Petrakis" <peter.petrakis@canonical.com> wrote:
> 
> 
>> Do you by any chance have active LVM snapshots? If so how many and
>> how long have they been provisioned for?
> 
> I forgot to mention that. There are now three snapshots, one on each of

What distro and kernel on you on?

> three LVs, that have been provisioned for a few hours. These LVs aren't 
> in active use, but are backups, synced daily. So basically the only 
> activity is rsync once daily, bandwidth limited to be fairly slow. One 
> logical volume that locked up when trying to write to it had a snapshot.

LVM snapshots can be very I/O intensive, even when you're not directly using them.


> Prior to this most recent rebuild, there were a lot of snap shots - 
> three on each of fifteen LVs. I replaced that VG with a fresh one 
> and it seemed to work for a while. I thought the problem was likely 
> related to lots of long lived snapshots, but after completely rebuilding
> the VG after deleting all snapshots the problem recurred very quickly, 
> before there were many snapshots and before there was a lot of IO 
> to the snaps
> 
> I realize I'm somewhat abusing snapshots - they weren't designed to 
> be long lived. Therefore my "torture test" usage may reveal problems 
> that wouldn't happen often with very short lived snapshots. 

That's right :). Some have reported as high as 50% impact on performance.

> Another similar server has more snapshots on more LVs running the 
> same rsyncs without obvious trouble.
> 
> I should also have mentioned sequential writes to one LV at a time 
> don't seem to trigger the problem. I copied the whole VG one LV 
> at a time with:
> dd if=/dev/oldvg/lv1 of=/dev/newvg/lv1

> Copying the entire LVs sequentially saw no problems. Later when I tried 
> to rsync to the LVs the problem showed itself.

That's remarkable as it removes the fs from the equation. What
fs are you using?

> 
>>>>    filter = [ "a|^/dev/md.*|", "a|^/dev/sd.*|",
>>>> "a|^/dev/etherd/.*|","r|^/dev/ram.*|", "r|block|", "r/.*/" ]
>>>
>> Is it intentional to include sd devices? Just because the MD uses
>> them doesn't mean you have to make allowances for them here.
> 
> 
> Some /dev/sdX devices were used, but no more and I have now removed 
> sd.* and etherd.
> 
> 
>>> <     locking_dir = "/var/lock/lvm"
>>> ---
>>>>     locking_dir = "/dev/shm"
>>
>> Why?
> 
> This was changed AFTER the problem started.
> Because comment in the file says:
> 
>   # Local non-LV directory that holds file-based locks while commands
>   # are in progress.  
> 
> Because /var/lock is on an LV, I tried switching it to a directory that 
> will never be on an LV. That didn't seem to have any effect.

Not a bad idea. Returning to the backtrace:

...
Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa01feca5>] raid5_quiesce+0x125/0x1a0 [raid456]
Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8105c580>] ? default_wake_function+0x0/0x20
Dec 13 09:15:52 clonebox3 kernel: [<ffffffff810563f3>] ? __wake_up+0x53/0x70
Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa02070c1>] make_request+0x501/0x520 [raid456]
Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8102ea69>] ? native_smp_send_reschedule+0x49/0x60
Dec 13 09:15:52 clonebox3 kernel: [<ffffffff810508e8>] ? resched_task+0x68/0x80
Dec 13 09:15:52 clonebox3 kernel: [<ffffffff813d09fb>] md_make_request+0xcb/0x230

Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8105c484>] ? try_to_wake_up+0x284/0x380
Dec 13 09:15:52 clonebox3 kernel: [<ffffffff81241982>] generic_make_request+0x1b2/0x4f0
...

Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa00029c4>] ? dm_wait_for_completion+0xd4/0x100 [dm_mod]
Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa0003836>] dm_flush+0x56/0x70 [dm_mod]
Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa00038a4>] dm_wq_work+0x54/0x200 [dm_mod]
...
Dec 13 09:15:52 clonebox3 kernel: INFO: task kcopyd:31629 blocked for more than 120 seconds.
Dec 13 09:15:52 clonebox3 kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
Dec 13 09:15:52 clonebox3 kernel: kcopyd        D ffff88007b824700     0 31629      2 0x00000080
Dec 13 09:15:52 clonebox3 kernel: ffff880044aa7ac0 0000000000000046 ffff880044aa7a88 ffff880044aa7a84
Dec 13 09:15:52 clonebox3 kernel: ffff880044aa7ae0 ffff88007b824700 ffff880001e16980 00000001083f7280

raid5_quiesce should have been straight forward

http://lxr.linux.no/linux+v3.1.5/drivers/md/raid5.c#L5422

From the stack context I expect it to in case 2 or 0. It could also be stuck on a lock or it
really did stop writes.

At this point I think you might have more of an MD issue than anything else. If you could take MD
out of the picture by using a single disk or use a HW RAID, that would be a really useful data point.

I would also investigate the health of your RAID. Look back in the logs for members being ejected
and then re-introduced. Also if you have any scripts that use mdadm to ping the array for status you might
want to stop those too. Sounds like the linux-raid list is your next stop.

Peter
