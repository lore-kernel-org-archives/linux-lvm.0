From: Neil Brown <neilb@cse.unsw.edu.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <15651.54044.557070.109158@notabene.cse.unsw.edu.au>
Subject: Re: [linux-lvm] LVM2 modifies the buffer_head struct?
In-Reply-To: message from Jens Axboe on Wednesday July 3
References: <F19741gcljD2E2044cY00004523@hotmail.com>
	<20020702141702.GA9769@fib011235813.fsnet.co.uk>
	<20020703100838.GH14097@suse.de>
	<20020703120124.GB615@fib011235813.fsnet.co.uk>
	<20020703121024.GC21568@suse.de>
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
Date: Wed Jul  3 23:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@suse.de>
Cc: Joe Thornber <joe@fib011235813.fsnet.co.uk>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, Andrew Morton <akpm@zip.com.au>

On Wednesday July 3, axboe@suse.de wrote:
> 
> Now we are in a grey area. The 'usual' stacked drivers work like this:
> 
> some fs path
> 	submit_bh(bh_orig);
> 
> ...
> 
> stacked driver make_request_fn:
> 	bh_new = alloc_bh
> 	bh_new->b_private = bh_orig;
> 	...
> 	submit_bh(bh_new);
> 
> if you are just modifying b_private, how exactly is your stacking
> working? ie what about lvm2 on lvm2?

I think this can work sanely and is something I have considered for
raid1-read and multipath in md.

struct privatebit {
  bio_end_io_t  *oldend;
  void          *oldprivate;
  ...other...stuff;
};

make_request(struct request_queue_t *q, struct buffer_head *bh, int rw)
{

 struct privatebit *pb = kmalloc(...);

  pb->oldend = bh->b_end_io;
  pb->oldprivate = bh->b_private;
  bh->b_private = pb;
  bh->b_end_io = my_end_handler;

  ..remap b_rdev, b_rsector ...

  generic_make_request(bh, rw);

}

Then my_end_handler have do some local cleanup,
re-instate oldend and oldprivate, and pass the bh back up.
For raid1/multipath it would arrange to resubmit the request if there
as an error.

This stacks nicely and allows for the extra bit to be alloced to be
minimal.

We just want ext3/jbd to make sure that it only calls bh2jh on
an unlocked buffer... is that easy?

Ofcourse this ceases to be an issue in 2.5 because the filesys uses 
pages or buffer_heads and the device driver uses bios.

NeilBrown
