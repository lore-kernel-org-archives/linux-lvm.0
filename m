Return-Path: <mason@suse.com>
Date: Mon, 04 Dec 2000 15:30:08 -0500
From: Chris Mason <mason@suse.com>
Message-ID: <34440000.975961808@coffee>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] vgextend and vgreduce errors in 0.9
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
To: linux-lvm@sistina.com


Hello everyone,

I searched through the archives for this, but did not see
any similar patches.  It looks like lvm 0.9 has some
double increments and decrements when extending/reducing
volume groups, and the lvm_get_inode code was called
twice when extending volume groups.

The following diff should fix it, along with the known
problem of an oops on vgextend.  Testing has been really,
really light, don't apply this until it has been blessed
by a few other eyes.

If there is another diff to fix the same bugs, please
forward it to me ;-)

-chris

------

--- linux/drivers/block/lvm.c.1	Mon Dec  4 14:52:31 2000
+++ linux/drivers/block/lvm.c	Mon Dec  4 16:15:18 2000
@@ -2084,20 +2084,10 @@
 		for (p = 0; p < vg_ptr->pv_max; p++) {
 			if ( ( pv_ptr = vg_ptr->pv[p]) == NULL) {
 				ret = lvm_do_pv_create(arg, vg_ptr, p);
-				lvm_do_create_proc_entry_of_pv ( vg_ptr, pv_ptr);
 				if ( ret != 0) return ret;
-	
-				/* We don't need the PE list
-				   in kernel space like LVs pe_t list */
-				pv_ptr->pe = NULL;
-				vg_ptr->pv_cur++;
-				vg_ptr->pv_act++;
-				vg_ptr->pe_total +=
-				    pv_ptr->pe_total;
-#ifdef LVM_GET_INODE
-				/* insert a dummy inode for fs_may_mount */
-				pv_ptr->inode = lvm_get_inode(pv_ptr->pv_dev);
-#endif
+                                pv_ptr = vg_ptr->pv[p] ;
+                                vg_ptr->pe_total += pv_ptr->pe_total;
+				lvm_do_create_proc_entry_of_pv ( vg_ptr, pv_ptr);
 				return 0;
 			}
 		}
@@ -2123,10 +2113,6 @@
 		    strcmp(pv_ptr->pv_name,
 			       pv_name) == 0) {
 			if (pv_ptr->lv_cur > 0) return -EPERM;
-			vg_ptr->pe_total -=
-			    pv_ptr->pe_total;
-			vg_ptr->pv_cur--;
-			vg_ptr->pv_act--;
 			lvm_do_pv_remove(vg_ptr, p);
 			/* Make PV pointer array contiguous */
 			for (; p < vg_ptr->pv_max - 1; p++)
