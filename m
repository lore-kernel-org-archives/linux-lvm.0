From: "Stephen C. Tweedie" <sct@redhat.com>
Message-ID: <20011023113250.A2334@redhat.com>
References: <E15vISM-0005YX-00.2001-10-21-14-15-58@mail5.svr.pol.co.uk> <002501c15a66$34f8d010$836788cf@industry> <20011022230524.B4212@redhat.com> <20011022162326.G5146@turbolinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011022162326.G5146@turbolinux.com>; from adilger@turbolabs.com on Mon, Oct 22, 2001 at 04:23:26PM -0600
Subject: [linux-lvm] Re: What really works?
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
Date: Tue Oct 23 05:32:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Stephen C. Tweedie" <sct@redhat.com>, "Jason A. Lixfeld" <jlixfeld@fastvibe.com>, ext3-users@redhat.com, linux-lvm@sistina.com

Hi,

On Mon, Oct 22, 2001 at 04:23:26PM -0600, Andreas Dilger wrote:

> > lvm_do_pe_lock_unlock does try to flush existing IO, but they do it
> > with
> > 
> > 		pe_lock_req.lock = UNLOCK_PE;
> > 		fsync_dev(pe_lock_req.data.lv_dev);
> > 		pe_lock_req.lock = LOCK_PE;
> 
> Note that the code you reference is only in use when the Logical Extent
> is being moved from one disk to another (shouldn't be done in normal
> circumstances).

Right, and the user in question had a LVM working robustly for 5 days
before trying to move a partition, at which point the filesystem
started giving errors all over the place.  It wasn't 100% clear from
the bug report whether the "move" was a fs-level copy or an LVM-level
PE move, though.

> Also, this code has been reworked in the LVM CVS and
> recent LVM releases to be more robust.

Yep, saw that.

> > which (a) doesn't wait for existing IO to complete if that IO was
> > submitted externally to the buffer cache (so it won't catch
> > raw IO, direct IO, journal activity, or RAID1 ios); and (b) it allows
> > new IO to be submitted while the fsync is going on, so when it
> > eventually sets LOCK_PE state again, we can have loads of new IO
> > freshly submitted to the device by the time the lock is re-asserted.  
> 
> The "external I/O" problem is a known issue (raw IO) because it is not
> flushed.  Note that in newer kernels, all write I/O which is done to
> the LE being moved is put into a queue at LVM mapping time, so the
> above fsync is not an issue for it (it gets resubmitted when the move
> is done).

It's still an issue, because you haven't waited for the previous
external IO to complete.  The 1.0.1rc4 code looks much more robust in
its locking against newly submitted IO (case (b) above), but doesn't
address (a) yet, and for the ext3 journal, that's a big problem.

Any block device which assumes that IO is done through the buffer
cache is broken in this respect.  The 2.2 raid1/5 reconstruction code
had the same problem, but 2.4 fixed that.

Cheers,
 Stephen
