Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1KEuxi16251
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 09:56:59 -0500
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20040220145944.GM27549@reti>
References: <20040219101519.GG30621@drinkel.cistron.nl> <20040219101915.GJ27190@suse.de> <20040219205907.GE32263@drinkel.cistron.nl> <40353E30.6000105@cyberone.com.au> <20040219235303.GI32263@drinkel.cistron.nl> <40355F03.9030207@cyberone.com.au> <20040219172656.77c887cf.akpm@osdl.org> <40356599.3080001@cyberone.com.au> <20040219183218.2b3c4706.akpm@osdl.org> <20040220144042.GC20917@traveler.cistron.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040220144042.GC20917@traveler.cistron.net>
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
Date: Fri Feb 20 09:56:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel van Smoorenburg <miquels@cistron.net>
Cc: Andrew Morton <akpm@osdl.org>, Nick Piggin <piggin@cyberone.com.au>, miquels@cistron.nl, axboe@suse.de, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, thornber@redhat.com

On Fri, Feb 20, 2004 at 03:40:42PM +0100, Miquel van Smoorenburg wrote:
> --- linux-2.6.3/drivers/md/dm-table.c.ORIG	2004-02-04 04:44:59.000000000 +0100
> +++ linux-2.6.3/drivers/md/dm-table.c	2004-02-20 15:14:35.000000000 +0100

<snip>

> +	if ((t = dm_get_table(md)) == NULL)
> +		return 0;

struct mapped_device has no business in this file.  You should move
this function to dm.c, and provide accessor fns in dm-table.c.

> +	devices = dm_table_get_devices(t);
> +	for (d = devices->next; d != devices; d = d->next) {
> +		struct dm_dev *dd = list_entry(d, struct dm_dev, list);
> +		request_queue_t *q = bdev_get_queue(dd->bdev);
> +		r |= test_bit(bdi_state, &(q->backing_dev_info.state));

Shouldn't this be calling your bdi_*_congested function rather than
assuming it is a real device under dm ? (often not true).

I'm also very slightly worried that or'ing together the congestion
results for all the seperate devices isn't always the right thing.
These devices include anything that the targets are using, exception
stores for snapshots, logs for mirror, all paths for multipath (or'ing
is most likely to be wrong for multipath).

- Joe
