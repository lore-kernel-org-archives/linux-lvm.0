From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] VFS lock patch for 2.4.22 ???
Message-ID: <20031006125004.GB808@tykepenguin.com>
References: <Pine.LNX.4.44.0310050117170.3619-100000@Server.mbss.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0310050117170.3619-100000@Server.mbss.org>
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
Date: Tue Oct  7 07:34:05 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline

On Sun, Oct 05, 2003 at 01:21:25AM +0100, Damir Dezeljin wrote:
> Hi.
> 
> I have to use kernel 2.4.22 on my box (due to new drivers and fixes),
> however I also have to use LVM10 snapshots (Debian Woody) on the same box
> (I already have an volume group and logical volumes configured).
> 
> The problem is that I'm using ext3 on the logical volumes and when I try
> to mount an snapshot I got an error.
> 
> 
> Is there an VFS-lock patch for kernel 2.4.22?
> If not ... is there any other way to get work mounting of ext3 snapshots
> with kernel 2.4.22?

Try this one, It's merely a massaged version of the 2.4.21 one.
I haven't given it a whole lot of testing though.

patrick


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: attachment; filename="linux-2.4.22-VFS-lock.patch"

diff -rwu linux-2.4.21.orig/drivers/md/lvm.c linux-2.4.21/drivers/md/lvm.c
--- linux-2.4.21.orig/drivers/md/lvm.c	2003-10-06 10:32:00.000000000 +0100
+++ linux-2.4.21/drivers/md/lvm.c	2003-10-06 10:33:22.000000000 +0100
@@ -236,9 +236,6 @@
 #define DEVICE_OFF(device)
 #define LOCAL_END_REQUEST
 
-/* lvm_do_lv_create calls fsync_dev_lockfs()/unlockfs() */
-/* #define	LVM_VFS_ENHANCEMENT */
-
 #include <linux/config.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -2248,12 +2245,8 @@
 	if (lv_ptr->lv_access & LV_SNAPSHOT) {
 		lv_t *org = lv_ptr->lv_snapshot_org, *last;
 
-		/* sync the original logical volume */
-		fsync_dev(org->lv_dev);
-#ifdef	LVM_VFS_ENHANCEMENT
 		/* VFS function call to sync and lock the filesystem */
 		fsync_dev_lockfs(org->lv_dev);
-#endif
 
 		down_write(&org->lv_lock);
 		org->lv_access |= LV_SNAPSHOT_ORG;
@@ -2279,11 +2272,9 @@
 	else
 		set_device_ro(lv_ptr->lv_dev, 1);
 
-#ifdef	LVM_VFS_ENHANCEMENT
 /* VFS function call to unlock the filesystem */
 	if (lv_ptr->lv_access & LV_SNAPSHOT)
 		unlockfs(lv_ptr->lv_snapshot_org->lv_dev);
-#endif
 
 	lvm_gendisk.part[MINOR(lv_ptr->lv_dev)].de =
 	    lvm_fs_create_lv(vg_ptr, lv_ptr);
diff -rwu linux-2.4.21.orig/fs/buffer.c linux-2.4.21/fs/buffer.c
--- linux-2.4.21.orig/fs/buffer.c	2003-10-06 10:26:47.000000000 +0100
+++ linux-2.4.21/fs/buffer.c	2003-10-06 10:33:22.000000000 +0100
@@ -376,6 +376,34 @@
 	fsync_dev(dev);
 }
 
+int fsync_dev_lockfs(kdev_t dev)
+{
+	/* you are not allowed to try locking all the filesystems
+	** on the system, your chances of getting through without
+	** total deadlock are slim to none.
+	*/
+	if (!dev)
+		return fsync_dev(dev) ;
+
+	sync_buffers(dev, 0);
+
+	lock_kernel();
+	/* note, the FS might need to start transactions to 
+	** sync the inodes, or the quota, no locking until
+	** after these are done
+	*/
+	sync_inodes(dev);
+	DQUOT_SYNC_DEV(dev);
+	/* if inodes or quotas could be dirtied during the
+	** sync_supers_lockfs call, the FS is responsible for getting
+	** them on disk, without deadlocking against the lock
+	*/
+	sync_supers_lockfs(dev) ;
+	unlock_kernel();
+
+	return sync_buffers(dev, 1) ;
+}
+
 asmlinkage long sys_sync(void)
 {
 	fsync_dev(0);
diff -rwu linux-2.4.21.orig/fs/reiserfs/super.c linux-2.4.21/fs/reiserfs/super.c
--- linux-2.4.21.orig/fs/reiserfs/super.c	2003-10-06 10:26:47.000000000 +0100
+++ linux-2.4.21/fs/reiserfs/super.c	2003-10-06 10:33:22.000000000 +0100
@@ -73,7 +73,7 @@
     reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
     journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
     reiserfs_block_writes(&th) ;
-    journal_end(&th, s, 1) ;
+    journal_end_sync(&th, s, 1) ;
   }
   s->s_dirt = dirty;
   unlock_kernel() ;
diff -rwu linux-2.4.21.orig/fs/super.c linux-2.4.21/fs/super.c
--- linux-2.4.21.orig/fs/super.c	2003-10-06 10:26:47.000000000 +0100
+++ linux-2.4.21/fs/super.c	2003-10-06 10:33:22.000000000 +0100
@@ -39,6 +39,13 @@
 spinlock_t sb_lock = SPIN_LOCK_UNLOCKED;
 
 /*
+ * lock/unlockfs grab a read lock on s_umount, but you need this lock to 
+ * make sure no lockfs runs are in progress before inserting/removing 
+ * supers from the list.  
+ */
+static DECLARE_MUTEX(lockfs_sem);
+
+/*
  * Handling of filesystem drivers list.
  * Rules:
  *	Inclusion to/removals from/scanning of list are protected by spinlock.
@@ -436,6 +443,19 @@
 	put_super(sb);
 }
 
+static void write_super_lockfs(struct super_block *sb)
+{
+	lock_super(sb);
+	if (sb->s_root && sb->s_op) {
+		if (sb->s_dirt && sb->s_op->write_super)
+			sb->s_op->write_super(sb);
+		if (sb->s_op->write_super_lockfs) {
+			sb->s_op->write_super_lockfs(sb);
+		}
+	}
+	unlock_super(sb);
+}
+
 static inline void write_super(struct super_block *sb)
 {
 	lock_super(sb);
@@ -483,6 +503,39 @@
 	spin_unlock(&sb_lock);
 }
 
+/*
+ * Note: don't check the dirty flag before waiting, we want the lock
+ * to happen every time this is called.  dev must be non-zero
+ */
+void sync_supers_lockfs(kdev_t dev)
+{
+	struct super_block * sb;
+
+	down(&lockfs_sem) ;
+	if (dev) {
+		sb = get_super(dev);
+		if (sb) {
+			write_super_lockfs(sb);
+			drop_super(sb);
+		}
+	}
+}
+
+void unlockfs(kdev_t dev)
+{
+	struct super_block * sb;
+
+	if (dev) {
+		sb = get_super(dev);
+		if (sb) {
+			if (sb->s_op && sb->s_op->unlockfs)
+				sb->s_op->unlockfs(sb) ;
+			drop_super(sb);
+		}
+	}
+	up(&lockfs_sem) ;
+}
+
 /**
  *	get_super	-	get the superblock of a device
  *	@dev: device to get the superblock for
@@ -702,6 +755,7 @@
 		goto out1;
 
 	error = -EBUSY;
+	down(&lockfs_sem);
 restart:
 	spin_lock(&sb_lock);
 
@@ -713,6 +767,7 @@
 		    ((flags ^ old->s_flags) & MS_RDONLY)) {
 			spin_unlock(&sb_lock);
 			destroy_super(s);
+			up(&lockfs_sem);
 			goto out1;
 		}
 		if (!grab_super(old))
@@ -720,12 +775,14 @@
 		destroy_super(s);
 		blkdev_put(bdev, BDEV_FS);
 		path_release(&nd);
+		up(&lockfs_sem);
 		return old;
 	}
 	s->s_dev = dev;
 	s->s_bdev = bdev;
 	s->s_flags = flags;
 	insert_super(s, fs_type);
+	up(&lockfs_sem);
 	if (!fs_type->read_super(s, data, flags & MS_VERBOSE ? 1 : 0))
 		goto Einval;
 	s->s_flags |= MS_ACTIVE;
@@ -833,7 +890,10 @@
 	if (!deactivate_super(sb))
 		return;
 
+	down(&lockfs_sem);
 	down_write(&sb->s_umount);
+	up(&lockfs_sem);
+
 	sb->s_root = NULL;
 	/* Need to clean after the sucker */
 	if (fs->fs_flags & FS_LITTER)
diff -rwu linux-2.4.21.orig/include/linux/fs.h linux-2.4.21/include/linux/fs.h
--- linux-2.4.21.orig/include/linux/fs.h	2003-10-06 10:34:32.000000000 +0100
+++ linux-2.4.21/include/linux/fs.h	2003-10-06 10:33:22.000000000 +0100
@@ -1272,6 +1272,7 @@
 extern int sync_buffers(kdev_t, int);
 extern void sync_dev(kdev_t);
 extern int fsync_dev(kdev_t);
+extern int fsync_dev_lockfs(kdev_t);
 extern int fsync_super(struct super_block *);
 extern int fsync_no_super(kdev_t);
 extern void sync_inodes_sb(struct super_block *);
@@ -1289,6 +1290,8 @@
 extern int filemap_fdatasync(struct address_space *);
 extern int filemap_fdatawait(struct address_space *);
 extern void sync_supers(kdev_t dev, int wait);
+extern void sync_supers_lockfs(kdev_t);
+extern void unlockfs(kdev_t);
 extern int bmap(struct inode *, int);
 extern int notify_change(struct dentry *, struct iattr *);
 extern int permission(struct inode *, int);
diff -rwu linux-2.4.21.orig/kernel/ksyms.c linux-2.4.21/kernel/ksyms.c
--- linux-2.4.21.orig/kernel/ksyms.c	2003-10-06 10:26:49.000000000 +0100
+++ linux-2.4.21/kernel/ksyms.c	2003-10-06 10:33:22.000000000 +0100
@@ -188,6 +188,8 @@
 EXPORT_SYMBOL(invalidate_inode_pages);
 EXPORT_SYMBOL(truncate_inode_pages);
 EXPORT_SYMBOL(fsync_dev);
+EXPORT_SYMBOL(fsync_dev_lockfs);
+EXPORT_SYMBOL(unlockfs);
 EXPORT_SYMBOL(fsync_no_super);
 EXPORT_SYMBOL(permission);
 EXPORT_SYMBOL(vfs_permission);

--UlVJffcvxoiEqYs2--
