Message-ID: <4526D126.2060004@ce.jp.nec.com>
Date: Fri, 06 Oct 2006 17:56:54 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
References: <4526D08C.8010303@ce.jp.nec.com>
In-Reply-To: <4526D08C.8010303@ce.jp.nec.com>
Content-Type: multipart/mixed; boundary="------------010509070904090003020101"
Subject: [linux-lvm] [PATCH LVM2] (3/3) add 'cling' allocation policy
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
--------------010509070904090003020101
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

This patch adds 'cling' allocation policy.

Currently there are 3 policies: 'contiguous', 'normal', 'anywhere'.
LVM2 tries to apply from left to right until it succeeds allocation
or it failed to allocate with specified policy.

With this patch, policies are applied in the order:
'contiguous', 'cling', 'normal', 'anywhere'.

From man page:
 The contiguous policy requires  that
 new extents are adjacent to existing extents. If there are sufficient
 free extents to satisfy an allocation request but  normal doesn't use them,
 anywhere will - even if that reduces performance by placing two stripes
 on the same physical volume.

'cling' policy requires that new extents are on the same physical
volume with the existing extents.

diffstat:
 include/metadata.h      |    1
 lib/display/display.c   |    1
 lib/metadata/lv_manip.c |   49 ++++++++++++++++++++++++++++++++++++++++++++---- lib/metadata/metadata.h |    1
 lib/report/report.c     |    2 +
 man/lvm.8               |    4 ++-
 6 files changed, 53 insertions(+), 5 deletions(-)

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America


--------------010509070904090003020101
Content-Type: text/x-patch;
 name="06-add-cling-allocation-policy.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="06-add-cling-allocation-policy.patch"

diff -X ../dontdiff -urp LVM2.05.use_for_each_pv/include/metadata.h LVM2.06.alloc-cling/include/metadata.h
--- LVM2.05.use_for_each_pv/include/metadata.h	2006-10-05 19:45:15.000000000 -0400
+++ LVM2.06.alloc-cling/include/metadata.h	2006-10-07 02:49:55.000000000 -0400
@@ -82,6 +82,7 @@ typedef enum {
 	ALLOC_INVALID = 0,
 	ALLOC_INHERIT,
 	ALLOC_CONTIGUOUS,
+	ALLOC_CLING,
 	ALLOC_NORMAL,
 	ALLOC_ANYWHERE
 } alloc_policy_t;
diff -X ../dontdiff -urp LVM2.05.use_for_each_pv/lib/display/display.c LVM2.06.alloc-cling/lib/display/display.c
--- LVM2.05.use_for_each_pv/lib/display/display.c	2006-07-29 00:46:08.000000000 -0400
+++ LVM2.06.alloc-cling/lib/display/display.c	2006-10-07 02:49:55.000000000 -0400
@@ -30,6 +30,7 @@ static struct {
 } _policies[] = {
 	{
 	ALLOC_CONTIGUOUS, "contiguous"}, {
+	ALLOC_CLING, "cling"}, {
 	ALLOC_NORMAL, "normal"}, {
 	ALLOC_ANYWHERE, "anywhere"}, {
 	ALLOC_INHERIT, "inherit"}
diff -X ../dontdiff -urp LVM2.05.use_for_each_pv/lib/metadata/lv_manip.c LVM2.06.alloc-cling/lib/metadata/lv_manip.c
--- LVM2.05.use_for_each_pv/lib/metadata/lv_manip.c	2006-10-07 02:49:12.000000000 -0400
+++ LVM2.06.alloc-cling/lib/metadata/lv_manip.c	2006-10-07 02:51:14.000000000 -0400
@@ -757,6 +757,23 @@ static int _check_contiguous(struct lv_s
 				     is_contiguous);
 }
 
+/*
+ * Is pva on the same PV with any existing areas?
+ */
+static int is_same_pv(struct pv_segment *prev, struct pv_area *pva)
+{
+	if (prev->pv == pva->map->pv)
+		return 1;
+
+	return 0;
+}
+
+static int _check_same_pv(struct lv_segment *prev_lvseg, struct pv_area *pva,
+			  struct pv_area **areas, uint32_t areas_size)
+{
+	return _find_and_set_pv_area(prev_lvseg, pva, areas, areas_size,
+				     is_same_pv);
+}
 
 /*
  * Choose sets of parallel areas to use, respecting any constraints.
@@ -771,9 +788,9 @@ static int _find_parallel_space(struct a
 	struct pv_area *pva;
 	struct pv_list *pvl;
 	unsigned already_found_one = 0;
-	unsigned contiguous = 0, contiguous_count = 0;
+	unsigned contiguous = 0, cling = 0, prefered_count = 0;
 	unsigned ix;
-	unsigned ix_offset = 0;	/* Offset for non-contiguous allocations */
+	unsigned ix_offset = 0;	/* Offset for non-prioritized allocations */
 	uint32_t max_parallel;	/* Maximum extents to allocate */
 	uint32_t next_le;
 	struct seg_pvs *spvs;
@@ -786,6 +803,9 @@ static int _find_parallel_space(struct a
 	if ((alloc == ALLOC_CONTIGUOUS) && prev_lvseg) {
 		contiguous = 1;
 		ix_offset = prev_lvseg->area_count;
+	} else if ((alloc == ALLOC_CLING) && prev_lvseg) {
+		cling = 1;
+		ix_offset = prev_lvseg->area_count;
 	}
 
 	/* FIXME This algorithm needs a lot of cleaning up! */
@@ -846,7 +866,16 @@ static int _find_parallel_space(struct a
 					    _check_contiguous(prev_lvseg,
 							      pva, areas,
 							      areas_size)) {
-						contiguous_count++;
+						prefered_count++;
+						goto next_pv;
+					}
+					continue;
+				} else if (cling) {
+					if (prev_lvseg &&
+					    _check_same_pv(prev_lvseg,
+							   pva, areas,
+							   areas_size)) {
+						prefered_count++;
 						goto next_pv;
 					}
 					continue;
@@ -875,7 +904,7 @@ static int _find_parallel_space(struct a
 				break;
 		}
 
-		if (contiguous && (contiguous_count < ix_offset))
+		if ((contiguous || cling) && (prefered_count < ix_offset))
 			break;
 
 		/* Only allocate log_area the first time around */
@@ -985,6 +1014,18 @@ static int _allocate(struct alloc_handle
 		goto finished;
 
 	old_allocated = allocated;
+	if (!_find_parallel_space(ah, ALLOC_CLING, pvms, areas,
+				  areas_size, can_split,
+				  prev_lvseg, &allocated, new_extents)) {
+		stack;
+		goto out;
+	}
+
+	if ((allocated == new_extents) || (ah->alloc == ALLOC_CLING) ||
+	    (!can_split && (allocated != old_allocated)))
+		goto finished;
+
+	old_allocated = allocated;
 	if (!_find_parallel_space(ah, ALLOC_NORMAL, pvms, areas,
 				  areas_size, can_split,
 				  prev_lvseg, &allocated, new_extents)) {
diff -X ../dontdiff -urp LVM2.05.use_for_each_pv/lib/metadata/metadata.h LVM2.06.alloc-cling/lib/metadata/metadata.h
--- LVM2.05.use_for_each_pv/lib/metadata/metadata.h	2006-10-05 19:45:15.000000000 -0400
+++ LVM2.06.alloc-cling/lib/metadata/metadata.h	2006-10-07 02:49:55.000000000 -0400
@@ -82,6 +82,7 @@ typedef enum {
 	ALLOC_INVALID = 0,
 	ALLOC_INHERIT,
 	ALLOC_CONTIGUOUS,
+	ALLOC_CLING,
 	ALLOC_NORMAL,
 	ALLOC_ANYWHERE
 } alloc_policy_t;
diff -X ../dontdiff -urp LVM2.05.use_for_each_pv/lib/report/report.c LVM2.06.alloc-cling/lib/report/report.c
--- LVM2.05.use_for_each_pv/lib/report/report.c	2006-10-05 19:45:16.000000000 -0400
+++ LVM2.06.alloc-cling/lib/report/report.c	2006-10-07 02:49:55.000000000 -0400
@@ -104,6 +104,8 @@ static char _alloc_policy_char(alloc_pol
 	switch (alloc) {
 	case ALLOC_CONTIGUOUS:
 		return 'c';
+	case ALLOC_CLING:
+		return 'C';
 	case ALLOC_NORMAL:
 		return 'n';
 	case ALLOC_ANYWHERE:
diff -X ../dontdiff -urp LVM2.05.use_for_each_pv/man/lvm.8 LVM2.06.alloc-cling/man/lvm.8
--- LVM2.05.use_for_each_pv/man/lvm.8	2006-08-23 04:18:58.000000000 -0400
+++ LVM2.06.alloc-cling/man/lvm.8	2006-10-07 02:49:55.000000000 -0400
@@ -136,7 +136,7 @@ Characters allowed in tags are: A-Z a-z 
 Delete the tag \fBtag\fP from a PV, VG or LV, if it's present.
 .TP
 \fB--alloc AllocationPolicy\fP
-The allocation policy to use: \fBcontiguous\fP, \fBnormal\fP, \fBanywhere\fP or \fBinherit\fP.
+The allocation policy to use: \fBcontiguous\fP, \fBcling\fP, \fBnormal\fP, \fBanywhere\fP or \fBinherit\fP.
 When a command needs to allocate physical extents from the volume group,
 the allocation policy controls how they are chosen.  
 Each volume group and logical volume has an allocation policy.
@@ -151,6 +151,8 @@ existing extents. If there are sufficien
 an allocation request but \fBnormal\fP doesn't use them,
 \fBanywhere\fP will - even if that reduces performance by
 placing two stripes on the same physical volume.
+The \fBcling\fP policy requires that new extents are on the same physical
+volume with existing extents.
 .IP
 N.B. The policies described above are not implemented fully yet.
 In particular, \fBcontiguous\fP does not place new extents adjacent to existing

--------------010509070904090003020101--
