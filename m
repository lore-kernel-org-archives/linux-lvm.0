Message-ID: <44F47575.6090006@ce.jp.nec.com>
Date: Tue, 29 Aug 2006 13:12:21 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020008010807000406010106"
Subject: [linux-lvm] [PATCH LVM2] Fix _for_each_pv() to return correct
	segment end
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
--------------020008010807000406010106
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi,

_for_each_pv() is a function to walk through all PVs used by
given part of LV. The function is expected to set smallest length
of PV segment consists of the part of LV.
However, current code doesn't work as expected.

As a result, build_parallel_areas_from_lv() considers only the
first segment of the LV and fails to build appropriate list of
PVs to be avoided.

Attached patch fixes this problem.
Applicable to 2.02.09.

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America



--------------020008010807000406010106
Content-Type: text/x-patch;
	name="01-fix-for_each_pv-to-return-correct-segment-end.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="01-fix-for_each_pv-to-return-correct-segment-end.patch"

_for_each_pv() is a function to walk through all PVs used by
given part of LV. The function is expected to set smallest length
of PV segment consists of the part of LV.
However, current code doesn't work as expected.

As a result, build_parallel_areas_from_lv() considers only the
first segment of the LV and fails to build appropriate list of
PVs to be avoided.

diff -urp LVM2.00/lib/metadata/lv_manip.c LVM2.01/lib/metadata/lv_manip.c
--- LVM2.00/lib/metadata/lv_manip.c	2006-08-25 03:50:56.000000000 -0400
+++ LVM2.01/lib/metadata/lv_manip.c	2006-08-26 00:06:29.000000000 -0400
@@ -1358,7 +1358,7 @@ static int _for_each_pv(struct cmd_conte
 	/* Remaining logical length of segment */
 	remaining_seg_len = seg->len - (le - seg->le);
 
-	if (len > remaining_seg_len)
+	if (remaining_seg_len > len)
 		remaining_seg_len = len;
 
 	if (spvs->len > remaining_seg_len)

--------------020008010807000406010106--
