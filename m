Date: Mon, 9 Aug 1999 14:52:33 -0500 (CDT)
From: David Teigland <teigland@lcse.umn.edu>
Subject: [linux-lvm] PATCH: volume drivers in ll_rw_block
Message-ID: <Pine.LNX.4.10.9908091418060.9796-100000@orinoco.lcse.umn.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-raid@vger.rutgers.edu
Cc: linux-lvm@msede.com, gfs-devel@lcse.umn.edu

I believe a change is needed in the way ll_rw_block() handles volume
drivers.  Currently, each volume driver requires a separate chunk of code
to handle its own mapping function.  As more volume drivers are used (MD,
LVM and GFS' Pool), ll_rw_block gets long and messy.  (See the combination
of MD and LVM in 2.2.10-ac12).  This can be simplified by having all
drivers use a single function pointer to call a previously assigned
mapping or make_request function.

This patch adds the function pointers map_fn and makerq_fn to the blk_dev
structure and uses them like request_fn.  If a block driver sets either of
these pointers in its init routine, the specific map or makerq function
will be called from ll_rw_block.

This eliminates repetitious driver-specific code and provides a clean way
to make MD, LVM and Pool modular.  MD devices can currently be used within
LVM, but this patch, in a general sense, imposes no limit on the number or
order in which volumes are built on one another.

Unaddressed by this method is more than one stacked volume driver using
makerq_fn.  If stacking volume drivers, only the bottom one can use a
make_request function.

The patch below to 2.2.10+raid0145 implements the generic mapping. Two
other patches can be found at ftp://globalfilesystem.org/pub/GFS/patches/

 - modular_md-2.2.10 adds module support for MD using this method.
 - lvm_map-0.7 allows LVM to be used with generic_map.


David Teigland


--------------------Cut Here---------------- generic_map-2.2.10-raid

diff -urN linux-raid-1/drivers/block/ll_rw_blk.c linux-raid-2/drivers/block/ll_rw_blk.c
--- linux-raid-1/drivers/block/ll_rw_blk.c	Mon Aug 16 14:42:42 1999
+++ linux-raid-2/drivers/block/ll_rw_blk.c	Mon Aug 16 14:46:08 1999
@@ -578,7 +578,7 @@
 {
 	unsigned int major;
 	int correct_size;
-	struct blk_dev_struct * dev;
+	struct blk_dev_struct * dev, * tdev = NULL;
 	int i;
 
 	/* Make sure that the first block contains something reasonable */
@@ -608,7 +608,10 @@
 
 	/* Verify requested block sizes.  */
 	for (i = 0; i < nr; i++) {
-		if (bh[i] && bh[i]->b_size != correct_size) {
+	        if (!bh[i])
+		        continue;
+
+		if (bh[i]->b_size != correct_size) {
 			printk(KERN_NOTICE "ll_rw_block: device %s: "
 			       "only %d-char blocks implemented (%lu)\n",
 			       kdevname(bh[0]->b_dev),
@@ -619,15 +622,17 @@
 		/* Md remaps blocks now */
 		bh[i]->b_rdev = bh[i]->b_dev;
 		bh[i]->b_rsector=bh[i]->b_blocknr*(bh[i]->b_size >> 9);
-#ifdef CONFIG_BLK_DEV_MD
-		if (major==MD_MAJOR &&
-			md_map (bh[i]->b_dev, &bh[i]->b_rdev,
-			    &bh[i]->b_rsector, bh[i]->b_size >> 9)) {
-		        printk (KERN_ERR
-				"Bad md_map in ll_rw_block\n");
-		        goto sorry;
-		}
-#endif
+
+               tdev = dev;
+               while (tdev->map_fn) {
+                       if (tdev->map_fn (bh[i]->b_rdev, &bh[i]->b_rdev,
+                                         &bh[i]->b_rsector,
+                                         bh[i]->b_size >> 9)) {
+                              printk (KERN_ERR "Bad map in ll_rw_block\n");
+                              goto sorry;
+                       }
+                       tdev = blk_dev + MAJOR(bh[i]->b_rdev);
+               }	       
 	}
 
 	if ((rw == WRITE || rw == WRITEA) && is_read_only(bh[0]->b_dev)) {
@@ -639,12 +644,10 @@
 	for (i = 0; i < nr; i++) {
 		if (bh[i]) {
 			set_bit(BH_Req, &bh[i]->b_state);
-#ifdef CONFIG_BLK_DEV_MD
-			if (MAJOR(bh[i]->b_dev) == MD_MAJOR) {
-				md_make_request(bh[i], rw);
-				continue;
-			}
-#endif
+                       if (tdev->makerq_fn) {
+                               tdev->makerq_fn (bh[i], rw);
+                               continue;
+                       }
 			make_request(MAJOR(bh[i]->b_rdev), rw, bh[i]);
 		}
 	}
@@ -724,6 +727,8 @@
 
 	for (dev = blk_dev + MAX_BLKDEV; dev-- != blk_dev;) {
 		dev->request_fn      = NULL;
+               dev->map_fn          = NULL;
+               dev->makerq_fn       = NULL;
 		dev->queue           = NULL;
 		dev->current_request = NULL;
 		dev->plug.rq_status  = RQ_INACTIVE;
diff -urN linux-raid-1/drivers/block/md.c linux-raid-2/drivers/block/md.c
--- linux-raid-1/drivers/block/md.c	Mon Aug 16 14:42:42 1999
+++ linux-raid-2/drivers/block/md.c	Mon Aug 16 14:43:15 1999
@@ -3894,6 +3894,8 @@
 	}
 
 	blk_dev[MD_MAJOR].request_fn = DEVICE_REQUEST;
+       blk_dev[MD_MAJOR].makerq_fn=md_make_request;
+       blk_dev[MD_MAJOR].map_fn=md_map;
 	blk_dev[MD_MAJOR].current_request = NULL;
 	read_ahead[MD_MAJOR] = INT_MAX;
 	md_gendisk.next = gendisk_head;
diff -urN linux-raid-1/include/linux/blkdev.h linux-raid-2/include/linux/blkdev.h
--- linux-raid-1/include/linux/blkdev.h	Mon Aug 16 14:42:42 1999
+++ linux-raid-2/include/linux/blkdev.h	Mon Aug 16 14:46:53 1999
@@ -34,10 +34,14 @@
 };
 
 typedef void (request_fn_proc) (void);
+typedef int (makerq_fn_proc) (struct buffer_head *, int rw);
+typedef int (map_fn_proc) (kdev_t, kdev_t *, unsigned long *, unsigned long);
 typedef struct request ** (queue_proc) (kdev_t dev);
 
 struct blk_dev_struct {
 	request_fn_proc		*request_fn;
+       makerq_fn_proc          *makerq_fn;
+       map_fn_proc             *map_fn;
 	/*
 	 * queue_proc has to be atomic
 	 */
