Subject: Re: [linux-lvm] Re: [PATCH] 2.5 version of device mapper submission
Message-ID: <20021015093244.GA3782@fib011235813.fsnet.co.uk>
References: <1034453946.15067.22.camel@irongate.swansea.linux.org.uk> <1034614756.29775.5.camel@UberGeek.coremetrics.com> <20021014175608.GA14963@fib011235813.fsnet.co.uk> <20021015082152.GA4827@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021015082152.GA4827@suse.de>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Oct 15 04:57:14 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@suse.de>
Cc: Austin Gonyou <austin@coremetrics.com>, linux-lvm@sistina.com, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Oct 15, 2002 at 10:21:52AM +0200, Jens Axboe wrote:
> On Mon, Oct 14 2002, Joe Thornber wrote:
> > 10.patch
> >   [Device-mapper]
> >   Add call to blk_queue_bounce() at the beginning of the request function.
> 
> What on earth for? I also see that you are setting BLK_BOUNCE_HIGH as
> the bounce limit unconditionally for your queue. Puzzled.

This is just me stupidly copying loop.c, already found out it doesn't
work.  Please ignore.

> When does dm even have to touch the data in the bio?

Tell me; if I'm splitting a bio using bio_clone, and then map the bio
to a driver that calls blk_queue_bounce.  How can I avoid the

        BUG_ON((*bio_orig)->bi_idx);

triggering ?  Or is bio_clone not to be used anymore ?

- Joe
