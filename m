Message-Id: <2D0AFEFEE711D611923E009027D39F2B02F0EC@cdserv.meridian-data.com>
From: "Stephenson, Dale" <dstephenson@snapserver.com>
MIME-Version: 1.0
Subject: [linux-lvm] Resizing snapshots leaks vmalloc memory
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
Date: Thu Mar 14 11:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

When repeatedly resizing snapshots (both reducing and enlarging), I
eventually would get VMALLOC failures.  Looking at the code, it looks like
when snapshots are resized the old exception table and hash table are never
freed.  A patch to address the problem follows.

Dale Stephenson
steph@snapserver.com

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
