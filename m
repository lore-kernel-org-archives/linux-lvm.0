Message-ID: <4526D07B.5030103@ce.jp.nec.com>
Date: Fri, 06 Oct 2006 17:54:03 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070500090906060204080406"
Subject: [linux-lvm] [PATCH LVM2] add --regionsize option to lvconvert
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
--------------070500090906060204080406
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi,

For mirrored LV, you can set region size at creation.
However, you can't if you convert linear LV to mirrored LV.

Implementation is already there but the parser isn't set to
accept the parameter.
Attached patch enables it.

Region size conversion of existing mirror isn't implemented yet
and lvconvert rejects such request.

diffstat:
 man/lvconvert.8  |    6 +++++-
 tools/commands.h |    3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America

--------------070500090906060204080406
Content-Type: text/x-patch;
 name="03.2-lvconvert-regionsize-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="03.2-lvconvert-regionsize-fix.patch"

diff -X dontdiff -urp LVM2.02.alloclogspace/man/lvconvert.8 LVM2.03.regionsizefix/man/lvconvert.8
--- LVM2.02.alloclogspace/man/lvconvert.8	2006-08-18 18:27:01.000000000 -0400
+++ LVM2.03.regionsizefix/man/lvconvert.8	2006-10-06 21:09:07.000000000 -0400
@@ -3,7 +3,7 @@
 lvconvert \- convert a logical volume between linear and mirror
 .SH SYNOPSIS
 .B lvconvert
-[\-m/\-\-mirrors Mirrors [\-\-corelog]]
+[\-m/\-\-mirrors Mirrors [\-\-corelog] [\-R/\-\-regionsize MirrorLogRegionSize]]
 [\-A/\-\-alloc AllocationPolicy]
 [\-h/\-?/\-\-help]
 [\-v/\-\-verbose]
@@ -28,6 +28,10 @@ mirror from using a disk-based (persiste
 an in-memory log.  You may only specify this option
 when the \-\-mirror argument is the same degree of
 the mirror you are changing.
+.TP
+.I \-R, \-\-regionsize MirrorLogRegionSize
+A mirror is divided into regions of this size (in MB), and the mirror log
+uses this granularity to track which regions are in sync.
 .SH Examples
 "lvconvert -m1 vg00/lvol1"
 .br
diff -X dontdiff -urp LVM2.02.alloclogspace/tools/commands.h LVM2.03.regionsizefix/tools/commands.h
--- LVM2.02.alloclogspace/tools/commands.h	2006-10-05 19:45:16.000000000 -0400
+++ LVM2.03.regionsizefix/tools/commands.h	2006-10-06 21:06:16.000000000 -0400
@@ -83,6 +83,7 @@ xx(lvconvert,
    "Change logical volume layout",
    "lvconvert "
    "[-m|--mirrors Mirrors [--corelog]]\n"
+   "\t[-R|--regionsize MirrorLogRegionSize]\n"
    "\t[--alloc AllocationPolicy]\n"
    "\t[-d|--debug]\n"
    "\t[-h|-?|--help]\n"
@@ -100,7 +101,7 @@ xx(lvconvert,
    "\t[--version]" "\n"
    "\tOriginalLogicalVolume[Path] SnapshotLogicalVolume[Path]\n",
 
-   alloc_ARG, chunksize_ARG, mirrors_ARG, corelog_ARG,
+   alloc_ARG, chunksize_ARG, mirrors_ARG, corelog_ARG, regionsize_ARG,
    snapshot_ARG, test_ARG, zero_ARG)
 
 xx(lvcreate,

--------------070500090906060204080406--
