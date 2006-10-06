Message-ID: <4526D0C0.70804@ce.jp.nec.com>
Date: Fri, 06 Oct 2006 17:55:12 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
References: <4526D08C.8010303@ce.jp.nec.com>
In-Reply-To: <4526D08C.8010303@ce.jp.nec.com>
Content-Type: multipart/mixed; boundary="------------010601070505030500090803"
Subject: [linux-lvm] [PATCH LVM2] (1/3) remove unnecessary parameter from
	_check_contiguous
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
--------------010601070505030500090803
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

This patch removes 'struct physical_volume' from _check_contiguous.
The pv can be obtained later by pva->map->pv.

The patch doesn't fix any bug but is a preparation for later patch.

diffstat:
 lib/metadata/lv_manip.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America


--------------010601070505030500090803
Content-Type: text/x-patch;
	name="04-remove-unnecessary-arg-from-check_contiguous.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="04-remove-unnecessary-arg-from-check_contiguous.patch"

diff -X dontdiff -urp LVM2.03.regionsizefix/lib/metadata/lv_manip.c LVM2.04.shrink-checkcontig-arg/lib/metadata/lv_manip.c
--- LVM2.03.regionsizefix/lib/metadata/lv_manip.c	2006-10-05 20:21:27.000000000 -0400
+++ LVM2.04.shrink-checkcontig-arg/lib/metadata/lv_manip.c	2006-10-07 00:46:29.000000000 -0400
@@ -690,8 +690,7 @@ static int _comp_area(const void *l, con
 /*
  * Is pva contiguous to any existing areas or on the same PV?
  */
-static int _check_contiguous(struct lv_segment *prev_lvseg,
-			     struct physical_volume *pv, struct pv_area *pva,
+static int _check_contiguous(struct lv_segment *prev_lvseg, struct pv_area *pva,
 			     struct pv_area **areas, uint32_t areas_size)
 {
 	struct pv_segment *prev_pvseg;
@@ -703,7 +702,7 @@ static int _check_contiguous(struct lv_s
 			lastseg = list_item(list_last(&seg_lv(prev_lvseg, s)->segments), struct lv_segment);
 			/* FIXME For more areas supply flattened prev_lvseg to ensure consistency */
 			if (lastseg->area_count == 1 &&
-			    _check_contiguous(lastseg, pv, pva, &areas[s], 1))
+			    _check_contiguous(lastseg, pva, &areas[s], 1))
 				return 1;
 			continue;
 		}
@@ -711,7 +710,7 @@ static int _check_contiguous(struct lv_s
 		if (!(prev_pvseg = seg_pvseg(prev_lvseg, s)))
 			continue; /* FIXME Broken */
 
-		if ((prev_pvseg->pv != pv))
+		if ((prev_pvseg->pv != pva->map->pv))
 			continue;
 
 		if (prev_pvseg->pe + prev_pvseg->len == pva->start) {
@@ -907,7 +906,6 @@ static int _find_parallel_space(struct a
 				if (contiguous) {
 					if (prev_lvseg &&
 					    _check_contiguous(prev_lvseg,
-							      pvm->pv,
 							      pva, areas,
 							      areas_size)) {
 						contiguous_count++;

--------------010601070505030500090803--
