Date: Fri, 12 Oct 2001 17:20:43 +1300
From: Mark van Walraven <markv@wave.co.nz>
Subject: Re: [linux-lvm] Patch for lvm-1.0.1-rc4 to work under linux-2.4.10-ac4 (Re-edition)
Message-ID: <20011012172043.A21539@mail.wave.co.nz>
References: <200110032244.TAA06029@inter.lojasrenner.com.br>
Mime-Version: 1.0
In-Reply-To: <200110032244.TAA06029@inter.lojasrenner.com.br>; from Andre Margis on Wed, Oct 03, 2001 at 07:40:00PM -0300
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

On Wed, Oct 03, 2001 at 07:40:00PM -0300, Andre Margis wrote:
> I change two programs to run under linux.2.4.10-ac4

The first set is functionally identical to the changes made to lvm.c
in Christoph Hellwig's gendisk clean-up.  By the looks of things, these
changes have been made in both the Linus and ac kernels.

The changes you made to lvm_snap.c are also similar to changes to the
LVM in the ac kernels, but do not appear in the Linus kernel.

For the convenience of the list and the developers, I've included unified
diffs below.

> My changes are correct?

I think so.  The danger is that other critical changes in the LVM code
in the ac kernels have not also been made in 1.0.1-rc4. I hope the
developers can have a look.

Developers, is there much progress in feeding LVM 1.0.x to Alan?

Regards,

Mark.

--- LVM/1.0.1-rc4/PATCHES/cleaned/lvm.c	Fri Oct 12 11:30:15 2001
+++ linux-2.4.10-ac11/drivers/md/lvm.c	Fri Oct 12 15:34:30 2001
@@ -432,8 +432,6 @@
  */
 int lvm_init(void)
 {
-	struct gendisk *gendisk_ptr = NULL;
-
 	if (devfs_register_chrdev(LVM_CHAR_MAJOR,
 				  lvm_name, &lvm_chr_fops) < 0) {
 		printk(KERN_ERR "%s -- devfs_register_chrdev failed\n",
@@ -453,20 +451,7 @@
 	lvm_init_fs();
 	lvm_init_vars();
 	lvm_geninit(&lvm_gendisk);
-
-	/* insert our gendisk@the corresponding major */
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
+	add_gendisk(&lvm_gendisk);
 
 #ifdef LVM_HD_NAME
 	/* reference from drivers/block/genhd.c */
@@ -499,8 +484,6 @@
 
 static void lvm_cleanup(void)
 {
-	struct gendisk *gendisk_ptr = NULL, *gendisk_ptr_prev = NULL;
-
 	if (devfs_unregister_chrdev(LVM_CHAR_MAJOR, lvm_name) < 0)
 		printk(KERN_ERR "%s -- devfs_unregister_chrdev failed\n",
 		       lvm_name);
@@ -508,18 +491,7 @@
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
-	/* delete our gendisk from chain */
-	if (gendisk_ptr == &lvm_gendisk)
-		gendisk_ptr_prev->next = gendisk_ptr->next;
+	del_gendisk(&lvm_gendisk);
 
 	blk_size[MAJOR_NR] = NULL;
 	blksize_size[MAJOR_NR] = NULL;
--- LVM/1.0.1-rc4/PATCHES/cleaned/lvm-snap.c	Fri Oct 12 11:30:15 2001
+++ linux-2.4.10-ac11/drivers/md/lvm-snap.c	Fri Oct 12 17:09:56 2001
@@ -511,9 +511,10 @@
 int lvm_snapshot_alloc(lv_t * lv_snap)
 {
 	int ret, max_sectors;
+       int nbhs = KIO_MAX_SECTORS;
 
 	/* allocate kiovec to do chunk io */
-	ret = alloc_kiovec(1, &lv_snap->lv_iobuf);
+       ret = alloc_kiovec_sz(1, &lv_snap->lv_iobuf, &nbhs);
 	if (ret) goto out;
 
 	max_sectors = KIO_MAX_SECTORS << (PAGE_SHIFT-9);
@@ -522,7 +523,7 @@
 	if (ret) goto out_free_kiovec;
 
 	/* allocate kiovec to do exception table io */
-	ret = alloc_kiovec(1, &lv_snap->lv_COW_table_iobuf);
+       ret = alloc_kiovec_sz(1, &lv_snap->lv_COW_table_iobuf, &nbhs);
 	if (ret) goto out_free_kiovec;
 
 	ret = lvm_snapshot_alloc_iobuf_pages(lv_snap->lv_COW_table_iobuf,
@@ -538,12 +539,12 @@
 
 out_free_both_kiovecs:
 	unmap_kiobuf(lv_snap->lv_COW_table_iobuf);
-	free_kiovec(1, &lv_snap->lv_COW_table_iobuf);
+	free_kiovec_sz(1, &lv_snap->lv_COW_table_iobuf, &nbhs);
 	lv_snap->lv_COW_table_iobuf = NULL;
 
 out_free_kiovec:
 	unmap_kiobuf(lv_snap->lv_iobuf);
-	free_kiovec(1, &lv_snap->lv_iobuf);
+	free_kiovec_sz(1, &lv_snap->lv_iobuf, &nbhs);
 	lv_snap->lv_iobuf = NULL;
 	if (lv_snap->lv_snapshot_hash_table != NULL)
 		vfree(lv_snap->lv_snapshot_hash_table);
@@ -553,6 +554,8 @@
 
 void lvm_snapshot_release(lv_t * lv)
 {
+	int 	nbhs = KIO_MAX_SECTORS;
+
 	if (lv->lv_block_exception)
 	{
 		vfree(lv->lv_block_exception);
@@ -568,14 +571,14 @@
 	{
 	        kiobuf_wait_for_io(lv->lv_iobuf);
 		unmap_kiobuf(lv->lv_iobuf);
-		free_kiovec(1, &lv->lv_iobuf);
+		free_kiovec_sz(1, &lv->lv_iobuf, &nbhs);
 		lv->lv_iobuf = NULL;
 	}
 	if (lv->lv_COW_table_iobuf)
 	{
 	        kiobuf_wait_for_io(lv->lv_COW_table_iobuf);
 		unmap_kiobuf(lv->lv_COW_table_iobuf);
-		free_kiovec(1, &lv->lv_COW_table_iobuf);
+               free_kiovec_sz(1, &lv->lv_COW_table_iobuf, &nbhs);
 		lv->lv_COW_table_iobuf = NULL;
 	}
 }
