Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1J1PJi12713
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 20:25:19 -0500
From: Andrew Morton <akpm@osdl.org>
Message-Id: <20040218172622.52914567.akpm@osdl.org>
In-Reply-To: <20040218235243.GA30621@drinkel.cistron.nl>
References: <20040216131609.GA21974@cistron.nl>
	<20040216133047.GA9330@suse.de>
	<20040217145716.GE30438@traveler.cistron.net>
	<20040218235243.GA30621@drinkel.cistron.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Feb 19 08:50:38 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Miquel van Smoorenburg <miquels@cistron.nl>
Cc: axboe@suse.de, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, thornber@redhat.com

Miquel van Smoorenburg <miquels@cistron.nl> wrote:
>
> On Tue, 17 Feb 2004 15:57:16, Miquel van Smoorenburg wrote:
> > For some reason, when using LVM, write requests get queued out
> > of order to the 3ware controller, which results in quite a bit
> > of seeking and thus performance loss.
> [..]
> > Okay I repeated some earlier tests, and I added some debug code in
> > several places.
> > 
> > I added logging to tw_scsi_queue() in the 3ware driver to log the
> > start sector and length of each request. It logs something like:
> > 3wdbg: id 119, lba = 0x2330bc33, num_sectors = 256
> > 
> > With a perl script, I can check if the requests are sent to the
> > host in order. That outputs something like this:
> > 
> > Consecutive: start 1180906348, length 7936 sec (3968 KB), requests: 31
> > Consecutive: start 1180906340, length 8 sec (4 KB), requests: 1
> > Consecutive: start 1180914292, length 7936 sec (3968 KB), requests: 31
> > Consecutive: start 1180914284, length 8 sec (4 KB), requests: 1
> > Consecutive: start 1180922236, length 7936 sec (3968 KB), requests: 31
> > Consecutive: start 1180922228, length 8 sec (4 KB), requests: 1
> > Consecutive: start 1180930180, length 7936 sec (3968 KB), requests: 31

3968 / 31 = 128 exactly.  I think when you say "requests: 31" you are
actually referring to a single request which has 31 128k BIOs in it, yes?

> > 
> > See, 31 requests in order, then one request "backwards", then 31 in order, etc.
> 
> I found out what causes this. It's get_request_wait().
> 
> When the request queue is full, and a new request needs to be created,
> __make_request() blocks in get_request_wait().
> 
> Another process wakes up first (pdflush / process submitting I/O itself /
> xfsdatad / etc) and sends the next bio's to __make_request().
> In the mean time some free requests have become available, and the bios
> are merged into a new request. Those requests are submitted to the device.
> 
> Then, get_request_wait() returns but the bio is not mergeable anymore -
> and that results in a backwards seek, severely limiting the I/O rate.
> 
> Wouldn't it be better to allow the request allocation and queue the
> request, and /then/ put the process to sleep ? The queue will grow larger
> than nr_requests, but it does that anyway.

That would help, but is a bit kludgy.

What _should_ have happened was:

a) The queue gets plugged

b) The maximal-sized 31-bio request is queued

c) The 4k request gets inserted *before* the 3968k request

d) The queue gets unplugged, and both requests stream smoothly.

(And this assumes that the queue was initially empty.  ALmost certainly
that was not the case).

So the question is, why did the little, later 4k request not get itself
inserted in front of the earlier, large 3968k request?

Are you using md as well?  If so, try removing the blk_run_queues()
statements from md_thread() and md_do_sync().  And generally hunt around
and try nuking blk_run_queues() statements from the device driver/md/dm
layer - they may well be wrong.

Is this problem specific to md?  Can it be reproduced on a boring-old-disk?

Does elevator=deadline change anything?
