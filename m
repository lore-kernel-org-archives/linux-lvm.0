Message-ID: <2D0AFEFEE711D611923E009027D39F2B02F18A@nasexs1.meridian-data.com>
From: Dale Stephenson <dale.stephenson@quantum.com>
Subject: RE: [linux-lvm] How well tested is the snapshot feature?
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C20E38.FCE21E70"
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
Date: Fri Jun  7 10:30:02 2002
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>
Cc: "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C20E38.FCE21E70
Content-Type: text/plain;
	charset="iso-8859-1"

I'm one of those people using LVM1 snapshots mostly successfully with XFS.
However:

1) I'm using a process flag hack to keep XFS's filesystem freeze from
snagging writes by kupdated, xfs_freeze, and fsync_dev/fsync_dev_lockfs.
I've also removed the xfs_unmountfs_writesb() call from xfs_thaw().  I'm
included the two patches I use, which apply against XFS 1.1.  I've directed
most of my discussion of this to the XFS list, as the locking mechanism is
filesystem-specific.  The only filesystem calls that the lvm driver makes
with the VFS patch are fsync_dev_lockfs() and unlockfs().  The COW activity
itself is done through brw_kiovec(), which I believe should not go through
the file system at all (though it seems to cause lots of indirect file
system activity through kupdated).

device-mapper (LVM2) uses (with VFS enhancement) the very same
fsync_dev_lockfs() and unlockfs() calls.  However, the COW activity is not
handled through brw_kiovec(), instead being transferred to device-mapper's
kcopyd.  I haven't worked with LVM2 yet, so it's certainly possible that
kcopyd allieviates the pressure on kupdated.  But in theory I would expect
it to be susceptible to the same file system deadlocks experienced by LVM1.


2) I'm still seeing an occasional xfs_freeze deadlock.
xfs_unmountfs_writesb() (from xfs_freeze) and kupdated get stuck on separate
pagebuf locks.  It occurs with multiple snapshots and streaming writes to
the snapshot source over both samba and nfs.

Using these patches, I haven't seen any oops problems, only the odd
deadlock.  You also have to mount the XFS snapshots with nouuid and
norecovery options.

Another approach that will work is to forget using the VFS patch entirely,
and use writeable snapshots (available for 1.1, LVM2, and working patches
have been posted to the list for 1.0.x).  If the snapshot is writeable you
can just mount with nouuid (or change the UUID of the snapshot), mount the
snapshot and let XFS recovery do its stuff.  This has the advantage of not
running into any locking problems whatsoever.  The disadvantage is that the
filesystem isn't clean, so instead of having a snapshot of the filesystem at
that point of time, you have the filesystem as if the power had suddenly
failed at that point in time.

Dale Stephenson
steph@snapserver.com

> -----Original Message-----
> From: Joe Thornber [mailto:joe@fib011235813.fsnet.co.uk]
> Sent: Friday, June 07, 2002 2:45 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] How well tested is the snapshot feature?
> 
> 
> On Fri, Jun 07, 2002 at 11:37:05AM +0200, Stephan Austermuehle wrote:
> > On Fri, Jun 07, 2002 at 10:33:00AM +0100, Joe Thornber wrote:
> > 
> > > Did you apply the VFS patch from the 1.0.3 release ?  This makes
> > > sure that the filesystem flushes a consistent state to the disk
> > > before the snapshot is setup.
> > 
> > Do you mean the VFS lock patch? Yes, it is applied.
> 
> Curious, as far as I know people are using LVM1 snapshots successfully
> with xfs.
> 
> - Joe


------_=_NextPart_000_01C20E38.FCE21E70
Content-Type: application/octet-stream;
	name="no_freeze.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="no_freeze.patch"

--- linux.old/fs/xfs/xfs_log.c	Wed Mar 20 04:51:25 2002=0A=
+++ linux/fs/xfs/xfs_log.c	Sat Mar 30 00:38:58 2002=0A=
@@ -324,6 +324,11 @@=0A=
 	int	rval;=0A=
 	xlog_t *log =3D mp->m_log;=0A=
 =0A=
+	if (XFS_MTOVFS(mp)->vfs_flag & VFS_RDONLY) {=0A=
+		printk("ignoring xfs_log_force on a read-only filesystem\n");=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
 #if defined(DEBUG) || defined(XLOG_NOLOG)=0A=
 	if (! xlog_debug && xlog_devt =3D=3D log->l_dev)=0A=
 		return 0;=0A=
--- linux.old/fs/xfs/xfs_mount.c	Sat Mar  9 03:21:26 2002=0A=
+++ linux/fs/xfs/xfs_mount.c	Sat Mar 30 00:39:39 2002=0A=
@@ -1680,6 +1680,7 @@=0A=
 	int		level)=0A=
 {=0A=
 	int	s =3D mutex_spinlock(&mp->m_freeze_lock);=0A=
+	unsigned long flags;=0A=
 =0A=
 	mp->m_frozen =3D level;=0A=
 	mutex_spinunlock(&mp->m_freeze_lock, s);=0A=
@@ -1688,13 +1689,27 @@=0A=
 		while (atomic_read(&mp->m_active_trans) > 0)=0A=
 			delay(100);=0A=
 	}=0A=
+=0A=
+	flags =3D current->flags;=0A=
+	current->flags |=3D PF_NO_FREEZE;=0A=
+=0A=
+	/* make sure the log is written after we freeze */=0A=
+	xfs_log_force(mp, 0, XFS_LOG_FORCE|XFS_LOG_SYNC);=0A=
+=0A=
+	if (! (flags & PF_NO_FREEZE)) {=0A=
+		current->flags &=3D ~PF_NO_FREEZE;=0A=
+	}=0A=
 }=0A=
 =0A=
 void=0A=
 xfs_finish_freeze(=0A=
 	xfs_mount_t *mp)=0A=
 {=0A=
-	int	s =3D mutex_spinlock(&mp->m_freeze_lock);=0A=
+	int	s;=0A=
+=0A=
+	if (current->flags & PF_NO_FREEZE) return;=0A=
+=0A=
+	s =3D mutex_spinlock(&mp->m_freeze_lock);=0A=
 =0A=
 	if (mp->m_frozen) {=0A=
 		mp->m_frozen =3D 0;=0A=
@@ -1713,6 +1728,14 @@=0A=
 {=0A=
 	int	s;=0A=
 	int	do_lock =3D 0;=0A=
+=0A=
+	/* some processes must not freeze - eg. a lvcreate or kupdated, =
otherwise=0A=
+	   lvcreate locks solid as it tries to flush blocks, and that gets =
here */=0A=
+	if (current->flags & PF_NO_FREEZE)  {=0A=
+		if (level =3D=3D XFS_FREEZE_TRANS)=0A=
+			atomic_inc(&mp->m_active_trans);=0A=
+		return;=0A=
+	}=0A=
 =0A=
 	if (!mp->m_frozen) {=0A=
 		if (level =3D=3D XFS_FREEZE_TRANS)=0A=
--- linux.old/fs/buffer.c	Sat Mar 30 00:28:28 2002=0A=
+++ linux/fs/buffer.c	Sat Mar 30 00:40:54 2002=0A=
@@ -392,6 +392,14 @@=0A=
 =0A=
 int fsync_dev(kdev_t dev)=0A=
 {=0A=
+	int ret;=0A=
+	unsigned long flags;=0A=
+=0A=
+	flags =3D current->flags;=0A=
+	/* we set this flag to prevent the XFS pagebuf code causing a =
deadlock =0A=
+	   during a sync - a frozen filesystem should freeze only new IO, =
not=0A=
+	   existing data waiting to be flushed */=0A=
+	current->flags |=3D PF_NO_FREEZE;=0A=
 	sync_buffers(dev, 0);=0A=
 =0A=
 	lock_kernel();=0A=
@@ -400,7 +408,13 @@=0A=
 	sync_supers(dev);=0A=
 	unlock_kernel();=0A=
 =0A=
-	return sync_buffers(dev, 1);=0A=
+	ret =3D sync_buffers(dev, 1);=0A=
+=0A=
+	if (! (flags & PF_NO_FREEZE)) {=0A=
+		current->flags &=3D ~PF_NO_FREEZE;=0A=
+	}=0A=
+=0A=
+	return ret;=0A=
 }=0A=
 =0A=
 /*=0A=
@@ -3038,6 +3052,9 @@=0A=
 	siginitsetinv(&current->blocked, sigmask(SIGCONT) | =
sigmask(SIGSTOP));=0A=
 	recalc_sigpending(tsk);=0A=
 	spin_unlock_irq(&tsk->sigmask_lock);=0A=
+=0A=
+	/* kupdated can also do IO of old blocks on a frozen filesystem */=0A=
+	current->flags |=3D PF_NO_FREEZE;=0A=
 =0A=
 	complete((struct completion *)startup);=0A=
 =0A=
--- linux.old/include/linux/sched.h	Sat Mar 30 00:30:23 2002=0A=
+++ linux/include/linux/sched.h	Fri Mar 29 23:34:13 2002=0A=
@@ -428,6 +428,7 @@=0A=
 #define PF_FREE_PAGES	0x00002000	/* per process page freeing */=0A=
 #define PF_NOIO		0x00004000	/* avoid generating further I/O */=0A=
 #define PF_FSTRANS	0x00008000	/* inside a filesystem transaction */=0A=
+#define PF_NO_FREEZE	0x01000000	/* ignore fs freeze flag */=0A=
 =0A=
 #define PF_USEDFPU	0x00100000	/* task used FPU this quantum (SMP) =
*/=0A=
 =0A=

------_=_NextPart_000_01C20E38.FCE21E70
Content-Type: application/octet-stream;
	name="no_freeze_lockfs.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="no_freeze_lockfs.patch"

--- linux/fs/buffer.c.old	Tue Apr  2 10:47:30 2002=0A=
+++ linux/fs/buffer.c	Tue Apr  2 10:48:35 2002=0A=
@@ -428,6 +428,9 @@=0A=
 =0A=
 int fsync_dev_lockfs(kdev_t dev)=0A=
 {=0A=
+	unsigned long flags;=0A=
+	int ret;=0A=
+=0A=
 	/* you are not allowed to try locking all the filesystems=0A=
 	** on the system, your chances of getting through without=0A=
 	** total deadlock are slim to none.=0A=
@@ -435,6 +438,9 @@=0A=
 	if (!dev)=0A=
 		return fsync_dev(dev) ;=0A=
 =0A=
+	flags =3D current->flags;=0A=
+	current->flags |=3D PF_NO_FREEZE;=0A=
+=0A=
 	sync_buffers(dev, 0);=0A=
 =0A=
 	lock_kernel();=0A=
@@ -451,7 +457,13 @@=0A=
 	sync_supers_lockfs(dev) ;=0A=
 	unlock_kernel();=0A=
 =0A=
-	return sync_buffers(dev, 1) ;=0A=
+	ret =3D sync_buffers(dev, 1) ;=0A=
+=0A=
+	if (! (flags & PF_NO_FREEZE)) {=0A=
+		current->flags &=3D ~PF_NO_FREEZE;=0A=
+	}=0A=
+=0A=
+	return ret;=0A=
 }=0A=
 =0A=
 asmlinkage long sys_sync(void)=0A=
@@ -1171,13 +1183,23 @@=0A=
 void balance_dirty(void)=0A=
 {=0A=
 	int state =3D balance_dirty_state();=0A=
+	unsigned long flags;=0A=
 =0A=
 	if (state < 0)=0A=
 		return;=0A=
 =0A=
 	/* If we're getting into imbalance, start write-out */=0A=
 	spin_lock(&lru_list_lock);=0A=
+=0A=
+	flags =3D current->flags;=0A=
+	current->flags |=3D PF_NO_FREEZE;=0A=
+=0A=
 	write_some_buffers(NODEV);=0A=
+=0A=
+	if (! (flags & PF_NO_FREEZE)) {=0A=
+		current->flags &=3D ~PF_NO_FREEZE;=0A=
+	}=0A=
+=0A=
 =0A=
 	/*=0A=
 	 * And if we're _really_ out of balance, wait for=0A=
--- linux/fs/xfs/xfs_fsops.c.old	Fri Apr 26 18:10:29 2002=0A=
+++ linux/fs/xfs/xfs_fsops.c	Fri Apr 26 18:13:16 2002=0A=
@@ -551,6 +551,7 @@=0A=
 	vfs_t		*vfsp;=0A=
 	/*REFERENCED*/=0A=
 	int		error;=0A=
+	unsigned long flags;=0A=
 =0A=
 	vfsp =3D XFS_MTOVFS(mp);=0A=
 =0A=
@@ -565,6 +566,10 @@=0A=
 =0A=
 	/* Pause transaction subsystem */=0A=
 	xfs_start_freeze(mp, XFS_FREEZE_TRANS);=0A=
+	=0A=
+	/* don't freeze the freeze */=0A=
+	flags =3D current->flags;=0A=
+	current->flags |=3D PF_NO_FREEZE;=0A=
 =0A=
 	/* Flush any remaining inodes into buffers */=0A=
 	VFS_SYNC(vfsp, SYNC_ATTR|SYNC_WAIT, sys_cred, error);=0A=
@@ -579,6 +584,10 @@=0A=
 	xfs_log_unmount_write(mp);=0A=
 	xfs_unmountfs_writesb(mp);=0A=
 =0A=
+	if (! (flags & PF_NO_FREEZE)) {=0A=
+		current->flags &=3D ~PF_NO_FREEZE;=0A=
+	}=0A=
+=0A=
 	return 0;=0A=
 }=0A=
 =0A=
@@ -587,7 +596,6 @@=0A=
 xfs_fs_thaw(=0A=
 	xfs_mount_t	*mp)=0A=
 {=0A=
-	xfs_unmountfs_writesb(mp);=0A=
 	xfs_finish_freeze(mp);=0A=
 	return 0;=0A=
 }=0A=

------_=_NextPart_000_01C20E38.FCE21E70--
