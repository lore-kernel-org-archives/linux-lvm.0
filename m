From: Jens Axboe <axboe@suse.de>
Message-ID: <20031231103258.GT3086@suse.de>
References: <20031229130055.GA30647@cistron.nl> <20031230034239.27950054.akpm@osdl.org> <3FF21BE1.9070603@cs.wisc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3FF21BE1.9070603@cs.wisc.edu>
Subject: [linux-lvm] Re: System hangs after echo value > /sys/block/dm-0/queue/nr_requests
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
Date: Thu Jan  1 11:29:10 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Christie <michaelc@cs.wisc.edu>
Cc: Andrew Morton <akpm@osdl.org>, Miquel van Smoorenburg <miquels@cistron.nl>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, Nick Piggin <piggin@cyberone.com.au>

On Tue, Dec 30 2003, Mike Christie wrote:
> Andrew Morton wrote:
> 
> >Where queue_requests_store() does wake_up(&rl->wait[READ]);
> >
> >It looks like nobody has called blk_init_queue() for this queue and the
> >waitqueue head is uninitialised.
> >
> 
> DM, MD, rd and loop use blk_alloc_queue and blk_queue_make_request to 
> initialize their queue, because they only use the make_request_fn. The 
> attached patch prevents the queue from being registered if only 
> blk_alloc_queue was called.

I'm fine with that patch since we don't have any attributes in there
that apply to just remappers.

-- 
Jens Axboe
