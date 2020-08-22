Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4E322022795
	for <linux-lvm@redhat.com>; Sat, 22 Aug 2020 02:38:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEF32901854
	for <linux-lvm@redhat.com>; Sat, 22 Aug 2020 02:38:34 +0000 (UTC)
From: Zhao Heming <heming.zhao@suse.com>
Date: Sat, 22 Aug 2020 10:38:11 +0800
Message-Id: <1598063891-25553-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH v2] lvdisplay: dispaly partial when underlying
	devs missing
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
Cc: Zhao Heming <heming.zhao@suse.com>

reproducible steps:
1. vgcreate vg1 /dev/sda /dev/sdb
2. lvcreate --type raid0 -l 100%FREE -n raid0lv vg1
3. do remove the /dev/sdb action
4. lvdisplay show wrong 'LV Status'

After removing raid0 type LV underlying dev, lvdisplay still display 'available'.

With this patch, lvdisplay will show
from:
  LV Status              available
to:
  LV Status              NOT available (partial)

Other LV type (like raid1, raid5), lvdisplay will show
from:
  LV Status              available
to:
  LV Status              available (partial)

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
v2:
- add special handle for raid0 type.
- print 'partial' if lv is partial status.
- change comments, add raid0 & other raid types cases.

---
 lib/display/display.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/lib/display/display.c b/lib/display/display.c
index 36c9879..0a37630 100644
--- a/lib/display/display.c
+++ b/lib/display/display.c
@@ -399,7 +399,7 @@ int lvdisplay_full(struct cmd_context *cmd,
 		   void *handle __attribute__((unused)))
 {
 	struct lvinfo info;
-	int inkernel, snap_active = 0;
+	int inkernel, snap_active = 0, partial = 0, raid0_partial = 0;
 	char uuid[64] __attribute__((aligned(8)));
 	const char *access_str;
 	struct lv_segment *snap_seg = NULL, *mirror_seg = NULL;
@@ -553,11 +553,17 @@ int lvdisplay_full(struct cmd_context *cmd,
 		log_print("LV VDO Pool name       %s", seg_lv(seg, 0)->name);
 	}
 
+	if (lv_is_partial(lv)) {
+		partial = 1;
+		if (lv_is_raid(lv) && seg_is_any_raid0(first_seg(lv)))
+			raid0_partial = 1;
+	}
 	if (inkernel && info.suspended)
 		log_print("LV Status              suspended");
 	else if (activation())
-		log_print("LV Status              %savailable",
-			  inkernel ? "" : "NOT ");
+		log_print("LV Status              %savailable %s",
+			  (inkernel && !raid0_partial) ? "" : "NOT ",
+			  partial ? "(partial)" : "");
 
 /********* FIXME lv_number
     log_print("LV #                   %u", lv->lv_number + 1);
-- 
1.8.3.1
