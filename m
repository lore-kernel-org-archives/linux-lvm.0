Return-Path: <thornber@btconnect.com>
Date: Fri, 17 Aug 2001 11:25:28 +0100
Subject: Re: [linux-lvm] [PATCH] LVM 1.0 & Linux 2.4.9
Message-ID: <20010817112527.C450@btconnect.com>
References: <Pine.LNX.4.33.0108162238310.5208-100000@greebo.foobarhouse.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0108162238310.5208-100000@greebo.foobarhouse.com>; from jamesp@foobarhouse.com on Thu, Aug 16, 2001 at 10:40:52PM +0100
From: Joe Thornber <thornber@btconnect.com>
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

On Thu, Aug 16, 2001 at 10:40:52PM +0100, James Pattinson wrote:
> Hi!
> 
> Another day, another kernel to compile! But after applying LVM 1.0 to
> 2.4.9 this evening, I found it didn't compile. It's to do with a mismatch
> between the max and min macros in the kernel and in LVM. Here's a patch to
> make things work:

This is what I've checked in, just a few changes to ensure we still work
with older kernels.

- Joe

--- kernel/lvm-internal.h	2001/07/10 13:19:25	1.5
+++ kernel/lvm-internal.h	2001/08/17 10:21:19
@@ -53,6 +53,12 @@
 extern struct block_device_operations lvm_blk_dops;
 #endif
 
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 4, 9)
+#undef min
+#undef max
+#define min(type, a, b) (((a) < (b)) ? (a) : (b))
+#define max(type, a, b) (((a) > (b)) ? (a) : (b))
+#endif
 
 /* debug macros */
 #ifdef DEBUG_IOCTL
--- kernel/lvm-snap.c	2001/06/27 12:03:09	1.5
+++ kernel/lvm-snap.c	2001/08/17 10:21:20
@@ -373,8 +373,8 @@
 
 	blksize_org = lvm_get_blksize(org_phys_dev);
 	blksize_snap = lvm_get_blksize(snap_phys_dev);
-	max_blksize = max(blksize_org, blksize_snap);
-	min_blksize = min(blksize_org, blksize_snap);
+	max_blksize = max(int, blksize_org, blksize_snap);
+	min_blksize = min(int, blksize_org, blksize_snap);
 	max_sectors = KIO_MAX_SECTORS * (min_blksize>>9);
 
 	if (chunk_size % (max_blksize>>9))
@@ -382,7 +382,7 @@
 
 	while (chunk_size)
 	{
-		nr_sectors = min(chunk_size, max_sectors);
+		nr_sectors = min(int, chunk_size, max_sectors);
 		chunk_size -= nr_sectors;
 
 		iobuf->length = nr_sectors << 9;
@@ -508,7 +508,7 @@
 
 	buckets = lv->lv_remap_end;
 	max_buckets = calc_max_buckets();
-	buckets = min(buckets, max_buckets);
+	buckets = min(unsigned long, buckets, max_buckets);
 	while (buckets & (buckets-1))
 		buckets &= (buckets-1);
 
--- kernel/lvm.c	2001/07/13 11:40:42	1.39
+++ kernel/lvm.c	2001/08/17 10:21:24
@@ -2452,7 +2452,7 @@
 
 	/* save availiable i/o statistic data */
 	if (old_lv->lv_stripes < 2) {	/* linear logical volume */
-		end = min(old_lv->lv_current_le, new_lv->lv_current_le);
+		end = min(uint, old_lv->lv_current_le, new_lv->lv_current_le);
 		for (l = 0; l < end; l++) {
 			new_lv->lv_current_pe[l].reads +=
 				old_lv->lv_current_pe[l].reads;
@@ -2466,7 +2466,7 @@
 
 		old_stripe_size = old_lv->lv_allocated_le / old_lv->lv_stripes;
 		new_stripe_size = new_lv->lv_allocated_le / new_lv->lv_stripes;
-		end = min(old_stripe_size, new_stripe_size);
+		end = min(uint, old_stripe_size, new_stripe_size);
 
 		for (i = source = dest = 0; i < new_lv->lv_stripes; i++) {
 			for (j = 0; j < end; j++) {

--- kernel/lvm.h	2001/08/16 14:31:45	1.25
+++ kernel/lvm.h	2001/08/17 10:21:25
@@ -165,14 +165,6 @@
 
 #define	LVM_DIR_PREFIX	"/dev/"
 
-#ifndef min
-#define min(a,b) (((a)<(b))?(a):(b))
-#endif
-#ifndef max
-#define max(a,b) (((a)>(b))?(a):(b))
-#endif
-
-
 /*
  * i/o protocol version
  *


--- tools/lib/pv_read_uuidlist.c	2001/04/24 14:29:21	1.4
+++ tools/lib/pv_read_uuidlist.c	2001/08/17 10:21:25
@@ -74,7 +74,10 @@
       goto pv_read_uuidlist_end;
    }
 
-   num = min(pv->pv_uuidlist_on_disk.size, LIST_SIZE);
+   num = pv->pv_uuidlist_on_disk.size;
+   if (LIST_SIZE < num)
+	   num = LIST_SIZE;
+
    if (read(pv_handle, this_pv_uuidlist, num) != num) {
       ret = -LVM_EPV_READ_UUIDLIST_READ;
       goto pv_read_uuidlist_end;
