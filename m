Message-ID: <44F47579.1040307@ce.jp.nec.com>
Date: Tue, 29 Aug 2006 13:12:25 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030603070301060301070207"
Subject: [linux-lvm] [PATCH LVM2] Fix max_parallel calculation
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
--------------030603070301060301070207
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi,

In _find_parallel_space(), there is 2 mistakes in calculation of
max_parallel (and *allocated).

  1. max_parallel and *allocated are number of extents multiplied by
     ah->area_multiple.
     So it needs to be divided by ah->area_multiple when it's used for
     stripe length calculation
  2. max_parallel specifies the total number of extents, not the newly
     allocated one.
     So it doesn't need to be offset by starting le.

As a result, allocation fails unexpectedly.

Typical failure cases:
  1) lvcreate --alloc contiguous fails for striped LV
     if requested LV size is larger than a PV size
  2) lvconvert -m to add mirror to existing LV fails
     if the existing LV has more than one segments

Attached patch fixes them.
Applicable to 2.02.09.

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America


--------------030603070301060301070207
Content-Type: text/x-patch;
 name="02-fix-max_parallel-calculation.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="02-fix-max_parallel-calculation.patch"

In _find_parallel_space(), there is 2 mistakes in calculation of
max_parallel (and *allocated).

  1. max_parallel and *allocated are number of extents multiplied by
     ah->area_multiple.
     So it needs to be divided by ah->area_multiple when it's used for
     stripe length calculation
  2. max_parallel specifies the total number of extents, not the newly
     allocated one.
     So it doesn't need to be offset by starting le.

Attached patch fixes them.
Otherwise, allocation fails unexpectedly.

Typical failure cases:
  1) lvcreate --alloc contiguous fails for striped LV
     if requested LV size is larger than a PV size
  2) lvconvert -m to add mirror to existing LV fails
     if the existing LV has more than one segments

diff -urp LVM2.01/lib/metadata/lv_manip.c LVM2.02/lib/metadata/lv_manip.c
--- LVM2.01/lib/metadata/lv_manip.c	2006-08-26 00:06:29.000000000 -0400
+++ LVM2.02/lib/metadata/lv_manip.c	2006-08-29 03:14:57.000000000 -0400
@@ -715,6 +715,12 @@ static int _find_parallel_space(struct a
 	do {
 		ix = 0;
 
+		/*
+		 * max_parallel and *allocated are number of extents
+		 * multiplied by ah->area_multiple.
+		 * So they should be divided by ah->area_multiple before
+		 * using for calcualtion of a stripe length.
+		 */
 		parallel_pvs = NULL;
 		max_parallel = needed;
 
@@ -723,11 +729,12 @@ static int _find_parallel_space(struct a
 		 * the maximum we can allocate in one go accordingly.
 		 */
 		if (ah->parallel_areas) {
+			next_le = (prev_lvseg ? prev_lvseg->le + prev_lvseg->len : 0) + (*allocated / ah->area_multiple);
 			list_iterate_items(spvs, ah->parallel_areas) {
-				next_le = (prev_lvseg ? prev_lvseg->le + prev_lvseg->len : 0) + *allocated;
-				if (next_le >= spvs->le) {
-					if (next_le + max_parallel > spvs->le + spvs->len)
-						max_parallel = (spvs->le + spvs->len - next_le) * ah->area_multiple;
+				if (next_le >= spvs->le &&
+				    next_le < spvs->le + spvs->len) {
+					if (max_parallel / ah->area_multiple > spvs->le + spvs->len)
+						max_parallel = (spvs->le + spvs->len) * ah->area_multiple;
 					parallel_pvs = &spvs->pvs;
 					break;
 				}
@@ -773,7 +780,7 @@ static int _find_parallel_space(struct a
 				}
 
 				/* Is it big enough on its own? */
-				if ((pva->count < max_parallel - *allocated) &&
+				if ((pva->count < (max_parallel - *allocated) / ah->area_multiple) &&
 				    ((!can_split && !ah->log_count) ||
 				     (already_found_one &&
 				      !(alloc == ALLOC_ANYWHERE))))

--------------030603070301060301070207--
