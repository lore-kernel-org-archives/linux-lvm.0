From: Chris Mason <mason@suse.com>
Message-Id: <3599230000.1012316373@tiny>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] [PATCH] updated lvm VFS locking patch 2.4.18-pre7
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
Date: Tue Jan 29 09:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, linux-lvm@sistina.com

Hello everyone,

2.4.18pre7 includes some super.c cleanups that trigger rejects on
the lvm VFS locking patch for journaled filesystems.

This is against 2.4.18pre7 + lvm 1.0.2, I'm forwarding it to Marcelo
later today.

-chris

Index: linus.21/fs/reiserfs/super.c
--- linus.21/fs/reiserfs/super.c Fri, 11 Jan 2002 10:14:59 -0500 root (linux/41_super.c 1.2.2.1.2.1.1.1 644)
+++ linus.21(w)/fs/reiserfs/super.c Mon, 28 Jan 2002 13:50:56 -0500 root (linux/41_super.c 1.2.2.1.2.1.1.1 644)
@@ -66,7 +66,7 @@
     reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
     journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
     reiserfs_block_writes(&th) ;
-    journal_end(&th, s, 1) ;
+    journal_end_sync(&th, s, 1) ;
   }
   s->s_dirt = dirty;
   unlock_kernel() ;
Index: linus.21/fs/super.c
--- linus.21/fs/super.c Mon, 28 Jan 2002 09:51:50 -0500 root (linux/d/45_super.c 1.6 644)
+++ linus.21(w)/fs/super.c Mon, 28 Jan 2002 17:19:58 -0500 root (linux/d/45_super.c 1.6 644)
@@ -54,6 +54,13 @@
 LIST_HEAD(super_blocks);
 spinlock_t sb_lock = SPIN_LOCK_UNLOCKED;
 
+/* 
+ * lock/unlockfs grab a read lock on s_umount, but you need this lock to 
+ * make sure no lockfs runs are in progress before inserting/removing 
+ * supers from the list.  
+ */
+static DECLARE_MUTEX(lockfs_sem);
+
 /*
  * Handling of filesystem drivers list.
  * Rules:
@@ -453,6 +460,19 @@
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
@@ -496,6 +516,39 @@
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
@@ -560,8 +613,10 @@
 	s->s_dev = dev;
 	s->s_bdev = bdev;
 	s->s_flags = flags;
+	down(&lockfs_sem);
 	spin_lock(&sb_lock);
 	insert_super(s, type);
+	up(&lockfs_sem);
 	lock_super(s);
 	if (!type->read_super(s, data, flags & MS_VERBOSE ? 1 : 0))
 		goto out_fail;
@@ -664,6 +719,7 @@
 	}
 
 	error = -EBUSY;
+	down(&lockfs_sem);
 restart:
 	spin_lock(&sb_lock);
 
@@ -676,6 +732,7 @@
 			spin_unlock(&sb_lock);
 			destroy_super(s);
 			blkdev_put(bdev, BDEV_FS);
+			up(&lockfs_sem);
 			goto out;
 		}
 		if (!grab_super(old))
@@ -683,12 +740,15 @@
 		destroy_super(s);
 		blkdev_put(bdev, BDEV_FS);
 		path_release(&nd);
+		up(&lockfs_sem);
 		return old;
 	}
 	s->s_dev = dev;
 	s->s_bdev = bdev;
 	s->s_flags = flags;
+
 	insert_super(s, fs_type);
+	up(&lockfs_sem);
 
 	error = -EINVAL;
 	lock_super(s);
@@ -779,7 +839,10 @@
 	if (!deactivate_super(sb))
 		return;
 
+	down(&lockfs_sem); 
 	down_write(&sb->s_umount);
+	up(&lockfs_sem);
+
 	lock_kernel();
 	sb->s_root = NULL;
 	/* Need to clean after the sucker */
Index: linus.21/fs/buffer.c
--- linus.21/fs/buffer.c Mon, 28 Jan 2002 09:51:50 -0500 root (linux/i/45_buffer.c 1.5.2.6 644)
+++ linus.21(w)/fs/buffer.c Mon, 28 Jan 2002 11:54:36 -0500 root (linux/i/45_buffer.c 1.5.2.6 644)
@@ -361,6 +361,34 @@
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
Index: linus.21/drivers/md/lvm.c
--- linus.21/drivers/md/lvm.c Mon, 28 Jan 2002 11:52:24 -0500 root (linux/h/c/34_lvm.c 1.5 644)
+++ linus.21(w)/drivers/md/lvm.c Mon, 28 Jan 2002 11:55:57 -0500 root (linux/h/c/34_lvm.c 1.5 644)
@@ -223,9 +223,6 @@
 #define DEVICE_OFF(device)
 #define LOCAL_END_REQUEST
 
-/* lvm_do_lv_create calls fsync_dev_lockfs()/unlockfs() */
-/* #define	LVM_VFS_ENHANCEMENT */
-
 #include <linux/config.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -2107,12 +2104,8 @@
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
@@ -2137,11 +2130,9 @@
 	else
 		set_device_ro(lv_ptr->lv_dev, 1);
 
-#ifdef	LVM_VFS_ENHANCEMENT
 /* VFS function call to unlock the filesystem */
 	if (lv_ptr->lv_access & LV_SNAPSHOT)
 		unlockfs(lv_ptr->lv_snapshot_org->lv_dev);
-#endif
 
 	lvm_gendisk.part[MINOR(lv_ptr->lv_dev)].de =
 	    lvm_fs_create_lv(vg_ptr, lv_ptr);
Index: linus.21/kernel/ksyms.c
--- linus.21/kernel/ksyms.c Mon, 28 Jan 2002 09:51:50 -0500 root (linux/m/c/25_ksyms.c 1.5.2.4 644)
+++ linus.21(w)/kernel/ksyms.c Mon, 28 Jan 2002 11:54:36 -0500 root (linux/m/c/25_ksyms.c 1.5.2.4 644)
@@ -178,6 +178,8 @@
 EXPORT_SYMBOL(invalidate_inode_pages);
 EXPORT_SYMBOL(truncate_inode_pages);
 EXPORT_SYMBOL(fsync_dev);
+EXPORT_SYMBOL(fsync_dev_lockfs);
+EXPORT_SYMBOL(unlockfs);
 EXPORT_SYMBOL(fsync_no_super);
 EXPORT_SYMBOL(permission);
 EXPORT_SYMBOL(vfs_permission);
Index: linus.21/include/linux/fs.h
--- linus.21/include/linux/fs.h Mon, 28 Jan 2002 09:51:50 -0500 root (linux/e/d/3_fs.h 1.2.1.1.1.3.3.1.1.2 644)
+++ linus.21(w)/include/linux/fs.h Mon, 28 Jan 2002 12:15:21 -0500 root (linux/e/d/3_fs.h 1.2.1.1.1.3.3.1.1.2 644)
@@ -1205,6 +1205,7 @@
 extern int sync_buffers(kdev_t, int);
 extern void sync_dev(kdev_t);
 extern int fsync_dev(kdev_t);
+extern int fsync_dev_lockfs(kdev_t);
 extern int fsync_super(struct super_block *);
 extern int fsync_no_super(kdev_t);
 extern void sync_inodes_sb(struct super_block *);
@@ -1216,6 +1217,8 @@
 extern int filemap_fdatasync(struct address_space *);
 extern int filemap_fdatawait(struct address_space *);
 extern void sync_supers(kdev_t);
+extern void sync_supers_lockfs(kdev_t);
+extern void unlockfs(kdev_t);
 extern int bmap(struct inode *, int);
 extern int notify_change(struct dentry *, struct iattr *);
 extern int permission(struct inode *, int);
