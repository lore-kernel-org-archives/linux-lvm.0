Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1HEw1i24857
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2004 09:58:01 -0500
From: Miquel van Smoorenburg <miquels@cistron.nl>
Message-ID: <20040217145716.GE30438@traveler.cistron.net>
References: <20040216131609.GA21974@cistron.nl> <20040216133047.GA9330@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20040216133047.GA9330@suse.de> (from axboe@suse.de on Mon, Feb 16, 2004 at 14:30:47 +0100)
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
Date: Wed Feb 18 10:29:11 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@suse.de>
Cc: Miquel van Smoorenburg <miquels@cistron.nl>, linux-lvm@sistina.com, Joe Thornber <thornber@redhat.com>

On 2004.02.16 14:30, Jens Axboe wrote:
> On Mon, Feb 16 2004, Miquel van Smoorenburg wrote:
>
> > By fiddling about today I just found that changing
> > /sys/block/sda/queue/nr_requests from 128 to something above
> > the queue depth of the 3ware controller (256 doesn't work,
> > 384 and up do) also fixes the problem.
> > 

[....]

> > See that ? Weird thing is, it's only on LVM, directly on /dev/sda1
> > no problem at all:
> > 
> > # cat /sys/block/sda/device/queue_depth
> > 254
> > # cat /sys/block/sda/queue/nr_requests
> > 128
> > # ~/mydd --if /dev/zero --of file --bs 4096 --count 100000 --fsync
> > 409600000 bytes transferred in 5.135642 seconds (79756338 bytes/sec)
> > 
> > Somehow, LVM is causing the requests to the underlying 3ware
> > device to get out of order, and increasing nr_requests to be
> > larger than the queue_depth of the device fixes this.
>
> Seems there's an extra problem here, the nr_requests vs depth problem
> should not be too problematic unless you have heavy random io. Doesn't
> look like dm is reordering (bio_list_add() adds to tail,
> flush_deferred_io() processes from head. direct queueing doesn't look
> like it's reordering). Can the dm folks verify this?
> 
> Or, you are just being hit by the problem first listed - requests get no
> hold time in the io scheduler for merging, because the driver drains
> them too quickly because of this artificially huge queue depth. If you
> did some stats on average request size and io/sec rate that should tell
> you for sure. I don't know what you have behind the 3ware, but it's
> generally not advised to use more than 4 tags per spindle.

Okay I repeated some earlier tests, and I added some debug code in
several places.

I added logging to tw_scsi_queue() in the 3ware driver to log the
start sector and length of each request. It logs something like:
3wdbg: id 119, lba = 0x2330bc33, num_sectors = 256

With a perl script, I can check if the requests are sent to the
host in order. That outputs something like this:

Consecutive: start 1180906348, length 7936 sec (3968 KB), requests: 31
Consecutive: start 1180906340, length 8 sec (4 KB), requests: 1
Consecutive: start 1180914292, length 7936 sec (3968 KB), requests: 31
Consecutive: start 1180914284, length 8 sec (4 KB), requests: 1
Consecutive: start 1180922236, length 7936 sec (3968 KB), requests: 31
Consecutive: start 1180922228, length 8 sec (4 KB), requests: 1
Consecutive: start 1180930180, length 7936 sec (3968 KB), requests: 31

See, 31 requests in order, then one request "backwards", then 31 in order, etc.

I added some queue debug code as well, both the LVM2 queue and 3ware
queue have the following settings:

max_sectors: 256
max_phys_segments: 128
max_hw_segments: 62
hardsect_size: 512
max_segment_size: 65536
seg_boundary_mask: ffffffff

Now 31 * 2 == 62 == max_hw_segments .. coincidence ?

Weird thing is, still still only happens with LVM over 3ware raid5, not
on /dev/sda1 of the 3ware directly.

I added some printk's to scsi_request_fn() in scsi_lib.c to see if a
requests was getting requeued - but no.

Upping nr_requests to 2 * queue_depth does still fix things, but as you
said that should not be necessary. This bugs me, I want to find out why
this only happens with LVM and not without ... 

Mike.
