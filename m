Return-Path: <hch@ns.caldera.de>
Date: Wed, 10 Jan 2001 20:34:00 +0100
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] Once again ... Kernel 2.4.0 - What can I do ?
Message-ID: <20010110203400.A31905@caldera.de>
References: <1504018708.20010108141026@lzer.net>
Mime-Version: 1.0
In-Reply-To: <1504018708.20010108141026@lzer.net>; from jan.w@lzer.net on Mon, Jan 08, 2001 at 02:10:26PM +0100
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
To: linux-lvm@sistina.com

On Mon, Jan 08, 2001 at 02:10:26PM +0100, Jan Walzer wrote:
>   Is there a way to "downpatch" the kernel to lvm0.8 ???
>   or better:
>   can I convert the volume to 0.9 without data-loss ???

I have written a little patch to implement the v6 IOP
in 2.4.0/LVM0.9.  It is rather hackish and does the work in
the kernel, but it does at least work ... (attached)

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.


diff -uNr --exclude-from=dontdiff linux-2.4.0-test13-pre4/drivers/md/Config.in linux/drivers/md/Config.in
--- linux-2.4.0-test13-pre4/drivers/md/Config.in	Sun Nov 26 17:23:18 2000
+++ linux/drivers/md/Config.in	Mon Dec 25 21:45:50 2000
@@ -17,5 +17,6 @@
 fi
 
 dep_tristate ' Logical volume manager (LVM) support' CONFIG_BLK_DEV_LVM $CONFIG_MD
+dep_mbool '   Support (only) LVM 0.8 IOP' CONFIG_BLK_DEV_LVM_COMPAT_08 $CONFIG_BLK_DEV_LVM
 
 endmenu
diff -uNr --exclude-from=dontdiff linux-2.4.0-test13-pre4/drivers/md/Makefile linux/drivers/md/Makefile
--- linux-2.4.0-test13-pre4/drivers/md/Makefile	Sat Dec 23 18:55:04 2000
+++ linux/drivers/md/Makefile	Mon Dec 25 21:46:33 2000
@@ -6,7 +6,7 @@
 
 export-objs	:= md.o xor.o
 list-multi	:= lvm-mod.o
-lvm-mod-objs	:= lvm.o lvm-snap.o
+lvm-mod-objs	:= lvm.o lvm-snap.o lvm-compat.o
 
 # Note: link order is important.  All raid personalities
 # and xor.o must come before md.o, as they each initialise 
diff -uNr --exclude-from=dontdiff linux-2.4.0-test13-pre4/drivers/md/lvm-compat.c linux/drivers/md/lvm-compat.c
--- linux-2.4.0-test13-pre4/drivers/md/lvm-compat.c	Thu Jan  1 01:00:00 1970
+++ linux/drivers/md/lvm-compat.c	Mon Dec 25 23:18:36 2000
@@ -0,0 +1,259 @@
+/*
+ * Copyright (c) 2000 Christoph Hellwig.
+ * All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#include <linux/config.h>
+#include <linux/kernel.h>
+#include <asm/uaccess.h>
+#include <linux/lvm.h>
+
+/*
+ * LVM compatiblity for 0.8 userlevel.
+ */
+
+int
+copy_vg_from_user(vg_t * vg, void * arg)
+{
+#ifdef CONFIG_BLK_DEV_LVM_COMPAT_08
+	int error;
+
+	if (LVM_DRIVER_IOP_VERSION == 6) {
+		vg_v1_t vg_compat;
+
+		error = copy_from_user(&vg_compat, arg, sizeof(vg_v1_t));
+		if (error)
+			return (error);
+		
+		memset(vg, 0, sizeof(vg_t));
+
+		/*
+		 * vg_t hasn't changed much - just memcpy.
+		 */
+		memcpy(vg, &vg_compat, sizeof(vg_v1_t));
+		memcpy(vg->vg_uuid, vg_compat.vg_name, UUID_LEN);
+
+		return 0;
+	} else
+#endif
+		return copy_from_user(vg, arg, sizeof(vg_t));
+}
+
+
+int
+copy_lv_from_user(lv_t * lv, void * arg)
+{
+#ifdef CONFIG_BLK_DEV_LVM_COMPAT_08
+	int error;
+
+	if (LVM_DRIVER_IOP_VERSION == 6) {
+		lv_v2_t lv_compat;
+
+
+		error = copy_from_user(&lv_compat, arg, sizeof(lv_v2_t));
+		if (error)
+			return (error);
+
+		memset(lv, 0, sizeof(lv_t));
+
+		/*
+		 * We can't simply memcpy the whole struct 
+		 * because a struct member is gone.
+		 */
+		memcpy(lv->lv_name, lv_compat.lv_name, NAME_LEN);
+		memcpy(lv->vg_name, lv_compat.vg_name, NAME_LEN);
+
+		lv->lv_access =			lv_compat.lv_access;
+		lv->lv_status =			lv_compat.lv_status;
+		lv->lv_open =			lv_compat.lv_open;
+		lv->lv_dev =			lv_compat.lv_dev;
+		lv->lv_number =			lv_compat.lv_number;
+		lv->lv_mirror_copies =		lv_compat.lv_mirror_copies;
+		lv->lv_recovery =		lv_compat.lv_recovery;
+		lv->lv_schedule =		lv_compat.lv_schedule;
+		lv->lv_size =			lv_compat.lv_size;
+		lv->lv_current_pe =		lv_compat.lv_current_pe;
+		lv->lv_current_le =		lv_compat.lv_current_le;
+		lv->lv_allocated_le =		lv_compat.lv_allocated_le;
+		lv->lv_stripes =		lv_compat.lv_stripes;
+		lv->lv_stripesize =		lv_compat.lv_stripesize;
+		lv->lv_badblock =		lv_compat.lv_badblock;
+		lv->lv_allocation =		lv_compat.lv_allocation;
+		lv->lv_io_timeout =		lv_compat.lv_io_timeout;
+		lv->lv_read_ahead =		lv_compat.lv_read_ahead;
+
+		/*
+		 * We'll convert these later.
+		 */
+		lv->lv_snapshot_org = 		(struct lv_v4 *) lv_compat.lv_snapshot_org;
+		lv->lv_snapshot_prev =		(struct lv_v4 *) lv_compat.lv_snapshot_prev;
+		lv->lv_snapshot_next =		(struct lv_v4 *) lv_compat.lv_snapshot_next;
+		
+		lv->lv_block_exception =	lv_compat.lv_block_exception;
+		lv->lv_remap_ptr = 		lv_compat.lv_remap_ptr;
+		lv->lv_remap_end =		lv_compat.lv_remap_end;
+		lv->lv_chunk_size =		lv_compat.lv_chunk_size;
+		lv->lv_snapshot_minor =		lv_compat.lv_snapshot_minor;
+
+		return 0;
+	} else
+#endif
+		return copy_from_user(lv, arg, sizeof(lv_t));
+}
+
+
+
+int
+copy_pv_from_user(pv_t * pv, void * arg)
+{
+#ifdef CONFIG_BLK_DEV_LVM_COMPAT_08
+	int error;
+
+	if (LVM_DRIVER_IOP_VERSION == 6) {
+		pv_v1_t pv_compat;
+
+		error = copy_from_user(&pv_compat, arg, sizeof(pv_v1_t));
+		if (error)
+			return (error);
+		
+		memset(pv, 0, sizeof(pv_t));
+
+		/*
+		 * vg_t hasn't changed much - just memcpy.
+		 */
+		memcpy(pv, &pv_compat, sizeof(pv_v1_t));
+		memcpy(pv->pv_uuid, pv_compat.pv_name, UUID_LEN);
+
+		return 0;
+	} else
+#endif
+		return copy_from_user(pv, arg, sizeof(pv_t));
+}
+
+int
+copy_status_byindex_from_user(lv_status_byindex_req_t * req, void * arg)
+{
+#ifdef CONFIG_BLK_DEV_LVM_COMPAT_08
+	int error;
+
+	if (LVM_DRIVER_IOP_VERSION == 6) {
+		struct {
+			u_int32_t	lv_index;
+			lv_t *		lv;
+		} req_compat;
+
+		error = copy_from_user(&req_compat, arg, sizeof(req_compat));
+		if (error)
+			return (error);
+		
+		memset(req, 0, sizeof(lv_status_byindex_req_t));
+
+		/*
+		 * vg_t hasn't changed much - just memcpy.
+		 */
+		memcpy(req, &req_compat, sizeof(req_compat));
+
+		return 0;
+	} else
+#endif
+		return copy_from_user(req, arg, sizeof(lv_status_byindex_req_t));
+}
+
+int
+copy_vg_to_user(void * arg, vg_t * vg)
+{
+#ifdef CONFIG_BLK_DEV_LVM_COMPAT_08
+	if (LVM_DRIVER_IOP_VERSION == 6) {
+		vg_v1_t vg_compat;
+
+		memcpy(&vg_compat, vg, sizeof(vg_v1_t));
+		return copy_to_user(arg, &vg_compat, sizeof(vg_v1_t));
+	} else
+#endif
+		return copy_to_user(arg, vg, sizeof(vg_t));
+}
+
+
+int
+copy_lv_to_user(void * arg, lv_t * lv)
+{
+#ifdef CONFIG_BLK_DEV_LVM_COMPAT_08
+	if (LVM_DRIVER_IOP_VERSION == 6) {
+		lv_v2_t	 lv_compat;
+
+		memset(&lv_compat, 0, sizeof(lv_v2_t));
+
+		/*
+		 * We can't simply memcpy the whole struct 
+		 * because a struct member is gone.
+		 */
+		memcpy(lv_compat.lv_name, lv->lv_name, NAME_LEN);
+		memcpy(lv_compat.vg_name, lv->vg_name, NAME_LEN);
+
+		lv_compat.lv_access =		lv->lv_access;
+		lv_compat.lv_status =		lv->lv_status;
+		lv_compat.lv_open =		lv->lv_open;
+		lv_compat.lv_dev =		lv->lv_dev;
+		lv_compat.lv_number =		lv->lv_number;
+		lv_compat.lv_mirror_copies =	lv->lv_mirror_copies;
+		lv_compat.lv_recovery =		lv->lv_recovery;
+		lv_compat.lv_schedule =		lv->lv_schedule;
+		lv_compat.lv_size =		lv->lv_size;
+		lv_compat.lv_current_pe =	lv->lv_current_pe;
+		lv_compat.lv_current_le =	lv->lv_current_le;
+		lv_compat.lv_allocated_le =	lv->lv_allocated_le;
+		lv_compat.lv_stripes =		lv->lv_stripes;
+		lv_compat.lv_stripesize =	lv->lv_stripesize;
+		lv_compat.lv_badblock =		lv->lv_badblock;
+		lv_compat.lv_allocation =	lv->lv_allocation;
+		lv_compat.lv_io_timeout =	lv->lv_io_timeout;
+		lv_compat.lv_read_ahead =	lv->lv_read_ahead;
+
+		/*
+		 * These should have already been converted.
+		 */
+		lv_compat.lv_snapshot_org = 	(struct lv_v2 *) lv->lv_snapshot_org;
+		lv_compat.lv_snapshot_prev =	(struct lv_v2 *) lv->lv_snapshot_prev;
+		lv_compat.lv_snapshot_next =	(struct lv_v2 *) lv->lv_snapshot_next;
+		
+		lv_compat.lv_block_exception =	lv->lv_block_exception;
+		lv_compat.lv_remap_ptr = 	lv->lv_remap_ptr;
+		lv_compat.lv_remap_end =	lv->lv_remap_end;
+		lv_compat.lv_chunk_size =	lv->lv_chunk_size;
+		lv_compat.lv_snapshot_minor =	lv->lv_snapshot_minor;
+
+		return copy_to_user(arg, &lv_compat, sizeof(lv_v2_t));
+	} else
+#endif
+		return copy_to_user(arg, lv, sizeof(lv_t));
+}
+
+
+
+int
+copy_pv_to_user(void * arg, pv_t * pv)
+{
+#ifdef CONFIG_BLK_DEV_LVM_COMPAT_08
+	if (LVM_DRIVER_IOP_VERSION == 6) {
+		pv_v1_t		pv_compat;
+
+		memcpy(&pv_compat, pv, sizeof(pv_v1_t));
+		return copy_to_user(arg, &pv_compat, sizeof(pv_v1_t));
+	} else
+#endif
+		return copy_from_user(pv, arg, sizeof(pv_t));
+}
diff -uNr --exclude-from=dontdiff linux-2.4.0-test13-pre4/drivers/md/lvm.c linux/drivers/md/lvm.c
--- linux-2.4.0-test13-pre4/drivers/md/lvm.c	Mon Dec 25 19:21:16 2000
+++ linux/drivers/md/lvm.c	Mon Dec 25 23:22:56 2000
@@ -260,6 +261,15 @@
 extern int lvm_snapshot_alloc_hash_table(lv_t *);
 extern void lvm_drop_snapshot(lv_t *, char *);
 
+/* external copy calls */
+extern int	copy_vg_from_user(vg_t *, void *);
+extern int	copy_lv_from_user(lv_t *, void *);
+extern int	copy_pv_from_user(pv_t *, void *);
+extern int	copy_status_byindex_from_user(lv_status_byindex_req_t *, void *);
+extern int	copy_vg_to_user(void *, vg_t *);
+extern int	copy_lv_to_user(void *, lv_t *);
+extern int	copy_pv_to_user(void *, pv_t *);
+
 #ifdef LVM_HD_NAME
 extern void (*lvm_hd_name_ptr) (char *, int);
 #endif
@@ -720,7 +730,7 @@
 	case VG_STATUS:
 		/* get volume group data (only the vg_t struct) */
 		if (vg_ptr == NULL) return -ENXIO;
-		if (copy_to_user(arg, vg_ptr, sizeof(vg_t)) != 0)
+		if (copy_vg_to_user(arg, vg_ptr) != 0)
 			return -EFAULT;
 		return 0;
 
@@ -1892,7 +1900,7 @@
 		return -ENOMEM;
 	}
 	/* get the volume group structure */
-	if (copy_from_user(vg_ptr, arg, sizeof(vg_t)) != 0) {
+	if (copy_vg_from_user(vg_ptr, arg) != 0) {
 		kfree(vg_ptr);
 		return -EFAULT;
 	}
@@ -1947,7 +1955,7 @@
 	for (l = 0; l < vg_ptr->lv_max; l++) {
 		/* user space address */
 		if ((lvp = vg_ptr->lv[l]) != NULL) {
-			if (copy_from_user(&lv, lvp, sizeof(lv_t)) != 0) {
+			if (copy_lv_from_user(&lv, lvp) != 0) {
 				lvm_do_vg_remove(minor);
 				return -EFAULT;
 			}
@@ -1970,7 +1978,7 @@
 	   in place during first path above */
 	for (l = 0; l < ls; l++) {
 		lvp = snap_lv_ptr[l];
-		if (copy_from_user(&lv, lvp, sizeof(lv_t)) != 0) {
+		if (copy_lv_from_user(&lv, lvp) != 0) {
 			lvm_do_vg_remove(minor);
 			return -EFAULT;
 		}
@@ -2211,7 +2221,7 @@
 		       lvm_name, __LINE__);
 		return -ENOMEM;
 	}
-	if (copy_from_user(pv_ptr, pvp, sizeof(pv_t)) != 0) {
+	if (copy_pv_from_user(pv_ptr, pvp) != 0) {
 		return -EFAULT;
 	}
 	/* We don't need the PE list
@@ -2816,9 +2826,8 @@
 		if (lv_ptr != NULL &&
 		    strcmp(lv_ptr->lv_name,
 			    lv_status_byname_req.lv_name) == 0) {
-			if (copy_to_user(lv_status_byname_req.lv,
-					 lv_ptr,
-					 sizeof(lv_t)) != 0)
+			if (copy_lv_to_user(lv_status_byname_req.lv,
+					lv_ptr) != 0)
 				return -EFAULT;
 
 			if (lv.lv_current_pe != NULL) {
@@ -2847,8 +2856,7 @@
 	lv_status_byindex_req_t lv_status_byindex_req;
 
 	if (vg_ptr == NULL) return -ENXIO;
-	if (copy_from_user(&lv_status_byindex_req, arg,
-			   sizeof(lv_status_byindex_req)) != 0)
+	if (copy_status_byindex_from_user(&lv_status_byindex_req, arg) != 0)
 		return -EFAULT;
 
 	if ((lvp = lv_status_byindex_req.lv) == NULL)
@@ -2856,10 +2864,10 @@
 	if ( ( lv_ptr = vg_ptr->lv[lv_status_byindex_req.lv_index]) == NULL)
 		return -ENXIO;
 
-	if (copy_from_user(&lv, lvp, sizeof(lv_t)) != 0)
+	if (copy_lv_from_user(&lv, lvp) != 0)
 		return -EFAULT;
 
-	if (copy_to_user(lvp, lv_ptr, sizeof(lv_t)) != 0)
+	if (copy_lv_to_user(lvp, lv_ptr) != 0)
 		return -EFAULT;
 
 	if (lv.lv_current_pe != NULL) {
@@ -2892,8 +2900,7 @@
 
 	if ( l == vg_ptr->lv_max) return -ENXIO;
 
-	if (copy_to_user(lv_status_bydev_req.lv,
-			 vg_ptr->lv[l], sizeof(lv_t)) != 0)
+	if (copy_lv_to_user(lv_status_bydev_req.lv, vg_ptr->lv[l]) != 0)
 		return -EFAULT;
 
 	return 0;
@@ -2956,9 +2963,8 @@
 #ifdef LVM_GET_INODE
 			inode_sav = pv_ptr->inode;
 #endif
-			if (copy_from_user(pv_ptr,
-					   pv_change_req.pv,
-					   sizeof(pv_t)) != 0)
+			if (copy_pv_from_user(pv_ptr,
+					   pv_change_req.pv) != 0)
 				return -EFAULT;
 
 			/* We don't need the PE list
@@ -2991,9 +2997,7 @@
 		if (pv_ptr != NULL &&
 		    strcmp(pv_ptr->pv_name,
 			       pv_status_req.pv_name) == 0) {
-			if (copy_to_user(pv_status_req.pv,
-					 pv_ptr,
-				         sizeof(pv_t)) != 0)
+			if (copy_pv_to_user(pv_status_req.pv, pv_ptr) != 0)
 				return -EFAULT;
 			return 0;
 		}
diff -uNr --exclude-from=dontdiff linux-2.4.0-test13-pre4/include/linux/lvm.h linux/include/linux/lvm.h
--- linux-2.4.0-test13-pre4/include/linux/lvm.h	Mon Dec 25 19:21:15 2000
+++ linux/include/linux/lvm.h	Mon Dec 25 21:54:41 2000
@@ -67,7 +67,6 @@
 #define	_LVM_KERNEL_H_VERSION	"LVM 0.9 (13/11/2000)"
 
 #include <linux/version.h>
-#include <endian.h>
 
 /*
  * preprocessor definitions
@@ -163,7 +162,11 @@
  * user land tools/lib/liblvm.h
  *
  */
-#define	LVM_DRIVER_IOP_VERSION	        10
+#ifdef CONFIG_BLK_DEV_LVM_COMPAT_08
+# define	LVM_DRIVER_IOP_VERSION		 6
+#else
+# define	LVM_DRIVER_IOP_VERSION	        10
+#endif
 
 #define LVM_NAME        "lvm"
 #define LVM_GLOBAL	"global"
@@ -639,6 +597,54 @@
 	ulong lv_block;
 	dev_t lv_dev;
 } lv_bmap_t;
+
+
+/*
+ * Structure Logical Volume (LV) Version 2
+ */
+
+/* core */
+typedef struct lv_v2 {
+	__u8 lv_name[NAME_LEN];
+	__u8 vg_name[NAME_LEN];
+	__u32 lv_access;
+	__u32 lv_status;
+	__u32 lv_open;		/* HM */
+	kdev_t lv_dev;		/* HM */
+	__u32 lv_number;	/* HM */
+	__u32 lv_mirror_copies;	/* for future use */
+	__u32 lv_recovery;	/*       "        */
+	__u32 lv_schedule;	/*       "        */
+	__u32 lv_size;
+	pe_t *lv_current_pe;	/* HM */
+	__u32 lv_current_le;	/* for future use */
+	__u32 lv_allocated_le;
+	__u32 lv_stripes;
+	__u32 lv_stripesize;
+	__u32 lv_badblock;	/* for future use */
+	__u32 lv_allocation;
+	__u32 lv_io_timeout;	/* for future use */
+	__u32 lv_read_ahead;
+
+	/* delta to version 1 starts here */
+	struct lv_v2 *lv_snapshot_org;
+	struct lv_v2 *lv_snapshot_prev;
+	struct lv_v2 *lv_snapshot_next;
+	lv_block_exception_t *lv_block_exception;
+	__u8 __unused;
+	__u32 lv_remap_ptr;
+	__u32 lv_remap_end;
+	__u32 lv_chunk_size;
+	__u32 lv_snapshot_minor;
+#ifdef __KERNEL__
+	struct kiobuf *lv_iobuf;
+	struct semaphore lv_snapshot_sem;
+	struct list_head *lv_snapshot_hash_table;
+	ulong  lv_snapshot_hash_mask;
+#else
+	char  dummy[200];
+#endif
+} lv_v2_t;
 
 /*
  * Structure Logical Volume (LV) Version 3
