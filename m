Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012230139.eBN1dws25900@webber.adilger.net>
Date: Fri, 22 Dec 2000 18:39:58 -0700 (MST)
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH] fix LVM device permissions
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
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@sistina.com>

Included here is a patch for LVM 0.9 (from 2.2.18 patch) which fixes the
permission checking in the kernel.  The goal is that any user who has
read access to the /dev/lvm /dev/<vg>/* devices can check the status,
and users with write permission can change the LVM devices.  This allows
delegation of storage admin to non-root users, if desired, and allows
you to check the LVM status as a regular user.

Unfortunately, the patch is not tested, as I'm currently having compiler
problems with my kernel, which prevent me from booting :-(.  However, it
is relatively safe (obvious changes) as long as you are not running a
full-LVM system.  You also need to define the SUSER_CHECK in lvm_user.h as

#define SUSER_CHECK

(obvious patch at bottom).  If this works OK, then the SUSER_CHECK calls
in all of the tools should be removed.  Testing _should_ show that root
and users in the "disk" group (or whatever group is set for the files)
can do everything, and others can do things like "pvdisplay /dev/hda1"
or whatever.  If not, "strace <command>" would help figure out what is
wrong.

Cheers, Andreas
============================================================================
--- drivers/block/lvm.c.orig	Mon Dec 18 17:46:40 2000
+++ drivers/block/lvm.c	Fri Dec 22 16:17:50 2000
@@ -647,9 +647,6 @@
 	       lvm_name, minor, VG_CHR(minor), file->f_mode, lock);
 #endif
 
-	/* super user validation */
-	if (!capable(CAP_SYS_ADMIN)) return -EACCES;
-
 	/* Group special file open */
 	if (VG_CHR(minor) > MAX_VG) return -ENXIO;
 
@@ -696,6 +693,8 @@
 	switch (command) {
 	case LVM_LOCK_LVM:
 		/* lock the LVM */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_lock_lvm();
 
 	case LVM_GET_IOP_VERSION:
@@ -708,6 +707,8 @@
 #ifdef LVM_TOTAL_RESET
 	case LVM_RESET:
 		/* lock reset function */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		lvm_reset_spindown = 1;
 		for (v = 0; v < ABS_MAX_VG; v++) {
 			if (vg[v] != NULL) lvm_do_vg_remove(v);
@@ -727,36 +728,52 @@
 
 	case LE_REMAP:
 		/* remap a logical extent (after moving the physical extent) */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_le_remap(vg_ptr,arg);
 
 	case PE_LOCK_UNLOCK:
 		/* lock/unlock i/o to a physical extent to move it to another
 		   physical volume (move's done in user space's pvmove) */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_pe_lock_unlock(vg_ptr,arg);
 
 	case VG_CREATE:
 		/* create a VGDA */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_vg_create(minor, arg);
 
 	case VG_EXTEND:
 		/* extend a volume group */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_vg_extend(vg_ptr, arg);
 
 	case VG_REDUCE:
 		/* reduce a volume group */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_vg_reduce(vg_ptr, arg);
 
 	case VG_RENAME:
 		/* rename a volume group */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_vg_rename(vg_ptr, arg);
 
 	case VG_REMOVE:
 		/* remove an inactive VGDA */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_vg_remove(minor);
 
 
 	case VG_SET_EXTENDABLE:
 		/* set/clear extendability flag of volume group */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		if (vg_ptr == NULL) return -ENXIO;
 		if (copy_from_user(&extendable, arg, sizeof(extendable)) != 0)
 			return -EFAULT;
@@ -773,6 +790,8 @@
 
 	case VG_STATUS:
 		/* get volume group data (only the vg_t struct) */
+		if (!(file->f_mode & FMODE_READ) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		if (vg_ptr == NULL) return -ENXIO;
 		if (copy_to_user(arg, vg_ptr, sizeof(vg_t)) != 0)
 			return -EFAULT;
@@ -781,6 +800,8 @@
 
 	case VG_STATUS_GET_COUNT:
 		/* get volume group count */
+		if (!(file->f_mode & FMODE_READ) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		if (copy_to_user(arg, &vg_count, sizeof(vg_count)) != 0)
 			return -EFAULT;
 		return 0;
@@ -788,6 +809,8 @@
 
 	case VG_STATUS_GET_NAMELIST:
 		/* get volume group count */
+		if (!(file->f_mode & FMODE_READ) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		for (l = v = 0; v < ABS_MAX_VG; v++) {
 			if (vg[v] != NULL) {
 				if (copy_to_user(arg + l * NAME_LEN,
@@ -806,6 +829,8 @@
 	case LV_REMOVE:
 	case LV_RENAME:
 		/* create, extend, reduce, remove or rename a logical volume */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		if (vg_ptr == NULL) return -ENXIO;
 		if (copy_from_user(&lv_req, arg, sizeof(lv_req)) != 0)
 			return -EFAULT;
@@ -833,30 +858,43 @@
 
 	case LV_STATUS_BYNAME:
 		/* get status of a logical volume by name */
+		if (!(file->f_mode & FMODE_READ) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_lv_status_byname(vg_ptr, arg);
 
 
 	case LV_STATUS_BYINDEX:
 		/* get status of a logical volume by index */
+		if (!(file->f_mode & FMODE_READ) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_lv_status_byindex(vg_ptr, arg);
 
 
 	case LV_STATUS_BYDEV:
+		/* get status of a logical volume by device */
+		if (!(file->f_mode & FMODE_READ) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_lv_status_bydev(vg_ptr, arg);
 
 
 	case PV_CHANGE:
 		/* change a physical volume */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_pv_change(vg_ptr,arg);
 
 
 	case PV_STATUS:
 		/* get physical volume data (pv_t structure only) */
+		if (!(file->f_mode & FMODE_READ) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_do_pv_status(vg_ptr,arg);
 
 
 	case PV_FLUSH:
 		/* physical volume buffer flush/invalidate */
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		if (copy_from_user(&pv_flush_req, arg,
 				   sizeof(pv_flush_req)) != 0)
 			return -EFAULT;
@@ -994,6 +1034,8 @@
 
 	switch (command) {
 	case BLKGETSIZE:
+		if (!(file->f_mode & FMODE_READ) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		/* return device size */
 #ifdef DEBUG_IOCTL
 		printk(KERN_DEBUG
@@ -1007,7 +1049,8 @@
 
 	case BLKFLSBUF:
 		/* flush buffer cache */
-		if (!capable(CAP_SYS_ADMIN)) return -EACCES;
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 
 #ifdef DEBUG_IOCTL
 		printk(KERN_DEBUG
@@ -1019,7 +1062,8 @@
 
 	case BLKRASET:
 		/* set read ahead for block device */
-		if (!capable(CAP_SYS_ADMIN)) return -EACCES;
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 
 #ifdef DEBUG_IOCTL
 		printk(KERN_DEBUG
@@ -1035,6 +1079,8 @@
 
 	case BLKRAGET:
 		/* get current read ahead setting */
+		if (!(file->f_mode & FMODE_READ) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 #ifdef DEBUG_IOCTL
 		printk(KERN_DEBUG
 		       "%s -- lvm_blk_ioctl -- BLKRAGET\n", lvm_name);
@@ -1046,6 +1092,8 @@
 
 	case HDIO_GETGEO:
 		/* get disk geometry */
+		if (!(file->f_mode & FMODE_READ) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 #ifdef DEBUG_IOCTL
 		printk(KERN_DEBUG
 		       "%s -- lvm_blk_ioctl -- HDIO_GETGEO\n", lvm_name);
@@ -1079,7 +1127,8 @@
 
 	case LV_SET_ACCESS:
 		/* set access flags of a logical volume */
-		if (!capable(CAP_SYS_ADMIN)) return -EACCES;
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		lv_ptr->lv_access = (ulong) arg;
 		if ( lv_ptr->lv_access & LV_WRITE)
 			set_device_ro(lv_ptr->lv_dev, 0);
@@ -1090,7 +1139,8 @@
 
 	case LV_SET_STATUS:
 		/* set status flags of a logical volume */
-		if (!capable(CAP_SYS_ADMIN)) return -EACCES;
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		if (!((ulong) arg & LV_ACTIVE) && lv_ptr->lv_open > 1)
 			return -EPERM;
 		lv_ptr->lv_status = (ulong) arg;
@@ -1098,16 +1148,21 @@
 
 	case LV_BMAP:
 		/* turn logical block into (dev_t, block). non privileged. */
+		if (!(file->f_mode & FMODE_READ) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		return lvm_user_bmap(inode, (struct lv_bmap *) arg);
 		break;
 
 	case LV_SET_ALLOCATION:
 		/* set allocation flags of a logical volume */
-		if (!capable(CAP_SYS_ADMIN)) return -EACCES;
+		if (!(file->f_mode & FMODE_WRITE) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		lv_ptr->lv_allocation = (ulong) arg;
 		break;
 
 	case LV_SNAPSHOT_USE_RATE:
+		if (!(file->f_mode & FMODE_READ) && !capable(CAP_SYS_ADMIN))
+			return -EACCES;
 		if (!(lv_ptr->lv_access & LV_SNAPSHOT)) return -EPERM;
 		{
 			lv_snapshot_use_rate_req_t	lv_snapshot_use_rate_req;


==============================================================================
--- tools/lvm_user.h.orig	Wed Nov 15 02:26:59 2000
+++ tools/lvm_user.h	Fri Dec 22 18:32:59 2000
@@ -58,12 +58,7 @@
 #include <getopt.h>
 #include <lvm.h>
 
-#define	SUSER_CHECK { \
-   if ( ! ( getuid () == 0 && geteuid () == 0)) { \
-      fprintf ( stderr, "%s -- this command is for root only\n\n", cmd); \
-      return 1; \
-   } \
-}
+#define	SUSER_CHECK
 
 #define	LVMFILE_CHECK( chkfile) { \
    int file = -1; \


-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
