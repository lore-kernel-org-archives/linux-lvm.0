Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011302005.eAUK5re01932@webber.adilger.net>
In-Reply-To: <14886.7367.247491.267120@notabene.cse.unsw.edu.au>
 "from Neil Brown at Nov 30, 2000 08:24:23 pm"
Date: Thu, 30 Nov 2000 13:05:53 -0700 (MST)
MIME-Version: 1.0
Subject: [linux-lvm] Re: [PATCH] Re: [bug] infinite loop in generic_make_request()
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Brown <neilb@cse.unsw.edu.au>
Cc: Linus Torvalds <torvalds@transmeta.com>, V Ganesh <ganesh@veritas.com>, linux-kernel@vger.kernel.org, linux-LVM@sistina.com, mingo@redhat.com

Neil Brown write:
> On Thursday November 30, ganesh@veritas.com wrote:
> > in generic_make_request(), the following code handles stacking:
> > 
> > do {
> >        q = blk_get_queue(bh->b_rdev);
> >        if (!q) {
> >                         printk(...)
> >                         buffer_IO_error(bh);
> >                         break;
> >        }
> > } while (q->make_request_fn(q, rw, bh));
> > 
> > however, make_request_fn may return -1 in case of errors. one such fn is
> > raid0_make_request(). this causes generic_make_request() to loop endlessly.
> > lvm returns 1 unconditionally, so it would also loop if an error occured in
> > lvm_map(). other bdevs might have the same problem.
> > I think a better mechanism would be to mandate that make_request_fn ought
> > to call bh->b_end_io() in case of errors and return 0.
> 
> Good catch, thanks.  Below is a patch to fix md drivers (md.c,
> linear.c and raid0.c).
> 
> NeilBrown

You need to also patch the lvm.c driver at the same time...  However, this
change now makes it very counter-intuitive compared to other kernel
functions.  Normally, we return 0 on success, and -ve on error.  Maybe
the RAID and LVM make_request functions should be changed to do that
instead (i.e. 0 on success, -ve on error, and maybe "1" if they do their
own recursion to break the loop)?

Cheers, Andreas

PS - I fixed the LVM mailing list address...
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
