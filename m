Return-Path: <mason@suse.com>
Date: Wed, 07 Feb 2001 17:32:37 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] Snapshots with 2.4.1?
Message-ID: <721750000.981585157@tiny>
In-Reply-To: <20010207142510.D16262@ultraviolet.org>
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


On Wednesday, February 07, 2001 02:25:10 PM -0800 Tracy R Reed <treed@ultraviolet.org> wrote:

> On Fri, Feb 02, 2001 at 04:56:42PM +0000, Joe Thornber wrote:
>> 2.4.1 hadn't been released when we made the beta3 tarball.  If you
>> want to make a beta3 patch for the kernel create an empty file call
>> PATCHES/fragments-2.4.1 (2.4.1 needs no extra fragments) then run
>> PATCHES/make.  That should remove all the conflicts.
> 
> I need to get snapshots working with 2.4.1. I've tried using just the
> straight LVM that comes with the kernel and I have tried applying the
> patches as described above. I either case, when I uncomment:
> 
> #define LVM_VFS_ENHANCEMENT 
> 
> in drivers/md/lvm.c to enable the hooks for snapshots the compile fails:
> 
> drivers/md/mddev.o: In function `lvm_do_lv_create':
> drivers/md/mddev.o(.text+0x11bdb): undefined reference to `fsync_dev_lockfs'
> drivers/md/mddev.o(.text+0x11c90): undefined reference to `unlockfs'
> 
> Can someone point out what else I am missing?
> 

This patch should do it, the reiserfs in 2.4.1 has code to take advantage of it.

diff -urN diff/linux/fs/buffer.c linux/fs/buffer.c
--- diff/linux/fs/buffer.c	Tue Oct  3 12:31:22 2000
+++ linux/fs/buffer.c	Tue Oct  3 12:16:16 2000
@@ -312,6 +312,28 @@
 	return sync_buffers(dev, 1);
 }
 
+int fsync_dev_lockfs(kdev_t dev)
+{
+	sync_buffers(dev, 0);
+
+	lock_kernel();
+	sync_supers(dev);
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
diff -urN diff/linux/fs/super.c linux/fs/super.c
--- diff/linux/fs/super.c	Tue Oct  3 12:31:23 2000
+++ linux/fs/super.c	Fri Sep 29 10:01:09 2000
@@ -628,6 +628,46 @@
 	}
 }
 
+/*
+ * Note: don't check the dirty flag before waiting, we want the lock
+ * to happen every time this is called.
+ */
+void sync_supers_lockfs(kdev_t dev)
+{
+	struct super_block * sb;
+
+	for (sb = sb_entry(super_blocks.next);
+	     sb != sb_entry(&super_blocks); 
+	     sb = sb_entry(sb->s_list.next)) {
+		if (!sb->s_dev)
+			continue;
+		if (dev && sb->s_dev != dev)
+			continue;
+		lock_super(sb);
+		if (sb->s_dev && (!dev || dev == sb->s_dev))
+			if (sb->s_op && sb->s_op->write_super_lockfs)
+				sb->s_op->write_super_lockfs(sb);
+		unlock_super(sb);
+	}
+}
+
+void unlockfs(kdev_t dev)
+{
+	struct super_block * sb;
+
+	for (sb = sb_entry(super_blocks.next);
+	     sb != sb_entry(&super_blocks); 
+	     sb = sb_entry(sb->s_list.next)) {
+		if (!sb->s_dev)
+			continue;
+		if (dev && sb->s_dev != dev)
+			continue;
+		if (sb->s_dev && (!dev || dev == sb->s_dev))
+			if (sb->s_op && sb->s_op->unlockfs)
+				sb->s_op->unlockfs(sb);
+	}
+}
+
 /**
  *	get_super	-	get the superblock of a device
  *	@dev: device to get the superblock for
