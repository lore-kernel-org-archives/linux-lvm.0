Date: Thu, 11 Oct 2001 13:20:32 -0400
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] Lock patch
Message-ID: <1348330000.1002820832@tiny>
In-Reply-To: <20011011184323.A20226@brightstar.swin.de>
References: <20011011184323.A20226@brightstar.swin.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com


On Thursday, October 11, 2001 06:43:23 PM +0200  wrote:

> Hi!
> 
> Will there be a VFS lock patch for 2.4.12? The patch for 2.4.9 doesn't
> work with kernels > 2.4.10

I'd like to clean this up a little so the extra semaphore isn't required,
but it does work.  There's an extra hunk tacked onto the end that you'll
need for reiserfs.

-chris

Index: 0.22/fs/super.c
--- 0.22/fs/super.c Tue, 09 Oct 2001 09:52:53 -0400 root (linux/d/45_super.c 1.1.2.1.3.1 644)
+++ 0.23/fs/super.c Tue, 09 Oct 2001 09:59:03 -0400 root (linux/d/45_super.c 1.1.2.1.3.2 644)
@@ -54,6 +54,8 @@
 LIST_HEAD(super_blocks);
 spinlock_t sb_lock = SPIN_LOCK_UNLOCKED;
 
+static DECLARE_MUTEX(lockfs_sem);
+
 /*
  * Handling of filesystem drivers list.
  * Rules:
@@ -322,6 +324,19 @@
 			sb->s_op->write_super(sb);
 	unlock_super(sb);
 }
+
+static inline void write_super_lockfs(struct super_block *sb)
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
  
 /*
  * Note: check the dirty flag before waiting, so we don't
@@ -357,6 +372,39 @@
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
+	down(&lockfs_sem);
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
+	up(&lockfs_sem);
+}
+
 /**
  *	get_super	-	get the superblock of a device
  *	@dev: device to get the superblock for
@@ -578,6 +626,7 @@
 	if (!s)
 		goto out1;
 	down_write(&s->s_umount);
+	down(&lockfs_sem) ;
 
 	error = -EBUSY;
 restart:
@@ -590,11 +639,13 @@
 		if (old->s_type != fs_type ||
 		    ((flags ^ old->s_flags) & MS_RDONLY)) {
 			spin_unlock(&sb_lock);
+			up(&lockfs_sem);
 			put_super(s);
 			goto out1;
 		}
 		if (!grab_super(old))
 			goto restart;
+		up(&lockfs_sem);
 		put_super(s);
 		blkdev_put(bdev, BDEV_FS);
 		path_release(&nd);
@@ -615,6 +666,9 @@
 	if (!fs_type->read_super(s, data, 0))
 		goto out_fail;
 	unlock_super(s);
+
+	up(&lockfs_sem);
+
 	get_filesystem(fs_type);
 	path_release(&nd);
 	return s;
@@ -728,6 +782,7 @@
 	sb->s_count -= S_BIAS;
 	spin_unlock(&sb_lock);
 
+	down(&lockfs_sem);
 	down_write(&sb->s_umount);
 	lock_kernel();
 	sb->s_root = NULL;
@@ -744,6 +799,7 @@
 		if (sop->put_super)
 			sop->put_super(sb);
 	}
+	up(&lockfs_sem);
 
 	/* Forget any remaining inodes */
 	if (invalidate_inodes(sb)) {
Index: 0.22/fs/buffer.c
--- 0.22/fs/buffer.c Tue, 09 Oct 2001 09:52:53 -0400 root (linux/i/46_buffer.c 1.1.2.1.8.1 644)
+++ 0.23/fs/buffer.c Tue, 09 Oct 2001 09:59:03 -0400 root (linux/i/46_buffer.c 1.1.2.1.8.2 644)
@@ -359,6 +359,34 @@
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
+	DQUOT_SYNC(dev);
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
Index: 0.22/drivers/md/lvm.c
--- 0.22/drivers/md/lvm.c Tue, 09 Oct 2001 09:56:26 -0400 root (linux/i/c/30_lvm.c 1.1.2.1.3.1 644)
+++ 0.23/drivers/md/lvm.c Tue, 09 Oct 2001 09:59:03 -0400 root (linux/i/c/30_lvm.c 1.1.2.1.3.2 644)
@@ -221,9 +221,6 @@
 #define DEVICE_OFF(device)
 #define LOCAL_END_REQUEST
 
-/* lvm_do_lv_create calls fsync_dev_lockfs()/unlockfs() */
-/* #define	LVM_VFS_ENHANCEMENT */
-
 #include <linux/config.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -2129,12 +2126,8 @@
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
@@ -2159,11 +2152,9 @@
 	else
 		set_device_ro(lv_ptr->lv_dev, 1);
 
-#ifdef	LVM_VFS_ENHANCEMENT
 /* VFS function call to unlock the filesystem */
 	if (lv_ptr->lv_access & LV_SNAPSHOT)
 		unlockfs(lv_ptr->lv_snapshot_org->lv_dev);
-#endif
 
 	lvm_gendisk.part[MINOR(lv_ptr->lv_dev)].de = lvm_fs_create_lv(vg_ptr, lv_ptr);
 	return 0;
Index: 0.22/kernel/ksyms.c
--- 0.22/kernel/ksyms.c Tue, 09 Oct 2001 09:52:53 -0400 root (linux/n/c/22_ksyms.c 1.1.2.1.8.1 644)
+++ 0.23/kernel/ksyms.c Tue, 09 Oct 2001 09:59:03 -0400 root (linux/n/c/22_ksyms.c 1.1.2.1.8.2 644)
@@ -178,6 +178,8 @@
 EXPORT_SYMBOL(invalidate_inode_pages);
 EXPORT_SYMBOL(truncate_inode_pages);
 EXPORT_SYMBOL(fsync_dev);
+EXPORT_SYMBOL(fsync_dev_lockfs);
+EXPORT_SYMBOL(unlockfs);
 EXPORT_SYMBOL(fsync_no_super);
 EXPORT_SYMBOL(permission);
 EXPORT_SYMBOL(vfs_permission);
Index: 0.22/include/linux/fs.h
--- 0.22/include/linux/fs.h Tue, 09 Oct 2001 09:52:53 -0400 root (linux/f/d/9_fs.h 1.1.2.1.9.1 644)
+++ 0.23/include/linux/fs.h Tue, 09 Oct 2001 09:59:03 -0400 root (linux/f/d/9_fs.h 1.1.2.1.9.2 644)
@@ -1183,6 +1183,7 @@
 extern int sync_buffers(kdev_t, int);
 extern void sync_dev(kdev_t);
 extern int fsync_dev(kdev_t);
+extern int fsync_dev_lockfs(kdev_t);
 extern int fsync_super(struct super_block *);
 extern int fsync_no_super(kdev_t);
 extern void sync_inodes_sb(struct super_block *);
@@ -1194,6 +1195,8 @@
 extern void filemap_fdatasync(struct address_space *);
 extern void filemap_fdatawait(struct address_space *);
 extern void sync_supers(kdev_t);
+extern void sync_supers_lockfs(kdev_t);
+extern void unlockfs(kdev_t);
 extern int bmap(struct inode *, int);
 extern int notify_change(struct dentry *, struct iattr *);
 extern int permission(struct inode *, int);
--- linux-2.4.4.tmp/fs/reiserfs/super.c	Mon Apr 30 16:01:29 2001
+++ linux-2.4.4.SuSE/fs/reiserfs/super.c	Mon Apr 30 16:02:13 2001
@@ -80,7 +80,7 @@
     reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
     journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
     reiserfs_block_writes(&th) ;
-    journal_end(&th, s, 1) ;
+    journal_end_sync(&th, s, 1) ;
   }
   s->s_dirt = dirty;
   unlock_kernel() ;
