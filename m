Message-ID: <2D0AFEFEE711D611923E009027D39F2B02F18C@nasexs1.meridian-data.com>
From: Dale Stephenson <dale.stephenson@quantum.com>
Subject: RE: [linux-lvm] How well tested is the snapshot feature?
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
Date: Fri Jun  7 13:26:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>
Cc: "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>

Joe Thornber writes:
> On Fri, Jun 07, 2002 at 08:35:44AM -0700, Dale Stephenson wrote:
> > device-mapper (LVM2) uses (with VFS enhancement) the very same
> > fsync_dev_lockfs() and unlockfs() calls.  However, the COW 
> activity is not
> > handled through brw_kiovec(), instead being transferred to 
> device-mapper's
> > kcopyd.  I haven't worked with LVM2 yet, so it's certainly 
> possible that
> > kcopyd allieviates the pressure on kupdated.  But in theory 
> I would expect
> > it to be susceptible to the same file system deadlocks 
> experienced by LVM1.
> 
> I'm not sure what this kupdated interaction that you mention could be.
> Both brw_kiovec and kcopyd stay well away from both the filesystem
> and the buffer cache.
> 
Subjective impression.  kupdated always seems to be in D state with
streaming writes and snapshots, more so than a similar stream directed at
LVM + XFS without snapshots.  While brw_kiovec and kcopyd stay away from the
filesystem, the filesystem doesn't stay away from them!  When kupdated
writes out something to a LV with multiple snapshots, multiple COW can
occur.  Since with device-mapper the COW is done by a separate process
(kcopyd), I'd expect kupdated to not spend so much time in D.  Plus
device-mapper's supposed to be faster. 

But when I say I expect "it" to be susceptible I'm talking about the system,
NOT the COW activity.  I really haven't had a problem with a thread getting
stuck while trying to do COW.  The problem I'm seeing now is with
xfs_unmountfs_writesb() as called from xfs_fs_freeze().  I've only seen the
problem with (multiple) snapshots, but brw_kiovec() isn't involved in the
deadlock and fsync_dev_lockfs() is.  So I would expect LVM2 (device-mapper)
to be susceptible to the same problem, at least in theory.

> > 2) I'm still seeing an occasional xfs_freeze deadlock.
> > xfs_unmountfs_writesb() (from xfs_freeze) and kupdated get 
> stuck on separate
> > pagebuf locks.  It occurs with multiple snapshots and 
> streaming writes to
> > the snapshot source over both samba and nfs.
> 
> Which kernel are you using ?  I've found that 2.4.18 can be easily
> persuaded to deadlock by having two processes making GFP_NOIO requests
> for memory whilst the system is short of free memory. 2.4.19-pre9
> works fine.
> 
2.4.18.  I've been able to induce memory deadlocks (processes in D state
descending from alloc_pages) on my 64K box with multiple snapshots, but
haven't been too worried about that since I expect it.  On a 1 GB system I
haven't seen the deadlocks, or at least recognized it as such.  The one I'm
seeing has a ton of writing processes waiting on check_frozen (which is
fine), kupdated stuck on pagebuf_lock(), and xfs_freeze waiting on
_pagebuf_wait_unpin().  Is this something you've seen?

I hope to have this tested on 2.4.19-pre10 Real Soon Now.

Dale Stephenson
steph@snapserver.com
