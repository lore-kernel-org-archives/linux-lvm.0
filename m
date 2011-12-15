Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pBFLc8LN025279
	for <linux-lvm@redhat.com>; Thu, 15 Dec 2011 16:38:08 -0500
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBFLc7jQ020700
	for <linux-lvm@redhat.com>; Thu, 15 Dec 2011 16:38:07 -0500
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPA id 4F46F21B93
	for <linux-lvm@redhat.com>; Thu, 15 Dec 2011 15:38:04 -0600 (CST)
Date: Thu, 15 Dec 2011 15:38:04 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20111215153804.43bb87a5@bettercgi.com>
In-Reply-To: <4EE8B7B3.900@canonical.com>
References: <20111213114558.7acbf2e9@bettercgi.com>
	<4EE79B02.5050709@canonical.com>
	<20111213141040.3b090df3@bettercgi.com>
	<4EE7D78A.2080704@canonical.com>
	<20111213173301.3d504b86@bettercgi.com>
	<4EE8B7B3.900@canonical.com>
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

Peter thank you very much for your comments. I'll continue testing and cussing.
It's beginning to look like snapshots + md raid check or resync =
freeze in some cases.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Wed, 14 Dec 2011 09:50:27 -0500
"Peter M. Petrakis" <peter.petrakis@canonical.com> wrote:

> 
> 
> On 12/13/2011 06:33 PM, Ray Morris wrote:
> >>> On Tue, 13 Dec 2011 13:35:46 -0500
> >>> "Peter M. Petrakis" <peter.petrakis@canonical.com> wrote
> > 
> >> What distro and kernel on you on?
> > 
> > 
> > 2.6.32-71.29.1.el6.x86_64 (CentOS 6)
> > 
> > 
> >>> Copying the entire LVs sequentially saw no problems. Later when I
> >>> tried to rsync to the LVs the problem showed itself.
> >>
> >> That's remarkable as it removes the fs from the equation. What
> >> fs are you using?
> > 
> > ext3
> > 
> >> Not a bad idea. Returning to the backtrace:
> > ...
> >> raid5_quiesce should have been straight forward
> >>
> >> http://lxr.linux.no/linux+v3.1.5/drivers/md/raid5.c#L5422
> > 
> > Interesting. Not that I speak kernel, but I may have to learn.
> > Please note the other partial stack trace included refers to a 
> > different function.
> > 
> > 
> > Dec 13 09:15:52 clonebox3 kernel: Call Trace:
> > Dec 13 09:15:52 clonebox3 kernel: [<ffffffffa01feca5>]
> > raid5_quiesce+0x125/0x1a0 [raid456] Dec 13 09:15:52 clonebox3
> > kernel: [<ffffffff8105c580>] ? default_wake_function+0x0/0x20 Dec
> > 13 09:15:52 clonebox3 kernel: [<ffffffff810563f3>] ?
> > __wake_up+0x53/0x70 -- Dec 13 09:15:52 clonebox3 kernel: Call Trace:
> > Dec 13 09:15:52 clonebox3 kernel: [<ffffffff814c9a53>]
> > io_schedule+0x73/0xc0 Dec 13 09:15:52 clonebox3 kernel:
> > [<ffffffffa0009a15>] sync_io+0xe5/0x180 [dm_mod] Dec 13 09:15:52
> > clonebox3 kernel: [<ffffffff81241982>] ?
> > generic_make_request+0x1b2/0x4f0 -- Dec 13 09:15:52 clonebox3
> > kernel: Call Trace: Dec 13 09:15:52 clonebox3 kernel:
> > [<ffffffffa00046ec>] ? dm_table_unplug_all+0x5c/0xd0 [dm_mod] Dec
> > 13 09:15:52 clonebox3 kernel: [<ffffffff8109bba9>] ?
> > ktime_get_ts+0xa9/0xe0 Dec 13 09:15:52 clonebox3 kernel:
> > [<ffffffff8119e960>] ? sync_buffer+0x0/0x50
> > 
> > an earlier occurrence:
> > 
> > Dec  5 23:31:34 clonebox3 kernel: Call Trace:
> > Dec  5 23:31:34 clonebox3 kernel: [<ffffffff8134ac7d>] ?
> > scsi_setup_blk_pc_cmnd+0x13d/0x170 Dec  5 23:31:34 clonebox3
> > kernel: [<ffffffffa01e7ca5>] raid5_quiesce+0x125/0x1a0 [raid456]
> > Dec  5 23:31:34 clonebox3 kernel: [<ffffffff8105c580>] ?
> > default_wake_function+0x0/0x20
> 
> [snip]
> 
> Still in the RAID code, just a tiny bit further. I assume when you
> examine lsscsi -l that all the disks are 'running' at this point?
> 
> > 
> > 
> >> At this point I think you might have more of an MD issue than
> >> anything else. If you could take MD out of the picture by using a
> >> single disk or use a HW RAID, that would be a really useful data
> >> point.
> > 
> > I _THINK_ it was all hardware RAID when this happened before, but I 
> > can't be sure.
> 
> Then you're not at your wits end, and you posses the HW to isolate
> this issue. Please retry your experiment and keep us posted.
> 
> Peter
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
