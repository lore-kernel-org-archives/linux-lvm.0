Message-ID: <3E63CCA0.3000908@mac.com>
From: "Dale J. Stephenson" <dalestephenson@mac.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot resizing pe_allocated correction
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
Date: Mon Mar  3 12:43:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm <linux-lvm@sistina.com>

Another slight fix.  When a snapshot is resized, the volume groups' 
pe_allocated field is not updated.  The following patch should fix this 
problem:

--- linux/drivers/md/lvm.c.orig	Mon Apr 29 08:50:41 2002
+++ linux/drivers/md/lvm.c	Mon Apr 29 12:41:29 2002
@@ -2280,6 +2280,9 @@
 		return -ENOMEM;
 	}
 
+	vg_ptr->pe_allocated -= old_lv->lv_allocated_snapshot_le;
+	vg_ptr->pe_allocated += new_lv->lv_allocated_le;
+
 	return 0;
 }
 
