Return-Path: <jweber@valinux.com>
Date: Tue, 15 May 2001 18:50:44 -0700 (PDT)
From: Jay Weber <jweber@valinux.com>
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
In-Reply-To: <28230000.989975826@tiny>
Message-ID: <Pine.LNX.4.30.0105151835220.25662-100000@shells.valinux.com>
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: ext3-users@redhat.com, Joe Thornber <thornber@btconnect.com>, sct@redhat.com

I think I have this one solved, I hope.

I think what Andreas and I are running into are a few different
assertions.  One being the LVM lvm_do_pv_flush caused assertion which is
related directly to invalidate_buffers() being called which then triggers
refile_buffer() on a journaled buffer, which appears clean in all other
ways according to the checks in refile_buffer().

The following is what I've got in __invalidate_buffers() right now.

                        if (!bh->b_count && !buffer_journaled(bh) &&
                            (destroy_dirty_buffers || !buffer_dirty(bh)))
                                put_last_free(bh);
                        if (slept)
                                goto again;

Stephen suggested something along the above a bit ago, except he uses
bh->b_jlist == BJ_None.  buffer_journaled() seems to be a function in fs.h
which seems a bit more appropriate.

Next, with the above we'd still see problems.  My next patch included a
suggestion from Heinz to add lock_kernel() and unlock_kernel() around the
fsync_dev() and invalidate_buffers() in lvm.c/lvm_do_pv_flush().
Currently I have this in my working kernel, I'm gonna try again without it
though, it seems that it shouldn't be necessary, the other block devices
I've looked at don't seem to lock the kernel.

Lastly, I was still getting an assertion generating the "Attempt to refile
free buffer", but this one was actually caused by an ext3 journaling
function calling refile_buffer(), not derived from invalidate_buffers().

In fs/jfs/checkpoint.c/cleanup_transaction(), you'll note it does some
buffer_head bit checks and then calls refile_buffer().  Mine currently
looks like the following:

                if (!buffer_dirty(bh) && !buffer_jdirty(bh) &&
                    !buffer_journaled(bh) &&
                    bh->b_list != BUF_CLEAN) {
                        unlock_journal(journal);
                        refile_buffer(bh);
                        lock_journal(journal);
                        return 1;
                }

Note the addition of the !buffer_journaled(bh) check.

Okay, so using all of the above, I have now been running multiple vgscan
loops and a pvscan loop while untarr'ing kernel, removing the kernel dir,
and then untarring again, and building the kernel with make -j4 (eating up
my memory and cpu) for nearly an hour with no assertions.

To me it appears that Stephen had it right all along (in prior thread on
this), he stated that the b_jlist == BJ_None may be necessary elsewhere
also, to insure that there are no journaled buffers out there before
handing back to refile_buffer().  I think that's what we were up against
and as far as I can tell (grepping for refile_buffer() in jfs/* code) I've
added the checks to all the appropriate cases.

Andreas can you give the above a try and see if it solves the problem on
your end also.  Stephen, does this look good as far as what I've changed?

Sorry, no diffs just yet, the changes are rather smallish though.

Thanks.

On Tue, 15 May 2001, Chris Mason wrote:

> Date: Tue, 15 May 2001 21:17:06 -0400
> From: Chris Mason <mason@suse.com>
> Reply-To: linux-lvm@sistina.com
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
>
>
>
> On Tuesday, May 15, 2001 06:32:24 PM -0600 Andreas Dilger
> <adilger@turbolinux.com> wrote:
>
> >> reiserfs should catch blocks that don't have the proper bits set when it
> >> starts i/o, and then it makes sure the block hasn't been relogged while
> >> the i/o was in progress.  It sends warnings not an oops though, check
> >> your log files.  If we were losing journal bits, and the log code didn't
> >> catch it, the result should be silent corruption.
> >>
> >> Since he is seeing deadlock, it seems more likely reiserfs is trying to
> >> lock a buffer for i/o, and that is hanging for some reason....
> >
> > But what does PV_FLUSH do?  Calls fsync_dev() to flush dirty buffers to
> > disk, and sync_supers() and waits for buffer I/O completion.  This is
> > unlikely to be the cause of a problem, because that happens on each
> > sync call.
> >
> > It then calls __invalidate_buffers(dev, 0), which destroys everything
> > but dirty buffers (on ALL buffer lru lists).
>
> Unless I'm reading it wrong (2.4.4), __invalidate_buffers destroys all
> buffers that are clean and have b_count == 0.  Reiserfs keeps b_count > 0
> for all metadata buffers that have been logged, while ext3 allows the count
> to be zero (but keeps them in the dirty list).
>
> __invalidate_buffers also waits on any locked buffers.  Any chance one of
> the other LVM ioctls grabs some lvm lock before calling PV_FLUSH?
>
> You're right though, pv_flush certainly doesn't look like it could cause
> any deadlocks.
>
> -chris
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
