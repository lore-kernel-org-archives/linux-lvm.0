Message-ID: <45146429.6090702@ce.jp.nec.com>
Date: Fri, 22 Sep 2006 18:31:05 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
References: <45146347.3070804@ce.jp.nec.com>
In-Reply-To: <45146347.3070804@ce.jp.nec.com>
Content-Type: multipart/mixed; boundary="------------080203050602000001050800"
Subject: [linux-lvm] [PATCH LVM2 1/2] fix mirror allocation
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
To: linux-lvm@redhat.com, Alasdair Kergon <agk@redhat.com>, Jonathan Brassow <jbrassow@redhat.com>

This is a multi-part message in MIME format.
--------------080203050602000001050800
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

This patch fixes this problem
  - 'lvcreate --alloc anywhere' cannot allocates log
    on the same PV with mimage. This prevents us to create a mirror LV
    on a VG with 2 PVs.
and also fixes other potential problems of mirror allocation
not avoiding PVs properly.

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America

--------------080203050602000001050800
Content-Type: text/x-patch;
 name="fix-mirror-alloc-anywhere.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fix-mirror-alloc-anywhere.patch"

diff -X dontdiff -urp LVM2/lib/metadata/lv_manip.c LVM2.fixed/lib/metadata/lv_manip.c
--- LVM2/lib/metadata/lv_manip.c	2006-08-29 21:27:56.000000000 -0400
+++ LVM2.fixed/lib/metadata/lv_manip.c	2006-09-23 02:54:32.000000000 -0400
@@ -573,13 +573,28 @@ static int _setup_alloced_segments(struc
 }
 
 /*
+ * allocate log area from given pv_area
+ */
+static int _alloc_log_area(struct alloc_handle *ah, uint32_t log_extents,
+			   struct pv_area *log_area)
+{
+	if (log_area) {
+		ah->log_area.pv = log_area->map->pv;
+		ah->log_area.pe = log_area->start;
+		ah->log_area.len = log_extents;
+		consume_pv_area(log_area, ah->log_area.len);
+	}
+
+	return 1;
+}
+
+/*
  * This function takes a list of pv_areas and adds them to allocated_areas.
  * If the complete area is not needed then it gets split.
  * The part used is removed from the pv_map so it can't be allocated twice.
  */
 static int _alloc_parallel_area(struct alloc_handle *ah, uint32_t needed,
-				struct pv_area **areas,
-				uint32_t *ix, struct pv_area *log_area)
+				struct pv_area **areas, uint32_t *ix)
 {
 	uint32_t area_len, smallest, remaining;
 	uint32_t s;
@@ -593,8 +608,7 @@ static int _alloc_parallel_area(struct a
 	if (area_len > smallest)
 		area_len = smallest;
 
-	if (!(aa = dm_pool_alloc(ah->mem, sizeof(*aa) *
-			      (ah->area_count + (log_area ? 1 : 0))))) {
+	if (!(aa = dm_pool_alloc(ah->mem, sizeof(*aa) * ah->area_count))) {
 		log_error("alloced_area allocation failed");
 		return 0;
 	}
@@ -611,13 +625,6 @@ static int _alloc_parallel_area(struct a
 	for (s = 0; s < ah->area_count; s++)
 		consume_pv_area(areas[s], area_len);
 
-	if (log_area) {
-		ah->log_area.pv = log_area->map->pv;
-		ah->log_area.pe = log_area->start;
-		ah->log_area.len = 1;	/* FIXME Calculate & check this */
-		consume_pv_area(log_area, ah->log_area.len);
-	}
-
 	*ix += area_len * ah->area_multiple;
 
 	return 1;
@@ -679,6 +686,102 @@ static int _check_contiguous(struct lv_s
 }
 
 /*
+ * returns 1 if given pv is found in the list of pvs.
+ *
+ * The list of PVs can be given in either or both of 2 ways:
+ *    by parallel_areas list in allocation handle
+ * and/or
+ *    by list of struct pv_list
+ */
+static int is_pv_parallel(struct physical_volume* pv,
+			  struct alloc_handle *ah, struct list *list)
+{
+	struct seg_pvs *spvs;
+	struct pv_list *pvl;
+
+	if (ah && ah->parallel_areas) {
+		list_iterate_items(spvs, ah->parallel_areas)
+			list_iterate_items(pvl, &spvs->pvs)
+				if (pv == pvl->pv)
+					return 1;
+	}
+
+	if (list) {
+		list_iterate_items(pvl, list)
+			if (pv == pvl->pv)
+				return 1;
+	}
+
+	return 0;
+}
+
+/*
+ * find smallest area fit to the log size
+ * avoiding all PVs in ah->parallel_areas
+ */
+/*
+ * FIXME _find_log_space and _find_parallel_space should be merged into
+ * single generic function.
+ */
+static int _find_log_space(struct alloc_handle *ah, alloc_policy_t alloc,
+				struct list *pvms, struct pv_area **areas,
+				uint32_t areas_size, uint32_t log_extents) 
+{
+	struct pv_map *pvm;
+	struct pv_area *pva;
+	unsigned already_found_one = 0;
+	unsigned ix = 0;
+
+	/*
+	 * Put the smallest area of each PV that is at least the
+	 * size we need into areas array.
+	 */
+	list_iterate_items(pvm, pvms) {
+		if (list_empty(&pvm->areas))
+			continue;	/* Next PV */
+
+		if (alloc != ALLOC_ANYWHERE) {
+			if (is_pv_parallel(pvm->pv, ah, NULL))
+				continue;
+		}
+
+		already_found_one = 0;
+		/* First area in each list is the largest */
+		list_iterate_items(pva, &pvm->areas) {
+			/* Is it big enough on its own? */
+			if (pva->count < log_extents)
+				break;
+
+			if (!already_found_one) {
+				ix++;
+				already_found_one = 1;
+			}
+
+			areas[ix - 1] = pva;
+		}
+
+		if (ix >= areas_size)
+			break;
+	}
+
+	/* Not found enough area */
+	if (ix < ah->log_count)
+		return 0;
+
+	/* sort the areas so we allocate from the biggest */
+	if (ix > 1)
+		qsort(areas, ix, sizeof(*areas), _comp_area);
+
+	/* use smallest area as log_area */
+	if (!_alloc_log_area(ah, log_extents, *(areas + ix - 1))) {
+		stack;
+		return 0;
+	}
+
+	return 1;
+}
+
+/*
  * Choose sets of parallel areas to use, respecting any constraints.
  */
 static int _find_parallel_space(struct alloc_handle *ah, alloc_policy_t alloc,
@@ -689,7 +792,6 @@ static int _find_parallel_space(struct a
 {
 	struct pv_map *pvm;
 	struct pv_area *pva;
-	struct pv_list *pvl;
 	unsigned already_found_one = 0;
 	unsigned contiguous = 0, contiguous_count = 0;
 	unsigned ix;
@@ -700,7 +802,6 @@ static int _find_parallel_space(struct a
 	struct list *parallel_pvs;
 
 	/* FIXME Do calculations on free extent counts before selecting space */
-	/* FIXME Select log PV appropriately if there isn't one yet */
 
 	/* Are there any preceding segments we must follow on from? */
 	if ((alloc == ALLOC_CONTIGUOUS) && prev_lvseg) {
@@ -708,6 +809,12 @@ static int _find_parallel_space(struct a
 		ix_offset = prev_lvseg->area_count;
 	}
 
+	/* Allocate log first */
+	if (ah->log_count && ah->log_area.len == 0)
+		/* FIXME Assuming log size = 1, Calculate correctly */
+		if (!_find_log_space(ah, alloc, pvms, areas, areas_size, 1))
+			return 0;
+
 	/* FIXME This algorithm needs a lot of cleaning up! */
 	/* FIXME anywhere doesn't find all space yet */
 	/* ix_offset holds the number of allocations that must be contiguous */
@@ -758,10 +865,8 @@ static int _find_parallel_space(struct a
 					continue;	/* Next PV */
 
 				/* Avoid PVs used by existing parallel areas */
-				if (parallel_pvs)
-					list_iterate_items(pvl, parallel_pvs)
-						if (pvm->pv == pvl->pv)
-							goto next_pv;
+				if (is_pv_parallel(pvm->pv, NULL, parallel_pvs))
+					goto next_pv;
 			}
 
 			already_found_one = 0;
@@ -781,7 +886,7 @@ static int _find_parallel_space(struct a
 
 				/* Is it big enough on its own? */
 				if ((pva->count < (max_parallel - *allocated) / ah->area_multiple) &&
-				    ((!can_split && !ah->log_count) ||
+				    (!can_split ||
 				     (already_found_one &&
 				      !(alloc == ALLOC_ANYWHERE))))
 					goto next_pv;
@@ -804,11 +909,7 @@ static int _find_parallel_space(struct a
 		if (contiguous && (contiguous_count < ix_offset))
 			break;
 
-		/* Only allocate log_area the first time around */
-		if (ix + ix_offset < ah->area_count +
-			    ((ah->log_count && !ah->log_area.len) ?
-				ah->log_count : 0))
-			/* FIXME With ALLOC_ANYWHERE, need to split areas */
+		if (ix + ix_offset < ah->area_count)
 			break;
 
 		/* sort the areas so we allocate from the biggest */
@@ -816,13 +917,7 @@ static int _find_parallel_space(struct a
 			qsort(areas + ix_offset, ix, sizeof(*areas),
 			      _comp_area);
 
-		/* First time around, use smallest area as log_area */
-		/* FIXME decide which PV to use at top of function instead */
-		if (!_alloc_parallel_area(ah, max_parallel, areas,
-					  allocated,
-					  (ah->log_count && !ah->log_area.len) ?
-						*(areas + ix_offset + ix - 1) :
-						NULL)) {
+		if (!_alloc_parallel_area(ah, max_parallel, areas, allocated)) {
 			stack;
 			return 0;
 		}

--------------080203050602000001050800--
