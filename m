From: Eric Sandeen <sandeen@sgi.com>
In-Reply-To: <Pine.LNX.4.33.0201042103110.11386-100000@chuckle.americas.sgi.com>
References: <Pine.LNX.4.33.0201042103110.11386-100000@chuckle.americas.sgi.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1010430053.14493.9.camel@stout.americas.sgi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to coexist happily
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
Date: Mon Jan  7 12:58:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Eric Sandeen <sandeen@sgi.com>
Cc: Adrian Head <ahead@bigpond.net.au>, Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

On Fri, 2002-01-04 at 21:10, Eric Sandeen wrote:
> Ok, I've done a bit of kdb sleuthing over here... it looks like it's
> blowing up shortly after lvm_snapshot_COW, although for some reason kdb
> says the backtrace is from sys_stat64 after the oops.  On the other
> hand, setting a breakpoint at
> lvm_snapshot_COW, it oopses just a couple steps later.  Here's the
> backtrace out of lvm_snapshot_COW.  It gets there from lvm_do_lv_create
> via unlockfs; does this make sense?  I didn't expect to get into
> lvm_snapshot_COW until after the snapshot volume was created...

Ok, it looks like that was the problem.  XFS wrote the superblock when
unfreezing (unlocking) the filesystem, apparently LVM wasn't happy with
this I/O on the snapshotted volume before the volume had been created. 
Something goes quite haywire as a result, but I'm not sure what.

We really don't need the superblock write at this point (it was the last
thing done prior to the freeze, no need to do it again), and removing it
allows the snapshot to be created without error.

I was curious, though, to see if reversing the order of unlockfs() &
lvm_fs_create_lv() at the end of  lvm_do_lv_create() might alleviate
this problem (i.e. create the lv, THEN unlock the snapshotted volume)
but that didn't work, either.  Perhaps the LVM folks can comment on
this...

Adrian says there's still a problem with overflows; I'll look into that.

-Eric

-- 
Eric Sandeen      XFS for Linux     http://oss.sgi.com/projects/xfs
sandeen@sgi.com   SGI, Inc.
