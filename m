Return-Path: <Steph@Connex.com>
Message-ID: <B14BF8753E65D211ABCA00104B301EF501C02B92@cairn-gorm.cragtech.com>
From: Dale Stephenson <Steph@Connex.com>
Date: Mon, 21 May 2001 14:47:50 -0700
MIME-Version: 1.0
Subject: [linux-lvm] LVM writeable snapshot patch for use with XFS
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
To: "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>
Cc: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Here is a replacement for the writeable snapshot patch I posted earlier to
these lists.  Its intended use is for changing the UUID on an XFS snapshot
so the snapshot can be mounted at the same time as the original.  This patch
is for beta 7 (the one I posted last week was beta 3) and doesn't have a bug
the earlier patch did.

A patch for lvchange follows the lvm.c patch, as snapshots are still created
read-only and must be changed to writable through lvchange.  This patch is
against an older version, but still cleanly applies to beta7 for me.

Dale J. Stephenson
Software Engineer
Connex, A Western Digital Company
steph@connex.com

--- linux/drivers/md/lvm.c.orig	Fri May 18 19:04:30 2001
+++ linux/drivers/md/lvm.c	Fri May 18 19:30:44 2001
@@ -1120,8 +1120,8 @@
 	ulong pe_start;
 	ulong size = bh->b_size >> 9;
 	ulong rsector_org = bh->b_rsector;
-	ulong rsector_map;
-	kdev_t rdev_map;
+	ulong rsector_map, rsector_sav;
+	kdev_t rdev_map, rdev_sav;
 	vg_t *vg_this = vg[VG_BLK(minor)];
 	lv_t *lv = vg_this->lv[LV_BLK(minor)];
 
@@ -1228,12 +1228,42 @@
 		goto out;
 
 	if (lv->lv_access & LV_SNAPSHOT) { /* remap snapshot */
-		if (lv->lv_block_exception)
+	  if (lv->lv_block_exception) {
+		  if (rw == WRITE || rw == WRITEA) {
+ 		    /* Start of writeable snapshot portion */
+ 		    rdev_sav = rdev_map;
+ 		    rsector_sav = rsector_map;
+ 
+ 		    if (!lvm_snapshot_remap_block(&rdev_map,
+						  &rsector_map,
+						  pe_start,
+						  lv)) {
+		      /* create a new mapping */
+		      if (lvm_snapshot_COW(rdev_map,
+					   rsector_map,
+					   pe_start,
+					   rsector_sav,
+					   vg_this,lv)) {
+			goto bad;
+		      }
+		      lvm_write_COW_table_block(vg_this,lv);
+		      rdev_map = rdev_sav;
+		      rsector_map = rsector_sav;
+		      if (!lvm_snapshot_remap_block(&rdev_map,
+						    &rsector_map,
+						    pe_start,
+						    lv)) {
+			goto bad;
+		      }
+		    }
+		    /* End of writable snapshot portion */
+		  }
+		  else
 			lvm_snapshot_remap_block(&rdev_map, &rsector_map,
 						 pe_start, lv);
-		else
+	  }
+	  else
 			goto bad;
-
 	} else if(rw == WRITE || rw == WRITEA) { /* snapshot origin */
 		lv_t *snap;
 
--- LVM_0_9/tools/lvchange.c.orig	Thu Dec 14 11:29:30 2000
+++ LVM_0_9/tools/lvchange.c	Thu Dec 14 11:36:16 2000
@@ -329,7 +330,8 @@
          continue;
       }
    
-      if ( lv->lv_access & LV_SNAPSHOT) {
+      if ( ( lv->lv_access & LV_SNAPSHOT) &&
+           ( (opt_C) || (opt_a) || (opt_r))) {
          fprintf ( stderr, "%s -- change on snapshot logical "
                            "volume \"%s\" not allowed\n", cmd, lv_name);
          continue;
@@ -370,7 +372,12 @@
    
          if ( doit > 0) {
             doit_sum++;
-            lv->lv_access = lv_access;
+            /* don't clear access flags except for LV_WRITE and LV_READ */
+            if (lv->lv_access & LV_WRITE)
+               lv->lv_access -= LV_WRITE;
+            if (lv->lv_access & LV_READ)
+               lv->lv_access -= LV_READ;
+            lv->lv_access |= lv_access;
             if ( opt_v > 0) printf ( "%s -- changing access permissions "
                                      "of logical volume \"%s\"\n",
                                      cmd, lv_name);
