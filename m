Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1JNrri25254
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 18:53:53 -0500
From: Miquel van Smoorenburg <miquels@cistron.nl>
Message-ID: <20040219235303.GI32263@drinkel.cistron.nl>
References: <20040216133047.GA9330@suse.de> <20040217145716.GE30438@traveler.cistron.net> <20040218235243.GA30621@drinkel.cistron.nl> <20040218172622.52914567.akpm@osdl.org> <20040219021159.GE30621@drinkel.cistron.nl> <20040218182628.7eb63d57.akpm@osdl.org> <20040219101519.GG30621@drinkel.cistron.nl> <20040219101915.GJ27190@suse.de> <20040219205907.GE32263@drinkel.cistron.nl> <40353E30.6000105@cyberone.com.au>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40353E30.6000105@cyberone.com.au> (from piggin@cyberone.com.au on Thu, Feb 19, 2004 at 23:52:32 +0100)
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
Date: Thu Feb 19 18:52:30 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Nick Piggin <piggin@cyberone.com.au>
Cc: Miquel van Smoorenburg <miquels@cistron.nl>, Jens Axboe <axboe@suse.de>, Andrew Morton <akpm@osdl.org>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, thornber@redhat.com

On Thu, 19 Feb 2004 23:52:32, Nick Piggin wrote:
> 
> 
> Miquel van Smoorenburg wrote:
> 
> >On Thu, 19 Feb 2004 11:19:15, Jens Axboe wrote:
> >
> >>On Thu, Feb 19 2004, Miquel van Smoorenburg wrote:
> >>
> >>
> >>>>Shouldn't the controller itself be performing the insertion?
> >>>>
> >>>Well, you would indeed expect the 3ware hardware to be smarter than
> >>>that, but in its defence, the driver doesn't set sdev->simple_tags or
> >>>sdev->ordered_tags at all. It just has a large queue on the host, in
> >>>hardware.
> >>>
> >>A too large queue. IMHO the simple and correct solution to your problem
> >>is to diminish the host queue (sane solution), or bump the block layer
> >>queue size (dumb solution).
> >>
> >
> >Well, I did that. Lowering the queue size of the 3ware controller to 64
> >does help a bit, but performance is still not optimal - leaving it at 254
> >and increasing the nr_requests of the queue to 512 helps the most.
> >
> >But the patch I posted does just as well, without any tuning. I changed
> >it a little though - it only has the "new" behaviour (instead of blocking
> >on allocating a request, allocate it, queue it, _then_ block) for WRITEs.
> >That results in the best performance I've seen, by far.
> >
> >
> 
> That's because you are half introducing per-process limits.
> 
> >Now the style of my patch might be ugly, but what is conceptually wrong
> >with allocating the request and queueing it, then block if the queue is
> >full, versus blocking on allocating the request and keeping a bio
> >"stuck" for quite some time, resulting in out-of-order requests to the
> >hardware ?
> >
> >
> 
> Conceptually? The concept that you have everything you need to
> continue and yet you block anyway is wrong.

For reading, I agree. For writing .. ah well, English is not my first
language, let's not argue about language semantics.

> >Note that this is not an issue of '2 processes writing to 1 file', really.
> >It's one process and pdflush writing the same dirty pages of the same file.
> 
> pdflush is a process though, that's all that matters.

I understand that when the two processes are unrelated, the patch as I
sent it will do the wrong thing.

But the thing is, you get this:

- "dd" process writes requests
- pdflush triggers to write dirty pages
- too many pages are dirty so "dd" blocks as well to write synchronously
- "dd" process triggers "queue full" but gets marked as "batching" so
  can continue (get_request)
- pdflush tries to submit one bio and gets blocked (get_request_wait)
- "dd" continues, but that one bio from pdflush remains stuck for a while

That's stupid, that one bio from pdflush should really be allowed on
the queue, since "dd" is adding requests from the same source to it
anyway.

Perhaps writes from pdflush should be handled differently to prevent
this specific case ?

Say, if pdflush adds request #128, don't mark it as batching, but
let it block. The next process will be the one marked as batching
and can continue. If pdflush tries to add a request > 128, allow it,
but _then_ block it.

Would something like that work ? Would it be a good idea to never mark
a pdflush process as batching, or would that have a negative impact
for some things ?

Mike.
