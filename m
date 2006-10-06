Message-ID: <4526D0F6.7090406@ce.jp.nec.com>
Date: Fri, 06 Oct 2006 17:56:06 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
References: <4526D08C.8010303@ce.jp.nec.com>
In-Reply-To: <4526D08C.8010303@ce.jp.nec.com>
Content-Type: multipart/mixed; boundary="------------060903050203040305040805"
Subject: [linux-lvm] [PATCH LVM2] (2/3) use _for_each_pv() from
	_check_contiguous()
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
To: linux-lvm@redhat.com, Alasdair Kergon <agk@redhat.com>

This is a multi-part message in MIME format.
--------------060903050203040305040805
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

This patch rewrites _check_contiguous() to use _for_each_pv().

_for_each_pv() is a generic iterator function to execute given
function on each PV constituting the specified range of LV.
Since _check_contiguous() tries to find contiguous PV segment from
the end of the existing LV segment, I gave the last one LE as
a iteration range of _for_each_pv().

To pass necessary parameters to _for_each_pv callback (_match_pv()),
this patch adds new struct pv_match_handle.

The patch doesn't fix any bug but is a preparation for later patch.
Also, the use like this is what _for_each_pv() is intended for, I think.

diffstat:
 lv_manip.c |   89 +++++++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 66 insertions(+), 23 deletions(-)

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America


--------------060903050203040305040805
Content-Type: text/x-patch;
	name="05-use-for_each_pv-from-check_contiguous.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="05-use-for_each_pv-from-check_contiguous.patch"

diff -X ../dontdiff -urp LVM2.04-shrink-checkcontig-arg/lib/metadata/lv_manip.c LVM2.05.use_for_each_pv/lib/metadata/lv_manip.c
--- LVM2.04-shrink-checkcontig-arg/lib/metadata/lv_manip.c	2006-10-07 02:46:21.000000000 -0400
+++ LVM2.05.use_for_each_pv/lib/metadata/lv_manip.c	2006-10-07 02:49:12.000000000 -0400
@@ -24,6 +24,11 @@
 #include "display.h"
 #include "segtype.h"
 
+static int _for_each_pv(struct cmd_context *cmd, struct logical_volume *lv,
+			uint32_t le, uint32_t len, uint32_t *max_seg_len,
+			int (*fn)(struct cmd_context *cmd, struct pv_segment *peg, void *data),
+			void *data);
+
 /*
  * PVs used by a segment of an LV
  */
@@ -680,42 +685,80 @@ static int _comp_area(const void *l, con
 	return 0;
 }
 
+struct pv_match_handle {
+	/* function to check if pv_segment fits for the pv_area */
+	int (*cond)(struct pv_segment *, struct pv_area *);
+
+	struct pv_area *pva; /* pv_area to match */
+	int index; /* index of pv in flattened lv segment */
+	int matched; /* 1 if matching pv_segment is found */
+};
+
 /*
- * Is pva contiguous to any existing areas or on the same PV?
+ * (_for_each_pv callback)
+ * Check if the pv_segment fits for the pv_match_handle
  */
-static int _check_contiguous(struct lv_segment *prev_lvseg, struct pv_area *pva,
-			     struct pv_area **areas, uint32_t areas_size)
+static int _match_pv(struct cmd_context *cmd, struct pv_segment *peg,
+		     void *data)
 {
-	struct pv_segment *prev_pvseg;
-	struct lv_segment *lastseg;
-	uint32_t s;
+	struct pv_match_handle *h = (struct pv_match_handle *)data;
 
-	for (s = 0; s < prev_lvseg->area_count && s < areas_size; s++) {
-		if (seg_type(prev_lvseg, s) == AREA_LV) {
-			lastseg = list_item(list_last(&seg_lv(prev_lvseg, s)->segments), struct lv_segment);
-			/* FIXME For more areas supply flattened prev_lvseg to ensure consistency */
-			if (lastseg->area_count == 1 &&
-			    _check_contiguous(lastseg, pva, &areas[s], 1))
-				return 1;
-			continue;
-		}
+	h->index++;
+	if (h->cond && h->cond(peg, h->pva)) {
+		h->matched = 1;
+		return 0; /* to exit from for_each_pv loop */
+	}
 
-		if (!(prev_pvseg = seg_pvseg(prev_lvseg, s)))
-			continue; /* FIXME Broken */
+	return 1;
+}
 
-		if ((prev_pvseg->pv != pva->map->pv))
-			continue;
+static int _find_and_set_pv_area(struct lv_segment *prev_lvseg,
+				 struct pv_area *pva,
+				 struct pv_area **areas, uint32_t areas_size,
+				 int (*cond)(struct pv_segment *,
+					     struct pv_area *))
+{
+	struct pv_match_handle pmh;
+
+	pmh.cond = cond;
+	pmh.pva = pva;
+	pmh.index = -1;
+	pmh.matched = 0;
+
+	/* search through all PVs in the last extent of the LV */
+	_for_each_pv(NULL, prev_lvseg->lv,
+		     prev_lvseg->le + prev_lvseg->len - 1, 1,
+		     NULL, _match_pv, &pmh);
 
-		if (prev_pvseg->pe + prev_pvseg->len == pva->start) {
-			areas[s] = pva;
-			return 1;
-		}
+	if (pmh.matched && pmh.index >= 0 && pmh.index < areas_size) {
+		areas[pmh.index] = pva;
+		return 1;
 	}
 
 	return 0;
 }
 
 /*
+ * Is pva contiguous to any existing areas or on the same PV?
+ */
+static int is_contiguous(struct pv_segment *prev, struct pv_area *pva)
+{
+	if ((prev->pv == pva->map->pv) &&
+	    (prev->pe + prev->len == pva->start))
+		return 1;
+
+	return 0;
+}
+
+static int _check_contiguous(struct lv_segment *prev_lvseg, struct pv_area *pva,
+			     struct pv_area **areas, uint32_t areas_size)
+{
+	return _find_and_set_pv_area(prev_lvseg, pva, areas, areas_size,
+				     is_contiguous);
+}
+
+
+/*
  * Choose sets of parallel areas to use, respecting any constraints.
  */
 static int _find_parallel_space(struct alloc_handle *ah, alloc_policy_t alloc,

--------------060903050203040305040805--
