Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011272255.PAA01692@lynx.turbolabs.com>
Date: Mon, 27 Nov 2000 15:55:06 -0700 (MST)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="%--multipart-mixed-boundary-1.1499.975365706--%"
Subject: [linux-lvm] [PATCH] online-ext2 patch for 2.4-test11-pre7
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
To: Linux LVM mailing list <linux-lvm@sistina.com>, ext2resize development mailing list <ext2resize-devel@lists.sourceforge.net>

--%--multipart-mixed-boundary-1.1499.975365706--%
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello all,
attached is an updated patch for online ext2 resizing with the latest 2.4
kernel (2.4.0-test11-pre7).  It is not significantly different from the
2.2 kernel patch or the previous 2.3 kernel patch, with the exception of
some changes to where the superblock lock is held.

I've tested it some, but 2.4 kernels don't run well on my laptop, and my
other systems are all running ext3 which doesn't work with 2.4 yet.  Please
report any problems to ext2resize-devel@lists.sourceforge.net.

The online-ext2-2.4.0.diff kernel patch needs to be applied AFTER the
linux-2.4.0-test11-ext2compat.diff patch, which fixes some problems
with the kernel trying to mount filesystems it doesn't understand.  These
patches are attached here, and the latest versions are also available from
CVS for the ext2resize project at http://sourceforge.net/projects/ext2resize/

As with previous versions of online resizing, you need to have the user
tools from the ext2resize package (also at sourceforge).  The latest version
of the user tools is 1.1.15.  These tools only work on i386 systems right now.

With the newest version of the LVM user tools, the e2fsadm tool will call
ext2online if the filesystem is mounted when the LV is resized.

Cheers, Andreas
-- 
Andreas Dilger                               TurboLabs filesystem development

--%--multipart-mixed-boundary-1.1499.975365706--%
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Description: 'diff' output text
Content-Disposition: attachment; filename="linux-2.4.0-test11-ext2compat.diff"

diff -ru -x .[a-zA-Z1-9]* -x *flags linux-2.4.0-test11-pre7.orig/fs/ext2/balloc.c linux-2.4.0-test11-pre7.compat/fs/ext2/balloc.c
--- linux-2.4.0-test11-pre7.orig/fs/ext2/balloc.c	Wed Sep 27 14:41:33 2000
+++ linux-2.4.0-test11-pre7.compat/fs/ext2/balloc.c	Sat Nov 18 17:15:56 2000
@@ -663,7 +663,7 @@
 			 EXT2_BLOCKS_PER_GROUP(sb), map);
 }
 
-static int test_root(int a, int b)
+static inline int test_root(int a, int b)
 {
 	if (a == 0)
 		return 1;
@@ -676,30 +676,63 @@
 	}
 }
 
-int ext2_group_sparse(int group)
+static inline int ext2_group_sparse(int group)
 {
 	return (test_root(group, 3) || test_root(group, 5) ||
 		test_root(group, 7));
 }
 
+/**
+ *	ext2_bg_has_super - number of blocks used by the superblock in group
+ *	@sb: superblock for filesystem
+ *	@group: group number to check
+ *
+ *	Return the number of blocks used by the superblock (primary or backup)
+ *	in this group.  Currently it this will be only 0 or 1.
+ */
+int ext2_bg_has_super(struct super_block * sb, int group)
+{
+	if (EXT2_HAS_RO_COMPAT_FEATURE(sb,EXT2_FEATURE_RO_COMPAT_SPARSE_SUPER)&&
+	    !ext2_group_sparse(group))
+		return 0;
+	return 1;
+}
+
+/**
+ *	ext2_bg_num_gdb - number of blocks used by the group table in group
+ *	@sb: superblock for filesystem
+ *	@group: group number to check
+ *
+ *	Return the number of blocks used by the group descriptor table
+ *	(primary or backup) in this group.  In the future there may be a
+ *	different number of descriptor blocks in each group.
+ */
+unsigned long ext2_bg_num_gdb(struct super_block * sb, int group)
+{
+	if (EXT2_HAS_RO_COMPAT_FEATURE(sb,EXT2_FEATURE_RO_COMPAT_SPARSE_SUPER)&&
+	    !ext2_group_sparse(group))
+		return 0;
+	return sb->u.ext2_sb.s_gdb_count;
+}
+
+
+
 #ifdef CONFIG_EXT2_CHECK
 /* Called at mount-time, super-block is locked */
 void ext2_check_blocks_bitmap (struct super_block * sb)
 {
 	struct buffer_head * bh;
 	struct ext2_super_block * es;
-	unsigned long desc_count, bitmap_count, x;
+	unsigned long desc_count, bitmap_count, x, j;
 	unsigned long desc_blocks;
 	int bitmap_nr;
 	struct ext2_group_desc * gdp;
-	int i, j;
+	int i;
 
 	es = sb->u.ext2_sb.s_es;
 	desc_count = 0;
 	bitmap_count = 0;
 	gdp = NULL;
-	desc_blocks = (sb->u.ext2_sb.s_groups_count + EXT2_DESC_PER_BLOCK(sb) - 1) /
-		      EXT2_DESC_PER_BLOCK(sb);
 	for (i = 0; i < sb->u.ext2_sb.s_groups_count; i++) {
 		gdp = ext2_get_group_desc (sb, i, NULL);
 		if (!gdp)
@@ -708,24 +741,19 @@
 		bitmap_nr = load_block_bitmap (sb, i);
 		if (bitmap_nr < 0)
 			continue;
-		
-		bh = sb->u.ext2_sb.s_block_bitmap[bitmap_nr];
 
-		if (!(sb->u.ext2_sb.s_feature_ro_compat &
-		     EXT2_FEATURE_RO_COMPAT_SPARSE_SUPER) ||
-		    ext2_group_sparse(i)) {
-			if (!ext2_test_bit (0, bh->b_data))
-				ext2_error (sb, "ext2_check_blocks_bitmap",
-					    "Superblock in group %d "
-					    "is marked free", i);
-
-			for (j = 0; j < desc_blocks; j++)
-				if (!ext2_test_bit (j + 1, bh->b_data))
-					ext2_error (sb,
-					    "ext2_check_blocks_bitmap",
-					    "Descriptor block #%d in group "
-					    "%d is marked free", j, i);
-		}
+		bh = EXT2_SB(sb)->s_block_bitmap[bitmap_nr];
+
+		if (ext2_bg_has_super(sb, i) && !ext2_test_bit(0, bh->b_data))
+			ext2_error(sb, __FUNCTION__,
+				   "Superblock in group %d is marked free", i);
+
+		desc_blocks = ext2_bg_num_gdb(sb, i);
+		for (j = 0; j < desc_blocks; j++)
+			if (!ext2_test_bit(j + 1, bh->b_data))
+				ext2_error(sb, __FUNCTION__,
+					   "Descriptor block #%ld in group "
+					   "%d is marked free", j, i);
 
 		if (!block_in_use (le32_to_cpu(gdp->bg_block_bitmap), sb, bh->b_data))
 			ext2_error (sb, "ext2_check_blocks_bitmap",
diff -ru -x .[a-zA-Z1-9]* -x *flags linux-2.4.0-test11-pre7.orig/fs/ext2/inode.c linux-2.4.0-test11-pre7.compat/fs/ext2/inode.c
--- linux-2.4.0-test11-pre7.orig/fs/ext2/inode.c	Wed Sep 27 14:41:33 2000
+++ linux-2.4.0-test11-pre7.compat/fs/ext2/inode.c	Thu Nov 16 15:33:21 2000
@@ -1190,13 +1190,15 @@
 		raw_inode->i_size_high = cpu_to_le32(inode->i_size >> 32);
 		if (raw_inode->i_size_high) {
 			struct super_block *sb = inode->i_sb;
-			struct ext2_super_block *es = sb->u.ext2_sb.s_es;
-			if (!(es->s_feature_ro_compat & cpu_to_le32(EXT2_FEATURE_RO_COMPAT_LARGE_FILE))) {
+			if (!EXT2_HAS_RO_COMPAT_FEATURE(sb,
+					EXT2_FEATURE_RO_COMPAT_LARGE_FILE) ||
+			    EXT2_SB(sb)->s_es->s_rev_level ==
+					cpu_to_le32(EXT2_GOOD_OLD_REV)) {
 			       /* If this is the first large file
 				* created, add a flag to the superblock.
 				*/
 				lock_kernel();
-				es->s_feature_ro_compat |= cpu_to_le32(EXT2_FEATURE_RO_COMPAT_LARGE_FILE);
+				ext2_update_fs_rev(sb);
+				EXT2_SET_RO_COMPAT_FEATURE(sb,
+					EXT2_FEATURE_RO_COMPAT_LARGE_FILE);
 				unlock_kernel();
 				ext2_write_super(sb);
 			}
diff -ru -x .[a-zA-Z1-9]* -x *flags linux-2.4.0-test11-pre7.orig/fs/ext2/super.c linux-2.4.0-test11-pre7.compat/fs/ext2/super.c
--- linux-2.4.0-test11-pre7.orig/fs/ext2/super.c	Fri Nov 10 14:26:40 2000
+++ linux-2.4.0-test11-pre7.compat/fs/ext2/super.c	Sat Nov 18 17:55:24 2000
@@ -95,6 +95,31 @@
 		bdevname(sb->s_dev), function, error_buf);
 }
 
+void ext2_update_fs_rev(struct super_block *sb)
+{
+	struct ext2_super_block *es = EXT2_SB(sb)->s_es;
+
+	if (le32_to_cpu(es->s_rev_level) > EXT2_GOOD_OLD_REV)
+		return;
+
+	ext2_warning(sb, __FUNCTION__,
+		     "updating to rev %d because of new feature flag, "
+		     "running e2fsck is recommended",
+		     EXT2_DYNAMIC_REV);
+
+	es->s_first_ino = cpu_to_le32(EXT2_GOOD_OLD_FIRST_INO);
+	es->s_inode_size = cpu_to_le16(EXT2_GOOD_OLD_INODE_SIZE);
+	es->s_rev_level = cpu_to_le32(EXT2_DYNAMIC_REV);
+	/* leave es->s_feature_*compat flags alone */
+	/* es->s_uuid will be set by e2fsck if empty */
+
+	/*
+	 * The rest of the superblock fields should be zero, and if not it
+	 * means they are likely already in use, so leave them alone.  We
+	 * can leave it up to e2fsck to clean up any inconsistencies there.
+	 */
+}
+
 void ext2_put_super (struct super_block * sb)
 {
 	int db_count;
@@ -104,7 +129,7 @@
 		sb->u.ext2_sb.s_es->s_state = le16_to_cpu(sb->u.ext2_sb.s_mount_state);
 		mark_buffer_dirty(sb->u.ext2_sb.s_sbh);
 	}
-	db_count = sb->u.ext2_sb.s_db_per_group;
+	db_count = sb->u.ext2_sb.s_gdb_count;
 	for (i = 0; i < db_count; i++)
 		if (sb->u.ext2_sb.s_group_desc[i])
 			brelse (sb->u.ext2_sb.s_group_desc[i]);
@@ -261,9 +286,9 @@
 {
 	int res = 0;
 	if (le32_to_cpu(es->s_rev_level) > EXT2_MAX_SUPP_REV) {
-			printk ("EXT2-fs warning: revision level too high, "
-				"forcing read/only mode\n");
-			res = MS_RDONLY;
+		printk ("EXT2-fs warning: revision level too high, "
+			"forcing read-only mode\n");
+		res = MS_RDONLY;
 	}
 	if (read_only)
 		return res;
@@ -423,22 +448,33 @@
 			brelse(bh);
 		return NULL;
 	}
-	if (le32_to_cpu(es->s_rev_level) > EXT2_GOOD_OLD_REV) {
-		if (le32_to_cpu(es->s_feature_incompat) & ~EXT2_FEATURE_INCOMPAT_SUPP) {
-			printk("EXT2-fs: %s: couldn't mount because of "
-			       "unsupported optional features.\n",
-			       bdevname(dev));
-			goto failed_mount;
-		}
-		if (!(sb->s_flags & MS_RDONLY) &&
-		    (le32_to_cpu(es->s_feature_ro_compat) & ~EXT2_FEATURE_RO_COMPAT_SUPP)) {
-			printk("EXT2-fs: %s: couldn't mount RDWR because of "
-			       "unsupported optional features.\n",
-			       bdevname(dev));
-			goto failed_mount;
-		}
+	if (le32_to_cpu(es->s_rev_level) == EXT2_GOOD_OLD_REV &&
+	    (EXT2_HAS_COMPAT_FEATURE(sb, ~0U) ||
+	     EXT2_HAS_RO_COMPAT_FEATURE(sb, ~0U) ||
+	     EXT2_HAS_INCOMPAT_FEATURE(sb, ~0U)))
+		printk("EXT2-fs warning: feature flags set on rev 0 fs, "
+		       "running e2fsck is recommended\n");
+
+	/*
+	 * Check feature flags regardless of the revision level, since we
+	 * previously didn't change the revision level when setting the flags,
+	 * so there is a chance incompat flags are set on a rev 0 filesystem.
+	 */
+	if ((i = EXT2_HAS_INCOMPAT_FEATURE(sb, ~EXT2_FEATURE_INCOMPAT_SUPP))) {
+		printk("EXT2-fs: %s: couldn't mount because of "
+			"unsupported optional features (%x).\n",
+			bdevname(dev), i);
+		goto failed_mount;
+	}
+	if (!(sb->s_flags & MS_RDONLY) &&
+	    (i = EXT2_HAS_RO_COMPAT_FEATURE(sb, ~EXT2_FEATURE_RO_COMPAT_SUPP))){
+		printk("EXT2-fs: %s: couldn't mount RDWR because of "
+		       "unsupported optional features (%x).\n",
+		       bdevname(dev), i);
+		goto failed_mount;
 	}
-	sb->s_blocksize_bits = le32_to_cpu(sb->u.ext2_sb.s_es->s_log_block_size) + 10;
+	sb->s_blocksize_bits =
+		le32_to_cpu(EXT2_SB(sb)->s_es->s_log_block_size) + 10;
 	sb->s_blocksize = 1 << sb->s_blocksize_bits;
 	if (sb->s_blocksize != BLOCK_SIZE &&
 	    (sb->s_blocksize == 1024 || sb->s_blocksize == 2048 ||
@@ -484,9 +520,6 @@
 			goto failed_mount;
 		}
 	}
-	sb->u.ext2_sb.s_feature_compat = le32_to_cpu(es->s_feature_compat);
-	sb->u.ext2_sb.s_feature_incompat = le32_to_cpu(es->s_feature_incompat);
-	sb->u.ext2_sb.s_feature_ro_compat = le32_to_cpu(es->s_feature_ro_compat);
 	sb->u.ext2_sb.s_frag_size = EXT2_MIN_FRAG_SIZE <<
 				   le32_to_cpu(es->s_log_frag_size);
 	if (sb->u.ext2_sb.s_frag_size)
@@ -590,7 +623,7 @@
 	}
 	sb->u.ext2_sb.s_loaded_inode_bitmaps = 0;
 	sb->u.ext2_sb.s_loaded_block_bitmaps = 0;
-	sb->u.ext2_sb.s_db_per_group = db_count;
+	sb->u.ext2_sb.s_gdb_count = db_count;
 	/*
 	 * set up enough so that it can read an inode
 	 */
@@ -683,6 +716,14 @@
 		ext2_commit_super (sb, es);
 	}
 	else {
+		int ret;
+		if ((ret = EXT2_HAS_RO_COMPAT_FEATURE(sb,
+					~EXT2_FEATURE_RO_COMPAT_SUPP))) {
+			printk("EXT2-fs: %s: couldn't remount RDWR because of "
+			       "unsupported optional features (%x).\n",
+			       bdevname(sb->s_dev), ret);
+			return -EROFS;
+		}
 		/*
 		 * Mounting a RDONLY partition read-write, so reread and
 		 * store the current valid flag.  (It may have been changed
@@ -698,7 +739,7 @@
 int ext2_statfs (struct super_block * sb, struct statfs * buf)
 {
 	unsigned long overhead;
-	int	ngroups, i;
+	int i;
 
 	if (test_opt (sb, MINIX_DF))
 		overhead = 0;
@@ -715,19 +756,12 @@
 
 		/*
 		 * Add the overhead attributed to the superblock and
-		 * block group descriptors.  If this is sparse
-		 * superblocks is turned on, then not all groups have
-		 * this.
+		 * block group descriptors.  If the sparse superblocks
+		 * feature is turned on, then not all groups have this.
 		 */
-		if (sb->u.ext2_sb.s_feature_ro_compat &
-		    EXT2_FEATURE_RO_COMPAT_SPARSE_SUPER) {
-			ngroups = 0;
-			for (i=0 ; i < sb->u.ext2_sb.s_groups_count; i++)
-				if (ext2_group_sparse(i))
-					ngroups++;
-		} else
-			ngroups = sb->u.ext2_sb.s_groups_count;
-		overhead += ngroups * (1 + sb->u.ext2_sb.s_db_per_group);
+		for (i = 0; i < EXT2_SB(sb)->s_groups_count; i++)
+			overhead += ext2_bg_has_super(sb, i) +
+				ext2_bg_num_gdb(sb, i);
 
 		/*
 		 * Every block group has an inode bitmap, a block
diff -ru -x .[a-zA-Z1-9]* -x *flags linux-2.4.0-test11-pre7.orig/include/linux/ext2_fs.h linux-2.4.0-test11-pre7.compat/include/linux/ext2_fs.h
--- linux-2.4.0-test11-pre7.orig/include/linux/ext2_fs.h	Tue Oct 31 12:18:07 2000
+++ linux-2.4.0-test11-pre7.compat/include/linux/ext2_fs.h	Thu Nov 16 15:33:21 2000
@@ -429,11 +429,23 @@
  */
 
 #define EXT2_HAS_COMPAT_FEATURE(sb,mask)			\
-	( EXT2_SB(sb)->s_feature_compat & (mask) )
+	( EXT2_SB(sb)->s_es->s_feature_compat & cpu_to_le32(mask) )
 #define EXT2_HAS_RO_COMPAT_FEATURE(sb,mask)			\
-	( EXT2_SB(sb)->s_feature_ro_compat & (mask) )
+	( EXT2_SB(sb)->s_es->s_feature_ro_compat & cpu_to_le32(mask) )
 #define EXT2_HAS_INCOMPAT_FEATURE(sb,mask)			\
-	( EXT2_SB(sb)->s_feature_incompat & (mask) )
+	( EXT2_SB(sb)->s_es->s_feature_incompat & cpu_to_le32(mask) )
+#define EXT2_SET_COMPAT_FEATURE(sb,mask)			\
+	EXT2_SB(sb)->s_es->s_feature_compat |= cpu_to_le32(mask)
+#define EXT2_SET_RO_COMPAT_FEATURE(sb,mask)			\
+	EXT2_SB(sb)->s_es->s_feature_ro_compat |= cpu_to_le32(mask)
+#define EXT2_SET_INCOMPAT_FEATURE(sb,mask)			\
+	EXT2_SB(sb)->s_es->s_feature_incompat |= cpu_to_le32(mask)
+#define EXT2_CLEAR_COMPAT_FEATURE(sb,mask)			\
+	EXT2_SB(sb)->s_es->s_feature_compat &= ~cpu_to_le32(mask)
+#define EXT2_CLEAR_RO_COMPAT_FEATURE(sb,mask)			\
+	EXT2_SB(sb)->s_es->s_feature_ro_compat &= ~cpu_to_le32(mask)
+#define EXT2_CLEAR_INCOMPAT_FEATURE(sb,mask)			\
+	EXT2_SB(sb)->s_es->s_feature_incompat &= ~cpu_to_le32(mask)
 
 #define EXT2_FEATURE_COMPAT_DIR_PREALLOC	0x0001
 
@@ -524,7 +536,8 @@
 extern int ext2_permission (struct inode *, int);
 
 /* balloc.c */
-extern int ext2_group_sparse(int group);
+extern int ext2_bg_has_super(struct super_block *sb, int group);
+extern unsigned long ext2_bg_num_gdb(struct super_block *sb, int group);
 extern int ext2_new_block (const struct inode *, unsigned long,
 			   __u32 *, __u32 *, int *);
 extern void ext2_free_blocks (const struct inode *, unsigned long,
@@ -583,6 +596,7 @@
 	__attribute__ ((NORET_AND format (printf, 3, 4)));
 extern void ext2_warning (struct super_block *, const char *, const char *, ...)
 	__attribute__ ((format (printf, 3, 4)));
+extern void ext2_update_fs_rev (struct super_block *sb);
 extern void ext2_put_super (struct super_block *);
 extern void ext2_write_super (struct super_block *);
 extern int ext2_remount (struct super_block *, int *, char *);
diff -ru -x .[a-zA-Z1-9]* -x *flags linux-2.4.0-test11-pre7.orig/include/linux/ext2_fs_sb.h linux-2.4.0-test11-pre7.compat/include/linux/ext2_fs_sb.h
--- linux-2.4.0-test11-pre7.orig/include/linux/ext2_fs_sb.h	Wed Sep 27 14:41:33 2000
+++ linux-2.4.0-test11-pre7.compat/include/linux/ext2_fs_sb.h	Thu Nov 16 15:33:21 2000
@@ -35,7 +35,7 @@
 	unsigned long s_blocks_per_group;/* Number of blocks in a group */
 	unsigned long s_inodes_per_group;/* Number of inodes in a group */
 	unsigned long s_itb_per_group;	/* Number of inode table blocks per group */
-	unsigned long s_db_per_group;	/* Number of descriptor blocks per group */
+	unsigned long s_gdb_count;	/* Number of descriptor blocks */
 	unsigned long s_desc_per_block;	/* Number of group descriptors per block */
 	unsigned long s_groups_count;	/* Number of groups in the fs */
 	struct buffer_head * s_sbh;	/* Buffer containing the super block */
@@ -56,9 +56,6 @@
 	int s_desc_per_block_bits;
 	int s_inode_size;
 	int s_first_ino;
-	int s_feature_compat;
-	int s_feature_incompat;
-	int s_feature_ro_compat;
 };
 
 #endif	/* _LINUX_EXT2_FS_SB */

--%--multipart-mixed-boundary-1.1499.975365706--%
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Description: 'diff' output text
Content-Disposition: attachment; filename="online-ext2-2.4.diff"

diff -ru linux-2.4.0-test11-pre7.compat/CREDITS linux-2.4.0-test11-pre7/CREDITS
--- linux-2.4.0-test11-pre7.compat/CREDITS	Mon Nov 20 16:55:29 2000
+++ linux-2.4.0-test11-pre7/CREDITS	Mon Nov 20 16:50:02 2000
@@ -606,6 +606,15 @@
 S: Warrendale, Pennsylvania 15086
 S: USA
 
+N: Andreas Dilger
+E: adilger@turbolinux.com
+W: http://www-mddsp.enel.ucalgary.ca/People/adilger/
+D: Ext2 filesystem online resize capability
+D: Ext3/LVM hacking
+S: 630 Schooner Cove N.W.
+S: Calgary, AB
+S: Canada   T3L 1Z1
+
 N: Alex deVries
 E: adevries@thepuffingroup.com
 D: Various SGI parts, bits of HAL2 and Newport, PA-RISC Linux.
diff -ru linux-2.4.0-test11-pre7.compat/Documentation/Configure.help linux-2.4.0-test11-pre7/Documentation/Configure.help
--- linux-2.4.0-test11-pre7.compat/Documentation/Configure.help	Mon Nov 20 16:55:30 2000
+++ linux-2.4.0-test11-pre7/Documentation/Configure.help	Mon Nov 20 16:50:03 2000
@@ -10681,6 +10681,20 @@
   compiled as a module, and so this could be dangerous. Most everyone
   wants to say Y here.
 
+Online resize for ext2 filesystems
+CONFIG_EXT2_RESIZE
+  This option gives you the ability to increase the size of an ext2
+  filesystem while it is mounted (in use).  In order to do this, you
+  must also be able to resize the underlying disk partition, probably
+  via a Logical Volume Manager (LVM), metadevice (MD), or hardware
+  RAID device - none of that capability is included in this feature.
+  If you don't know what any of these things are, or you haven't
+  configured your kernel for them, you should probably say N here.  If
+  you choose Y, then your kernel will be about 3k larger, and you need
+  to get some more software (http://ext2resize.sourceforge.net/) in
+  order to actually resize your filesystem, otherwise this feature
+  will just sit unused inside the kernel.
+
 BFS file system support (EXPERIMENTAL)
 CONFIG_BFS_FS
   Boot File System (BFS) is a file system used under SCO UnixWare to
diff -ru linux-2.4.0-test11-pre7.compat/fs/Config.in linux-2.4.0-test11-pre7/fs/Config.in
--- linux-2.4.0-test11-pre7.compat/fs/Config.in	Mon Nov 20 16:55:53 2000
+++ linux-2.4.0-test11-pre7/fs/Config.in	Mon Nov 20 16:50:32 2000
@@ -59,6 +59,7 @@
 tristate 'ROM file system support' CONFIG_ROMFS_FS
 
 tristate 'Second extended fs support' CONFIG_EXT2_FS
+dep_mbool '  Online ext2 resize support (DANGEROUS)' CONFIG_EXT2_RESIZE $CONFIG_EXT2_FS $CONFIG_EXPERIMENTAL
 
 tristate 'System V and Coherent file system support (read only)' CONFIG_SYSV_FS
 dep_mbool '  SYSV file system write support (DANGEROUS)' CONFIG_SYSV_FS_WRITE $CONFIG_SYSV_FS $CONFIG_EXPERIMENTAL
diff -ru linux-2.4.0-test11-pre7.compat/fs/ext2/balloc.c linux-2.4.0-test11-pre7/fs/ext2/balloc.c
--- linux-2.4.0-test11-pre7.compat/fs/ext2/balloc.c	Sat Nov 18 17:15:56 2000
+++ linux-2.4.0-test11-pre7/fs/ext2/balloc.c	Sat Nov 25 12:03:35 2000
@@ -619,13 +619,13 @@
 
 unsigned long ext2_count_free_blocks (struct super_block * sb)
 {
-#ifdef EXT2FS_DEBUG
 	struct ext2_super_block * es;
 	unsigned long desc_count, bitmap_count, x;
 	int bitmap_nr;
 	struct ext2_group_desc * gdp;
 	int i;
-	
+
+	if (test_opt(sb, DEBUG) && test_opt(sb, CHECK)) {
 	lock_super (sb);
 	es = sb->u.ext2_sb.s_es;
 	desc_count = 0;
@@ -646,13 +646,12 @@
 			i, le16_to_cpu(gdp->bg_free_blocks_count), x);
 		bitmap_count += x;
 	}
-	printk("ext2_count_free_blocks: stored = %lu, computed = %lu, %lu\n",
+	printk(__FUNCTION__": stored = %u, computed gdt = %lu, bitmap = %lu\n",
 	       le32_to_cpu(es->s_free_blocks_count), desc_count, bitmap_count);
 	unlock_super (sb);
 	return bitmap_count;
-#else
+	} else
 	return le32_to_cpu(sb->u.ext2_sb.s_es->s_free_blocks_count);
-#endif
 }
 
 static inline int block_in_use (unsigned long block,
diff -ru linux-2.4.0-test11-pre7.compat/fs/ext2/super.c linux-2.4.0-test11-pre7/fs/ext2/super.c
--- linux-2.4.0-test11-pre7.compat/fs/ext2/super.c	Fri Nov 24 22:17:30 2000
+++ linux-2.4.0-test11-pre7/fs/ext2/super.c	Sat Nov 25 22:01:41 2000
@@ -14,6 +14,7 @@
  *
  *  Big-endian to little-endian byte-swapping/bitmaps by
  *        David S. Miller (davem@caip.rutgers.edu), 1995
+ *  Online resize by Andreas Dilger (adilger@turbolinux.com), July 1999
  */
 
 #include <linux/config.h>
@@ -30,6 +31,10 @@
 
 static char error_buf[1024];
 
+#ifndef MIN
+# define MIN(m,n) ((m) < (n) ? (m) : (n))
+#endif
+
 void ext2_error (struct super_block * sb, const char * function,
 		 const char * fmt, ...)
 {
@@ -161,7 +166,9 @@
  */
 static int parse_options (char * options, unsigned long * sb_block,
 			  unsigned short *resuid, unsigned short * resgid,
-			  unsigned long * mount_options)
+			  unsigned long *mount_options,
+			  unsigned long *n_blocks_count,
+			  unsigned long *resgdt)
 {
 	char * this_char;
 	char * value;
@@ -227,6 +234,31 @@
 		else if (!strcmp (this_char, "nogrpid") ||
 			 !strcmp (this_char, "sysvgroups"))
 			clear_opt (*mount_options, GRPID);
+#ifdef CONFIG_EXT2_RESIZE
+		else if (!strcmp(this_char, "resize")) {
+			printk("EXT2-fs: parse_options: resize=%s\n", value);
+			if (!n_blocks_count) {
+				printk("EXT2-fs: resize option only available "
+				       "for remount\n");
+				return 0;
+			}
+			if (!value || !*value) {
+				printk("EXT2-fs: resize requires number of "
+				       "blocks\n");
+				return 0;
+			}
+			*n_blocks_count = simple_strtoul(value, &value, 0);
+			if (*value == ':') {
+				value++;
+				*resgdt = simple_strtoul(value, &value, 0);
+			}
+			if (*value) {
+				printk("EXT2-fs: invalid resize option: %s\n",
+				       value);
+				return 0;
+			}
+		}
+#endif /* CONFIG_EXT2_RESIZE */
 		else if (!strcmp (this_char, "resgid")) {
 			if (!value || !*value) {
 				printk ("EXT2-fs: the resgid option requires "
@@ -315,10 +348,10 @@
 	mark_buffer_dirty(sb->u.ext2_sb.s_sbh);
 	sb->s_dirt = 1;
 	if (test_opt (sb, DEBUG))
-		printk ("[EXT II FS %s, %s, bs=%lu, fs=%lu, gc=%lu, "
+		printk ("[EXT II FS %s, %s, bs=%lu, bc=%u, gc=%lu, "
 			"bpg=%lu, ipg=%lu, mo=%04lx]\n",
 			EXT2FS_VERSION, EXT2FS_DATE, sb->s_blocksize,
-			sb->u.ext2_sb.s_frag_size,
+			le32_to_cpu(es->s_blocks_count),
 			sb->u.ext2_sb.s_groups_count,
 			EXT2_BLOCKS_PER_GROUP(sb),
 			EXT2_INODES_PER_GROUP(sb),
@@ -332,7 +365,9 @@
 	return res;
 }
 
-static int ext2_check_descriptors (struct super_block * sb)
+static int ext2_check_descriptors(struct super_block *sb,
+				  struct buffer_head **group_desc,
+				  unsigned long groups_count)
 {
 	int i;
 	int desc_block = 0;
@@ -341,14 +376,14 @@
 
 	ext2_debug ("Checking group descriptors");
 
-	for (i = 0; i < sb->u.ext2_sb.s_groups_count; i++)
+	for (i = 0; i < groups_count; i++)
 	{
 		if ((i % EXT2_DESC_PER_BLOCK(sb)) == 0)
-			gdp = (struct ext2_group_desc *) sb->u.ext2_sb.s_group_desc[desc_block++]->b_data;
+			gdp = (struct ext2_group_desc *)group_desc[desc_block++]->b_data;
 		if (le32_to_cpu(gdp->bg_block_bitmap) < block ||
 		    le32_to_cpu(gdp->bg_block_bitmap) >= block + EXT2_BLOCKS_PER_GROUP(sb))
 		{
-			ext2_error (sb, "ext2_check_descriptors",
+			ext2_warning(sb, __FUNCTION__,
 				    "Block bitmap for group %d"
 				    " not in group (block %lu)!",
 				    i, (unsigned long) le32_to_cpu(gdp->bg_block_bitmap));
@@ -357,7 +392,7 @@
 		if (le32_to_cpu(gdp->bg_inode_bitmap) < block ||
 		    le32_to_cpu(gdp->bg_inode_bitmap) >= block + EXT2_BLOCKS_PER_GROUP(sb))
 		{
-			ext2_error (sb, "ext2_check_descriptors",
+			ext2_warning(sb, __FUNCTION__,
 				    "Inode bitmap for group %d"
 				    " not in group (block %lu)!",
 				    i, (unsigned long) le32_to_cpu(gdp->bg_inode_bitmap));
@@ -367,7 +402,7 @@
 		    le32_to_cpu(gdp->bg_inode_table) + sb->u.ext2_sb.s_itb_per_group >=
 		    block + EXT2_BLOCKS_PER_GROUP(sb))
 		{
-			ext2_error (sb, "ext2_check_descriptors",
+			ext2_warning(sb, __FUNCTION__,
 				    "Inode table for group %d"
 				    " not in group (block %lu)!",
 				    i, (unsigned long) le32_to_cpu(gdp->bg_inode_table));
@@ -379,6 +414,275 @@
 	return 1;
 }
 
+static int ext2_read_descriptors(struct super_block *sb,
+				 unsigned long blocks_count)
+{
+	struct buffer_head **group_desc;
+	struct buffer_head **o_group_desc;
+	unsigned long groups_count;
+	unsigned long o_groups_count;
+	unsigned long gdb_count;
+	unsigned long o_gdb_count;
+
+	o_group_desc = EXT2_SB(sb)->s_group_desc;
+	o_groups_count = EXT2_SB(sb)->s_groups_count;
+	o_gdb_count = EXT2_SB(sb)->s_gdb_count;
+
+	groups_count = (blocks_count -
+			le32_to_cpu(EXT2_SB(sb)->s_es->s_first_data_block) +
+			EXT2_BLOCKS_PER_GROUP(sb) - 1) /
+			EXT2_BLOCKS_PER_GROUP(sb);
+	gdb_count = (groups_count + EXT2_DESC_PER_BLOCK(sb) - 1) /
+		   EXT2_DESC_PER_BLOCK(sb);
+	if (test_opt(sb, DEBUG)) {
+		printk("EXT2-fs: ext2_read_descriptors: o_groups_count=%lu, "
+		       "groups_count=%lu, blocks_count=%lu\n", o_groups_count,
+		       groups_count, blocks_count);
+		printk("EXT2-fs: ext2_read_descriptors: o_gdb_count=%lu, "
+		       "gdb_count=%lu\n", o_gdb_count, gdb_count);
+	}
+
+	if (o_gdb_count != gdb_count) {
+		unsigned long logic_gd_block = EXT2_SB(sb)->s_sbh->b_blocknr +1;
+		unsigned long i;
+
+		group_desc = (struct buffer_head **)kmalloc(gdb_count *
+				sizeof(struct buffer_head *), GFP_KERNEL);
+		if (group_desc == NULL) {
+			ext2_warning(sb, __FUNCTION__,
+				     "not enough memory for %ld group blocks",
+				     gdb_count);
+			return -ENOMEM;
+		}
+		for (i = o_gdb_count; i < gdb_count; i++) {	/* Add blocks */
+			group_desc[i] = bread(sb->s_dev, logic_gd_block + i,
+					      sb->s_blocksize);
+			if (!group_desc[i]) {
+				unsigned long j;
+
+				for (j = o_gdb_count; j < i; j++)
+					brelse(group_desc[j]);
+				kfree(group_desc);
+				ext2_warning(sb, __FUNCTION__,
+					     "can't read group block %ld",
+					     i);
+				return -EIO;
+			}
+		}
+
+		/*
+		 * Copy over pointers to old descriptor blocks already loaded.
+		 */
+		memcpy(group_desc, o_group_desc,
+		       MIN(o_gdb_count, gdb_count) *
+		       sizeof(struct buffer_head *));
+	} else
+		group_desc = o_group_desc; /* this will never be NULL */
+
+	if (!ext2_check_descriptors(sb, group_desc, groups_count)) {
+		unsigned long j;
+
+		for (j = o_gdb_count; j < gdb_count; j++)
+			brelse(group_desc[j]);
+		if (group_desc != o_group_desc)
+			kfree(group_desc);
+		return -EINVAL;
+	}
+
+	EXT2_SB(sb)->s_group_desc = group_desc;
+	EXT2_SB(sb)->s_groups_count = groups_count;
+	EXT2_SB(sb)->s_gdb_count = gdb_count;
+
+	if (o_group_desc && o_group_desc != EXT2_SB(sb)->s_group_desc) {
+#ifdef CONFIG_EXT2_SHRINK
+		unsigned long i;
+		for (i = gdb_count; i < o_gdb_count; i++) /* Remove blocks */
+			brelse(o_group_desc[i]);
+#endif
+		kfree(o_group_desc);
+	}
+
+	return 0;
+} /* ext2_read_descriptors */
+
+#ifdef CONFIG_EXT2_RESIZE
+/* Make the disk blocks in a new group available to the filesystem */
+static int ext2_update_group(struct super_block *sb, unsigned int block_group,
+			     unsigned int reserved, unsigned int resgdt)
+{
+	struct ext2_group_desc *gdp;
+	struct ext2_super_block *es;
+	int blocks;
+	int m_blocks;
+	int inodes;
+	unsigned long gdb;
+	int shrink = reserved > 100 ? 1 : 0;
+
+	es = EXT2_SB(sb)->s_es;
+	gdp = ext2_get_group_desc(sb, block_group, NULL);
+	gdb = ext2_bg_num_gdb(sb, block_group);
+
+	inodes = le32_to_cpu(gdp->bg_free_inodes_count);
+	blocks = le32_to_cpu(gdp->bg_free_blocks_count);
+	m_blocks = EXT2_SB(sb)->s_itb_per_group + 2 +
+		ext2_bg_has_super(sb, block_group) +
+		(gdb ? gdb + resgdt : 0) + blocks;
+
+	if (block_group < EXT2_SB(sb)->s_groups_count - 1 &&
+	    m_blocks != EXT2_BLOCKS_PER_GROUP(sb)) {
+		ext2_warning(sb, __FUNCTION__,
+			     "bad group size for %s group %d (%d blocks) "
+			     "(iblk = %ld, GDT blk %ld, resgdt %d, blocks %d\n",
+			     ext2_bg_has_super(sb, block_group) ? "normal" :
+			     "no-backup", block_group, m_blocks,
+			     EXT2_SB(sb)->s_itb_per_group, gdb, resgdt, blocks);
+		return -EINVAL;
+	}
+
+	es->s_free_inodes_count =
+		cpu_to_le32(le32_to_cpu(es->s_free_inodes_count) + inodes);
+	es->s_inodes_count = cpu_to_le32(le32_to_cpu(es->s_inodes_count) +
+		inodes);
+
+	es->s_free_blocks_count =
+		cpu_to_le32(le32_to_cpu(es->s_free_blocks_count) + blocks);
+	es->s_blocks_count = cpu_to_le32(le32_to_cpu(es->s_blocks_count) +
+		m_blocks);
+	es->s_r_blocks_count = cpu_to_le32(le32_to_cpu(es->s_r_blocks_count) +
+		m_blocks * reserved / 100);
+
+	mark_buffer_dirty(EXT2_SB(sb)->s_sbh);
+	sb->s_dirt = 1;
+
+	if (test_opt(sb, DEBUG)) {
+		printk("EXT2-fs: ext2_update_group: %s %s group %u: "
+		       "%u inodes, %u blocks (%u free), %d (%d%%) reserved\n",
+		       shrink ? "removing" : "adding",
+		       ext2_bg_has_super(sb, block_group) ? "normal" :
+		       "no-super", block_group, inodes, m_blocks, blocks,
+		       m_blocks * reserved / 100, reserved);
+		printk("EXT2-fs: ext2_update_group: %u inodes (%u free), "
+		       "%u blocks (%u free)\n",
+		       le32_to_cpu(es->s_inodes_count),
+		       le32_to_cpu(es->s_free_inodes_count),
+		       le32_to_cpu(es->s_blocks_count),
+		       le32_to_cpu(es->s_free_blocks_count));
+	}
+
+	return 0;
+} /* ext2_update_group */
+
+/* Resize the filesystem to the new number of blocks specified.  If required,
+ * the new group descriptors should have already been configured for us (we
+ * only check that they are valid).
+ */
+static int ext2_resize_fs(struct super_block *sb,
+			  struct ext2_super_block *es,
+			  unsigned long n_blocks_count, unsigned long resgdt)
+{
+	unsigned long o_blocks_count;
+	unsigned long o_groups_count;
+	unsigned long last, add;
+	unsigned long reserved;
+	struct buffer_head *bh;
+	struct inode inode;
+	unsigned long i;
+	int err = 0;
+
+	o_blocks_count = le32_to_cpu(es->s_blocks_count);
+	o_groups_count = EXT2_SB(sb)->s_groups_count;
+
+	if (test_opt(sb, DEBUG))
+		printk("EXT2-fs: ext2_resize_fs: from %lu to %lu blocks\n",
+		       o_blocks_count, n_blocks_count);
+
+	if (n_blocks_count == 0 || n_blocks_count == o_blocks_count)
+		return 0;
+
+#ifndef CONFIG_EXT2_SHRINK
+	/* Until we can shrink the FS, we need to check this */
+	if (n_blocks_count < o_blocks_count) {
+		ext2_warning(sb, __FUNCTION__, "error: can't shrink FS!");
+		return -EBUSY;
+	}
+#endif /* CONFIG_EXT2_SHRINK */
+
+	/* See if the device is actually as big as what was requested */
+	bh = bread(sb->s_dev, n_blocks_count - 1, EXT2_BLOCK_SIZE(sb));
+	if (!bh) {
+		ext2_warning(sb, __FUNCTION__,
+			     "unable to read last block, resize aborted");
+		return -ENOSPC;
+	}
+	brelse(bh);
+
+	/* For reserved percentage calculation, we avoid 32-bit overflow. */
+	reserved = o_blocks_count > 10000000 ?
+		(le32_to_cpu(es->s_r_blocks_count) + o_blocks_count / 200) /
+			(o_blocks_count / 100) :
+		(le32_to_cpu(es->s_r_blocks_count) * 100 + o_blocks_count / 2) /
+			o_blocks_count;
+
+	if ((err = ext2_read_descriptors(sb, n_blocks_count))) {
+		ext2_warning(sb, __FUNCTION__,
+			     "group descriptor error %d, resize aborted", err);
+		return err;
+	}
+
+	/* Handle the remaining blocks in the last partial group. */
+	last = (o_blocks_count - le32_to_cpu(es->s_first_data_block)) %
+		EXT2_BLOCKS_PER_GROUP(sb);
+	if (last != 0) {	/* The last group isn't full yet */
+		add = EXT2_BLOCKS_PER_GROUP(sb) - last;
+		if (add + o_blocks_count > n_blocks_count)
+			add = n_blocks_count - o_blocks_count;
+		es->s_blocks_count =
+			cpu_to_le32(le32_to_cpu(es->s_blocks_count) + add);
+		es->s_r_blocks_count =
+			cpu_to_le32(le32_to_cpu(es->s_r_blocks_count) +
+				    add * reserved / 100);
+		mark_buffer_dirty(EXT2_SB(sb)->s_sbh);
+		sb->s_dirt = 1;
+		/*
+		 * Fake out an inode enough to "free" the new blocks in this
+		 * group.  Turn off quotas for this inode so it doesn't get
+		 * confused by freeing blocks that don't really exist yet.
+		 */
+		inode.i_sb = sb;
+		for (i = 0; i < MAXQUOTAS; i++)
+			inode.i_dquot[i] = NODQUOT;
+		unlock_super(sb);
+		ext2_free_blocks(&inode, o_blocks_count, add);
+		lock_super(sb);
+		if (test_opt(sb, DEBUG))
+			printk("EXT2-fs: ext2_resize_fs: added %lu new blocks "
+			       "to %lu blocks in last group\n",
+			       add, o_blocks_count);
+	}
+
+	/*
+	 * Update superblock with remaining new group block/inode counts
+	 */
+	for (i = o_groups_count; i < EXT2_SB(sb)->s_groups_count &&
+	     !(err = ext2_update_group(sb, i, reserved, resgdt)); i++)
+		/* empty loop */;
+
+	if (err || le32_to_cpu(es->s_blocks_count) != n_blocks_count) {
+		ext2_warning(sb, __FUNCTION__,
+			     "specified size does not match new block count "
+			     "(%lu != %u) (err %d)", n_blocks_count,
+			     le32_to_cpu(es->s_blocks_count), err);
+		EXT2_SB(sb)->s_mount_state &= ~EXT2_VALID_FS;
+	} else
+		EXT2_SB(sb)->s_mount_state |= EXT2_VALID_FS;
+
+	return err;
+} /* ext2_resize_fs */
+#else  /* !CONFIG_EXT2_RESIZE */
+#define ext2_resize_fs(sb, es, n_blocks_count, resgdt) 0
+#endif /* CONFIG_EXT2_RESIZE */
+
 #define log2(n) ffz(~(n))
 
 struct super_block * ext2_read_super (struct super_block * sb, void * data,
@@ -394,8 +693,7 @@
 	kdev_t dev = sb->s_dev;
 	int blocksize = BLOCK_SIZE;
 	int hblock;
-	int db_count;
-	int i, j;
+	int i;
 
 	/*
 	 * See what the current blocksize for the device is, and
@@ -412,7 +710,7 @@
 
 	sb->u.ext2_sb.s_mount_opt = 0;
 	if (!parse_options ((char *) data, &sb_block, &resuid, &resgid,
-	    &sb->u.ext2_sb.s_mount_opt)) {
+	    &sb->u.ext2_sb.s_mount_opt, NULL, NULL)) {
 		return NULL;
 	}
 
@@ -586,35 +884,6 @@
 		goto failed_mount;
 	}
 
-	sb->u.ext2_sb.s_groups_count = (le32_to_cpu(es->s_blocks_count) -
-				        le32_to_cpu(es->s_first_data_block) +
-				       EXT2_BLOCKS_PER_GROUP(sb) - 1) /
-				       EXT2_BLOCKS_PER_GROUP(sb);
-	db_count = (sb->u.ext2_sb.s_groups_count + EXT2_DESC_PER_BLOCK(sb) - 1) /
-		   EXT2_DESC_PER_BLOCK(sb);
-	sb->u.ext2_sb.s_group_desc = kmalloc (db_count * sizeof (struct buffer_head *), GFP_KERNEL);
-	if (sb->u.ext2_sb.s_group_desc == NULL) {
-		printk ("EXT2-fs: not enough memory\n");
-		goto failed_mount;
-	}
-	for (i = 0; i < db_count; i++) {
-		sb->u.ext2_sb.s_group_desc[i] = bread (dev, logic_sb_block + i + 1,
-						       sb->s_blocksize);
-		if (!sb->u.ext2_sb.s_group_desc[i]) {
-			for (j = 0; j < i; j++)
-				brelse (sb->u.ext2_sb.s_group_desc[j]);
-			kfree(sb->u.ext2_sb.s_group_desc);
-			printk ("EXT2-fs: unable to read group descriptors\n");
-			goto failed_mount;
-		}
-	}
-	if (!ext2_check_descriptors (sb)) {
-		for (j = 0; j < db_count; j++)
-			brelse (sb->u.ext2_sb.s_group_desc[j]);
-		kfree(sb->u.ext2_sb.s_group_desc);
-		printk ("EXT2-fs: group descriptors corrupted !\n");
-		goto failed_mount;
-	}
 	for (i = 0; i < EXT2_MAX_GROUP_LOADED; i++) {
 		sb->u.ext2_sb.s_inode_bitmap_number[i] = 0;
 		sb->u.ext2_sb.s_inode_bitmap[i] = NULL;
@@ -623,14 +892,21 @@
 	}
 	sb->u.ext2_sb.s_loaded_inode_bitmaps = 0;
 	sb->u.ext2_sb.s_loaded_block_bitmaps = 0;
-	sb->u.ext2_sb.s_gdb_count = db_count;
 	/*
 	 * set up enough so that it can read an inode
 	 */
 	sb->s_op = &ext2_sops;
+	sb->u.ext2_sb.s_group_desc = NULL;
+	sb->u.ext2_sb.s_groups_count = 0;
+	sb->u.ext2_sb.s_gdb_count = 0;
+	if ((i = ext2_read_descriptors(sb, le32_to_cpu(es->s_blocks_count)))) {
+		ext2_error(sb, __FUNCTION__,
+			   "group descriptor error %d, unable to mount", i);
+		goto failed_mount;
+	}
 	sb->s_root = d_alloc_root(iget(sb, EXT2_ROOT_INO));
 	if (!sb->s_root) {
-		for (i = 0; i < db_count; i++)
+		for (i = 0; i < sb->u.ext2_sb.s_gdb_count; i++)
 			if (sb->u.ext2_sb.s_group_desc[i])
 				brelse (sb->u.ext2_sb.s_group_desc[i]);
 		kfree(sb->u.ext2_sb.s_group_desc);
@@ -684,6 +961,8 @@
 	struct ext2_super_block * es;
 	unsigned short resuid = sb->u.ext2_sb.s_resuid;
 	unsigned short resgid = sb->u.ext2_sb.s_resgid;
+	unsigned long n_blocks_count = 0;
+	unsigned long resgdt = 0;
 	unsigned long new_mount_opt;
 	unsigned long tmp;
 
@@ -692,14 +971,16 @@
 	 */
 	new_mount_opt = sb->u.ext2_sb.s_mount_opt;
 	if (!parse_options (data, &tmp, &resuid, &resgid,
-			    &new_mount_opt))
+			    &new_mount_opt, &n_blocks_count, &resgdt))
 		return -EINVAL;
 
 	sb->u.ext2_sb.s_mount_opt = new_mount_opt;
 	sb->u.ext2_sb.s_resuid = resuid;
 	sb->u.ext2_sb.s_resgid = resgid;
 	es = sb->u.ext2_sb.s_es;
-	if ((*flags & MS_RDONLY) == (sb->s_flags & MS_RDONLY))
+	if ((*flags & MS_RDONLY) == (sb->s_flags & MS_RDONLY) &&
+	    (n_blocks_count == 0 ||
+	     n_blocks_count == le32_to_cpu(es->s_blocks_count)))
 		return 0;
 	if (*flags & MS_RDONLY) {
 		if (le16_to_cpu(es->s_state) & EXT2_VALID_FS ||
@@ -730,6 +1010,8 @@
 		 * by e2fsck since we originally mounted the partition.)
 		 */
 		sb->u.ext2_sb.s_mount_state = le16_to_cpu(es->s_state);
+		if ((ret = ext2_resize_fs(sb, es, n_blocks_count, resgdt)))
+			return ret;
 		if (!ext2_setup_super (sb, es, 0))
 			sb->s_flags &= ~MS_RDONLY;
 	}
diff -ru linux-2.4.0-test11-pre7.compat/include/linux/ext2_fs.h linux-2.4.0-test11-pre7/include/linux/ext2_fs.h
--- linux-2.4.0-test11-pre7.compat/include/linux/ext2_fs.h	Thu Nov 16 15:33:21 2000
+++ linux-2.4.0-test11-pre7/include/linux/ext2_fs.h	Wed Nov 15 19:53:04 2000
@@ -61,6 +61,7 @@
 #define EXT2_ACL_DATA_INO	 4	/* ACL inode */
 #define EXT2_BOOT_LOADER_INO	 5	/* Boot loader inode */
 #define EXT2_UNDEL_DIR_INO	 6	/* Undelete directory inode */
+#define EXT2_RESIZE_INO		 7	/* Reserved group descriptors inode */
 
 /* First non-reserved inode for old ext2 filesystems */
 #define EXT2_GOOD_OLD_FIRST_INO	11

--%--multipart-mixed-boundary-1.1499.975365706--%--
