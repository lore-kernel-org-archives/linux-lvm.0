Message-ID: <4514649E.2040403@ce.jp.nec.com>
Date: Fri, 22 Sep 2006 18:33:02 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
References: <45146347.3070804@ce.jp.nec.com>
In-Reply-To: <45146347.3070804@ce.jp.nec.com>
Content-Type: multipart/mixed; boundary="------------080504010906090201030202"
Subject: [linux-lvm] [PATCH LVM2 2/2] fix lvconvert to setup mirror
	constraints
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
--------------080504010906090201030202
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

This patch fixes this problem:
  - 'lvconvert' from corelog allocates log from the same PV
    with other image. It spoils redundancy.

The patch depends on fix-mirror-alloc-anywhere.patch posted formerly.

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America

--------------080504010906090201030202
Content-Type: text/x-patch;
 name="fix-lvconvert-allocate-disklog.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fix-lvconvert-allocate-disklog.patch"

diff -X dontdiff -urp LVM2/tools/lvconvert.c LVM2.fixed/tools/lvconvert.c
--- LVM2/tools/lvconvert.c	2006-08-30 05:57:31.000000000 -0400
+++ LVM2.fixed/tools/lvconvert.c	2006-09-15 00:00:33.000000000 -0400
@@ -281,15 +281,10 @@ static int lvconvert_mirrors(struct cmd_
 			if (lp->mirrors == existing_mirrors) {
 				if (!seg->log_lv && !arg_count(cmd, corelog_ARG)) {
 					/* No disk log present, add one. */
-					/* FIXME: Why doesn't this work?  Without
-					   it, we will probably put the log on the
-					   same device as a mirror leg.
-					  if (!(parallel_areas = build_parallel_areas_from_lv(cmd, lv))) {
-					  stack;
-					  return 0;
-					  }
-					*/
-					parallel_areas = NULL;
+					if (!(parallel_areas = build_parallel_areas_from_lv(cmd, lv))) {
+						stack;
+						return 0;
+					}
 					if (!lv_mirror_percent(cmd, lv, 0, &sync_percent, NULL)) {
 						log_error("Unable to determine mirror sync status.");
 						return 0;

--------------080504010906090201030202--
