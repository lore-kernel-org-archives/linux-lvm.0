Subject: Re: [linux-lvm] How well tested is the snapshot feature?
Message-ID: <20020608085931.GA915@fib011235813.fsnet.co.uk>
References: <2D0AFEFEE711D611923E009027D39F2B02F18C@nasexs1.meridian-data.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2D0AFEFEE711D611923E009027D39F2B02F18C@nasexs1.meridian-data.com>
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
Date: Sat Jun  8 04:00:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>

On Fri, Jun 07, 2002 at 11:31:30AM -0700, Dale Stephenson wrote:
> Subjective impression.  kupdated always seems to be in D state with
> streaming writes and snapshots, more so than a similar stream directed at
> LVM + XFS without snapshots.  While brw_kiovec and kcopyd stay away from the
> filesystem, the filesystem doesn't stay away from them!  When kupdated
> writes out something to a LV with multiple snapshots, multiple COW can
> occur.

The big weakness of snapshots in LVM1 and EVMS is that they perform
the copy on write exception synchronously.  ie. If a process schedules
a lot of writes to a device (eg, kupdate), and these writes trigger a
lot of exceptions, the exceptions will be performed one after the
other.  So if you are using an 8k chunk size for each exception (small
chunks sizes eliminate redundant copying), and kupdate triggers 1M of
exceptions LVM1 and EVMS will perform the following steps:

1) Issue read of original chunk
2) wait
3) issue write
4) wait

And it will do it for *every* chunk, 128 times in this case.  So
that's 256 times in total that the original process spends waiting for
the disk.  No wonder you see kupdate in the 'D' state.

In order to combat this effect you will be forced to use larger chunk
sizes in the hope that most of these exceptions are to adjacent parts
of the disk.

With device-mapper if an exception is triggered it is immediately
handed to kcopyd, and then device-mapper carrys on servicing
subsequent requests.  Typically queuing more and more exceptions with
kcopyd.  Kcopyd tries to perform as many of these copies at once,
which gives us two major benefits.

i) The read for one exception can occur at the same time as the write
   for another.  Assuming the COW store and the origin are on seperate
   PVs on average this reduces the overhead of performing an exception
   by a half.

ii) There is no uneccessary waiting !  This waiting is readily
    apparent in the graph on

    http://people.sistina.com/~thornber/snap_performance.html

    Since this benchmark is based on dbench which just creating and
    removing v. large files it is advantageous to LVM1/EVMS since
    there will be little redundant copying when they use large chunk
    sizes.  It would be interesting to use a benchmark that touches lots
    of little files scattered over a huge filesystem - that would at
    least highlight the inefficiency of copying 512k when a 1k file is
    touched.

So with LVM2 people are encouraged to use small chunk sizes to avoid
redundant copying.

> The problem I'm seeing now is with
> xfs_unmountfs_writesb() as called from xfs_fs_freeze().  I've only seen the
> problem with (multiple) snapshots, but brw_kiovec() isn't involved in the
> deadlock and fsync_dev_lockfs() is.  So I would expect LVM2 (device-mapper)
> to be susceptible to the same problem, at least in theory.

Yes, it sounds like a bug in xfs.

> 2.4.18.  I've been able to induce memory deadlocks (processes in D state
> descending from alloc_pages) on my 64K box with multiple snapshots, but
> haven't been too worried about that since I expect it.  On a 1 GB system I
> haven't seen the deadlocks, or at least recognized it as such.  The one I'm
> seeing has a ton of writing processes waiting on check_frozen (which is
> fine), kupdated stuck on pagebuf_lock(), and xfs_freeze waiting on
> _pagebuf_wait_unpin().  Is this something you've seen?

No, the deadlocks I've seen seemed to involve a thread staying
permanently in the rebalance loop in __alloc_pages.

- Joe
