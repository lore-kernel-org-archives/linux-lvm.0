Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1JKxpi22663
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 15:59:51 -0500
From: Miquel van Smoorenburg <miquels@cistron.nl>
Message-ID: <20040219205907.GE32263@drinkel.cistron.nl>
References: <20040216131609.GA21974@cistron.nl> <20040216133047.GA9330@suse.de> <20040217145716.GE30438@traveler.cistron.net> <20040218235243.GA30621@drinkel.cistron.nl> <20040218172622.52914567.akpm@osdl.org> <20040219021159.GE30621@drinkel.cistron.nl> <20040218182628.7eb63d57.akpm@osdl.org> <20040219101519.GG30621@drinkel.cistron.nl> <20040219101915.GJ27190@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20040219101915.GJ27190@suse.de> (from axboe@suse.de on Thu, Feb 19, 2004 at 11:19:15 +0100)
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
Date: Thu Feb 19 15:58:07 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@suse.de>
Cc: Miquel van Smoorenburg <miquels@cistron.nl>, Andrew Morton <akpm@osdl.org>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, thornber@redhat.com

On Thu, 19 Feb 2004 11:19:15, Jens Axboe wrote:
> On Thu, Feb 19 2004, Miquel van Smoorenburg wrote:
>
> > > Shouldn't the controller itself be performing the insertion?
> > 
> > Well, you would indeed expect the 3ware hardware to be smarter than
> > that, but in its defence, the driver doesn't set sdev->simple_tags or
> > sdev->ordered_tags at all. It just has a large queue on the host, in
> > hardware.
> 
> A too large queue. IMHO the simple and correct solution to your problem
> is to diminish the host queue (sane solution), or bump the block layer
> queue size (dumb solution).

Well, I did that. Lowering the queue size of the 3ware controller to 64
does help a bit, but performance is still not optimal - leaving it at 254
and increasing the nr_requests of the queue to 512 helps the most.

But the patch I posted does just as well, without any tuning. I changed
it a little though - it only has the "new" behaviour (instead of blocking
on allocating a request, allocate it, queue it, _then_ block) for WRITEs.
That results in the best performance I've seen, by far.

Now the style of my patch might be ugly, but what is conceptually wrong
with allocating the request and queueing it, then block if the queue is
full, versus blocking on allocating the request and keeping a bio
"stuck" for quite some time, resulting in out-of-order requests to the
hardware ?

Note that this is not an issue of '2 processes writing to 1 file', really.
It's one process and pdflush writing the same dirty pages of the same file.

Mike.
