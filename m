Message-ID: <452A7867.6010908@ce.jp.nec.com>
Date: Mon, 09 Oct 2006 12:27:19 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
References: <4526D08C.8010303@ce.jp.nec.com> <4526D0F6.7090406@ce.jp.nec.com>
	<20061007233846.GD17654@agk.surrey.redhat.com>
In-Reply-To: <20061007233846.GD17654@agk.surrey.redhat.com>
Content-Type: multipart/mixed; boundary="------------040807050401060900060102"
Subject: [linux-lvm] Re: [PATCH LVM2] (2/3) use _for_each_pv() from
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
--------------040807050401060900060102
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Alasdair G Kergon wrote:
>> This patch rewrites _check_contiguous() to use _for_each_pv().
>  
> I think the existing FIXME got dropped and I suspect there are problems
> with multiple levels of recursion.  (h->index++ ?)

I think the FIXME was intended for the case of stacked LV.
The index here is used to flatten the stacked LV to linear array
of PVs.
To complete it, we need to use the index in other places, too.

In _allocate(),
         /* Upper bound if none of the PVs in prev_lvseg is in pvms */
         /* FIXME Work size out properly */
         if (prev_lvseg)
                 areas_size += prev_lvseg->area_count;

and in _find_parallel_space(),
         if (prev_lvseg) {
                 ix_offset = prev_lvseg->area_count;

we can count the number of PVs constituting the last extent of
the prev_lvseg correctly by _for_each_pv().

What do you think about the attached patch?

It adds index calculation in _for_each_pv() (I replaced
'top_level_area_index' because it seemed aiming for similar
purpose) and fixes the 2 places above.
If you pass a pointer to counter, _for_each_pv() increments
the counter for each AREA_PV and passes the current number to
call back function. Upon return from the top level _for_each_pv(),
the counter should have the number of PVs in flattend LV.
As long as we use the same set of parameters for _for_each_pv(),
the counter value can be used as consistent index.

I also attached hypothetical metadata of stacked LV
(RAID0+1 and RAID10).

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America

--------------040807050401060900060102
Content-Type: text/x-patch;
 name="07-area_count-calculation-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="07-area_count-calculation-fix.patch"

diff -X dontdiff -urp LVM2/lib/metadata/lv_manip.c LVM2.07.calcfix/lib/metadata/lv_manip.c
--- LVM2/lib/metadata/lv_manip.c	2006-10-09 21:06:56.000000000 -0400
+++ LVM2.07.calcfix/lib/metadata/lv_manip.c	2006-10-09 21:24:59.000000000 -0400
@@ -680,7 +680,7 @@ static int _alloc_parallel_area(struct a
 static int _for_each_pv(struct cmd_context *cmd, struct logical_volume *lv,
 			uint32_t le, uint32_t len, uint32_t *max_seg_len,
 			uint32_t first_area, uint32_t max_areas,
-			int top_level_area_index,
+			uint32_t *flattend_area_index,
 			int only_single_area_segments,
 			int (*fn)(struct cmd_context *cmd,
 				  struct pv_segment *peg, uint32_t s,
@@ -720,13 +720,19 @@ static int _for_each_pv(struct cmd_conte
 					       area_len, max_seg_len,
 					       only_single_area_segments ? 0 : 0,
 					       only_single_area_segments ? 1 : 0,
-					       top_level_area_index != -1 ? top_level_area_index : s,
+					       flattend_area_index,
 					       only_single_area_segments, fn,
 					       data)))
 				stack;
-		} else if (seg_type(seg, s) == AREA_PV)
-			if (!(r = fn(cmd, seg_pvseg(seg, s), top_level_area_index != -1 ? top_level_area_index : s, data)))
+		} else if (seg_type(seg, s) == AREA_PV) {
+			if (fn && !(r = fn(cmd, seg_pvseg(seg, s),
+					   flattend_area_index != NULL ?
+						*flattend_area_index : s,
+					   data)))
 				stack;
+			if (flattend_area_index)
+				(*flattend_area_index)++;
+		}
 		if (r != 1)
 			return r;
 	}
@@ -734,7 +740,7 @@ static int _for_each_pv(struct cmd_conte
 	/* FIXME only_single_area_segments used as workaround to skip log LV - needs new param? */
 	if (!only_single_area_segments && seg_is_mirrored(seg) && seg->log_lv) {
 		if (!(r = _for_each_pv(cmd, seg->log_lv, 0, MIRROR_LOG_SIZE,
-				       NULL, 0, 0, 0, only_single_area_segments,
+				       NULL, 0, 0, NULL, only_single_area_segments,
 				       fn, data)))
 			stack;
 		if (r != 1)
@@ -832,7 +838,7 @@ static int _check_cling(struct cmd_conte
 	/* FIXME Cope with stacks by flattening */
 	if (!(r = _for_each_pv(cmd, prev_lvseg->lv,
 			       prev_lvseg->le + prev_lvseg->len - 1, 1, NULL,
-			       0, 0, -1, 1,
+			       0, 0, NULL, 1,
 			       _is_condition, &pvmatch)))
 		stack;
 
@@ -860,7 +866,7 @@ static int _check_contiguous(struct cmd_
 	/* FIXME Cope with stacks by flattening */
 	if (!(r = _for_each_pv(cmd, prev_lvseg->lv,
 			       prev_lvseg->le + prev_lvseg->len - 1, 1, NULL,
-			       0, 0, -1, 1,
+			       0, 0, NULL, 1,
 			       _is_condition, &pvmatch)))
 		stack;
 
@@ -885,7 +891,7 @@ static int _find_parallel_space(struct a
 	unsigned already_found_one = 0;
 	unsigned contiguous = 0, cling = 0, preferred_count = 0;
 	unsigned ix;
-	unsigned ix_offset = 0;	/* Offset for non-preferred allocations */
+	uint32_t ix_offset = 0;	/* Offset for non-preferred allocations */
 	uint32_t max_parallel;	/* Maximum extents to allocate */
 	uint32_t next_le;
 	struct seg_pvs *spvs;
@@ -896,7 +902,10 @@ static int _find_parallel_space(struct a
 
 	/* Are there any preceding segments we must follow on from? */
 	if (prev_lvseg) {
-		ix_offset = prev_lvseg->area_count;
+		if (!_for_each_pv(NULL, prev_lvseg->lv,
+				  prev_lvseg->le + prev_lvseg->len - 1, 1, NULL,
+				  0, 0, &ix_offset, 1, NULL, NULL))
+			return 0;
 		if ((alloc == ALLOC_CONTIGUOUS))
 			contiguous = 1;
 		else if ((alloc == ALLOC_CLING))
@@ -1092,9 +1101,14 @@ static int _allocate(struct alloc_handle
 	}
 
 	/* Upper bound if none of the PVs in prev_lvseg is in pvms */
-	/* FIXME Work size out properly */
-	if (prev_lvseg)
-		areas_size += prev_lvseg->area_count;
+	if (prev_lvseg) {
+		uint32_t prev_lvseg_areas;
+		if (!_for_each_pv(NULL, prev_lvseg->lv,
+				  prev_lvseg->le + prev_lvseg->len - 1, 1, NULL,
+				  0, 0, &prev_lvseg_areas, 1, NULL, NULL))
+			return 0;
+		areas_size += prev_lvseg_areas;
+	}
 
 	/* Allocate an array of pv_areas to hold the largest space on each PV */
 	if (!(areas = dm_malloc(sizeof(*areas) * areas_size))) {
@@ -1621,7 +1635,7 @@ struct list *build_parallel_areas_from_l
 		/* Find next segment end */
 		/* FIXME Unnecessary nesting! */
 		if (!_for_each_pv(cmd, lv, current_le, spvs->len, &spvs->len,
-				  0, 0, -1, 0, _add_pvs, (void *) spvs)) {
+				  0, 0, NULL, 0, _add_pvs, (void *) spvs)) {
 			stack;
 			return NULL;
 		}

--------------040807050401060900060102
Content-Type: text/plain;
 name="mirror-stripe.vg"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mirror-stripe.vg"

# Generated by LVM2: Mon Oct  9 20:30:07 2006

contents = "Text Format Volume Group"
version = 1

description = "Created *before* executing 'lvextend -l+1 mvg2/lvol2'"

creation_host = "tetsuo.lab"	# Linux tetsuo.lab 2.6.9-42.ELsmp #1 SMP Wed Jul 12 23:27:17 EDT 2006 i686
creation_time = 1160440207	# Mon Oct  9 20:30:07 2006

mvg2 {
	id = "AxZG1h-O6iz-YrBC-McFa-N252-NWZL-eLX1qy"
	seqno = 198
	status = ["RESIZEABLE", "READ", "WRITE"]
	extent_size = 8192		# 4 Megabytes
	max_lv = 0
	max_pv = 0

	physical_volumes {

		pv0 {
			id = "9EMez9-jHA3-FKBa-Ubtx-CkuB-WRlK-ZAIKiu"
			device = "/dev/sdc13"	# Hint only

			status = ["ALLOCATABLE"]
			dev_size = 3916160	# 1.86737 Gigabytes
			pe_start = 384
			pe_count = 478	# 1.86719 Gigabytes
		}

		pv1 {
			id = "CyCMk3-IJEW-v7FB-laN3-ZQAp-2Lia-MiA3H3"
			device = "/dev/sdc14"	# Hint only

			status = ["ALLOCATABLE"]
			dev_size = 3916160	# 1.86737 Gigabytes
			pe_start = 384
			pe_count = 478	# 1.86719 Gigabytes
		}
	}

	logical_volumes {

		lvol2 {
			id = "rqnWd1-o0ub-bQIv-x2Rw-o9Z6-KeSo-OAVWnf"
			status = ["READ", "WRITE", "VISIBLE"]
			segment_count = 1

			segment1 {
				start_extent = 0
				extent_count = 2	# 8 Megabytes

				type = "mirror"
				mirror_count = 2
				region_size = 1024

				mirrors = [
					"lvol2_mimage_0", 0,
					"lvol2_mimage_1", 0
				]
			}
		}

		lvol5 {
			id = "1ADDD2-16NG-HttH-0RN0-3ymb-P9Eg-TJBRjl"
			status = ["READ", "WRITE", "VISIBLE"]
			segment_count = 1

			segment1 {
				start_extent = 0
				extent_count = 2	# 8 Megabytes

				type = "striped"
				stripe_count = 2
				stripe_size = 128	# 64 Kilobytes

				stripes = [
					"lvol3", 0,
					"lvol4", 0
				]
			}
		}

		lvol0 {
			id = "1ADDD2-16NG-HttH-0RN0-3ymb-P9Eg-TJBRjs"
			status = ["READ", "WRITE"]
			segment_count = 1

			segment1 {
				start_extent = 0
				extent_count = 2	# 8 Megabytes

				type = "striped"
				stripe_count = 2
				stripe_size = 128	# 64 Kilobytes

				stripes = [
					"pv0", 0,
					"pv1", 0
				]
			}
		}

		lvol1 {
			id = "1ADDD2-16NG-HttH-0RN0-3ymb-P9Eg-TJBRjk"
			status = ["READ", "WRITE"]
			segment_count = 1

			segment1 {
				start_extent = 0
				extent_count = 2	# 8 Megabytes

				type = "striped"
				stripe_count = 2
				stripe_size = 128	# 64 Kilobytes

				stripes = [
					"pv0", 1,
					"pv1", 1
				]
			}
		}

		lvol2_mimage_0 {
			id = "6TZMZW-n0cV-UNT8-w2lk-xMNH-3Ejm-quLPlS"
			status = ["READ", "WRITE"]
			segment_count = 1

			segment1 {
				start_extent = 0
				extent_count = 2	# 8 Megabytes

				type = "striped"
				stripe_count = 1	# linear

				stripes = [
					"lvol0", 0
				]
			}
		}

		lvol2_mimage_1 {
			id = "mBeAfD-xomg-HvnK-ifJY-tzCf-yAcs-IqNKdr"
			status = ["READ", "WRITE"]
			segment_count = 1

			segment1 {
				start_extent = 0
				extent_count = 2	# 8 Megabytes

				type = "striped"
				stripe_count = 1	# linear

				stripes = [
					"lvol1", 0
				]
			}
		}

		lvol3 {
			id = "rqnWd1-o0ub-bQIv-x2Rw-o9Z6-KeSo-OAVWng"
			status = ["READ", "WRITE"]
			segment_count = 1

			segment1 {
				start_extent = 0
				extent_count = 1	# 4 Megabytes

				type = "mirror"
				mirror_count = 2
				region_size = 1024

				mirrors = [
					"lvol3_mimage_0", 0,
					"lvol3_mimage_1", 0
				]
			}
		}

		lvol3_mimage_0 {
			id = "6TZMZW-n0cV-UNT8-w2lk-xMNH-3Ejm-quLPlT"
			status = ["READ", "WRITE"]
			segment_count = 1

			segment1 {
				start_extent = 0
				extent_count = 1	# 4 Megabytes

				type = "striped"
				stripe_count = 1	# linear

				stripes = [
					"pv0", 2
				]
			}
		}

		lvol3_mimage_1 {
			id = "mBeAfD-xomg-HvnK-ifJY-tzCf-yAcs-IqNKds"
			status = ["READ", "WRITE"]
			segment_count = 1

			segment1 {
				start_extent = 0
				extent_count = 1	# 4 Megabytes

				type = "striped"
				stripe_count = 1	# linear

				stripes = [
					"pv1", 2
				]
			}
		}

		lvol4 {
			id = "rqnWd1-o0ub-bQIv-x2Rw-o9Z6-KeSo-OAVWnh"
			status = ["READ", "WRITE"]
			segment_count = 1

			segment1 {
				start_extent = 0
				extent_count = 1	# 4 Megabytes

				type = "mirror"
				mirror_count = 2
				region_size = 1024

				mirrors = [
					"lvol4_mimage_0", 0,
					"lvol4_mimage_1", 0
				]
			}
		}

		lvol4_mimage_0 {
			id = "6TZMZW-n0cV-UNT8-w2lk-xMNH-3Ejm-quLPlU"
			status = ["READ", "WRITE"]
			segment_count = 1

			segment1 {
				start_extent = 0
				extent_count = 1	# 4 Megabytes

				type = "striped"
				stripe_count = 1	# linear

				stripes = [
					"pv0", 3
				]
			}
		}

		lvol4_mimage_1 {
			id = "mBeAfD-xomg-HvnK-ifJY-tzCf-yAcs-IqNKdt"
			status = ["READ", "WRITE"]
			segment_count = 1

			segment1 {
				start_extent = 0
				extent_count = 1	# 4 Megabytes

				type = "striped"
				stripe_count = 1	# linear

				stripes = [
					"pv1", 3
				]
			}
		}
	}
}

--------------040807050401060900060102--
