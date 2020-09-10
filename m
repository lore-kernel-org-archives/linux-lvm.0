Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5666AF5CFD
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2020 15:37:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DE9F811E79
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2020 15:37:59 +0000 (UTC)
From: Zhao Heming <heming.zhao@suse.com>
Date: Thu, 10 Sep 2020 23:37:27 +0800
Message-Id: <1599752247-30793-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH 1/2] metadata: check pv->dev null when setting
	PARTIAL_LV
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
Cc: zkabelac@redhat.com, teigland@redhat.com, Zhao Heming <heming.zhao@suse.com>

The code in vg_read():
```
if (missing_pv_dev || missing_pv_flag)
    vg_mark_partial_lvs(vg, 1);
```
the missing_pv_dev not zero when pv->dev is null.
the missing_pv_flag not zero when pv->dev is not null but status MISSING_PV is true.
any above condition will trigger code to set PARTIAL_LV.
So in _lv_mark_if_partial_single(), there should add  '|| (!pv->dev)' case.

Below comment by David:
And the MISSING_PV flag was not used consistently, so there were cases
where pv->dev was null but the flag was not set. So to check for null dev
until it's more confidence in how that flag is used.

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
 lib/metadata/metadata.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/metadata/metadata.c b/lib/metadata/metadata.c
index 8b8c491..5f444a6 100644
--- a/lib/metadata/metadata.c
+++ b/lib/metadata/metadata.c
@@ -2048,11 +2048,13 @@ static int _lv_mark_if_partial_single(struct logical_volume *lv, void *data)
 	unsigned s;
 	struct _lv_mark_if_partial_baton baton = { .partial = 0 };
 	struct lv_segment *lvseg;
+	struct physical_volume *pv;
 
 	dm_list_iterate_items(lvseg, &lv->segments) {
 		for (s = 0; s < lvseg->area_count; ++s) {
 			if (seg_type(lvseg, s) == AREA_PV) {
-				if (is_missing_pv(seg_pv(lvseg, s)))
+				pv = seg_pv(lvseg, s);
+				if (is_missing_pv(pv) || !pv->dev)
 					lv->status |= PARTIAL_LV;
 			}
 		}
-- 
1.8.3.1
