From: Patrick Caulfield <caulfield@sistina.com>
Message-ID: <20011112130101.A11020@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [PATCH] lvm in 2.4.15.pre3
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
Date: Mon Nov 12 06:59:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-lvm@sistina.com
Cc: torvalds@transmeta.com

Please apply the following patch to LVM in 2.4.13pre3.

It looks like the LVM patch that came from Alan calls alloc/free_kiovec_sz()
functions which only exist in his tree.

patrick

--- drivers/md/lvm-snap.c.orig	Mon Nov 12 12:53:01 2001
+++ drivers/md/lvm-snap.c	Mon Nov 12 12:53:47 2001
@@ -500,10 +500,9 @@
 int lvm_snapshot_alloc(lv_t * lv_snap)
 {
 	int ret, max_sectors;
-	int nbhs = KIO_MAX_SECTORS;
 
 	/* allocate kiovec to do chunk io */
-	ret = alloc_kiovec_sz(1, &lv_snap->lv_iobuf, &nbhs);
+	ret = alloc_kiovec(1, &lv_snap->lv_iobuf);
 	if (ret) goto out;
 
 	max_sectors = KIO_MAX_SECTORS << (PAGE_SHIFT-9);
@@ -512,7 +511,7 @@
 	if (ret) goto out_free_kiovec;
 
 	/* allocate kiovec to do exception table io */
-	ret = alloc_kiovec_sz(1, &lv_snap->lv_COW_table_iobuf, &nbhs);
+	ret = alloc_kiovec(1, &lv_snap->lv_COW_table_iobuf);
 	if (ret) goto out_free_kiovec;
 
 	ret = lvm_snapshot_alloc_iobuf_pages(lv_snap->lv_COW_table_iobuf,
@@ -528,12 +527,12 @@
 
 out_free_both_kiovecs:
 	unmap_kiobuf(lv_snap->lv_COW_table_iobuf);
-	free_kiovec_sz(1, &lv_snap->lv_COW_table_iobuf, &nbhs);
+	free_kiovec(1, &lv_snap->lv_COW_table_iobuf);
 	lv_snap->lv_COW_table_iobuf = NULL;
 
 out_free_kiovec:
 	unmap_kiobuf(lv_snap->lv_iobuf);
-	free_kiovec_sz(1, &lv_snap->lv_iobuf, &nbhs);
+	free_kiovec(1, &lv_snap->lv_iobuf);
 	lv_snap->lv_iobuf = NULL;
 	if (lv_snap->lv_snapshot_hash_table != NULL)
 		vfree(lv_snap->lv_snapshot_hash_table);
@@ -543,8 +542,6 @@
 
 void lvm_snapshot_release(lv_t * lv)
 {
-	int 	nbhs = KIO_MAX_SECTORS;
-
 	if (lv->lv_block_exception)
 	{
 		vfree(lv->lv_block_exception);
@@ -560,14 +557,14 @@
 	{
 	        kiobuf_wait_for_io(lv->lv_iobuf);
 		unmap_kiobuf(lv->lv_iobuf);
-		free_kiovec_sz(1, &lv->lv_iobuf, &nbhs);
+		free_kiovec(1, &lv->lv_iobuf);
 		lv->lv_iobuf = NULL;
 	}
 	if (lv->lv_COW_table_iobuf)
 	{
                kiobuf_wait_for_io(lv->lv_COW_table_iobuf);
                unmap_kiobuf(lv->lv_COW_table_iobuf);
-               free_kiovec_sz(1, &lv->lv_COW_table_iobuf, &nbhs);
+               free_kiovec(1, &lv->lv_COW_table_iobuf);
                lv->lv_COW_table_iobuf = NULL;
 	}
 }
