Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2732EE84C
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 16:47:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 839A7811E78
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 16:47:54 +0000 (UTC)
From: Zhao Heming <heming.zhao@suse.com>
Date: Thu, 10 Sep 2020 00:47:29 +0800
Message-Id: <1599670049-6641-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH v2] lvs: add -o lv_usable
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
Cc: teigland@sourceware.org, zkabelac@redhat.com, Zhao Heming <heming.zhao@suse.com>

report LV is usable for upper layer.

leave issues
- this patch doesn't contain dm table comparison. So if the disk
  is removed then re-inserted, but the re-inserted disk
  major:minor is changed, the code doesn't have ability to detect.
- raid10: removing any 2 disks will think as array broken.

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
v2:
- remove dm table parsing code in _lv_is_usable()
- add new status bit NOT_USABLE_LV. 
  note, I chose the first available bit 0x0000000080000000
- _lvusable_disp() uses lv_is_usable() to return usable status

---
 lib/metadata/metadata-exported.h |   3 +
 lib/metadata/metadata.c          | 110 ++++++++++++++++++++++++++++++-
 lib/report/columns.h             |   1 +
 lib/report/properties.c          |   2 +
 lib/report/report.c              |  10 +++
 lib/report/values.h              |   1 +
 6 files changed, 124 insertions(+), 3 deletions(-)

diff --git a/lib/metadata/metadata-exported.h b/lib/metadata/metadata-exported.h
index 670656a0f..dca9317a9 100644
--- a/lib/metadata/metadata-exported.h
+++ b/lib/metadata/metadata-exported.h
@@ -88,6 +88,8 @@
 #define PV_MOVED_VG		UINT64_C(0x4000000000000000)	/* PV - Moved to a new VG */
 #define PARTIAL_LV		UINT64_C(0x0000000001000000)	/* LV - derived flag, not
 							   written out in metadata*/
+#define NOT_USABLE_LV	UINT64_C(0x0000000080000000)	/* LV - derived flag, not
+							   written out in metadata*/
 
 #define WRITECACHE_ORIGIN	UINT64_C(0x0000000002000000)
 #define INTEGRITY_METADATA	UINT64_C(0x0000000004000000)    /* LV - Internal use only */
@@ -214,6 +216,7 @@
 
 #define lv_is_locked(lv)	(((lv)->status & LOCKED) ? 1 : 0)
 #define lv_is_partial(lv)	(((lv)->status & PARTIAL_LV) ? 1 : 0)
+#define lv_is_usable(lv)	(((lv)->status & NOT_USABLE_LV) ? 0 : 1)
 #define lv_is_virtual(lv)	(((lv)->status & VIRTUAL) ? 1 : 0)
 #define lv_is_merging(lv)	(((lv)->status & MERGING) ? 1 : 0)
 #define lv_is_merging_origin(lv) (lv_is_merging(lv) && (lv)->snapshot)
diff --git a/lib/metadata/metadata.c b/lib/metadata/metadata.c
index 8b8c491c0..181a6441e 100644
--- a/lib/metadata/metadata.c
+++ b/lib/metadata/metadata.c
@@ -2043,17 +2043,118 @@ static int _lv_mark_if_partial_collect(struct logical_volume *lv, void *data)
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
+ * For all other LV type (e.g. thin, cache, integrity, vdo etc):
+ * - return false if there is any underlying dev loose.
+ */
+static bool _lv_is_usable(const struct logical_volume *lv)
+{
+	int s, missing_pv = 0, exist_pv = 0;
+	bool ret = true;
+	struct lv_segment *seg = NULL;
+	struct physical_volume *pv = NULL;
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
+				pv = seg_pv(seg, s);
+				if (!(pv->dev) && is_missing_pv(pv))
+					missing_pv++;
+				else
+					exist_pv++;
+			}
+		}
+	}
+
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
+	/*
+	 * There are raid10 near/offset/far copy modes. 
+	 * It's silly to think false when missing_pv great than 1.
+	 */
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
+	/*
+	 * if code go there, the LV type must be thin, cache, integrity, vdo etc
+	 * return false if there is any underlying dev loose
+	 */
+	ret = missing_pv ? false : true;
+
+out:
+	return ret;
+}
+
 static int _lv_mark_if_partial_single(struct logical_volume *lv, void *data)
 {
 	unsigned s;
 	struct _lv_mark_if_partial_baton baton = { .partial = 0 };
-	struct lv_segment *lvseg;
+	struct lv_segment *lvseg = NULL;
+	struct physical_volume *pv = NULL;
 
 	dm_list_iterate_items(lvseg, &lv->segments) {
 		for (s = 0; s < lvseg->area_count; ++s) {
 			if (seg_type(lvseg, s) == AREA_PV) {
-				if (is_missing_pv(seg_pv(lvseg, s)))
+				pv = seg_pv(lvseg, s);
+				if (!(pv->dev) && is_missing_pv(pv)) {
 					lv->status |= PARTIAL_LV;
+					lv->status |= NOT_USABLE_LV;
+				}
 			}
 		}
 	}
@@ -2061,8 +2162,11 @@ static int _lv_mark_if_partial_single(struct logical_volume *lv, void *data)
 	if (!_lv_each_dependency(lv, _lv_mark_if_partial_collect, &baton))
 		return_0;
 
-	if (baton.partial)
+	if (baton.partial) {
 		lv->status |= PARTIAL_LV;
+		if (!_lv_is_usable(lv))
+			lv->status |= NOT_USABLE_LV;
+	}
 
 	return 1;
 }
diff --git a/lib/report/columns.h b/lib/report/columns.h
index 426a32c50..357c42530 100644
--- a/lib/report/columns.h
+++ b/lib/report/columns.h
@@ -145,6 +145,7 @@ FIELD(LVSSTATUS, lv, STR_LIST, "KCacheSettings", lvid, 18, kernel_cache_settings
 FIELD(LVSSTATUS, lv, STR, "KCachePolicy", lvid, 18, kernel_cache_policy, kernel_cache_policy, "Cache policy used in kernel.", 0)
 FIELD(LVSSTATUS, lv, NUM, "KMFmt", lvid, 0, kernelmetadataformat, kernel_metadata_format, "Cache metadata format used in kernel.", 0)
 FIELD(LVSSTATUS, lv, STR, "Health", lvid, 15, lvhealthstatus, lv_health_status, "LV health status.", 0)
+FIELD(LVSSTATUS, lv, STR, "Usable", lvid, 15, lvusable, lv_usable, "whether lvm believes the uppser layer can successfully do io to the entire LV.", 0)
 FIELD(LVSSTATUS, lv, STR, "KDiscards", lvid, 0, kdiscards, kernel_discards, "For thin pools, how discards are handled in kernel.", 0)
 FIELD(LVSSTATUS, lv, BIN, "CheckNeeded", lvid, 15, lvcheckneeded, lv_check_needed, "For thin pools and cache volumes, whether metadata check is needed.", 0)
 FIELD(LVSSTATUS, lv, BIN, "MergeFailed", lvid, 15, lvmergefailed, lv_merge_failed, "Set if snapshot merge failed.", 0)
diff --git a/lib/report/properties.c b/lib/report/properties.c
index d4ac8c47e..e3d64a5d6 100644
--- a/lib/report/properties.c
+++ b/lib/report/properties.c
@@ -296,6 +296,8 @@ GET_PV_NUM_PROPERTY_FN(pv_ba_size, SECTOR_SIZE * pv->ba_size)
 #define _lv_device_open_get prop_not_implemented_get
 #define _lv_health_status_set prop_not_implemented_set
 #define _lv_health_status_get prop_not_implemented_get
+#define _lv_usable_set prop_not_implemented_set
+#define _lv_usable_get prop_not_implemented_get
 #define _lv_skip_activation_set prop_not_implemented_set
 #define _lv_skip_activation_get prop_not_implemented_get
 #define _lv_check_needed_set prop_not_implemented_set
diff --git a/lib/report/report.c b/lib/report/report.c
index 73a150a7e..51b5b98f5 100644
--- a/lib/report/report.c
+++ b/lib/report/report.c
@@ -3903,6 +3903,16 @@ static int _lvhealthstatus_disp(struct dm_report *rh, struct dm_pool *mem,
 	return _field_string(rh, field, health);
 }
 
+static int _lvusable_disp(struct dm_report *rh, struct dm_pool *mem,
+				struct dm_report_field *field,
+				const void *data, void *private)
+{
+	const struct lv_with_info_and_seg_status *lvdm = (const struct lv_with_info_and_seg_status *) data;
+	const struct logical_volume *lv = lvdm->lv;
+
+	return _field_string(rh, field, lv_is_usable(lv) ? "usable" : "not usable");
+}
+
 static int _lvcheckneeded_disp(struct dm_report *rh, struct dm_pool *mem,
 			       struct dm_report_field *field,
 			       const void *data, void *private)
diff --git a/lib/report/values.h b/lib/report/values.h
index 9b98c229e..53f285db6 100644
--- a/lib/report/values.h
+++ b/lib/report/values.h
@@ -102,6 +102,7 @@ FIELD_RESERVED_VALUE(NAMED | RANGE | FUZZY | DYNAMIC, lv_time_removed, lv_time_r
 FIELD_RESERVED_VALUE(NOFLAG, cache_policy, cache_policy_undef, "", "", "", "undefined")
 FIELD_RESERVED_VALUE(NOFLAG, seg_monitor, seg_monitor_undef, "", "", "", "undefined")
 FIELD_RESERVED_VALUE(NOFLAG, lv_health_status, health_undef, "", "", "", "undefined")
+FIELD_RESERVED_VALUE(NOFLAG, lv_usable, usable_undef, "", "", "", "undefined")
 FIELD_RESERVED_VALUE(NOFLAG, kernel_discards, seg_kernel_discards_undef, "", "", "", "undefined")
 FIELD_RESERVED_VALUE(NOFLAG, vdo_write_policy, vdo_write_policy_undef, "", "", "", "undefined")
 /* TODO the following 2 need STR_LIST support for reserved values
-- 
2.27.0
