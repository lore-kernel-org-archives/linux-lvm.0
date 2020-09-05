Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B94902157F23
	for <linux-lvm@redhat.com>; Sat,  5 Sep 2020 09:07:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF4A4101A540
	for <linux-lvm@redhat.com>; Sat,  5 Sep 2020 09:07:12 +0000 (UTC)
From: Zhao Heming <heming.zhao@suse.com>
Date: Sat,  5 Sep 2020 17:06:26 +0800
Message-Id: <1599296786-27353-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH] lvs: add -o lv_usable
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

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
 lib/activate/activate.h          |   2 +
 lib/activate/dev_manager.c       |  67 ++++++++++++++++
 lib/metadata/metadata-exported.h |   1 +
 lib/metadata/metadata.c          | 130 +++++++++++++++++++++++++++++++
 lib/report/columns.h             |   1 +
 lib/report/properties.c          |   2 +
 lib/report/report.c              |  13 ++++
 lib/report/values.h              |   1 +
 8 files changed, 217 insertions(+)

diff --git a/lib/activate/activate.h b/lib/activate/activate.h
index e3c1bb35e..25de3d6b1 100644
--- a/lib/activate/activate.h
+++ b/lib/activate/activate.h
@@ -255,6 +255,8 @@ struct dev_usable_check_params {
  */
 int device_is_usable(struct device *dev, struct dev_usable_check_params check);
 
+char *lv_mapping_table(const char *dm_table_dev);
+bool dm_has_lvdev(const char *dm_table_dev, const char *lvdev);
 /*
  * Declaration moved here from fs.h to keep header fs.h hidden
  */
diff --git a/lib/activate/dev_manager.c b/lib/activate/dev_manager.c
index a626b000a..c272c20f6 100644
--- a/lib/activate/dev_manager.c
+++ b/lib/activate/dev_manager.c
@@ -778,6 +778,73 @@ int device_is_usable(struct device *dev, struct dev_usable_check_params check)
 	return r;
 }
 
+/*
+ * Return input LV underlying devs
+ * NOTE: Caller should free the return string.
+ */
+char *lv_mapping_table(const char *dm_table_dev)
+{
+	struct dm_task *dmt;
+	uint64_t start, len;
+	char *params, *type = NULL;
+	void *next = NULL;
+	char *ret_str = NULL;
+
+	if (!(dmt = _setup_task_run(DM_DEVICE_TABLE, NULL,
+					dm_table_dev, NULL, NULL, 0, 0, 0, 0, 0))) {
+		log_error("can't get %s device mapping table", dm_table_dev);
+		return NULL;
+	}
+
+	do {
+		next = dm_get_next_target(dmt, next, &start, &len, &type, &params);
+		if (strcmp(type, TARGET_NAME_LINEAR))
+				goto out; /* only support linear type */
+		/* TODO: merge all sub-dm dev into one ret_str */
+		ret_str = strndup(params, strchr(params, ' ') - params);
+		break;
+	} while (next);
+
+out:
+	dm_task_destroy(dmt);
+
+	return ret_str;
+}
+
+/*
+ * To check whether 1st parameter lv underlying devs contains
+ * 2nd parameter lv dev
+ */
+bool dm_has_lvdev(const char *dm_table_dev, const char *lvdev)
+{
+	struct dm_task *dmt;
+	uint64_t start, len;
+	char *params, *type = NULL;
+	void *next = NULL;
+	bool ret = false;
+
+	if (!(dmt = _setup_task_run(DM_DEVICE_TABLE, NULL,
+					dm_table_dev, NULL, NULL, 0, 0, 0, 0, 0))) {
+		log_error("can't get %s device mapping table", dm_table_dev);
+		return false;
+	}
+
+	do {
+		next = dm_get_next_target(dmt, next, &start, &len, &type, &params);
+		if (strcmp(type, TARGET_NAME_LINEAR))
+				goto out; /* only support linear type */
+		if (strstr(params, lvdev)) {
+			ret = true;
+			break;
+		}
+	} while (next);
+
+out:
+	dm_task_destroy(dmt);
+
+	return ret;
+}
+
 /*
  * If active LVs were activated by a version of LVM2 before 2.02.00 we must
  * perform additional checks to find them because they do not have the LVM-
diff --git a/lib/metadata/metadata-exported.h b/lib/metadata/metadata-exported.h
index 670656a0f..620216dc0 100644
--- a/lib/metadata/metadata-exported.h
+++ b/lib/metadata/metadata-exported.h
@@ -1416,5 +1416,6 @@ int lv_extend_integrity_in_raid(struct logical_volume *lv, struct dm_list *pvh);
 int lv_get_raid_integrity_settings(struct logical_volume *lv, struct integrity_settings **isettings);
 int integrity_mode_set(const char *mode, struct integrity_settings *settings);
 int lv_integrity_mismatches(struct cmd_context *cmd, const struct logical_volume *lv, uint64_t *mismatches);
+bool _lv_is_usable(const struct logical_volume *lv, char *dm_dev);
 
 #endif
diff --git a/lib/metadata/metadata.c b/lib/metadata/metadata.c
index 8b8c491c0..03bc399a8 100644
--- a/lib/metadata/metadata.c
+++ b/lib/metadata/metadata.c
@@ -2043,6 +2043,136 @@ static int _lv_mark_if_partial_collect(struct logical_volume *lv, void *data)
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
+ * - return false if there is any disk loose.
+ */
+bool _lv_is_usable(const struct logical_volume *lv, char *dm_dev)
+{
+	int s, missing_pv = 0, exist_pv = 0, un_usable_pv = 0;
+	bool ret = true;
+	struct lv_segment *seg = NULL;
+	struct device *dev;
+	char t_dev[8]; /* strlen(255:255)+1: 8 */
+	char lvname[50];
+	char *lv_dev;
+	struct physical_volume *pv;
+
+	/* see comment, return directly */
+	if (!dm_dev && seg_is_mirror(first_seg(lv))) {
+		ret = true;
+		goto out;
+	}
+
+	dm_list_iterate_items(seg, &lv->segments) {
+		for (s = 0; s < seg->area_count; ++s) {
+			if (seg_type(seg, s) == AREA_LV) {
+				if (seg_lv(seg, s)->status & PARTIAL_LV) {
+					missing_pv++;
+				} else {
+					/* format is right: "vgname" + '-' + "lvname" ?? */
+					snprintf(lvname, 50, "%s-%s", lv->vg->name, seg_lv(seg, s)->name);
+					lv_dev = lv_mapping_table(lvname);
+					if (lv_dev)
+						_lv_is_usable(seg_lv(seg, s), lv_dev) ?
+							exist_pv++ : un_usable_pv++;
+					else
+						missing_pv++;
+				}
+			} else if (seg_type(seg, s) == AREA_PV) {
+				pv = seg_pv(seg, s);
+				snprintf(t_dev, 8, "%d:%d",
+						pv->dev ? (int) MAJOR(pv->dev->dev) : -1,
+						pv->dev ? (int) MINOR(pv->dev->dev) : -1);
+
+				if (dm_dev) { /* call from recursion */
+					ret = strncmp(t_dev, dm_dev, 8) ? false : true;
+					free(dm_dev);
+					return ret;
+				}
+
+				if (!(pv->dev) && is_missing_pv(pv)) {
+					missing_pv++;
+				} else {
+					if (pv->dev) {
+						dev = seg_dev(seg, s);
+						snprintf(t_dev, 8, "%d:%d", (int) MAJOR(dev->dev), (int) MINOR(dev->dev));
+						/* format is right: "vgname" + '-' + "lvname" ?? */
+						snprintf(lvname, 50, "%s-%s", lv->vg->name, lv->name);
+						dm_has_lvdev(lvname, t_dev) ? exist_pv++ : un_usable_pv++;
+					} else
+						missing_pv++;
+				}
+			}
+		}
+	}
+
+	/* make sure recursioin must return from here */
+	if (dm_dev) {
+		ret = (un_usable_pv || missing_pv ) ? false : true;
+		free(dm_dev);
+		return ret;
+	}
+
+	seg = first_seg(lv);
+	if (seg_is_linear(seg)) {
+		ret = (missing_pv || un_usable_pv) ? false : true;
+		goto out;
+	}
+	if (seg_is_any_raid0(seg)) {
+		ret = (missing_pv || un_usable_pv) ? false : true;
+		goto out;
+	}
+	if (seg_is_raid1(seg)) {
+		ret = exist_pv ? true : false;
+		goto out;
+	}
+	if (seg_is_any_raid10(seg)) {
+		ret = ((missing_pv + un_usable_pv) > 1) ? false : true;
+		goto out;
+	}
+	if (seg_is_raid4(seg)) {
+		ret = ((missing_pv + un_usable_pv) > 1) ? false : true;
+		goto out;
+	}
+	if (seg_is_any_raid5(seg)) {
+		ret = ((missing_pv + un_usable_pv) > 1) ? false : true;
+		goto out;
+	}
+	if (seg_is_any_raid6(seg)) {
+		ret = ((missing_pv + un_usable_pv) > 2) ? false : true;
+		goto out;
+	}
+
+	/*
+	 * if code go there, the LV type must be thin, cache, integrity, vdo etc
+	 * return false if there is any disk loose or un_usable.
+	 */
+	ret = (missing_pv || un_usable_pv )? false : true;
+
+out:
+	return ret;
+}
+
 static int _lv_mark_if_partial_single(struct logical_volume *lv, void *data)
 {
 	unsigned s;
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
index cd7971562..dad7649aa 100644
--- a/lib/report/report.c
+++ b/lib/report/report.c
@@ -3900,6 +3900,19 @@ static int _lvhealthstatus_disp(struct dm_report *rh, struct dm_pool *mem,
 	return _field_string(rh, field, health);
 }
 
+static int _lvusable_disp(struct dm_report *rh, struct dm_pool *mem,
+				struct dm_report_field *field,
+				const void *data, void *private)
+{
+	const struct lv_with_info_and_seg_status *lvdm = (const struct lv_with_info_and_seg_status *) data;
+	const struct logical_volume *lv = lvdm->lv;
+	const char *usable = "";
+
+	usable = _lv_is_usable(lv, NULL) ? "usable" : "not usable";
+
+	return _field_string(rh, field, usable);
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
