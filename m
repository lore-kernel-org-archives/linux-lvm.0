Message-ID: <390EA677.863F82E1@msede.com>
Date: Tue, 02 May 2000 11:57:11 +0200
From: Michael Marxmeier <mike@msede.com>
Reply-To: chhellwig@gmx.net
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH] devfs support for lvm
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message from Christoph Hellwig <chhellwig@gmx.net> ...

-------- Original Message --------
Date: Mon, 1 May 2000 14:53:57 +0200
From: Christoph Hellwig <chhellwig@gmx.net>
Subject: [PATCH] devfs support for lvm
Message-ID: <20000501145357.A434@sb.t-online.de>

Hi,
I've adapted lvm to create it's devices files automatically using devfs
(if enabled ...). If you use the vanilla utils nothing changes.

If you use a vgchange that has the code removing and creating the nodes
ifdef'ed out (and don't run vgscan on each boot), you don't have to mount
your root partition rw for lvm.

Christoph

-- 
Always remember that you are unique.  Just like everyone else.


diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/block/lvm.c linux/drivers/block/lvm.c
--- linux.orig/drivers/block/lvm.c	Mon May  1 10:34:24 2000
+++ linux/drivers/block/lvm.c	Mon May  1 14:22:09 2000
@@ -123,6 +123,7 @@
  *               - avoided inline strings functions lvm_strlen etc.
  *    14/02/2000 - support for 2.3.43
  *               - integrated Andrea Arcagnelli's snapshot code
+ *    01/05/2000 - added devfs support (Christoph Hellwig)
  *
  */
 
@@ -300,6 +301,11 @@
 static spinlock_t lvm_lock = SPIN_LOCK_UNLOCKED;
 static spinlock_t lvm_snapshot_lock = SPIN_LOCK_UNLOCKED;
 
+static devfs_handle_t lvm_devfs_handle;
+static devfs_handle_t vg_devfs_handle[MAX_VG];
+static devfs_handle_t ch_devfs_handle[MAX_VG];
+static devfs_handle_t lv_devfs_handle[MAX_LV];
+
 static struct file_operations lvm_chr_fops =
 {
 	open:		lvm_chr_open,
@@ -366,21 +372,22 @@
 {
 	struct gendisk *gendisk_ptr = NULL;
 
-	if (register_chrdev(LVM_CHAR_MAJOR, lvm_name, &lvm_chr_fops) < 0) {
+	if (devfs_register_chrdev(LVM_CHAR_MAJOR, lvm_name, &lvm_chr_fops) < 0) {
 		printk(KERN_ERR "%s -- register_chrdev failed\n", lvm_name);
 		return -EIO;
 	}
-#ifdef BLOCK_DEVICE_OPERATIONS
-	if (register_blkdev(MAJOR_NR, lvm_name, &lvm_blk_dops) < 0)
-#else
-	if (register_blkdev(MAJOR_NR, lvm_name, &lvm_blk_fops) < 0)
-#endif
-	{
+	if (devfs_register_blkdev(MAJOR_NR, lvm_name, &lvm_blk_dops) < 0) {
 		printk("%s -- register_blkdev failed\n", lvm_name);
-		if (unregister_chrdev(LVM_CHAR_MAJOR, lvm_name) < 0)
+		if (devfs_unregister_chrdev(LVM_CHAR_MAJOR, lvm_name) < 0)
 			printk(KERN_ERR "%s -- unregister_chrdev failed\n", lvm_name);
 		return -EIO;
 	}
+	
+	lvm_devfs_handle = devfs_register(
+		0 , "lvm", 0, 0, LVM_CHAR_MAJOR, 0,
+		S_IFCHR | S_IRUSR | S_IWUSR | S_IRGRP,
+		0, 0, &lvm_chr_fops, NULL);
+
 #if defined CONFIG_LVM_PROC_FS && defined CONFIG_PROC_FS
 	create_proc_info_entry(LVM_NAME, S_IFREG | S_IRUGO,
 			       &proc_root, lvm_proc_get_info_ptr);
@@ -437,10 +444,12 @@
 {
 	struct gendisk *gendisk_ptr = NULL, *gendisk_ptr_prev = NULL;
 
-	if (unregister_chrdev(LVM_CHAR_MAJOR, lvm_name) < 0) {
+	devfs_unregister (lvm_devfs_handle);
+
+	if (devfs_unregister_chrdev(LVM_CHAR_MAJOR, lvm_name) < 0) {
 		printk(KERN_ERR "%s -- unregister_chrdev failed\n", lvm_name);
 	}
-	if (unregister_blkdev(MAJOR_NR, lvm_name) < 0) {
+	if (devfs_unregister_blkdev(MAJOR_NR, lvm_name) < 0) {
 		printk(KERN_ERR "%s -- unregister_blkdev failed\n", lvm_name);
 	}
 	blk_cleanup_queue(BLK_DEFAULT_QUEUE(MAJOR_NR));
@@ -1657,6 +1666,14 @@
 		kfree(vg_ptr);
 		return -EFAULT;
 	}
+
+	vg_devfs_handle[vg_ptr->vg_number] = devfs_mk_dir(0, vg_ptr->vg_name, 0, NULL);
+	ch_devfs_handle[vg_ptr->vg_number] = devfs_register(
+		vg_devfs_handle[vg_ptr->vg_number] , "group", 0,
+		DEVFS_FL_DEFAULT, LVM_CHAR_MAJOR, vg_ptr->vg_number,
+		S_IFCHR | S_IRUSR | S_IWUSR | S_IRGRP,
+		0, 0, &lvm_chr_fops, NULL);
+
 	/* we are not that active so far... */
 	vg_ptr->vg_status &= ~VG_ACTIVE;
 	vg[VG_CHR(minor)] = vg_ptr;
@@ -1884,6 +1901,9 @@
 	/* let's go inactive */
 	vg_ptr->vg_status &= ~VG_ACTIVE;
 
+	devfs_unregister (ch_devfs_handle[vg_ptr->vg_number]);
+	devfs_unregister (vg_devfs_handle[vg_ptr->vg_number]);
+
 	/* free LVs */
 	/* first free snapshot logical volumes */
 	for (i = 0; i < vg_ptr->lv_max; i++) {
@@ -1938,6 +1958,7 @@
 static int lvm_do_lv_create(int minor, char *lv_name, lv_t *lv)
 {
 	int l, le, l_new, p, size;
+	char *lv_buf = kmalloc(sizeof(char) * NAME_LEN, GFP_KERNEL);
 	ulong lv_status_save;
 	lv_block_exception_t *lvbe = lv->lv_block_exception;
 	vg_t *vg_ptr = vg[VG_CHR(minor)];
@@ -2094,6 +2115,16 @@
 	vg_ptr->lv_cur++;
 	lv_ptr->lv_status = lv_status_save;
 
+	strtok(lv->lv_name, "/");	/* /dev */
+	strtok(NULL, "/");		/* vg */
+	lv_buf = strtok(NULL, "/");	/* lv */
+
+	lv_devfs_handle[lv->lv_number] = devfs_register(
+		vg_devfs_handle[vg_ptr->vg_number], lv_buf, 0,
+		DEVFS_FL_DEFAULT, LVM_BLK_MAJOR, lv->lv_number,
+		S_IFBLK | S_IRUSR | S_IWUSR | S_IRGRP,
+		0, 0, &lvm_blk_dops, NULL);
+
 	/* optionally add our new snapshot LV */
 	if (lv_ptr->lv_access & LV_SNAPSHOT) {
 		/* sync the original logical volume */
@@ -2185,6 +2216,8 @@
 			lv_ptr->lv_snapshot_org->lv_access &= ~LV_SNAPSHOT_ORG;
 		lvm_snapshot_release(lv_ptr);
 	}
+
+	devfs_unregister(lv_devfs_handle[lv_ptr->lv_number]);
 
 #ifdef DEBUG_KFREE
 	printk(KERN_DEBUG "%s -- kfree %d\n", lvm_name, __LINE__);
