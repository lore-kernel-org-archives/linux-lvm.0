From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010311735.KAA02575@lynx.turbolabs.com>
Subject: [linux-lvm] [PATCH] 2.4 kernel lvm.h
Date: Tue, 31 Oct 2000 10:35:07 -0700 (MST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Here is the patch for 2.4 include/linux/lvm.h which allows it to be used
in user programs as well as the kernel.  Even if we decide not to include
<linux/lvm.h> in favour of <lib/lvm.h>, I think we should apply this patch
so that we can keep identical include files to reduce maintenance.

Cheers, Andreas


--- -	Thu Oct 26 18:43:42 2000
+++ linux/include/linux/lvm.h	Thu Oct 26 18:39:13 2000
@@ -49,6 +50,8 @@
  *    08/12/1999 - changed LVM_LV_SIZE_MAX macro to reflect current 1TB limit
  *    01/01/2000 - extended lv_v2 core structure by wait_queue member
  *    12/02/2000 - integrated Andrea Arcagnelli's snapshot work
+ *    18/02/2000 - seperated user and kernel space parts by 
+ *                 #ifdef them with __KERNEL__
  *
  */
 
@@ -56,7 +59,9 @@
 #ifndef _LVM_H_INCLUDE
 #define _LVM_H_INCLUDE
 
-#define	_LVM_H_VERSION	"LVM 0.8final (15/2/2000)"
+#define	_LVM_H_VERSION	"LVM 0.8final (22/02/2000)"
+
+#include <linux/version.h>
 
 /*
  * preprocessor definitions
@@ -64,8 +69,9 @@
 /* if you like emergency reset code in the driver */
 #define	LVM_TOTAL_RESET
 
+#ifdef __KERNEL__
 #define LVM_GET_INODE
-#undef	LVM_HD_NAME
+#define	LVM_HD_NAME
 
 /* lots of debugging output (see driver source)
    #define DEBUG_LVM_GET_INFO
@@ -80,20 +86,19 @@
    #define DEBUG_KFREE
  */
 
-#include <linux/version.h>
-
-#ifndef __KERNEL__
-#define ____NOT_KERNEL____
+#include <linux/kdev_t.h>
+#include <linux/list.h>
+#else
 #define __KERNEL__
-#endif
 #include <linux/kdev_t.h>
-#ifdef ____NOT_KERNEL____
-#undef ____NOT_KERNEL____
+#include <linux/list.h>
 #undef __KERNEL__
-#endif
+#endif /* #ifndef __KERNEL__ */
 
+#include <asm/types.h>
 #include <linux/major.h>
 
+#ifdef __KERNEL__
 #if LINUX_VERSION_CODE >= KERNEL_VERSION ( 2, 3 ,0)
 #include <linux/spinlock.h>
 #else
@@ -101,6 +106,8 @@
 #endif
 
 #include <asm/semaphore.h>
+#endif /* #ifdef __KERNEL__ */
+
 #include <asm/page.h>
 
 #if !defined ( LVM_BLK_MAJOR) || !defined ( LVM_CHAR_MAJOR)
@@ -125,7 +132,7 @@
 #define pv_disk_t pv_disk_v1_t
 #define lv_disk_t lv_disk_v1_t
 #define vg_disk_t vg_disk_v1_t
-#define lv_exception_t lv_v2_exception_t
+#define lv_block_exception_t lv_block_exception_v1_t
 #endif
 
 
@@ -220,7 +227,7 @@
                                     LVM_TIMESTAMP_DISK_SIZE)
 
 /* now for the dynamically calculated parts of the VGDA */
-#define	LVM_LV_DISK_OFFSET(a, b) ( (a)->lv_on_disk.base + sizeof ( lv_t) * b)
+#define	LVM_LV_DISK_OFFSET(a, b) ( (a)->lv_on_disk.base + sizeof ( lv_disk_t) * b)
 #define	LVM_DISK_SIZE(pv) 	 ( (pv)->pe_on_disk.base + \
                                    (pv)->pe_on_disk.size)
 #define	LVM_PE_DISK_OFFSET(pe, pv)	( pe * pv->pe_size + \
@@ -386,8 +392,7 @@
     kdev_t rdev_org;
     ulong rsector_new;
     kdev_t rdev_new;
-} lv_block_exception_t;
-
+} lv_block_exception_v1_t;
 
 /* disk stored pe information */
 typedef struct
@@ -597,10 +558,14 @@
     __u32 lv_remap_end;
     __u32 lv_chunk_size;
     __u32 lv_snapshot_minor;
+#ifdef __KERNEL__
     struct kiobuf * lv_iobuf;
     struct semaphore lv_snapshot_sem;
     struct list_head * lv_snapshot_hash_table;
-    unsigned long lv_snapshot_hash_mask;
+    ulong  lv_snapshot_hash_mask;
+#else
+    char  dummy[200];
+#endif
 } lv_v2_t;
 
 /* disk */
