Subject: Re: [linux-lvm] LVM2 modifies the buffer_head struct?
Message-ID: <20020704074534.GA884@fib011235813.fsnet.co.uk>
References: <F19741gcljD2E2044cY00004523@hotmail.com> <20020702141702.GA9769@fib011235813.fsnet.co.uk> <20020703100838.GH14097@suse.de> <20020703120124.GB615@fib011235813.fsnet.co.uk> <20020703121024.GC21568@suse.de> <15651.54044.557070.109158@notabene.cse.unsw.edu.au>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15651.54044.557070.109158@notabene.cse.unsw.edu.au>
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
Date: Thu Jul  4 02:46:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Brown <neilb@cse.unsw.edu.au>
Cc: Jens Axboe <axboe@suse.de>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, Andrew Morton <akpm@zip.com.au>

On Thu, Jul 04, 2002 at 02:46:20PM +1000, Neil Brown wrote:
> I think this can work sanely and is something I have considered for
> raid1-read and multipath in md.
> 
> struct privatebit {
>   bio_end_io_t  *oldend;
>   void          *oldprivate;
>   ...other...stuff;
> };
> 
> make_request(struct request_queue_t *q, struct buffer_head *bh, int rw)
> {
> 
>  struct privatebit *pb = kmalloc(...);
> 
>   pb->oldend = bh->b_end_io;
>   pb->oldprivate = bh->b_private;
>   bh->b_private = pb;
>   bh->b_end_io = my_end_handler;
> 
>   ..remap b_rdev, b_rsector ...
> 
>   generic_make_request(bh, rw);
> 
> }
> 
> Then my_end_handler have do some local cleanup,
> re-instate oldend and oldprivate, and pass the bh back up.
> For raid1/multipath it would arrange to resubmit the request if there
> as an error.
> 
> This stacks nicely and allows for the extra bit to be alloced to be
> minimal.

This is exactly what I'm doing in device-mapper :)

> Ofcourse this ceases to be an issue in 2.5 because the filesys uses 
> pages or buffer_heads and the device driver uses bios.

y, 2.5 is fine.

- Joe
