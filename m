Return-Path: <jamesp@foobarhouse.com>
Date: Thu, 16 Aug 2001 22:40:52 +0100 (BST)
From: James Pattinson <jamesp@foobarhouse.com>
Message-ID: <Pine.LNX.4.33.0108162238310.5208-100000@greebo.foobarhouse.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH] LVM 1.0 & Linux 2.4.9
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@Sistina.com

Hi!

Another day, another kernel to compile! But after applying LVM 1.0 to
2.4.9 this evening, I found it didn't compile. It's to do with a mismatch
between the max and min macros in the kernel and in LVM. Here's a patch to
make things work:

diff -u --recursive 1.0.clean/kernel/lvm-snap.c 1.0/kernel/lvm-snap.c
--- 1.0.clean/kernel/lvm-snap.c	Wed Jun 27 13:03:09 2001
+++ 1.0/kernel/lvm-snap.c	Thu Aug 16 22:30:07 2001
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
+	buckets = min(int, buckets, max_buckets);
 	while (buckets & (buckets-1))
 		buckets &= (buckets-1);

diff -u --recursive 1.0.clean/kernel/lvm.c 1.0/kernel/lvm.c
--- 1.0.clean/kernel/lvm.c	Fri Jul 13 12:40:42 2001
+++ 1.0/kernel/lvm.c	Thu Aug 16 22:30:23 2001
@@ -2452,7 +2452,7 @@

 	/* save availiable i/o statistic data */
 	if (old_lv->lv_stripes < 2) {	/* linear logical volume */
-		end = min(old_lv->lv_current_le, new_lv->lv_current_le);
+		end = min(int, old_lv->lv_current_le, new_lv->lv_current_le);
 		for (l = 0; l < end; l++) {
 			new_lv->lv_current_pe[l].reads +=
 				old_lv->lv_current_pe[l].reads;
@@ -2466,7 +2466,7 @@

 		old_stripe_size = old_lv->lv_allocated_le / old_lv->lv_stripes;
 		new_stripe_size = new_lv->lv_allocated_le / new_lv->lv_stripes;
-		end = min(old_stripe_size, new_stripe_size);
+		end = min(int, old_stripe_size, new_stripe_size);

 		for (i = source = dest = 0; i < new_lv->lv_stripes; i++) {
 			for (j = 0; j < end; j++) {

Have fun!

James

PS I aint no kernel hacker, use@your own risk but it works for me :)
