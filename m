Message-Id: <2D0AFEFEE711D611923E009027D39F2B02F141@cdserv.meridian-data.com>
From: "Stephenson, Dale" <dstephenson@snapserver.com>
MIME-Version: 1.0
Subject: [linux-lvm] Patch for /proc (NOT a bug fix)
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
Date: Wed May  1 14:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This patch doesn't attempt to solve any bugs.  I just wanted to get more
useful information about snapshots from /proc -- little things like the
snapshots' actual size, what volume is its source, and how much of its space
it has used.  Yes, all this information is available from /sbin/lvdisplay
(except for the *real* allocated LE, which you have to figure by hand).  But
I like using /proc.

I put the extra (conditional) lines before the "device:" line because the
optional stripesize line was already there.

I'd like to fit the snapshot/snapshot-source bit into the status bits in
/proc/lvm/global too, but I haven't done it yet.

Dale J. Stephenson
steph@snapserver.com

--- linux/drivers/md/lvm-fs.c.orig	Mon Apr 22 12:14:59 2002
+++ linux/drivers/md/lvm-fs.c	Mon Apr 22 13:44:03 2002
@@ -285,6 +285,26 @@
 		sz += sprintf(page + sz, "stripesize:   %u\n",
 			      lv->lv_stripesize);
 	}
+	if (lv->lv_access & LV_SNAPSHOT) {
+		sz += sprintf(page + sz, "remap total:  %u\n",
+			      lv->lv_remap_end * lv->lv_chunk_size / 2);
+		sz += sprintf(page + sz, "remap used:   %u\n",
+			      lv->lv_remap_ptr * lv->lv_chunk_size / 2);
+		sz += sprintf(page + sz, "snapshot LE:  %u\n",
+			      lv->lv_allocated_snapshot_le);
+		if (lv->lv_snapshot_org != NULL) {
+			sz += sprintf(page + sz, "source:       %s\n",
+				      lv->lv_snapshot_org->lv_name);
+		}
+	}
+	if (lv->lv_access & LV_SNAPSHOT_ORG) {
+		lv_t *lvp = lv->lv_snapshot_next;
+		while (lvp != NULL) {
+			sz += sprintf(page + sz, "source of:    %s\n",
+				      lvp->lv_name);
+			lvp = lvp->lv_snapshot_next;
+		}
+	}
 	sz += sprintf(page + sz, "device:       %02u:%02u\n",
 		      MAJOR(lv->lv_dev), MINOR(lv->lv_dev));
 
