Date: Wed, 23 Feb 2000 02:25:18 +0100 (CET)
From: Andrea Arcangeli <andrea@suse.de>
Subject: [linux-lvm] Re: __ll_rw_block(): more generalized q->make_request_fn()
In-Reply-To: <200002180712.IAA21315@u9etz.ez-darmstadt.telekom.de>
Message-ID: <Pine.LNX.4.21.0002230207340.8973-100000@alpha.random>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: torvalds@transmeta.com, mingo@redhat.com, linux-kernel@vger.rutgers.edu, mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

On Fri, 18 Feb 2000, Heinz Mauelshagen wrote:

>heading for  a more generalized make_request_fn()/generic_make_request()
>calling convention in __ll_rw_block(), which helps us to avoid to implement
>stacking support in each volume driver (like MD, LVM and POOL), i propose
>the following changes to 2.3.46 ll_rw_blk.c.
>
>Ingo: can MD deal with that as well?
>Linus: comments?

I agree to go in that direction. I also think the logical volume handler
should be a per major thing and not a queue thing. It doesn't worth to
waste space in each queue for a per blockdevice callback.

This is the core of what I did:

[..]
		bh[i]->b_rdev = bh[i]->b_dev;
		bh[i]->b_rsector = bh[i]->b_blocknr*(bh[i]->b_size>>9);

		major = logical_major;
		if (blk_dev[major].logical_volume_fn) {
			/*
			 * Loop thru all functions until we don't
			 * hit a volume driver any longer.
			 */
			do {
				if (blk_dev[major].logical_volume_fn(rw, bh[i]))
					goto IO_error;
				major = MAJOR(bh[i]->b_rdev);
			} while (blk_dev[major].logical_volume_fn);

			q = blk_get_queue(bh[i]->b_rdev);
		}

		generic_make_request(q, rw, bh[i]);
		continue;

	IO_error:
		buffer_IO_error(bh[i]);
	}
[..]

This gives genericity without recursion on the stack with multiple volume
layer and without having to recalc the queue after each volume layer
returned. It also handle logical volume driver errors gracefully.

The common code changes are here:

	ftp://ftp.*.kernel.org/pub/linux/kernel/people/andrea/patches/v2.3/2.3.47/logical-volume-ll_rw_block-2.3.47-1.gz

These are the md driver updates to the new ll_rw_block logical volume
interface:

	ftp://ftp.*.kernel.org/pub/linux/kernel/people/andrea/patches/v2.3/2.3.47/logical-volume-md-2.3.47-1.gz

What do you think about them, Ingo? I have not tested MD (I only tested
the ll_rw_block changes with LVM and they are rock solid) but also MD
looks ok to me. See the generic_make_request that goes away and gets
recalled from the ll_rw_block layer now.

I also did this change to the md primary handler:

-void md_make_request (int rw, struct buffer_head * bh)
+int md_logical_volume (int rw, struct buffer_head * bh)
 {
        mddev_t *mddev = kdev_to_mddev(bh->b_dev);
 
-       if (!mddev || !mddev->pers)
-               bh->b_end_io(bh, 0);
-       else {
-               if ((rw == READ || rw == READA) && buffer_uptodate(bh))
-                       bh->b_end_io(bh, 1);
-               else
-                       mddev->pers->make_request(mddev, rw, bh);
-       }
+       if (mddev && mddev->pers)
+               return mddev->pers->make_request(mddev, rw, bh);
+       else
+               return 1;
 }

The end_io(0) is now handled cleanly in the ll_rw_block layer (see
buffer_IO_error) by returning a value != 0.

What I am instead interested to know is if I am right assuming the (rw ==
READ || rw == READA) && buffer_uptodate(bh) check is only a not necessary
performance optimization. Is that right? Maybe it's not right for your
latest raid5 code but I guess it is going to work fine in raid0 and linear
that are the only md lowlevel drivers uptodate in 2.3.47.

Even if such check is necessary for some subtle reason in your new raid
code, it doesn't look clean at all to me but it seems a sympthom of bad
design. If you get there, the buffer shouldn't be uptodate in first place,
or you'd better fix the caller instead of adding an additional branch in
such a fast path.

For the LVM changes I submitted them to Heinz.

Comments?

Andrea
