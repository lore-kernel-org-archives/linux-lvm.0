From: Andreas Dilger <adilger@turbolabs.com>
Message-ID: <20011022162326.G5146@turbolinux.com>
References: <E15vISM-0005YX-00.2001-10-21-14-15-58@mail5.svr.pol.co.uk> <002501c15a66$34f8d010$836788cf@industry> <20011022230524.B4212@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011022230524.B4212@redhat.com>
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
Date: Mon Oct 22 17:22:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Stephen C. Tweedie" <sct@redhat.com>
Cc: "Jason A. Lixfeld" <jlixfeld@fastvibe.com>, ext3-users@redhat.com, linux-lvm@sistina.com

On Oct 22, 2001  23:05 +0100, Stephen C. Tweedie wrote:
> Just glancing over the LVM code, though, I don't think that their
> locking code is safe in the presence of other filesystem activity.  
>
> lvm_do_pe_lock_unlock does try to flush existing IO, but they do it
> with
> 
> 		pe_lock_req.lock = UNLOCK_PE;
> 		fsync_dev(pe_lock_req.data.lv_dev);
> 		pe_lock_req.lock = LOCK_PE;

Note that the code you reference is only in use when the Logical Extent
is being moved from one disk to another (shouldn't be done in normal
circumstances).  Also, this code has been reworked in the LVM CVS and
recent LVM releases to be more robust.

> which (a) doesn't wait for existing IO to complete if that IO was
> submitted externally to the buffer cache (so it won't catch
> raw IO, direct IO, journal activity, or RAID1 ios); and (b) it allows
> new IO to be submitted while the fsync is going on, so when it
> eventually sets LOCK_PE state again, we can have loads of new IO
> freshly submitted to the device by the time the lock is re-asserted.  

The "external I/O" problem is a known issue (raw IO) because it is not
flushed.  Note that in newer kernels, all write I/O which is done to
the LE being moved is put into a queue at LVM mapping time, so the
above fsync is not an issue for it (it gets resubmitted when the move
is done).

> LVM folks, am I missing something here?  I can't see how you can
> assert that the device is truly quiescent after the LOCK_PE has been
> set.  

See lvm_map() in newer LVM code for the _queue_io() calls.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
