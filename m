Message-ID: <44ECCE2D.5060002@ce.jp.nec.com>
Date: Wed, 23 Aug 2006 17:52:45 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010405030707050706020508"
Subject: [linux-lvm] [PATCH] Fix lvextend spoiling redundancy of mirror LV
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
--------------010405030707050706020508
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi,

lvextend doesn't allocate extents appropriately if the LV is mirrored.
Attached patch fixes the problem.
If this looks reasonable, please consider to include in LVM2.

Details of the problem:

Suppose I have 4 PVs with sufficient free space and a 2-sided
mirrored LV with size=4MB, I would expect the following LV
as a result of "lvextend -L+4MB":

# lvs -a -olv_name,seg_size,devices vg4
  LV             SSize Devices
  lv0            8.00M lv0_mimage_0(0),lv0_mimage_1(0)
  [lv0_mimage_0] 8.00M /dev/sda(0)
  [lv0_mimage_1] 8.00M /dev/sdb(0)
  [lv0_mlog]     4.00M /dev/sdc(0)

However, actual result was following:

# lvs -a -olv_name,seg_size,devices vg4
  LV             SSize Devices
  lv0            8.00M lv0_mimage_0(0),lv0_mimage_1(0)
  [lv0_mimage_0] 4.00M /dev/sda(0)
  [lv0_mimage_0] 4.00M /dev/sdd(0)
  [lv0_mimage_1] 4.00M /dev/sdb(0)
  [lv0_mimage_1] 4.00M /dev/sda(1)
  [lv0_mlog]     4.00M /dev/sdc(0)

In this case, failure of a PV (/dev/sda) would break whole LV (lv0),
which is not what we expect from mirrored LV.

The cause of the problem is that _check_contiguous() doesn't care
layered LV and cannot find out contiguousness between PV areas.

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America


--------------010405030707050706020508
Content-Type: text/x-patch;
 name="fix-lvextend-spoiling-redundancy.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="fix-lvextend-spoiling-redundancy.patch"

Finding contiguous PV segment for mirrored LV.
Check areas[] boundary in _check_contiguous().

Applicable to LVM2 2.02.09.

Steps to reproduce the problem:
  # pvcreate /dev/sd[abcd]
  # vgcreate vg4 /dev/sd[abcd]
  # lvcreate -l1 -m1 -nlv0 vg4
  # lvchange -an vg4/lv0
  # lvextend -l+1 vg4/lv0
  # lvs -a -olv_name,seg_size,devices vg4

--- LVM2/lib/metadata/lv_manip.c        2006-08-23 04:26:43.000000000 -0400
+++ LVM2.fix/lib/metadata/lv_manip.c    2006-08-23 04:29:37.000000000 -0400
@@ -642,12 +642,24 @@ static int _comp_area(const void *l, con
  */
 static int _check_contiguous(struct lv_segment *prev_lvseg,
 			     struct physical_volume *pv, struct pv_area *pva,
-			     struct pv_area **areas)
+			     struct pv_area **areas, uint32_t areas_size)
 {
 	struct pv_segment *prev_pvseg;
 	uint32_t s;
 
-	for (s = 0; s < prev_lvseg->area_count; s++) {
+	for (s = 0; s < prev_lvseg->area_count && s < areas_size; s++) {
+		if (seg_type(prev_lvseg, s) == AREA_LV) {
+			struct logical_volume *lv;
+			struct lv_segment *lastseg;
+			lv = seg_lv(prev_lvseg, s);
+			lastseg = list_item(list_last(&lv->segments),
+					    struct lv_segment);
+			if (_check_contiguous(lastseg, pv, pva, &areas[s],
+					      areas_size - s))
+				return 1;
+			continue;
+		}
+
 		if (seg_type(prev_lvseg, s) != AREA_PV)
 			continue;	/* FIXME Broken */
 
@@ -752,7 +764,8 @@ static int _find_parallel_space(struct a
 					if (prev_lvseg &&
 					    _check_contiguous(prev_lvseg,
 							      pvm->pv,
-							      pva, areas)) {
+							      pva, areas,
+							      areas_size)) {
 						contiguous_count++;
 						goto next_pv;
 					}


--------------010405030707050706020508--
