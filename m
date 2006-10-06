Message-ID: <4526D00E.5070309@ce.jp.nec.com>
Date: Fri, 06 Oct 2006 17:52:14 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020708010009070402000007"
Subject: [linux-lvm] [PATCH LVM2] fix description of lvcreate --regionsize
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
--------------020708010009070402000007
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi,

While lvcreate man page says -R|--regionsize takes mirror region
size in "KB", it actually takes the parameter as "MB".
It's inconsistent.

This patch fixes man page to describe it as "MB".

Alternative fix could be change the line for regionsize_ARG in
tools/args.h as follows:
  arg(regionsize_ARG, 'R', "regionsize", size_kb_arg)
Then the command takes the argument as "KB".
This allows user to set smaller region size from command line
but breaks compatibility with older versions.

I'm not sure which one is better.
If someone needs to choose region size smaller than 1MB, you can do it:
# lvcreate --config "activation {mirror_region_size=4}" -m1 -L100M vg

diffstat:
 man/lvcreate.8 |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America

--------------020708010009070402000007
Content-Type: text/x-patch;
 name="03.1-lvcreate-regionsize-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="03.1-lvcreate-regionsize-fix.patch"

diff -X dontdiff -urp LVM2.02.alloclogspace/man/lvcreate.8 LVM2.03.regionsizefix/man/lvcreate.8
--- LVM2.02.alloclogspace/man/lvcreate.8	2006-10-05 19:45:16.000000000 -0400
+++ LVM2.03.regionsizefix/man/lvcreate.8	2006-10-06 21:11:08.000000000 -0400
@@ -11,10 +11,10 @@ lvcreate \- create a logical volume in a
 {\-l/\-\-extents LogicalExtentsNumber[%{VG|FREE}] |
  \-L/\-\-size LogicalVolumeSize[kKmMgGtT]}
 [\-M/\-\-persistent y/n] [\-\-minor minor]
-[\-m/\-\-mirrors Mirrors [\-\-nosync] [\-\-corelog]]
+[\-m/\-\-mirrors Mirrors [\-\-nosync] [\-\-corelog]
+[\-R/\-\-regionsize MirrorLogRegionSize]]
 [\-n/\-\-name LogicalVolumeName]
 [\-p/\-\-permission r/rw] [\-r/\-\-readahead ReadAheadSectors]
-[-R|--regionsize MirrorLogRegionSize]
 [\-t/\-\-test]
 [\-v/\-\-verbose] [\-Z/\-\-zero y/n]
 VolumeGroupName [PhysicalVolumePath...]
@@ -116,7 +116,7 @@ Set read ahead sector count of this logi
 Ignored by device-mapper.
 .TP
 .I \-R, \-\-regionsize MirrorLogRegionSize
-A mirror is divided into regions of this size (in KB), and the mirror log 
+A mirror is divided into regions of this size (in MB), and the mirror log 
 uses this granularity to track which regions are in sync.
 .TP
 .I \-s, \-\-snapshot

--------------020708010009070402000007--
