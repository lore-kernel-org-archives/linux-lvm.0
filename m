Date: Sat, 6 Oct 2001 13:01:47 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Message-ID: <20011006130147.C31614@lug-owl.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Removing direct access to gendisk_head
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

Hi!

I'm currently looking over kernel code (for cleaning-up purposes)
and removed EXPORT_SYMBOL(gendisk_head) which was a no-no for
current LVM kernel code. Please think about picking up this patch

	- Named struct initializers
	- Removing direct use of gendisk_head

There's an open Q: Do we need to nullify ->real_devices and ->next?
I don't think so (but I am unsure) so please remove these two lines
upon your oppinion:-)

MfG, JBG


--- lvm.c.orig	Sat Oct  6 11:19:40 2001
+++ lvm.c	Sat Oct  6 12:48:27 2001
@@ -414,17 +414,17 @@
 
 static struct gendisk lvm_gendisk =
 {
-	MAJOR_NR,		/* major # */
-	LVM_NAME,		/* name of major */
-	0,			/* number of times minor is shifted
-				   to get real minor */
-	1,			/* maximum partitions per device */
-	lvm_hd_struct,		/* partition table */
-	lvm_size,		/* device size in blocks, copied
-				   to block_size[] */
-	MAX_LV,			/* number or real devices */
-	NULL,			/* internal */
-	NULL,			/* pointer to next gendisk struct (internal) */
+	major:		MAJOR_NR,		/* major number */
+	major_name:	LVM_NAME,		/* name of major */
+	minor_shift:	0,			/* number of times minor is shifted
+						   to get real minor */
+	max_p:		1,			/* maximum partitions per device */
+	part:		lvm_hd_struct,		/* partition table */
+	sizes:		lvm_size,		/* device size in blocks, copied
+						   to block_size[] */
+	nr_real:	MAX_LV,			/* number or real devices */
+	real_devices:	NULL,			/* internal */
+	next:		NULL,			/* pointer to next gendisk struct (internal) */
 };
 
 /*
@@ -454,19 +454,8 @@
 	lvm_init_vars();
 	lvm_geninit(&lvm_gendisk);
 
-	/* insert our gendisk at the corresponding major */
-	if (gendisk_head != NULL) {
-		gendisk_ptr = gendisk_head;
-		while (gendisk_ptr->next != NULL &&
-		       gendisk_ptr->major > lvm_gendisk.major) {
-			gendisk_ptr = gendisk_ptr->next;
-		}
-		lvm_gendisk.next = gendisk_ptr->next;
-		gendisk_ptr->next = &lvm_gendisk;
-	} else {
-		gendisk_head = &lvm_gendisk;
-		lvm_gendisk.next = NULL;
-	}
+	/* insert our gendisk */
+	add_gendisk(&lvm_gendisk);
 
 #ifdef LVM_HD_NAME
 	/* reference from drivers/block/genhd.c */
@@ -508,18 +497,8 @@
 		printk(KERN_ERR "%s -- devfs_unregister_blkdev failed\n",
 		       lvm_name);
 
-
-
-	gendisk_ptr = gendisk_ptr_prev = gendisk_head;
-	while (gendisk_ptr != NULL) {
-		if (gendisk_ptr == &lvm_gendisk)
-			break;
-		gendisk_ptr_prev = gendisk_ptr;
-		gendisk_ptr = gendisk_ptr->next;
-	}
 	/* delete our gendisk from chain */
-	if (gendisk_ptr == &lvm_gendisk)
-		gendisk_ptr_prev->next = gendisk_ptr->next;
+	del_gendisk(&lvm_gendisk);
 
 	blk_size[MAJOR_NR] = NULL;
 	blksize_size[MAJOR_NR] = NULL;
-- 
Jan-Benedict Glaw . jbglaw@lug-owl.de . +49-172-7608481
