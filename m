From: Jonathan Brassow <jbrassow@redhat.com>
Date: Thu, 09 Nov 2006 11:00:46 -0600
Message-Id: <1163091646.19633.6.camel@hydrogen.msp.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [Patch 1/1] Fix mirror region_size calculation.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com, jbrassow@redhat.com, agk@redhat.com

This patch fixes 214604 and 214302 (http://bugzilla.redhat.com).

 brassow

region_size is a 32-bit value.  Sometimes, when computing the maximum
possible region_size for large volumes, 32-bits can be exceeded.  We
now cap the maximum region_size at 2^31 (the max power of 2 that can
be held in a 32-bit number).

Additionally, while waiting for a fix to allow for log devices
greater than 1 extent, we also adjust the minimum region_size.
By increasing the region_size, we can get by with log devices
that maintain a size of 1 extent for now.

Index: LVM2/lib/metadata/mirror.c
===================================================================
--- LVM2.orig/lib/metadata/mirror.c	2006-11-08 14:18:33.000000000 -0600
+++ LVM2/lib/metadata/mirror.c	2006-11-09 10:51:11.000000000 -0600
@@ -36,20 +36,44 @@ struct lv_segment *find_mirror_seg(struc
 }
 
 /*
- * Ensure region size is compatible with volume size.
+ * adjusted_mirror_region_size
+ * @extent_size: The size of an extent in sectors
+ * @extents: The number of extents in the LV
+ * @region_size: The current guess at an appropriate region size
+ *
+ * The maximum region size must be the largest power of 2 that
+ * evenly divides into the total size given by extent_size * extents.
+ *
+ * The suggested minumum region size should be a number where the
+ * number of regions is less than the number of bits in an extent.
+ *
+ * Returns: suggested region_size, or 0 on failure to find good region size
  */
 uint32_t adjusted_mirror_region_size(uint32_t extent_size, uint32_t extents,
 				     uint32_t region_size)
 {
-	uint32_t region_max;
+	uint32_t region_max, region_min;
 
-	region_max = (1 << (ffs((int)extents) - 1)) * extent_size;
+	region_max = ffs((int)extents) + ffs((int)extent_size) - 2;
+	/* cap region_max@the max power of 2 that can be held in 32 bits */
+	region_max = (region_max > 31) ? (1 << 31) : (1 << region_max);
+
+	/* Leave some extra room for the log header before the bits... */
+	for (region_min = region_size;
+	     (extents/region_min) > (1 << SECTOR_SHIFT);
+	     region_min *= 2);
 
 	if (region_max < region_size) {
 		region_size = region_max;
 		log_print("Using reduced mirror region size of %" PRIu32
 			  " sectors", region_max);
-		return region_max;
+	} else if (region_min > region_size) {
+		region_size = region_min;
+		if (region_size <= region_max)
+			log_print("Using minimum mirror region size of %" PRIu32
+				  " sectors", region_min);
+		else
+			region_size = 0;
 	}
 
 	return region_size;
Index: LVM2/tools/lvconvert.c
===================================================================
--- LVM2.orig/tools/lvconvert.c	2006-10-24 13:50:29.000000000 -0500
+++ LVM2/tools/lvconvert.c	2006-11-09 09:12:28.000000000 -0600
@@ -388,6 +388,11 @@ static int lvconvert_mirrors(struct cmd_
 								      lv->le_count,
 								      lp->region_size);
 
+			if (!lp->region_size) {
+				log_error("Failed to find valid region size");
+				return 0;
+			}
+
 			log_lv = NULL;
 			if (!arg_count(cmd, corelog_ARG) &&
 			    !(log_lv = create_mirror_log(cmd, lv->vg, ah,
Index: LVM2/tools/lvcreate.c
===================================================================
--- LVM2.orig/tools/lvcreate.c	2006-10-18 13:01:53.000000000 -0500
+++ LVM2/tools/lvcreate.c	2006-11-09 09:10:22.000000000 -0600
@@ -678,6 +678,11 @@ static int _lvcreate(struct cmd_context 
 							      lp->extents,
 							      lp->region_size);
 
+		if (!lp->region_size) {
+			log_error("Failed to find valid region size");
+			return 0;
+		}
+
 		init_mirror_in_sync(lp->nosync);
 
 		if (lp->nosync) {
