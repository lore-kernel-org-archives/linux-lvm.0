Return-Path: <Steph@Connex.com>
Message-ID: <B14BF8753E65D211ABCA00104B301EF501C02C87@cairn-gorm.cragtech.com>
From: Dale Stephenson <Steph@Connex.com>
Subject: RE: [linux-lvm] Some ideas regarding snapshots (was: Reiserfs, 2.
	4.7, snapshots w/ 0.9)
Date: Fri, 27 Jul 2001 10:22:06 -0700
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Joe Thornber wrote:
> Writeable snapshot's are easy to implement, I believe someone has
> already made a patch for the current LVM series (search the list).  I
> certainly intend putting it into the experimental LVM branch soon.
> 
> - Joe

I haven't tried to apply it with beta8, but this is the writeable snapshot
patch I used for beta7:
(All I've used it for is replays and UUID changes, so YMMV.) 

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
 

Note that snapshots are created read-only, so you need to change lvchange to
let you make it read-write:

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

Dale J. Stephenson
steph@connex.com
