Message-ID: <45770A5C.9050407@ce.jp.nec.com>
Date: Wed, 06 Dec 2006 13:22:20 -0500
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
References: <200612061148.01266.jens.wilke@de.ibm.com>
In-Reply-To: <200612061148.01266.jens.wilke@de.ibm.com>
Content-Type: multipart/mixed; boundary="------------080802020609070306030103"
Subject: [linux-lvm] Re: bug in CLING allocator on lv extend
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
To: Jens Wilke <jens.wilke@de.ibm.com>
Cc: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------080802020609070306030103
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi Jens,

Thanks for testing and detailed bug report.

Attached patch will fix the problem.
I have tested it with your test case and it works well.
Please check on your environment, too.

The cause of the problem was that _alloc_parallel_area()
in lib/metadata/lv_manip.c assumed either:
  - areas in "areas[]" are sorted in size
or
  - all areas in areas[] are large enough to fulfill the
    allocation request at once
So it's been ok just to check the last item of areas[]
for adjusting the allocation size.

Under the "cling" policy, this assumption is no longer true.

BTW, the bug was already fixed in the allocation patch set
posted to lvm-devel on Oct. 13, which is not yet accepted.

Jens Wilke wrote:
> I did some extensive tests of the new CLING allocator algorithm which
> should allow proper mirror extension.
> 
> Testing with CVS HEAD dated 1st december, this is the error I get on 
> lvextend in a specific test configuration:
> lvextend: metadata/pv_map.c:197: consume_pv_area: Assertion `to_go <= pva->count' failed.
> 
> The problem arises in case of an unbalanced amount of free space on the data disks,
> mimages twisted (mimage_1 on PV0), and a hole (or at least two areas, I suppose)
> that needs to be allocated.
> 
> The attached extendtest.sh is the generic code that leads to the error situation 
> (set environment varibales disk[0-2] and vg respectively).
> 
> The attached extendtest.vg is the meta data backup before the lvextend
> with 3 PVs of 128MB each.

-- 
Jun'ichi Nomura, NEC Corporation of America

--------------080802020609070306030103
Content-Type: text/x-patch;
	name="fix-alloc_parallel_area-for-unsorted-areas.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="fix-alloc_parallel_area-for-unsorted-areas.patch"

_alloc_parallel_area() assumes areas[] being sorted or every items
of areas[] being larger than or equal to area_len.
It's no longer true under "cling" allocation policy.
Because, areas[] are indexed based on the layout of previous LV segment
and some of the areas can be smaller than area_len.

Patch applicable to LVM2 2.02.16.

 lib/metadata/lv_manip.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- LVM2.orig/lib/metadata/lv_manip.c	30 Oct 2006 16:10:55 -0000	1.112
+++ LVM2/lib/metadata/lv_manip.c	6 Dec 2006 18:06:28 -0000
@@ -628,17 +628,17 @@ static int _alloc_parallel_area(struct a
 				struct pv_area **areas,
 				uint32_t *ix, struct pv_area *log_area)
 {
-	uint32_t area_len, smallest, remaining;
+	uint32_t area_len, remaining;
 	uint32_t s;
 	struct alloced_area *aa;
 
 	remaining = needed - *ix;
 	area_len = remaining / ah->area_multiple;
 
-	smallest = areas[ah->area_count - 1]->count;
-
-	if (area_len > smallest)
-		area_len = smallest;
+	/* adjust area_len to the smallest area */
+	for (s = 0; s < ah->area_count; s++)
+		if (area_len > areas[s]->count)
+			area_len = areas[s]->count;
 
 	if (!(aa = dm_pool_alloc(ah->mem, sizeof(*aa) *
 			      (ah->area_count + (log_area ? 1 : 0))))) {

--------------080802020609070306030103--
