Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105160032.f4G0WPIP022333@webber.adilger.int>
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
In-Reply-To: <1272890000.989968441@tiny> "from Chris Mason at May 15, 2001 07:14:01
 pm"
Date: Tue, 15 May 2001 18:32:24 -0600 (MDT)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Chris writes:
> On Tuesday, May 15, 2001 04:49:25 PM -0600 Andreas Dilger
> <adilger@turbolinux.com> wrote:
> 
> > Tom Otake writes:
> >> Yes, I've been able to recreate the second hang scenario, though I have
> >> to admit it wasn't exactly the same.  I started the copy of the data,
> >> created a new LV, which worked.  I ran mkreiserfs on the new LV, it
> >> worked.  I removed the new LV, also worked, then ran pvscan.  That's
> >> when the system hung.  All the while, the copy from CD to disk was going
> >> on.
> > 
> > It may be that this is related to the ext3 problem that is ongoing.
> > Basically, if pvscan or vgscan (PV_FLUSH ioctl calling invalidate_buffers)
> > is run it causes buffers to go into an invalid state for the journal
> > code, and this breaks the journaling.  On ext3, there are assertions in
> > the code which detect the invalid state and case an oops (stack trace),
> > but this may not be the case with reiserfs.
> 
> reiserfs should catch blocks that don't have the proper bits set when it
> starts i/o, and then it makes sure the block hasn't been relogged while the
> i/o was in progress.  It sends warnings not an oops though, check your log
> files.  If we were losing journal bits, and the log code didn't catch it,
> the result should be silent corruption.  
> 
> Since he is seeing deadlock, it seems more likely reiserfs is trying to
> lock a buffer for i/o, and that is hanging for some reason....

But what does PV_FLUSH do?  Calls fsync_dev() to flush dirty buffers to
disk, and sync_supers() and waits for buffer I/O completion.  This is
unlikely to be the cause of a problem, because that happens on each
sync call.

It then calls __invalidate_buffers(dev, 0), which destroys everything
but dirty buffers (on ALL buffer lru lists).  Since reiserfs may have
journaled buffers which are not "dirty" by the normal sense, these may
be thrown out.  It is doing _something_ wierd with the ext3 buffers,
such that they are essentially gone from the buffer lists, but still
in the journal list.  We have tried tracking it down a bit, but not
successfully yet.

I think some of the debugging tools Andrew Morton made for ext3 on 2.4
will help.  Basically, it allows you to keep a history of what happens
to the buffer through the journal and block layer, so that when you get
a problem with a buffer you can trace back to see who changed it...  I
haven't yet checked if we still have this invalidate_buffers() issue in
2.4 ext3 yet.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
