From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] 2.4.13ac5+lvm 1.0.1rc4 can it be done ??
Message-ID: <20011031213857.A8057@tiger.bigcats.invalid>
References: <3BE0350B.5060703@ti.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3BE0350B.5060703@ti.com>; from cej@ti.com on Wed, Oct 31, 2001 at 06:29:47PM +0100
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
Date: Wed Oct 31 15:12:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux lvm <linux-lvm@sistina.com>

Hi, christian!

christian e (cej@ti.com) wrote 73 lines:
> * downloaded 1.0.1rc4 lvm and did a make in PATCHES dir and pacth the 
> kernel getting this:

> Reversed (or previously applied) patch detected!  Assume -R? [n]

> I answer 'n' assuming some of the patch is already in ac5..maybe all of 

yes, this part is already in the ac series.

> * compiling the kernel gives:

> drivers/md/mddev.o: In function `lvm_init':
> drivers/md/mddev.o(.text+0x86): undefined reference to `lvm_init_fs'
> drivers/md/mddev.o(.text+0x9a): undefined reference to `gendisk_head'
> drivers/md/mddev.o(.text+0xd8): undefined reference to `gendisk_head'
> drivers/md/mddev.o: In function `lvm_cleanup':
> drivers/md/mddev.o(.text+0x168): undefined reference to `gendisk_head'
> drivers/md/mddev.o(.text+0x1bc): undefined reference to `lvm_fin_fs'
> drivers/md/mddev.o: In function `lvm_do_vg_create':
> drivers/md/mddev.o(.text+0x1d96): undefined reference to `lvm_fs_create_vg'
> drivers/md/mddev.o: In function `lvm_do_vg_rename':
> drivers/md/mddev.o(.text+0x22ec): undefined reference to `lvm_fs_remove_vg'
> drivers/md/mddev.o(.text+0x2493): undefined reference to `lvm_fs_create_vg'
> drivers/md/mddev.o: In function `lvm_do_vg_remove':
> drivers/md/mddev.o(.text+0x24f9): undefined reference to `lvm_fs_remove_vg'
> drivers/md/mddev.o: In function `lvm_do_pv_create':
> drivers/md/mddev.o(.text+0x2705): undefined reference to `lvm_fs_create_pv'
> drivers/md/mddev.o: In function `lvm_do_pv_remove':
> drivers/md/mddev.o(.text+0x2744): undefined reference to `lvm_fs_remove_pv'
> drivers/md/mddev.o: In function `lvm_do_lv_create':
> drivers/md/mddev.o(.text+0x30b4): undefined reference to `lvm_fs_create_lv'
> drivers/md/mddev.o: In function `lvm_do_lv_remove':
> drivers/md/mddev.o(.text+0x31b3): undefined reference to `lvm_fs_remove_lv'
> drivers/md/mddev.o: In function `lvm_do_lv_rename':
> drivers/md/mddev.o(.text+0x429e): undefined reference to `lvm_fs_remove_lv'
> drivers/md/mddev.o(.text+0x42c1): undefined reference to `lvm_fs_create_lv'
> drivers/md/mddev.o: In function `lvm_snapshot_alloc':

Structure change in the kernel.  This part is in the CVS.

> drivers/md/mddev.o(.text+0x4f2d): undefined reference to `alloc_kiovec'
> drivers/md/mddev.o(.text+0x4f5e): undefined reference to `alloc_kiovec'
> drivers/md/mddev.o(.text+0x4fa5): undefined reference to `free_kiovec'
> drivers/md/mddev.o(.text+0x4fcc): undefined reference to `free_kiovec'
> drivers/md/mddev.o: In function `lvm_snapshot_release':
> drivers/md/mddev.o(.text+0x5073): undefined reference to `free_kiovec'
> drivers/md/mddev.o(.text+0x50aa): undefined reference to `free_kiovec'

And this isn't (different in AC and standard kernels).

Try the following patch:
(apply in top-dir of the kernel with patch -p0 < PATCHFILE
after you patched in LVM)
It should work OKish, it's against 2.4.10, but chances are
this part has not been touched...

Other versions (doing the same) can be found in the list
archive.

--- drivers/md/lvm.c.old	Wed Oct 10 23:18:56 2001
+++ drivers/md/lvm.c	Wed Oct 10 23:24:14 2001
@@ -455,6 +455,8 @@
 	lvm_geninit(&lvm_gendisk);
 
 	/* insert our gendisk@the corresponding major */
+	/* -- old interface, no longer in use!! -- */
+#if 0
 	if (gendisk_head != NULL) {
 		gendisk_ptr = gendisk_head;
 		while (gendisk_ptr->next != NULL &&
@@ -467,6 +469,10 @@
 		gendisk_head = &lvm_gendisk;
 		lvm_gendisk.next = NULL;
 	}
+#endif
+
+	/* new interface */
+	add_gendisk(&lvm_gendisk);	
 
 #ifdef LVM_HD_NAME
 	/* reference from drivers/block/genhd.c */
@@ -509,7 +515,8 @@
 		       lvm_name);
 
 
-
+	/* -- old interface, no longer in use!! */
+#if 0
 	gendisk_ptr = gendisk_ptr_prev = gendisk_head;
 	while (gendisk_ptr != NULL) {
 		if (gendisk_ptr == &lvm_gendisk)
@@ -520,6 +527,10 @@
 	/* delete our gendisk from chain */
 	if (gendisk_ptr == &lvm_gendisk)
 		gendisk_ptr_prev->next = gendisk_ptr->next;
+#endif
+	/* -- new interface -- */
+	del_gendisk(&lvm_gendisk);
+
 
 	blk_size[MAJOR_NR] = NULL;
 	blksize_size[MAJOR_NR] = NULL;
--- drivers/md/lvm-snap.c.old	Wed Oct 10 23:24:36 2001
+++ drivers/md/lvm-snap.c	Wed Oct 10 23:30:29 2001
@@ -55,6 +55,8 @@
 
 static char *lvm_snap_version __attribute__ ((unused)) = "LVM "LVM_RELEASE_NAME" snapshot code ("LVM_RELEASE_DATE")\n";
 
+int kio_max_sectors = KIO_MAX_SECTORS;
+
 
 extern const char *const lvm_name;
 extern int lvm_blocksizes[];
@@ -513,7 +515,7 @@
 	int ret, max_sectors;
 
 	/* allocate kiovec to do chunk io */
-	ret = alloc_kiovec(1, &lv_snap->lv_iobuf);
+	ret = alloc_kiovec_sz(1, &lv_snap->lv_iobuf, &kio_max_sectors);
 	if (ret) goto out;
 
 	max_sectors = KIO_MAX_SECTORS << (PAGE_SHIFT-9);
@@ -522,7 +524,7 @@
 	if (ret) goto out_free_kiovec;
 
 	/* allocate kiovec to do exception table io */
-	ret = alloc_kiovec(1, &lv_snap->lv_COW_table_iobuf);
+	ret = alloc_kiovec_sz(1, &lv_snap->lv_COW_table_iobuf, &kio_max_sectors);
 	if (ret) goto out_free_kiovec;
 
 	ret = lvm_snapshot_alloc_iobuf_pages(lv_snap->lv_COW_table_iobuf,
@@ -538,12 +540,12 @@
 
 out_free_both_kiovecs:
 	unmap_kiobuf(lv_snap->lv_COW_table_iobuf);
-	free_kiovec(1, &lv_snap->lv_COW_table_iobuf);
+	free_kiovec_sz(1, &lv_snap->lv_COW_table_iobuf, &kio_max_sectors);
 	lv_snap->lv_COW_table_iobuf = NULL;
 
 out_free_kiovec:
 	unmap_kiobuf(lv_snap->lv_iobuf);
-	free_kiovec(1, &lv_snap->lv_iobuf);
+	free_kiovec_sz(1, &lv_snap->lv_iobuf, &kio_max_sectors);
 	lv_snap->lv_iobuf = NULL;
 	if (lv_snap->lv_snapshot_hash_table != NULL)
 		vfree(lv_snap->lv_snapshot_hash_table);
@@ -568,14 +570,14 @@
 	{
 	        kiobuf_wait_for_io(lv->lv_iobuf);
 		unmap_kiobuf(lv->lv_iobuf);
-		free_kiovec(1, &lv->lv_iobuf);
+		free_kiovec_sz(1, &lv->lv_iobuf, &kio_max_sectors);
 		lv->lv_iobuf = NULL;
 	}
 	if (lv->lv_COW_table_iobuf)
 	{
 	        kiobuf_wait_for_io(lv->lv_COW_table_iobuf);
 		unmap_kiobuf(lv->lv_COW_table_iobuf);
-		free_kiovec(1, &lv->lv_COW_table_iobuf);
+		free_kiovec_sz(1, &lv->lv_COW_table_iobuf, &kio_max_sectors);
 		lv->lv_COW_table_iobuf = NULL;
 	}
 }


-Wolfgang
