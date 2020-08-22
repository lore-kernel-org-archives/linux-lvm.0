Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 417591009B9D
	for <linux-lvm@redhat.com>; Sat, 22 Aug 2020 05:33:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAA21888BE5
	for <linux-lvm@redhat.com>; Sat, 22 Aug 2020 05:33:10 +0000 (UTC)
From: Zhao Heming <heming.zhao@suse.com>
Date: Sat, 22 Aug 2020 13:32:44 +0800
Message-Id: <1598074364-21814-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH v3] lvdisplay: dispaly correct status when
	underlying devs missing
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
Cc: ematsumiya@suse.com, Zhao Heming <heming.zhao@suse.com>

reproducible steps:
1. vgcreate vg1 /dev/sda /dev/sdb
2. lvcreate --type raid0 -l 100%FREE -n raid0lv vg1
3. do remove the /dev/sdb action
4. lvdisplay show wrong 'LV Status'

After removing raid0 type LV underlying dev, lvdisplay still display
'available'. This is wrong status for raid0.

This patch add a new function raid_is_available(), which will handle
all raid case.

With this patch, lvdisplay will show
from:
  LV Status              available
to:
  LV Status              NOT available (partial)

Reviewed-by: Enzo Matsumiya <ematsumiya@suse.com>
Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
v3:
- change patch title
  from:
   dispaly partial when underlying devs missing
  to:
   dispaly correct status when underlying devs missing
- add new function raid_is_available(), which can handle all raid type
- add reviewed info: Enzo Matsumiya

v2:
- add special handle for raid0 type.
- print 'partial' if lv is partial status.
- change comments, add raid0 & other raid types cases.

---
 lib/display/display.c  | 13 +++++++++---
 lib/metadata/segtype.h |  1 +
 lib/raid/raid.c        | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/lib/display/display.c b/lib/display/display.c
index 36c9879..3bb570f 100644
--- a/lib/display/display.c
+++ b/lib/display/display.c
@@ -399,7 +399,7 @@ int lvdisplay_full(struct cmd_context *cmd,
 		   void *handle __attribute__((unused)))
 {
 	struct lvinfo info;
-	int inkernel, snap_active = 0;
+	int inkernel, snap_active = 0, partial = 0, raid_is_avail = 1;
 	char uuid[64] __attribute__((aligned(8)));
 	const char *access_str;
 	struct lv_segment *snap_seg = NULL, *mirror_seg = NULL;
@@ -553,11 +553,18 @@ int lvdisplay_full(struct cmd_context *cmd,
 		log_print("LV VDO Pool name       %s", seg_lv(seg, 0)->name);
 	}
 
+	if (lv_is_partial(lv)) {
+		partial = 1;
+		if (lv_is_raid(lv))
+			raid_is_avail = raid_is_available(lv) ? 1 : 0;
+	}
+
 	if (inkernel && info.suspended)
 		log_print("LV Status              suspended");
 	else if (activation())
-		log_print("LV Status              %savailable",
-			  inkernel ? "" : "NOT ");
+		log_print("LV Status              %savailable %s",
+			  (inkernel && raid_is_avail) ? "" : "NOT ",
+			  partial ? "(partial)" : "");
 
 /********* FIXME lv_number
     log_print("LV #                   %u", lv->lv_number + 1);
diff --git a/lib/metadata/segtype.h b/lib/metadata/segtype.h
index 08ddc35..1a84070 100644
--- a/lib/metadata/segtype.h
+++ b/lib/metadata/segtype.h
@@ -326,6 +326,7 @@ struct segment_type *init_unknown_segtype(struct cmd_context *cmd,
 
 #ifdef RAID_INTERNAL
 int init_raid_segtypes(struct cmd_context *cmd, struct segtype_library *seglib);
+bool raid_is_available(const struct logical_volume *lv);
 #endif
 
 #define THIN_FEATURE_DISCARDS			(1U << 0)
diff --git a/lib/raid/raid.c b/lib/raid/raid.c
index e88a154..4ed77e9 100644
--- a/lib/raid/raid.c
+++ b/lib/raid/raid.c
@@ -25,6 +25,60 @@
 #include "lib/metadata/metadata.h"
 #include "lib/metadata/lv_alloc.h"
 
+/*
+ * below case think as available, return true:
+ * - raid 1:@least 1 disk live
+ * - raid 10: loose 1 disk
+ * - raid 4/5: loose 1 disk
+ * - raid 6: loose 2 disk
+ *
+ * raid 0: if there is any disk loose, return false
+ * */
+bool raid_is_available(const struct logical_volume *lv)
+{
+	int s, missing_pv = 0, exist_pv = 0;
+	bool ret = true;
+	struct lv_segment *seg = NULL;
+
+	dm_list_iterate_items(seg, &lv->segments) {
+		for (s = 0; s < seg->area_count; ++s) {
+			if (seg_type(seg, s) == AREA_LV) {
+				if (seg_lv(seg, s)->status & PARTIAL_LV)
+					missing_pv++;
+				else
+					exist_pv++;
+			}
+		}
+	}
+	if (seg_is_any_raid0(first_seg(lv))){
+		ret = missing_pv ? false : true;
+		goto out;
+	}
+	if (seg_is_raid1(first_seg(lv))){
+		ret = exist_pv ? true : false;
+		goto out;
+	}
+	if (seg_is_any_raid10(first_seg(lv))) {
+		ret = (missing_pv > 1) ? false : true;
+		goto out;
+	}
+	if (seg_is_raid4(first_seg(lv))) {
+		ret = (missing_pv > 1) ? false : true;
+		goto out;
+	}
+	if (seg_is_any_raid5(first_seg(lv))) {
+		ret = (missing_pv > 1) ? false : true;
+		goto out;
+	}
+	if (seg_is_any_raid6(first_seg(lv))) {
+		ret = (missing_pv > 2) ? false : true;
+		goto out;
+	}
+
+out:
+	return ret;
+}
+
 static int _raid_target_present(struct cmd_context *cmd,
 				const struct lv_segment *seg __attribute__((unused)),
 				unsigned *attributes);
-- 
1.8.3.1
