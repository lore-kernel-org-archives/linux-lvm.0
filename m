Message-ID: <3E63C91A.9030803@mac.com>
From: "Dale J. Stephenson" <dalestephenson@mac.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot resizing memory leak
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
Date: Mon Mar  3 12:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

It looks like the current lvm code still has the memory leak when 
resizing snapshots.  The lv_block_exception and lv_snapshot_hash_table 
fields are set to ones newly allocated for the new size, but the old 
ones are not freed.  The following patch should fix it:

--- linux/drivers/md/lvm.c.orig	Thu Mar 14 08:21:16 2002
+++ linux/drivers/md/lvm.c	Thu Mar 14 08:23:07 2002
@@ -2489,6 +2489,8 @@
 		memcpy(new_lv->lv_block_exception,
 		       old_lv->lv_block_exception, size);
 
+		vfree(old_lv->lv_block_exception);
+		vfree(old_lv->lv_snapshot_hash_table);
 		old_lv->lv_remap_end = new_lv->lv_remap_end;
 		old_lv->lv_block_exception = new_lv->lv_block_exception;
 		old_lv->lv_snapshot_hash_table =
