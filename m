Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pBDNX5sF003898
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2011 18:33:05 -0500
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBDNX3YA006860
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2011 18:33:04 -0500
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPA id 8335321B4F
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2011 17:33:01 -0600 (CST)
Date: Tue, 13 Dec 2011 17:33:01 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20111213173301.3d504b86@bettercgi.com>
In-Reply-To: <4EE7D78A.2080704@canonical.com>
References: <20111213114558.7acbf2e9@bettercgi.com>
	<4EE79B02.5050709@canonical.com>
	<20111213141040.3b090df3@bettercgi.com>
	<4EE7D78A.2080704@canonical.com>
Mime-Version: 1.0
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

> > On Tue, 13 Dec 2011 13:35:46 -0500
> > "Peter M. Petrakis" <peter.petrakis@canonical.com> wrote

> What distro and kernel on you on?


2.6.32-71.29.1.el6.x86_64 (CentOS 6)


> > Copying the entire LVs sequentially saw no problems. Later when I
> > tried to rsync to the LVs the problem showed itself.
> 
> That's remarkable as it removes the fs from the equation. What
> fs are you using?

ext3

> Not a bad idea. Returning to the backtrace:
...
> raid5_quiesce should have been straight forward
> 
> http://lxr.linux.no/linux+v3.1.5/drivers/md/raid5.c#L5422

Interesting. Not that I speak kernel, but I may have to learn.
Please note the other partial stack trace included refers to a 
different function.


Dec 13 09:15:52 clonebox3 kernel: Call Trace:
Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa01feca5>] raid5_quiesce+0x125/0x1a0 [raid456]
Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8105c580>] ? default_wake_function+0x0/0x20
Dec 13 09:15:52 clonebox3 kernel: [<ffffffff810563f3>] ? __wake_up+0x53/0x70
--
Dec 13 09:15:52 clonebox3 kernel: Call Trace:
Dec 13 09:15:52 clonebox3 kernel: [<ffffffff814c9a53>] io_schedule+0x73/0xc0
Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa0009a15>] sync_io+0xe5/0x180 [dm_mod]
Dec 13 09:15:52 clonebox3 kernel: [<ffffffff81241982>] ? generic_make_request+0x1b2/0x4f0
--
Dec 13 09:15:52 clonebox3 kernel: Call Trace:
Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa00046ec>] ? dm_table_unplug_all+0x5c/0xd0 [dm_mod]
Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8109bba9>] ? ktime_get_ts+0xa9/0xe0
Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8119e960>] ? sync_buffer+0x0/0x50

an earlier occurrence:

Dec  5 23:31:34 clonebox3 kernel: Call Trace:
Dec  5 23:31:34 clonebox3 kernel: [<ffffffff8134ac7d>] ? scsi_setup_blk_pc_cmnd+0x13d/0x170
Dec  5 23:31:34 clonebox3 kernel: [<ffffffffa01e7ca5>] raid5_quiesce+0x125/0x1a0 [raid456]
Dec  5 23:31:34 clonebox3 kernel: [<ffffffff8105c580>] ? default_wake_function+0x0/0x20
--
Dec  5 23:31:34 clonebox3 kernel: Call Trace:
Dec  5 23:31:34 clonebox3 kernel: [<ffffffffa00098fb>] ? dispatch_io+0x22b/0x260 [dm_mod]
Dec  5 23:31:34 clonebox3 kernel: [<ffffffff814c9a53>] io_schedule+0x73/0xc0
Dec  5 23:31:34 clonebox3 kernel: [<ffffffffa0009a15>] sync_io+0xe5/0x180 [dm_mod]
--
Dec  5 23:31:34 clonebox3 kernel: Call Trace:
Dec  5 23:31:34 clonebox3 kernel: [<ffffffff81267d7e>] ? __sg_alloc_table+0x7e/0x130
Dec  5 23:31:34 clonebox3 kernel: [<ffffffffa01e7ca5>] raid5_quiesce+0x125/0x1a0 [raid456]
Dec  5 23:31:34 clonebox3 kernel: [<ffffffff8105c580>] ? default_wake_function+0x0/0x20
--
Dec  5 23:31:35 clonebox3 kernel: Call Trace:
Dec  5 23:31:35 clonebox3 kernel: [<ffffffffa00098fb>] ? dispatch_io+0x22b/0x260 [dm_mod]
Dec  5 23:31:35 clonebox3 kernel: [<ffffffff814c9a53>] io_schedule+0x73/0xc0
Dec  5 23:31:35 clonebox3 kernel: [<ffffffffa0009a15>] sync_io+0xe5/0x180 [dm_mod]
--
Dec  5 23:31:35 clonebox3 kernel: Call Trace:
Dec  5 23:31:35 clonebox3 kernel: [<ffffffffa01e7ca5>] raid5_quiesce+0x125/0x1a0 [raid456]
Dec  5 23:31:35 clonebox3 kernel: [<ffffffff8105c580>] ? default_wake_function+0x0/0x20
Dec  5 23:31:35 clonebox3 kernel: [<ffffffffa01f00c1>] make_request+0x501/0x520 [raid456]
--
Dec  5 23:31:35 clonebox3 kernel: Call Trace:
Dec  5 23:31:35 clonebox3 kernel: [<ffffffffa00098fb>] ? dispatch_io+0x22b/0x260 [dm_mod]
Dec  5 23:31:35 clonebox3 kernel: [<ffffffff814c9a53>] io_schedule+0x73/0xc0
Dec  5 23:31:35 clonebox3 kernel: [<ffffffffa0009a15>] sync_io+0xe5/0x180 [dm_mod]
--
Dec  5 23:31:35 clonebox3 kernel: Call Trace:
Dec  5 23:31:35 clonebox3 kernel: [<ffffffff81091eb6>] ? autoremove_wake_function+0x16/0x40
Dec  5 23:31:35 clonebox3 kernel: [<ffffffff810500e9>] ? __wake_up_common+0x59/0x90
Dec  5 23:31:35 clonebox3 kernel: [<ffffffff8109218e>] ? prepare_to_wait+0x4e/0x80



> At this point I think you might have more of an MD issue than
> anything else. If you could take MD out of the picture by using a
> single disk or use a HW RAID, that would be a really useful data
> point.

I _THINK_ it was all hardware RAID when this happened before, but I 
can't be sure.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Tue, 13 Dec 2011 17:54:02 -0500
"Peter M. Petrakis" <peter.petrakis@canonical.com> wrote:

> 
> 
> On 12/13/2011 03:10 PM, Ray Morris wrote:
> > 
> > On Tue, 13 Dec 2011 13:35:46 -0500
> > "Peter M. Petrakis" <peter.petrakis@canonical.com> wrote:
> > 
> > 
> >> Do you by any chance have active LVM snapshots? If so how many and
> >> how long have they been provisioned for?
> > 
> > I forgot to mention that. There are now three snapshots, one on
> > each of
> 
> What distro and kernel on you on?
> 
> > three LVs, that have been provisioned for a few hours. These LVs
> > aren't in active use, but are backups, synced daily. So basically
> > the only activity is rsync once daily, bandwidth limited to be
> > fairly slow. One logical volume that locked up when trying to write
> > to it had a snapshot.
> 
> LVM snapshots can be very I/O intensive, even when you're not
> directly using them.
> 
> 
> > Prior to this most recent rebuild, there were a lot of snap shots - 
> > three on each of fifteen LVs. I replaced that VG with a fresh one 
> > and it seemed to work for a while. I thought the problem was likely 
> > related to lots of long lived snapshots, but after completely
> > rebuilding the VG after deleting all snapshots the problem recurred
> > very quickly, before there were many snapshots and before there was
> > a lot of IO to the snaps
> > 
> > I realize I'm somewhat abusing snapshots - they weren't designed to 
> > be long lived. Therefore my "torture test" usage may reveal
> > problems that wouldn't happen often with very short lived
> > snapshots. 
> 
> That's right :). Some have reported as high as 50% impact on
> performance.
> 
> > Another similar server has more snapshots on more LVs running the 
> > same rsyncs without obvious trouble.
> > 
> > I should also have mentioned sequential writes to one LV at a time 
> > don't seem to trigger the problem. I copied the whole VG one LV 
> > at a time with:
> > dd if=/dev/oldvg/lv1 of=/dev/newvg/lv1
> 
> > Copying the entire LVs sequentially saw no problems. Later when I
> > tried to rsync to the LVs the problem showed itself.
> 
> That's remarkable as it removes the fs from the equation. What
> fs are you using?
> 
> > 
> >>>>    filter = [ "a|^/dev/md.*|", "a|^/dev/sd.*|",
> >>>> "a|^/dev/etherd/.*|","r|^/dev/ram.*|", "r|block|", "r/.*/" ]
> >>>
> >> Is it intentional to include sd devices? Just because the MD uses
> >> them doesn't mean you have to make allowances for them here.
> > 
> > 
> > Some /dev/sdX devices were used, but no more and I have now removed 
> > sd.* and etherd.
> > 
> > 
> >>> <     locking_dir = "/var/lock/lvm"
> >>> ---
> >>>>     locking_dir = "/dev/shm"
> >>
> >> Why?
> > 
> > This was changed AFTER the problem started.
> > Because comment in the file says:
> > 
> >   # Local non-LV directory that holds file-based locks while
> > commands # are in progress.  
> > 
> > Because /var/lock is on an LV, I tried switching it to a directory
> > that will never be on an LV. That didn't seem to have any effect.
> 
> Not a bad idea. Returning to the backtrace:
> 
> ...
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa01feca5>]
> raid5_quiesce+0x125/0x1a0 [raid456] Dec 13 09:15:52 clonebox3 kernel:
> [<ffffffff8105c580>] ? default_wake_function+0x0/0x20 Dec 13 09:15:52
> clonebox3 kernel: [<ffffffff810563f3>] ? __wake_up+0x53/0x70 Dec 13
> 09:15:52 clonebox3 kernel: [<ffffffffa02070c1>]
> make_request+0x501/0x520 [raid456] Dec 13 09:15:52 clonebox3 kernel:
> [<ffffffff8102ea69>] ? native_smp_send_reschedule+0x49/0x60 Dec 13
> 09:15:52 clonebox3 kernel: [<ffffffff810508e8>] ?
> resched_task+0x68/0x80 Dec 13 09:15:52 clonebox3 kernel:
> [<ffffffff813d09fb>] md_make_request+0xcb/0x230
> 
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffff8105c484>] ?
> try_to_wake_up+0x284/0x380 Dec 13 09:15:52 clonebox3 kernel:
> [<ffffffff81241982>] generic_make_request+0x1b2/0x4f0 ...
> 
> Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa00029c4>] ?
> dm_wait_for_completion+0xd4/0x100 [dm_mod] Dec 13 09:15:52 clonebox3
> kernel: [<ffffffffa0003836>] dm_flush+0x56/0x70 [dm_mod] Dec 13
> 09:15:52 clonebox3 kernel: [<ffffffffa00038a4>] dm_wq_work+0x54/0x200
> [dm_mod] ... Dec 13 09:15:52 clonebox3 kernel: INFO: task
> kcopyd:31629 blocked for more than 120 seconds. Dec 13 09:15:52
> clonebox3 kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message. Dec 13 09:15:52 clonebox3 kernel:
> kcopyd        D ffff88007b824700     0 31629      2 0x00000080 Dec 13
> 09:15:52 clonebox3 kernel: ffff880044aa7ac0 0000000000000046
> ffff880044aa7a88 ffff880044aa7a84 Dec 13 09:15:52 clonebox3 kernel:
> ffff880044aa7ae0 ffff88007b824700 ffff880001e16980 00000001083f7280
> 
> raid5_quiesce should have been straight forward
> 
> http://lxr.linux.no/linux+v3.1.5/drivers/md/raid5.c#L5422
> 
> >From the stack context I expect it to in case 2 or 0. It could also
> >be stuck on a lock or it
> really did stop writes.
> 
> At this point I think you might have more of an MD issue than
> anything else. If you could take MD out of the picture by using a
> single disk or use a HW RAID, that would be a really useful data
> point.
> 
> I would also investigate the health of your RAID. Look back in the
> logs for members being ejected and then re-introduced. Also if you
> have any scripts that use mdadm to ping the array for status you
> might want to stop those too. Sounds like the linux-raid list is your
> next stop.
> 
> Peter
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
