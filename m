From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] Re: IO scheduler, queue depth, nr_requests
Message-ID: <20040216140441.GG28615@reti>
References: <20040216131609.GA21974@cistron.nl> <20040216133047.GA9330@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040216133047.GA9330@suse.de>
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
Date: Mon Feb 16 09:01:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com, Jens Axboe <axboe@suse.de>
Cc: Miquel van Smoorenburg <miquels@cistron.nl>, linux-lvm@sistina.com

On Mon, Feb 16, 2004 at 02:30:47PM +0100, Jens Axboe wrote:
> Seems there's an extra problem here, the nr_requests vs depth problem
> should not be too problematic unless you have heavy random io. Doesn't
> look like dm is reordering (bio_list_add() adds to tail,
> flush_deferred_io() processes from head. direct queueing doesn't look
> like it's reordering). Can the dm folks verify this?

Ordering is certainly maintained for the simple targets (linear,
striped).  Snapshots and mirroring still need some work in this
regard, but I don't think these are begin used for the tests.

The place that I am expecting dm to cause poor performance is due to
this bit of stupidity in dm-table.c.  It's on my TODO list, but is not
getting to the op since no-one seems to be complaining about it yet.

                /* FIXME: Device-Mapper on top of RAID-0 breaks because DM
                 *        currently doesn't honor MD's merge_bvec_fn routine.
                 *        In this case, we'll force DM to use PAGE_SIZE or
                 *        smaller I/O, just to be safe. A better fix is in the
                 *        works, but add this for the time being so it will at
                 *        least operate correctly.
                 */
                if (q->merge_bvec_fn)
                        rs->max_sectors =
                                min_not_zero(rs->max_sectors,
                                             (unsigned short)(PAGE_SIZE >> 9));



- Joe
