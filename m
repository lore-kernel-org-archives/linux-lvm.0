From: Andrew Morton <akpm@osdl.org>
Message-Id: <20040226143843.4bdf0f38.akpm@osdl.org>
In-Reply-To: <20040226162952.GA14231@cistron.nl>
References: <1qJVx-75K-15@gated-at.bofh.it>
	<1r6fH-3L8-11@gated-at.bofh.it>
	<1r6S4-6cv-1@gated-at.bofh.it>
	<403D02E3.4070208@tmr.com>
	<c1j4mb$gmd$1@news.cistron.nl>
	<20040225162431.1f08365d.akpm@osdl.org>
	<20040226103704.GA13717@traveler.cistron.net>
	<20040226024714.768e3c71.akpm@osdl.org>
	<20040226105120.GC7580@suse.de>
	<20040226162810.GA13985@cistron.nl>
	<20040226162952.GA14231@cistron.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: PATCH: bdi_congested-dm.patch (was: Re: IO scheduler, queue
 depth, nr_requests)
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
Date: Thu Feb 26 17:35:12 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Miquel van Smoorenburg <miquels@cistron.nl>
Cc: thornber@redhat.com, axboe@suse.de, piggin@cyberone.com.au, linux-lvm@redhat.com

Miquel van Smoorenburg <miquels@cistron.nl> wrote:
>
> +	down_read(&md->lock);
> +	r = dm_table_any_congested(md->map, bdi_bits);
> +	up_read(&md->lock);

This can deadlock if anyone ever performs a __GFP_IO memory allocation
while holding md->lock.

We could enter page reclaim with the lock held, come back in here and take
it again.  That's an instant deadlock if we were holding it for write and a
super-rare deadlock if we were holding it for read (requires some other
process to come in and run down_write() in between the two down_read()s).

A quick audit shows that we're OK, I think.  What does
dm_table_suspend_targets() do?  But still, this restriction needs to be
understood, documented and adhered to in future DM development.

If it gets really sticky in here it would be acceptable to do
down_read_trylock() and return 0 if it fails - the congestion code is only
advisory and 99% is good enough.


I like these patches btw - I was always worried about what the
stacked-device impementation of queue congestion would look like, and this
is nice and simple.
