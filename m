Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1GDVSi05572
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 08:31:28 -0500
From: Jens Axboe <axboe@suse.de>
Message-ID: <20040216133047.GA9330@suse.de>
References: <20040216131609.GA21974@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040216131609.GA21974@cistron.nl>
Subject: [linux-lvm] Re: IO scheduler, queue depth, nr_requests
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 16 08:30:08 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel van Smoorenburg <miquels@cistron.nl>
Cc: linux-lvm@sistina.com

On Mon, Feb 16 2004, Miquel van Smoorenburg wrote:
> Hello,
> 
> 	as you might have seen from the linux-kernel mailinglist
> I have been testing for months now with a fileserver set up to
> use XFS over LVM2 on a 3ware RAID5 controller.
> 
> I asked for help several times on the list, but nobody really
> replied, so now I'm taking a shot at mailing you directly, since
> you appear to be the I/O request queueing guru of the kernel ;)
> Cc: sent to linux-lvm@sistina.com. Any hint appreciated.
> 
> For some reason, when using LVM, write requests get queued out
> of order to the 3ware controller, which results in quite a bit
> of seeking and thus performance loss.
> 
> The default queue depth of the 3ware controller is 254. I found
> out that lowering it to 64 in the driver fixed my problems, and
> I advised 3ware support about this. They weren't really convinced..
> 
> By fiddling about today I just found that changing
> /sys/block/sda/queue/nr_requests from 128 to something above
> the queue depth of the 3ware controller (256 doesn't work,
> 384 and up do) also fixes the problem.
> 
> Does that actually make sense ?

Yes, it makes perfect sense, I've been aware of this problem for quite
some time. If you look init_tag_map() in ll_rw_blk.c:

	if (depth > q->nr_requests / 2) {
		q->nr_requests = depth * 2;
		printk(KERN_INFO "%s: large TCQ depth: adjusted nr_requests "
                         "to %lu\n", __FUNCTION__, q->nr_requests);
	}

it pretty much matches the problem you outlined. Unfortunately, the
tagging depth of SCSI drivers cannot be controlled unless they use the
generic block tagging helpers, and to my knowledge only a single driver
does...

> Ah yes, I'm currently using 2.6.2 with a 3ware 8506-8 in
> hardware raid5 mode, deadline scheduler, PIV 3.0 Ghz, 2 GB RAM.
> 
> Debug output ("mydd" works just like "dd", but has an fsync option):
> 
> - /mnt is an XFS filesystem on a LVM2 volume on the 3ware
> - /mnt2 is an XFS filesystem directly on /dev/sda1 of the 3ware
> 
> - First on /mnt, the LVM partition. Note that a small "dd" runs
>   fast, a larger one runs slower:
> 
> # cd /mnt
> # cat /sys/block/sda/device/queue_depth
> 254
> # cat /sys/block/sda/queue/nr_requests
> 128
> # ~/mydd --if /dev/zero --of file --bs 4096 --count 50000 --fsync
> 204800000 bytes transferred in 2.679812 seconds (76423271 bytes/sec)
> # ~/mydd --if /dev/zero --of file --bs 4096 --count 100000 --fsync
> 409600000 bytes transferred in 9.501549 seconds (43108760 bytes/sec)
> 
> - Now I set the nr_requests to 512:
> # echo 512 > /sys/block/sda/queue/nr_requests
> # ~/mydd --if /dev/zero --of file --bs 4096 --count 100000 --fsync
> 409600000 bytes transferred in 5.374437 seconds (76212634 bytes/sec)
> 
> See that ? Weird thing is, it's only on LVM, directly on /dev/sda1
> no problem at all:
> 
> # cat /sys/block/sda/device/queue_depth
> 254
> # cat /sys/block/sda/queue/nr_requests
> 128
> # ~/mydd --if /dev/zero --of file --bs 4096 --count 100000 --fsync
> 409600000 bytes transferred in 5.135642 seconds (79756338 bytes/sec)
> 
> Somehow, LVM is causing the requests to the underlying 3ware
> device to get out of order, and increasing nr_requests to be
> larger than the queue_depth of the device fixes this.
> 
> I tried the latest dm-patches in -mm (applied those to vanilla
> 2.6.2), which include a patch called dm-04-maintain-bio-ordering.patch
> but that doesn't really help (at first I though otherwise, but the
> tests scripts I used lowered the queue_depth of the 3ware to 64
> by accident) - if anything, it makes things worse.
> 
> # ~/mydd --if /dev/zero --of file --bs 4096 --count 100000 --fsync
> 409600000 bytes transferred in 13.138224 seconds (31176208 bytes/sec)
> 
> Setting nr_requests to 512 fixes things up again.

Seems there's an extra problem here, the nr_requests vs depth problem
should not be too problematic unless you have heavy random io. Doesn't
look like dm is reordering (bio_list_add() adds to tail,
flush_deferred_io() processes from head. direct queueing doesn't look
like it's reordering). Can the dm folks verify this?

Or, you are just being hit by the problem first listed - requests get no
hold time in the io scheduler for merging, because the driver drains
them too quickly because of this artificially huge queue depth. If you
did some stats on average request size and io/sec rate that should tell
you for sure. I don't know what you have behind the 3ware, but it's
generally not advised to use more than 4 tags per spindle.

-- 
Jens Axboe
