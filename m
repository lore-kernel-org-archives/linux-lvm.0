Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1ME3Qi09257
	for <linux-lvm@redhat.com>; Sun, 22 Feb 2004 09:03:26 -0500
From: Miquel van Smoorenburg <miquels@cistron.net>
Message-ID: <20040222140232.GE1375@drinkel.cistron.nl>
References: <20040219205907.GE32263@drinkel.cistron.nl> <40353E30.6000105@cyberone.com.au> <20040219235303.GI32263@drinkel.cistron.nl> <40355F03.9030207@cyberone.com.au> <20040219172656.77c887cf.akpm@osdl.org> <40356599.3080001@cyberone.com.au> <20040219183218.2b3c4706.akpm@osdl.org> <20040220144042.GC20917@traveler.cistron.net> <20040220145944.GM27549@reti> <20040220150013.GY27190@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20040220150013.GY27190@suse.de> (from axboe@suse.de on Fri, Feb 20, 2004 at 16:00:13 +0100)
Subject: [linux-lvm] Re: [PATCH] bdi_congestion_funp (was: Re: [PATCH] per process request limits (was Re: IO scheduler, queue depth, nr_requests))
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
Date: Mon Feb 23 08:45:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@suse.de>
Cc: Joe Thornber <thornber@redhat.com>, Miquel van Smoorenburg <miquels@cistron.net>, Andrew Morton <akpm@osdl.org>, Nick Piggin <piggin@cyberone.com.au>, miquels@cistron.nl, linux-lvm@sistina.com, linux-kernel@vger.kernel.org

On Fri, 20 Feb 2004 16:00:13, Jens Axboe wrote:
> On Fri, Feb 20 2004, Joe Thornber wrote:
> > > +	devices = dm_table_get_devices(t);
> > > +	for (d = devices->next; d != devices; d = d->next) {
> > > +		struct dm_dev *dd = list_entry(d, struct dm_dev, list);
> > > +		request_queue_t *q = bdev_get_queue(dd->bdev);
> > > +		r |= test_bit(bdi_state, &(q->backing_dev_info.state));
> > 
> > Shouldn't this be calling your bdi_*_congested function rather than
> > assuming it is a real device under dm ? (often not true).
> > 
> > I'm also very slightly worried that or'ing together the congestion
> > results for all the seperate devices isn't always the right thing.
> > These devices include anything that the targets are using, exception
> > stores for snapshots, logs for mirror, all paths for multipath (or'ing
> > is most likely to be wrong for multipath).
> 
> Yeah the patch is pretty much crap in that area, I don't think Miquel
> was aiming for inclusion :)
> 
> I'd suggest making queue functions for congestion state as well so it
> stacks properly.

I've been looking at this. If you want to keep the struct backing_dev_info
reasonably stand-alone (no function pointer and aux data like I did) you
probably need to add a list of parent_queues to every request_list. If
the queue get congested, you mark the parent queue(s) congested as well.
Congested state would need to be changed into a counter instead of a
bitfield, I think.

The pdflush-is-running-on-this-queue bit can probably remain as-is. It's
mostly meant to prevent 2 pdflush daemons from running the same queue.
I don't see much harm in pdflush #1 running on /dev/md0 which consists
of /dev/sda1 and /dev/sdb1 and pdflush #2 running on /dev/sdb2, right ?

Would that be the way to go? If so, I'll take a stab at it.

Mike.
