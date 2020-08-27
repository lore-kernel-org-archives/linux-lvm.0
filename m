Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7744B10073B7
	for <linux-lvm@redhat.com>; Thu, 27 Aug 2020 16:05:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 359FE80121D
	for <linux-lvm@redhat.com>; Thu, 27 Aug 2020 16:05:42 +0000 (UTC)
From: Zhao Heming <heming.zhao@suse.com>
Date: Fri, 28 Aug 2020 00:05:20 +0800
Message-Id: <1598544320-3198-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH] lib/metadata: add new api lv_is_available()
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: teigland@sourceware.org, Zhao Heming <heming.zhao@suse.com>

It commit is enhancement for 1d0dc74f9147e3c1f3681efa4166cbe2edcb6571
1d0dc74f9147 only supports all raid type, this commit adds new api
and extends support scope with linear/mirror type.

This patch introduced a new flag NOT_AVAIL_LV, when a lv (includeing
sub-lv or child-lv) doesn't work, this flag will set.

With this patch, for linear type LV, one of two disks missing,
lvdisplay will show
from:
  LV Status              available (partial)
to:
  LV Status              NOT available (partial)

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
 lib/display/display.c            |  7 +--
 lib/metadata/metadata-exported.h |  3 +
 lib/metadata/metadata.c          | 95 +++++++++++++++++++++++++++++++-
 lib/metadata/segtype.h           |  1 -
 lib/raid/raid.c                  | 54 ------------------
 5 files changed, 99 insertions(+), 61 deletions(-)

diff --git a/lib/display/display.c b/lib/display/display.c
index 3bb570f03..7c4ec9bb3 100644
--- a/lib/display/display.c
+++ b/lib/display/display.c
@@ -399,7 +399,7 @@ int lvdisplay_full(struct cmd_context *cmd,
 		   void *handle __attribute__((unused)))
 {
 	struct lvinfo info;
-	int inkernel, snap_active = 0, partial = 0, raid_is_avail = 1;
+	int inkernel, snap_active = 0, partial = 0, lv_is_avail = 1;
 	char uuid[64] __attribute__((aligned(8)));
 	const char *access_str;
 	struct lv_segment *snap_seg = NULL, *mirror_seg = NULL;
@@ -555,15 +555,14 @@ int lvdisplay_full(struct cmd_context *cmd,
 
 	if (lv_is_partial(lv)) {
 		partial = 1;
-		if (lv_is_raid(lv))
-			raid_is_avail = raid_is_available(lv) ? 1 : 0;
+		lv_is_avail = lv_is_available(lv) ? 1 : 0;
 	}
 
 	if (inkernel && info.suspended)
 		log_print("LV Status              suspended");
 	else if (activation())
 		log_print("LV Status              %savailable %s",
-			  (inkernel && raid_is_avail) ? "" : "NOT ",
+			  (inkernel && lv_is_avail) ? "" : "NOT ",
 			  partial ? "(partial)" : "");
 
 /********* FIXME lv_number
diff --git a/lib/metadata/metadata-exported.h b/lib/metadata/metadata-exported.h
index 06ea757b8..a7fb88e6e 100644
--- a/lib/metadata/metadata-exported.h
+++ b/lib/metadata/metadata-exported.h
@@ -88,6 +88,8 @@
 #define PV_MOVED_VG		UINT64_C(0x4000000000000000)	/* PV - Moved to a new VG */
 #define PARTIAL_LV		UINT64_C(0x0000000001000000)	/* LV - derived flag, not
 							   written out in metadata*/
+#define NOT_AVAIL_LV	UINT64_C(0x0000000080000000)	/* LV - derived flag, not
+							   written out in metadata*/
 
 #define WRITECACHE_ORIGIN	UINT64_C(0x0000000002000000)
 #define INTEGRITY_METADATA	UINT64_C(0x0000000004000000)    /* LV - Internal use only */
@@ -214,6 +216,7 @@
 
 #define lv_is_locked(lv)	(((lv)->status & LOCKED) ? 1 : 0)
 #define lv_is_partial(lv)	(((lv)->status & PARTIAL_LV) ? 1 : 0)
+#define lv_is_available(lv)	(((lv)->status & NOT_AVAIL_LV) ? 0 : 1)
 #define lv_is_virtual(lv)	(((lv)->status & VIRTUAL) ? 1 : 0)
 #define lv_is_merging(lv)	(((lv)->status & MERGING) ? 1 : 0)
 #define lv_is_merging_origin(lv) (lv_is_merging(lv) && (lv)->snapshot)
diff --git a/lib/metadata/metadata.c b/lib/metadata/metadata.c
index c0d42066d..828788566 100644
--- a/lib/metadata/metadata.c
+++ b/lib/metadata/metadata.c
@@ -2043,6 +2043,92 @@ static int _lv_mark_if_partial_collect(struct logical_volume *lv, void *data)
 	return 1;
 }
 
+/*
+ * Return LV is still work or not when underlying dev is removed
+ *
+ * RAID:
+ * - raid 0: if there is any disk loose, return false
+ * - raid1,10,4/5,6: below case think as available, return true:
+ *   - raid 1: at least 1 disk live
+ *   - raid 10: loose 1 disk
+ *   - raid 4/5: loose 1 disk
+ *   - raid 6: loose 2 disk
+ *
+ * LINEAR:
+ * - if there is any disk loose, return false
+ *
+ * MIRROR:
+ * - mirror type won't be in 'not available' status, return true directly.
+ * - the failing rule
+ *   - 3-way mirror convert to 2-way mirror
+ *   - 2-way mirror to linear device
+ *
+ * TODO:
+ * thin, cache, integrity, vdo etc.
+ */
+static bool _lv_is_available(const struct logical_volume *lv)
+{
+	int s, missing_pv = 0, exist_pv = 0;
+	bool ret = true;
+	struct lv_segment *seg = NULL;
+
+	/* see comment, return directly */
+	if (seg_is_mirror(first_seg(lv))) {
+		ret = true;
+		goto out;
+	}
+
+	dm_list_iterate_items(seg, &lv->segments) {
+		for (s = 0; s < seg->area_count; ++s) {
+			if (seg_type(seg, s) == AREA_LV) {
+				if (seg_lv(seg, s)->status & PARTIAL_LV)
+					missing_pv++;
+				else
+					exist_pv++;
+			} else if (seg_type(seg, s) == AREA_PV) {
+				if (is_missing_pv(seg_pv(seg, s)))
+					missing_pv++;
+				else
+					exist_pv++;
+			}
+		}
+	}
+
+	log_print("missing pv: %d exist pv: %d", missing_pv, exist_pv);
+	seg = first_seg(lv);
+	if (seg_is_linear(seg)) {
+		ret = missing_pv ? false : true;
+		goto out;
+	}
+	if (seg_is_any_raid0(seg)) {
+		ret = missing_pv ? false : true;
+		goto out;
+	}
+	if (seg_is_raid1(seg)) {
+		ret = exist_pv ? true : false;
+		goto out;
+	}
+	if (seg_is_any_raid10(seg)) {
+		ret = (missing_pv > 1) ? false : true;
+		goto out;
+	}
+	if (seg_is_raid4(seg)) {
+		ret = (missing_pv > 1) ? false : true;
+		goto out;
+	}
+	if (seg_is_any_raid5(seg)) {
+		ret = (missing_pv > 1) ? false : true;
+		goto out;
+	}
+	if (seg_is_any_raid6(seg)) {
+		ret = (missing_pv > 2) ? false : true;
+		goto out;
+	}
+
+out:
+	return ret;
+}
+
 static int _lv_mark_if_partial_single(struct logical_volume *lv, void *data)
 {
 	unsigned s;
@@ -2052,8 +2138,10 @@ static int _lv_mark_if_partial_single(struct logical_volume *lv, void *data)
 	dm_list_iterate_items(lvseg, &lv->segments) {
 		for (s = 0; s < lvseg->area_count; ++s) {
 			if (seg_type(lvseg, s) == AREA_PV) {
-				if (is_missing_pv(seg_pv(lvseg, s)))
+				if (is_missing_pv(seg_pv(lvseg, s))) {
 					lv->status |= PARTIAL_LV;
+					lv->status |= NOT_AVAIL_LV;
+				}
 			}
 		}
 	}
@@ -2061,8 +2149,11 @@ static int _lv_mark_if_partial_single(struct logical_volume *lv, void *data)
 	if (!_lv_each_dependency(lv, _lv_mark_if_partial_collect, &baton))
 		return_0;
 
-	if (baton.partial)
+	if (baton.partial) {
 		lv->status |= PARTIAL_LV;
+		if (_lv_is_available(lv))
+			lv->status |= NOT_AVAIL_LV;
+	}
 
 	return 1;
 }
diff --git a/lib/metadata/segtype.h b/lib/metadata/segtype.h
index 1a840707d..08ddc3565 100644
--- a/lib/metadata/segtype.h
+++ b/lib/metadata/segtype.h
@@ -326,7 +326,6 @@ struct segment_type *init_unknown_segtype(struct cmd_context *cmd,
 
 #ifdef RAID_INTERNAL
 int init_raid_segtypes(struct cmd_context *cmd, struct segtype_library *seglib);
-bool raid_is_available(const struct logical_volume *lv);
 #endif
 
 #define THIN_FEATURE_DISCARDS			(1U << 0)
diff --git a/lib/raid/raid.c b/lib/raid/raid.c
index 4ed77e9a8..e88a15408 100644
--- a/lib/raid/raid.c
+++ b/lib/raid/raid.c
@@ -25,60 +25,6 @@
 #include "lib/metadata/metadata.h"
 #include "lib/metadata/lv_alloc.h"
 
-/*
- * below case think as available, return true:
- * - raid 1:@least 1 disk live
- * - raid 10: loose 1 disk
- * - raid 4/5: loose 1 disk
- * - raid 6: loose 2 disk
- *
- * raid 0: if there is any disk loose, return false
- * */
-bool raid_is_available(const struct logical_volume *lv)
-{
-	int s, missing_pv = 0, exist_pv = 0;
-	bool ret = true;
-	struct lv_segment *seg = NULL;
-
-	dm_list_iterate_items(seg, &lv->segments) {
-		for (s = 0; s < seg->area_count; ++s) {
-			if (seg_type(seg, s) == AREA_LV) {
-				if (seg_lv(seg, s)->status & PARTIAL_LV)
-					missing_pv++;
-				else
-					exist_pv++;
-			}
-		}
-	}
-	if (seg_is_any_raid0(first_seg(lv))){
-		ret = missing_pv ? false : true;
-		goto out;
-	}
-	if (seg_is_raid1(first_seg(lv))){
-		ret = exist_pv ? true : false;
-		goto out;
-	}
-	if (seg_is_any_raid10(first_seg(lv))) {
-		ret = (missing_pv > 1) ? false : true;
-		goto out;
-	}
-	if (seg_is_raid4(first_seg(lv))) {
-		ret = (missing_pv > 1) ? false : true;
-		goto out;
-	}
-	if (seg_is_any_raid5(first_seg(lv))) {
-		ret = (missing_pv > 1) ? false : true;
-		goto out;
-	}
-	if (seg_is_any_raid6(first_seg(lv))) {
-		ret = (missing_pv > 2) ? false : true;
-		goto out;
-	}
-
-out:
-	return ret;
-}
-
 static int _raid_target_present(struct cmd_context *cmd,
 				const struct lv_segment *seg __attribute__((unused)),
 				unsigned *attributes);
-- 
2.27.0
