Return-Path: <SSmyth@Connex.com>
Message-ID: <B14BF8753E65D211ABCA00104B301EF501BD7B1E@cairn-gorm.cragtech.com>
From: Scott Smyth <SSmyth@Connex.com>
Date: Fri, 12 Jan 2001 16:05:55 -0800
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C07CF4.995C6E90"
Subject: [linux-lvm] LVM v0.9 on 2.4.0 kernel: raid5syncd halt
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
To: "'linux-lvm@sistina.com '" <linux-lvm@sistina.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C07CF4.995C6E90
Content-Type: text/plain


Hi;

The 2.4.0 kernel (patched with XFS and the appropriate
LVM patches from the 0.9-patches tree) produces a stop
of any resync when issuing lvcreate (i.e., lvcreate
-L 500M -n vol volgr0).  The resyncing stops and does
not continue after this.  I have included the following
patches for the kernel and userspace LVM that are
included in the rpm builds.  (BTW, no kernel oops is
generated, and I can remove my lv and pv after and
stop the raid but the resync never restarts until 
reboot).

versions:

	code from today's lvm_0_9-patches cvs tree
	with attached two patches.

	kernel 2.4.0 w/ attached two patches.

Has anyone else seen this behavior?

thanks, Scott


------_=_NextPart_000_01C07CF4.995C6E90
Content-Type: application/octet-stream;
	name="linux-2.4.0-VFS-lock.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="linux-2.4.0-VFS-lock.patch"

diff -urN diff/linux/fs/buffer.c linux/fs/buffer.c=0A=
--- diff/linux/fs/buffer.c	Tue Oct  3 12:31:22 2000=0A=
+++ linux/fs/buffer.c	Tue Oct  3 12:16:16 2000=0A=
@@ -312,6 +312,28 @@=0A=
 	return sync_buffers(dev, 1);=0A=
 }=0A=
 =0A=
+int fsync_dev_lockfs(kdev_t dev)=0A=
+{=0A=
+	sync_buffers(dev, 0);=0A=
+=0A=
+	lock_kernel();=0A=
+	sync_supers(dev);=0A=
+	/* note, the FS might need to start transactions to =0A=
+	** sync the inodes, or the quota, no locking until=0A=
+	** after these are done=0A=
+	*/=0A=
+	sync_inodes(dev);=0A=
+	DQUOT_SYNC(dev);=0A=
+	/* if inodes or quotas could be dirtied during the=0A=
+	** sync_supers_lockfs call, the FS is responsible for getting=0A=
+	** them on disk, without deadlocking against the lock=0A=
+	*/=0A=
+	sync_supers_lockfs(dev) ;=0A=
+	unlock_kernel();=0A=
+=0A=
+	return sync_buffers(dev, 1) ;=0A=
+}=0A=
+=0A=
 asmlinkage long sys_sync(void)=0A=
 {=0A=
 	fsync_dev(0);=0A=
diff -urN diff/linux/fs/super.c linux/fs/super.c=0A=
--- diff/linux/fs/super.c	Tue Oct  3 12:31:23 2000=0A=
+++ linux/fs/super.c	Fri Sep 29 10:01:09 2000=0A=
@@ -628,6 +628,46 @@=0A=
 	}=0A=
 }=0A=
 =0A=
+/*=0A=
+ * Note: don't check the dirty flag before waiting, we want the =
lock=0A=
+ * to happen every time this is called.=0A=
+ */=0A=
+void sync_supers_lockfs(kdev_t dev)=0A=
+{=0A=
+	struct super_block * sb;=0A=
+=0A=
+	for (sb =3D sb_entry(super_blocks.next);=0A=
+	     sb !=3D sb_entry(&super_blocks); =0A=
+	     sb =3D sb_entry(sb->s_list.next)) {=0A=
+		if (!sb->s_dev)=0A=
+			continue;=0A=
+		if (dev && sb->s_dev !=3D dev)=0A=
+			continue;=0A=
+		lock_super(sb);=0A=
+		if (sb->s_dev && (!dev || dev =3D=3D sb->s_dev))=0A=
+			if (sb->s_op && sb->s_op->write_super_lockfs)=0A=
+				sb->s_op->write_super_lockfs(sb);=0A=
+		unlock_super(sb);=0A=
+	}=0A=
+}=0A=
+=0A=
+void unlockfs(kdev_t dev)=0A=
+{=0A=
+	struct super_block * sb;=0A=
+=0A=
+	for (sb =3D sb_entry(super_blocks.next);=0A=
+	     sb !=3D sb_entry(&super_blocks); =0A=
+	     sb =3D sb_entry(sb->s_list.next)) {=0A=
+		if (!sb->s_dev)=0A=
+			continue;=0A=
+		if (dev && sb->s_dev !=3D dev)=0A=
+			continue;=0A=
+		if (sb->s_dev && (!dev || dev =3D=3D sb->s_dev))=0A=
+			if (sb->s_op && sb->s_op->unlockfs)=0A=
+				sb->s_op->unlockfs(sb);=0A=
+	}=0A=
+}=0A=
+=0A=
 /**=0A=
  *	get_super	-	get the superblock of a device=0A=
  *	@dev: device to get the superblock for=0A=
diff -urN diff/linux/include/linux/fs.h linux/include/linux/fs.h=0A=
--- linux/include/linux/fs.h.orig	Tue Jan  9 13:58:06 2001=0A=
+++ llinux/include/linux/fs.h	Tue Jan  9 13:59:56 2001=0A=
@@ -850,6 +850,8 @@=0A=
 	void (*delete_inode) (struct inode *);=0A=
 	void (*put_super) (struct super_block *);=0A=
 	void (*write_super) (struct super_block *);=0A=
+	void (*write_super_lockfs) (struct super_block *);=0A=
+	void (*unlockfs) (struct super_block *);=0A=
 	int (*statfs) (struct super_block *, struct statfs *);=0A=
 	int (*remount_fs) (struct super_block *, int *, char *);=0A=
 	void (*clear_inode) (struct inode *);=0A=
@@ -1102,12 +1104,15 @@=0A=
 extern void write_inode_now(struct inode *, int);=0A=
 extern void sync_dev(kdev_t);=0A=
 extern int fsync_dev(kdev_t);=0A=
+extern int fsync_dev_lockfs(kdev_t);=0A=
 extern int fsync_inode_buffers(struct inode *);=0A=
 extern int osync_inode_buffers(struct inode *);=0A=
 extern int inode_has_buffers(struct inode *);=0A=
 extern void filemap_fdatasync(struct address_space *);=0A=
 extern void filemap_fdatawait(struct address_space *);=0A=
 extern void sync_supers(kdev_t);=0A=
+extern void sync_supers_lockfs(kdev_t);=0A=
+extern void unlockfs(kdev_t);=0A=
 extern int bmap(struct inode *, int);=0A=
 extern int notify_change(struct dentry *, struct iattr *);=0A=
 extern int permission(struct inode *, int);=0A=
diff -urN diff/linux/kernel/ksyms.c linux/kernel/ksyms.c=0A=
--- diff/linux/kernel/ksyms.c	Tue Oct  3 12:31:25 2000=0A=
+++ linux/kernel/ksyms.c	Tue Oct  3 12:09:34 2000=0A=
@@ -181,6 +181,8 @@=0A=
 EXPORT_SYMBOL(invalidate_inode_pages);=0A=
 EXPORT_SYMBOL(truncate_inode_pages);=0A=
 EXPORT_SYMBOL(fsync_dev);=0A=
+EXPORT_SYMBOL(fsync_dev_lockfs);=0A=
+EXPORT_SYMBOL(unlockfs);=0A=
 EXPORT_SYMBOL(permission);=0A=
 EXPORT_SYMBOL(inode_setattr);=0A=
 EXPORT_SYMBOL(inode_change_ok);=0A=

------_=_NextPart_000_01C07CF4.995C6E90
Content-Type: application/octet-stream;
	name="lvm-0.9-0.9.1-prerelease-2.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lvm-0.9-0.9.1-prerelease-2.patch"

diff -urN 2.4.0ac4/Documentation/Configure.help =
2.4.0ac4-lvm/Documentation/Configure.help=0A=
--- 2.4.0ac4/Documentation/Configure.help	Tue Jan  9 01:25:32 2001=0A=
+++ 2.4.0ac4-lvm/Documentation/Configure.help	Tue Jan  9 01:26:16 =
2001=0A=
@@ -1447,15 +1447,6 @@=0A=
   want), say M here and read Documentation/modules.txt. The module=0A=
   will be called lvm-mod.o.=0A=
 =0A=
-Logical Volume Manager /proc file system information=0A=
-CONFIG_LVM_PROC_FS=0A=
-  If you say Y here, you are able to access overall Logical Volume=0A=
-  Manager, Volume Group, Logical and Physical Volume information in=0A=
-  /proc/lvm.=0A=
-=0A=
-  To use this option, you have to check, that the "/proc file =
system=0A=
-  support" (CONFIG_PROC_FS) is enabled too.=0A=
-=0A=
 Multiple devices driver support=0A=
 CONFIG_BLK_DEV_MD=0A=
   This driver lets you combine several hard disk partitions into =
one=0A=
diff -urN 2.4.0ac4/drivers/md/Config.in =
2.4.0ac4-lvm/drivers/md/Config.in=0A=
--- linux/drivers/md/Config.in.orig	Mon Oct  2 12:00:07 2000=0A=
+++ linux/drivers/md/Config.in	Thu Jan 11 12:52:20 2001=0A=
@@ -17,6 +17,5 @@=0A=
 fi=0A=
 =0A=
 dep_tristate ' Logical volume manager (LVM) support' =
CONFIG_BLK_DEV_LVM $CONFIG_MD=0A=
-dep_mbool '   LVM information in proc filesystem' CONFIG_LVM_PROC_FS =
$CONFIG_BLK_DEV_LVM=0A=
 =0A=
 endmenu=0A=
=0A=
diff -urN 2.4.0ac4/drivers/md/lvm-snap.c =
2.4.0ac4-lvm/drivers/md/lvm-snap.c=0A=
--- 2.4.0ac4/drivers/md/lvm-snap.c	Tue Jan  2 17:41:16 2001=0A=
+++ 2.4.0ac4-lvm/drivers/md/lvm-snap.c	Tue Jan  9 01:26:17 2001=0A=
@@ -214,10 +214,10 @@=0A=
 	memset(lv_COW_table, 0, blksize_snap);=0A=
 	for ( ; is < lv_snap->lv_remap_ptr; is++, id++) {=0A=
 		/* store new COW_table entry */=0A=
-		lv_COW_table[id].pv_org_number =3D =
LVM_TO_DISK64(lvm_pv_get_number(vg, =
lv_snap->lv_block_exception[is].rdev_org));=0A=
-		lv_COW_table[id].pv_org_rsector =3D =
LVM_TO_DISK64(lv_snap->lv_block_exception[is].rsector_org);=0A=
-		lv_COW_table[id].pv_snap_number =3D =
LVM_TO_DISK64(lvm_pv_get_number(vg, =
lv_snap->lv_block_exception[is].rdev_new));=0A=
-		lv_COW_table[id].pv_snap_rsector =3D =
LVM_TO_DISK64(lv_snap->lv_block_exception[is].rsector_new);=0A=
+		lv_COW_table[id].pv_org_number =3D cpu_to_le64(lvm_pv_get_number(vg, =
lv_snap->lv_block_exception[is].rdev_org));=0A=
+		lv_COW_table[id].pv_org_rsector =3D =
cpu_to_le64(lv_snap->lv_block_exception[is].rsector_org);=0A=
+		lv_COW_table[id].pv_snap_number =3D =
cpu_to_le64(lvm_pv_get_number(vg, =
lv_snap->lv_block_exception[is].rdev_new));=0A=
+		lv_COW_table[id].pv_snap_rsector =3D =
cpu_to_le64(lv_snap->lv_block_exception[is].rsector_new);=0A=
 	}=0A=
 }=0A=
 =0A=
@@ -268,10 +268,10 @@=0A=
 	blocks[0] =3D (snap_pe_start + COW_table_sector_offset) >> =
(blksize_snap >> 10);=0A=
 =0A=
 	/* store new COW_table entry */=0A=
-	lv_COW_table[idx_COW_table].pv_org_number =3D =
LVM_TO_DISK64(lvm_pv_get_number(vg, =
lv_snap->lv_block_exception[idx].rdev_org));=0A=
-	lv_COW_table[idx_COW_table].pv_org_rsector =3D =
LVM_TO_DISK64(lv_snap->lv_block_exception[idx].rsector_org);=0A=
-	lv_COW_table[idx_COW_table].pv_snap_number =3D =
LVM_TO_DISK64(lvm_pv_get_number(vg, snap_phys_dev));=0A=
-	lv_COW_table[idx_COW_table].pv_snap_rsector =3D =
LVM_TO_DISK64(lv_snap->lv_block_exception[idx].rsector_new);=0A=
+	lv_COW_table[idx_COW_table].pv_org_number =3D =
cpu_to_le64(lvm_pv_get_number(vg, =
lv_snap->lv_block_exception[idx].rdev_org));=0A=
+	lv_COW_table[idx_COW_table].pv_org_rsector =3D =
cpu_to_le64(lv_snap->lv_block_exception[idx].rsector_org);=0A=
+	lv_COW_table[idx_COW_table].pv_snap_number =3D =
cpu_to_le64(lvm_pv_get_number(vg, snap_phys_dev));=0A=
+	lv_COW_table[idx_COW_table].pv_snap_rsector =3D =
cpu_to_le64(lv_snap->lv_block_exception[idx].rsector_new);=0A=
 =0A=
 	length_tmp =3D iobuf->length;=0A=
 	iobuf->length =3D blksize_snap;=0A=
diff -urN 2.4.0ac4/drivers/md/lvm.c 2.4.0ac4-lvm/drivers/md/lvm.c=0A=
--- linux/drivers/md/lvm.c.orig	Thu Jan 11 12:51:02 2001=0A=
+++ linux/drivers/md/lvm.c	Thu Jan 11 12:57:16 2001=0A=
@@ -139,6 +139,7 @@=0A=
  *                 lvm_proc_get_global_info()=0A=
  *    02/11/2000 - implemented /proc/lvm/ hierarchy=0A=
  *    07/12/2000 - make sure lvm_make_request_fn returns correct value =
- 0 or 1 - NeilBrown=0A=
+ *    25/12/2000 - fix procfs #defines - Christoph Hellwig=0A=
  *=0A=
  */=0A=
 =0A=
@@ -224,7 +225,7 @@=0A=
 =0A=
 static int lvm_chr_ioctl(struct inode *, struct file *, uint, =
ulong);=0A=
 =0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 int lvm_proc_read_vg_info(char *, char **, off_t, int, int *, void =
*);=0A=
 int lvm_proc_read_lv_info(char *, char **, off_t, int, int *, void =
*);=0A=
 int lvm_proc_read_pv_info(char *, char **, off_t, int, int *, void =
*);=0A=
@@ -347,7 +348,7 @@=0A=
 static spinlock_t lvm_lock =3D SPIN_LOCK_UNLOCKED;=0A=
 static spinlock_t lvm_snapshot_lock =3D SPIN_LOCK_UNLOCKED;=0A=
 =0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 static struct proc_dir_entry *lvm_proc_dir =3D NULL;=0A=
 static struct proc_dir_entry *lvm_proc_vg_subdir =3D NULL;=0A=
 struct proc_dir_entry *pde =3D NULL;=0A=
@@ -433,7 +434,7 @@=0A=
 		&lvm_chr_fops, NULL);=0A=
 #endif=0A=
 =0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 	lvm_proc_dir =3D create_proc_entry (LVM_DIR, S_IFDIR, &proc_root);=0A=
 	if (lvm_proc_dir !=3D NULL) {=0A=
 		lvm_proc_vg_subdir =3D create_proc_entry (LVM_VG_SUBDIR, S_IFDIR, =
lvm_proc_dir);=0A=
@@ -521,7 +522,7 @@=0A=
 	blksize_size[MAJOR_NR] =3D NULL;=0A=
 	hardsect_size[MAJOR_NR] =3D NULL;=0A=
 =0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 	remove_proc_entry(LVM_GLOBAL, lvm_proc_dir);=0A=
 	remove_proc_entry(LVM_VG_SUBDIR, lvm_proc_dir);=0A=
 	remove_proc_entry(LVM_DIR, &proc_root);=0A=
@@ -1265,7 +1266,7 @@=0A=
 }=0A=
 =0A=
 =0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 /*=0A=
  * Support functions /proc-Filesystem=0A=
  */=0A=
@@ -1454,8 +1455,6 @@=0A=
 	else=0A=
 		return count;=0A=
 } /* lvm_proc_get_global_info() */=0A=
-#endif /* #if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS =
*/=0A=
-=0A=
 =0A=
 /*=0A=
  * provide VG information=0A=
@@ -1532,7 +1531,7 @@=0A=
 =0A=
 	return sz;=0A=
 }=0A=
-=0A=
+#endif /* CONFIG_PROC_FS */=0A=
 =0A=
 /*=0A=
  * block device support function for =
/usr/src/linux/drivers/block/ll_rw_blk.c=0A=
@@ -1661,6 +1660,8 @@=0A=
 	if (lv->lv_access & (LV_SNAPSHOT|LV_SNAPSHOT_ORG)) {=0A=
 		/* original logical volume */=0A=
 		if (lv->lv_access & LV_SNAPSHOT_ORG) {=0A=
+			/* Serializes the access to the lv_snapshot_next list */=0A=
+			down(&lv->lv_snapshot_sem);=0A=
 			if (rw =3D=3D WRITE || rw =3D=3D WRITEA)=0A=
 			{=0A=
 				lv_t *lv_ptr;=0A=
@@ -1671,7 +1672,8 @@=0A=
 				     lv_ptr =3D lv_ptr->lv_snapshot_next) {=0A=
 					/* Check for inactive snapshot */=0A=
 					if (!(lv_ptr->lv_status & LV_ACTIVE)) continue;=0A=
-					down(&lv->lv_snapshot_org->lv_snapshot_sem);=0A=
+					/* Serializes the COW with the accesses to the snapshot device =
*/=0A=
+					down(&lv_ptr->lv_snapshot_sem);=0A=
 					/* do we still have exception storage for this snapshot free? =
*/=0A=
 					if (lv_ptr->lv_block_exception !=3D NULL) {=0A=
 						rdev_sav =3D rdev_tmp;=0A=
@@ -1692,9 +1694,10 @@=0A=
 						rdev_tmp =3D rdev_sav;=0A=
 						rsector_tmp =3D rsector_sav;=0A=
 					}=0A=
-					up(&lv->lv_snapshot_org->lv_snapshot_sem);=0A=
+					up(&lv_ptr->lv_snapshot_sem);=0A=
 				}=0A=
 			}=0A=
+			up(&lv->lv_snapshot_sem);=0A=
 		} else {=0A=
 			/* remap snapshot logical volume */=0A=
 			down(&lv->lv_snapshot_sem);=0A=
@@ -1991,7 +1994,7 @@=0A=
 		&lvm_chr_fops, NULL);=0A=
 #endif=0A=
 =0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 	lvm_do_create_proc_entry_of_vg ( vg_ptr);=0A=
 #endif=0A=
 =0A=
@@ -2025,17 +2028,10 @@=0A=
 				ret =3D lvm_do_pv_create(arg, vg_ptr, p);=0A=
 				lvm_do_create_proc_entry_of_pv ( vg_ptr, pv_ptr);=0A=
 				if ( ret !=3D 0) return ret;=0A=
-	=0A=
-				/* We don't need the PE list=0A=
-				   in kernel space like LVs pe_t list */=0A=
-				pv_ptr->pe =3D NULL;=0A=
-				vg_ptr->pv_cur++;=0A=
-				vg_ptr->pv_act++;=0A=
-				vg_ptr->pe_total +=3D=0A=
-				    pv_ptr->pe_total;=0A=
-#ifdef LVM_GET_INODE=0A=
-				/* insert a dummy inode for fs_may_mount */=0A=
-				pv_ptr->inode =3D lvm_get_inode(pv_ptr->pv_dev);=0A=
+				pv_ptr =3D vg_ptr->pv[p] ;=0A=
+				vg_ptr->pe_total +=3D pv_ptr->pe_total;=0A=
+#ifdef CONFIG_PROC_FS=0A=
+				lvm_do_create_proc_entry_of_pv ( vg_ptr, pv_ptr);=0A=
 #endif=0A=
 				return 0;=0A=
 			}=0A=
@@ -2062,10 +2058,6 @@=0A=
 		    strcmp(pv_ptr->pv_name,=0A=
 			       pv_name) =3D=3D 0) {=0A=
 			if (pv_ptr->lv_cur > 0) return -EPERM;=0A=
-			vg_ptr->pe_total -=3D=0A=
-			    pv_ptr->pe_total;=0A=
-			vg_ptr->pv_cur--;=0A=
-			vg_ptr->pv_act--;=0A=
 			lvm_do_pv_remove(vg_ptr, p);=0A=
 			/* Make PV pointer array contiguous */=0A=
 			for (; p < vg_ptr->pv_max - 1; p++)=0A=
@@ -2093,7 +2085,7 @@=0A=
 	if (copy_from_user(vg_name, arg, sizeof(vg_name)) !=3D 0)=0A=
 		return -EFAULT;=0A=
 =0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 	lvm_do_remove_proc_entry_of_vg ( vg_ptr);=0A=
 #endif=0A=
 =0A=
@@ -2117,7 +2109,7 @@=0A=
 		strncpy(pv_ptr->vg_name, vg_name, NAME_LEN);=0A=
 	}=0A=
 =0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 	lvm_do_create_proc_entry_of_vg ( vg_ptr);=0A=
 #endif=0A=
 =0A=
@@ -2181,7 +2173,7 @@=0A=
 	devfs_unregister (vg_devfs_handle[vg_ptr->vg_number]);=0A=
 #endif=0A=
 =0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 	lvm_do_remove_proc_entry_of_vg ( vg_ptr);=0A=
 #endif=0A=
 =0A=
@@ -2239,7 +2231,7 @@=0A=
 static int lvm_do_pv_remove(vg_t *vg_ptr, ulong p) {=0A=
 	pv_t *pv_ptr =3D vg_ptr->pv[p];=0A=
 =0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 	lvm_do_remove_proc_entry_of_pv ( vg_ptr, pv_ptr);=0A=
 #endif=0A=
 	vg_ptr->pe_total -=3D=0A=
@@ -2374,18 +2366,10 @@=0A=
 =0A=
 				lv_ptr->lv_snapshot_minor =3D 0;=0A=
 				lv_ptr->lv_snapshot_org =3D lv_ptr;=0A=
-				lv_ptr->lv_snapshot_prev =3D NULL;=0A=
-				/* walk thrugh the snapshot list */=0A=
-				while (lv_ptr->lv_snapshot_next !=3D NULL)=0A=
-					lv_ptr =3D lv_ptr->lv_snapshot_next;=0A=
-				/* now lv_ptr points to the last existing snapshot in the chain =
*/=0A=
-				vg_ptr->lv[l]->lv_snapshot_prev =3D lv_ptr;=0A=
 				/* our new one now back points to the previous last in the =
chain=0A=
 				   which can be the original logical volume */=0A=
 				lv_ptr =3D vg_ptr->lv[l];=0A=
 				/* now lv_ptr points to our new last snapshot logical volume */=0A=
-				lv_ptr->lv_snapshot_org =3D =
lv_ptr->lv_snapshot_prev->lv_snapshot_org;=0A=
-				lv_ptr->lv_snapshot_next =3D NULL;=0A=
 				lv_ptr->lv_current_pe =3D =
lv_ptr->lv_snapshot_org->lv_current_pe;=0A=
 				lv_ptr->lv_allocated_le =3D =
lv_ptr->lv_snapshot_org->lv_allocated_le;=0A=
 				lv_ptr->lv_current_le =3D =
lv_ptr->lv_snapshot_org->lv_current_le;=0A=
@@ -2444,22 +2428,27 @@=0A=
 	}=0A=
 #endif=0A=
 =0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 	lvm_do_create_proc_entry_of_lv ( vg_ptr, lv_ptr);=0A=
 #endif=0A=
 =0A=
 	/* optionally add our new snapshot LV */=0A=
 	if (lv_ptr->lv_access & LV_SNAPSHOT) {=0A=
+		lv_t * org =3D lv_ptr->lv_snapshot_org, * last;=0A=
 		/* sync the original logical volume */=0A=
-		fsync_dev(lv_ptr->lv_snapshot_org->lv_dev);=0A=
+		fsync_dev(org->lv_dev);=0A=
 #ifdef	LVM_VFS_ENHANCEMENT=0A=
 		/* VFS function call to sync and lock the filesystem */=0A=
-		fsync_dev_lockfs(lv_ptr->lv_snapshot_org->lv_dev);=0A=
+		fsync_dev_lockfs(org->lv_dev);=0A=
 #endif=0A=
-		lv_ptr->lv_snapshot_org->lv_access |=3D LV_SNAPSHOT_ORG;=0A=
-		lv_ptr->lv_access &=3D ~LV_SNAPSHOT_ORG;=0A=
-		/* put ourselve into the chain */=0A=
-		lv_ptr->lv_snapshot_prev->lv_snapshot_next =3D lv_ptr;=0A=
+		down(&org->lv_snapshot_sem);=0A=
+		org->lv_access |=3D LV_SNAPSHOT_ORG;=0A=
+		lv_ptr->lv_access &=3D ~LV_SNAPSHOT_ORG; /* this can only hide an =
userspace bug */=0A=
+		/* Link in the list of snapshot volumes */=0A=
+		for (last =3D org; last->lv_snapshot_next; last =3D =
last->lv_snapshot_next);=0A=
+		lv_ptr->lv_snapshot_prev =3D last;=0A=
+		last->lv_snapshot_next =3D lv_ptr;=0A=
+		up(&org->lv_snapshot_sem);=0A=
 	}=0A=
 =0A=
 	/* activate the logical volume */=0A=
@@ -2515,6 +2504,28 @@=0A=
 	    lv_ptr->lv_snapshot_next !=3D NULL)=0A=
 		return -EPERM;=0A=
 =0A=
+	if (lv_ptr->lv_access & LV_SNAPSHOT) {=0A=
+		/*=0A=
+		 * Atomically make the the snapshot invisible=0A=
+		 * to the original lv before playing with it.=0A=
+		 */=0A=
+		lv_t * org =3D lv_ptr->lv_snapshot_org;=0A=
+		down(&org->lv_snapshot_sem);=0A=
+=0A=
+		/* remove this snapshot logical volume from the chain */=0A=
+		lv_ptr->lv_snapshot_prev->lv_snapshot_next =3D =
lv_ptr->lv_snapshot_next;=0A=
+		if (lv_ptr->lv_snapshot_next !=3D NULL) {=0A=
+			lv_ptr->lv_snapshot_next->lv_snapshot_prev =3D=0A=
+			    lv_ptr->lv_snapshot_prev;=0A=
+		}=0A=
+		up(&org->lv_snapshot_sem);=0A=
+=0A=
+		/* no more snapshots? */=0A=
+		if (!org->lv_snapshot_next)=0A=
+			org->lv_access &=3D ~LV_SNAPSHOT_ORG;=0A=
+		lvm_snapshot_release(lv_ptr);=0A=
+	}=0A=
+=0A=
 	lv_ptr->lv_status |=3D LV_SPINDOWN;=0A=
 =0A=
 	/* sync the buffers */=0A=
@@ -2548,25 +2559,13 @@=0A=
 			}=0A=
 		}=0A=
 		vfree(lv_ptr->lv_current_pe);=0A=
-	/* LV_SNAPSHOT */=0A=
-	} else {=0A=
-		/* remove this snapshot logical volume from the chain */=0A=
-		lv_ptr->lv_snapshot_prev->lv_snapshot_next =3D =
lv_ptr->lv_snapshot_next;=0A=
-		if (lv_ptr->lv_snapshot_next !=3D NULL) {=0A=
-			lv_ptr->lv_snapshot_next->lv_snapshot_prev =3D=0A=
-			    lv_ptr->lv_snapshot_prev;=0A=
-		}=0A=
-		/* no more snapshots? */=0A=
-		if (lv_ptr->lv_snapshot_org->lv_snapshot_next =3D=3D NULL)=0A=
-			lv_ptr->lv_snapshot_org->lv_access &=3D ~LV_SNAPSHOT_ORG;=0A=
-		lvm_snapshot_release(lv_ptr);=0A=
 	}=0A=
 =0A=
 #ifdef	CONFIG_DEVFS_FS=0A=
 	devfs_unregister(lv_devfs_handle[lv_ptr->lv_number]);=0A=
 #endif=0A=
 =0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 	lvm_do_remove_proc_entry_of_lv ( vg_ptr, lv_ptr);=0A=
 #endif=0A=
 =0A=
@@ -2916,13 +2915,13 @@=0A=
 		if ( (lv_ptr =3D vg_ptr->lv[l]) =3D=3D NULL) continue;=0A=
 		if (lv_ptr->lv_dev =3D=3D lv->lv_dev)=0A=
 		{=0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 			lvm_do_remove_proc_entry_of_lv ( vg_ptr, lv_ptr);=0A=
 #endif=0A=
 			strncpy(lv_ptr->lv_name,=0A=
 				lv_req->lv_name,=0A=
 				NAME_LEN);=0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
+#ifdef CONFIG_PROC_FS=0A=
 			lvm_do_create_proc_entry_of_lv ( vg_ptr, lv_ptr);=0A=
 #endif=0A=
 			break;=0A=
@@ -3004,7 +3003,7 @@=0A=
 } /* lvm_do_pv_status() */=0A=
 =0A=
 =0A=
-=0A=
+#ifdef CONFIG_PROC_FS=0A=
 /*=0A=
  * create a /proc entry for a logical volume=0A=
  */=0A=
@@ -3076,7 +3075,6 @@=0A=
 /*=0A=
  * create a /proc entry for a volume group=0A=
  */=0A=
-#if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS=0A=
 void lvm_do_create_proc_entry_of_vg ( vg_t *vg_ptr) {=0A=
 	int l, p;=0A=
 	pv_t *pv_ptr;=0A=
@@ -3135,8 +3133,7 @@=0A=
 		remove_proc_entry(vg_ptr->vg_name, lvm_proc_vg_subdir);=0A=
 	}=0A=
 }=0A=
-#endif=0A=
-=0A=
+#endif /* CONFIG_PROC_FS */=0A=
 =0A=
 /*=0A=
  * support function initialize gendisk variables=0A=
diff -urN 2.4.0ac4/include/linux/lvm.h =
2.4.0ac4-lvm/include/linux/lvm.h=0A=
--- 2.4.0ac4/include/linux/lvm.h	Mon Jan  8 06:33:52 2001=0A=
+++ 2.4.0ac4-lvm/include/linux/lvm.h	Tue Jan  9 01:26:17 2001=0A=
@@ -57,6 +57,8 @@=0A=
  *    26/06/2000 - implemented snapshot persistency and resizing =
support=0A=
  *    02/11/2000 - added hash table size member to lv structure=0A=
  *    12/11/2000 - removed unneeded timestamp definitions=0A=
+ *    24/12/2000 - removed LVM_TO_{CORE,DISK}*, use cpu_{from, =
to}_le*=0A=
+ *                 instead - Christoph Hellwig=0A=
  *=0A=
  */=0A=
 =0A=
@@ -68,7 +70,6 @@=0A=
 =0A=
 #include <linux/config.h>=0A=
 #include <linux/version.h>=0A=
-#include <endian.h>=0A=
 =0A=
 /*=0A=
  * preprocessor definitions=0A=
@@ -324,51 +325,6 @@=0A=
 	COW_table_entries_per_PE =3D LVM_GET_COW_TABLE_CHUNKS_PER_PE(vg, lv); =
\=0A=
 	COW_table_chunks_per_PE =3D ( COW_table_entries_per_PE * =
sizeof(lv_COW_table_disk_t) / SECTOR_SIZE + lv->lv_chunk_size - 1) / =
lv->lv_chunk_size; \=0A=
 	COW_table_entries_per_PE - COW_table_chunks_per_PE;})=0A=
-=0A=
-=0A=
-/* to disk and to core data conversion macros */=0A=
-#if __BYTE_ORDER =3D=3D __BIG_ENDIAN=0A=
-=0A=
-#define LVM_TO_CORE16(x) ( \=0A=
-        ((uint16_t)((((uint16_t)(x) & 0x00FFU) << 8) | \=0A=
-                    (((uint16_t)(x) & 0xFF00U) >> 8))))=0A=
-=0A=
-#define LVM_TO_DISK16(x) LVM_TO_CORE16(x)=0A=
-=0A=
-#define LVM_TO_CORE32(x) ( \=0A=
-        ((uint32_t)((((uint32_t)(x) & 0x000000FFU) << 24) | \=0A=
-                    (((uint32_t)(x) & 0x0000FF00U) << 8))) \=0A=
-                    (((uint32_t)(x) & 0x00FF0000U) >> 8))) \=0A=
-                    (((uint32_t)(x) & 0xFF000000U) >> 24))))=0A=
-=0A=
-#define LVM_TO_DISK32(x) LVM_TO_CORE32(x)=0A=
-=0A=
-#define LVM_TO_CORE64(x) \=0A=
-        ((uint64_t)((((uint64_t)(x) & 0x00000000000000FFULL) << 56) | =
\=0A=
-                    (((uint64_t)(x) & 0x000000000000FF00ULL) << 40) | =
\=0A=
-                    (((uint64_t)(x) & 0x0000000000FF0000ULL) << 24) | =
\=0A=
-                    (((uint64_t)(x) & 0x00000000FF000000ULL) <<  8) | =
\=0A=
-                    (((uint64_t)(x) & 0x000000FF00000000ULL) >>  8) | =
\=0A=
-                    (((uint64_t)(x) & 0x0000FF0000000000ULL) >> 24) | =
\=0A=
-                    (((uint64_t)(x) & 0x00FF000000000000ULL) >> 40) | =
\=0A=
-                    (((uint64_t)(x) & 0xFF00000000000000ULL) >> 56))) =
=0A=
-=0A=
-#define LVM_TO_DISK64(x) LVM_TO_CORE64(x)=0A=
-=0A=
-#elif __BYTE_ORDER =3D=3D __LITTLE_ENDIAN=0A=
-=0A=
-#define LVM_TO_CORE16(x) x=0A=
-#define LVM_TO_DISK16(x) x=0A=
-#define LVM_TO_CORE32(x) x=0A=
-#define LVM_TO_DISK32(x) x=0A=
-#define LVM_TO_CORE64(x) x=0A=
-#define LVM_TO_DISK64(x) x=0A=
-=0A=
-#else=0A=
-=0A=
-#error "__BYTE_ORDER must be defined as __LITTLE_ENDIAN or =
__BIG_ENDIAN"=0A=
-=0A=
-#endif /* #if __BYTE_ORDER =3D=3D __BIG_ENDIAN */=0A=
 =0A=
 =0A=
 /*=0A=

------_=_NextPart_000_01C07CF4.995C6E90
Content-Type: application/octet-stream;
	name="lvm-pv-get-size.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lvm-pv-get-size.patch"

--- LVM_0_9/tools/lib/pv_get_size.c.orig	Fri Jan 12 11:32:50 2001=0A=
+++ LVM_0_9/tools/lib/pv_get_size.c	Fri Jan 12 11:33:00 2001=0A=
@@ -97,6 +97,7 @@=0A=
             if ( dir_cache[i].st_rdev =3D=3D st_rdev)=0A=
                break;=0A=
          }=0A=
+	  strncpy ( disk_dev_name, dir_cache[i].dev_name, sizeof =
(disk_dev_name) - 1); =0A=
       } else {=0A=
 	  strncpy ( disk_dev_name, dev_name, sizeof ( disk_dev_name) - 1);=0A=
       }=0A=
@@ -104,8 +105,6 @@=0A=
       ret =3D -LVM_EPV_GET_SIZE_LVM_DIR_CACHE;=0A=
       goto pv_get_size_end;=0A=
    }=0A=
-=0A=
-   strncpy ( disk_dev_name, dir_cache[i].dev_name, sizeof ( =
disk_dev_name) - 1);=0A=
 =0A=
    first =3D 1;=0A=
    if ( ( pv_handle =3D open ( disk_dev_name, O_RDONLY)) =3D=3D -1) =
{=0A=

------_=_NextPart_000_01C07CF4.995C6E90
Content-Type: application/octet-stream;
	name="lvm-snapshot-name.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lvm-snapshot-name.patch"

--- LVM_0_9/tools/lvcreate.c.orig	Sun Nov 12 16:20:10 2000=0A=
+++ LVM_0_9/tools/lvcreate.c	Thu Jan 11 16:38:09 2001=0A=
@@ -432,7 +432,7 @@=0A=
          return LVM_EINVALID_CMD_LINE;=0A=
       }=0A=
       strncpy ( lv_snapshot_name, lv_name, sizeof ( lv_name) - 1);=0A=
-      lv_path[sizeof ( lv_name) - 1] =3D 0;=0A=
+      lv_snapshot_name[sizeof ( lv_name) - 1] =3D 0;=0A=
       dummy =3D argv[optind];=0A=
       LVM_CHECK_DEFAULT_VG_NAME ( dummy, buffer, NAME_LEN);=0A=
       strncpy ( lv_name, dummy, sizeof ( lv_name) - 1);=0A=

------_=_NextPart_000_01C07CF4.995C6E90--
