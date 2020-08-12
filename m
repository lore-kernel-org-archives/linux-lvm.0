Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39F952157F23
	for <linux-lvm@redhat.com>; Wed, 12 Aug 2020 11:18:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82BB61859160
	for <linux-lvm@redhat.com>; Wed, 12 Aug 2020 11:18:50 +0000 (UTC)
From: Zhao Heming <heming.zhao@suse.com>
Date: Wed, 12 Aug 2020 19:18:31 +0800
Message-Id: <1597231111-28086-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH] tests: use correct RA size,
	underly dev & delay time.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: Zhao Heming <heming.zhao@suse.com>

lvconvert-repair-raid.sh:
- in some env, the delay=0 is too short to set up env.

lvcreate-usage.sh:
- use correct underlying dev for brd & loop devices.
- read ahead size should equal or bigger than current system value

read-ahead.sh:
- use current system ra_size PLUS 128 to set up new ra_size.
  for detail, refer _set_dev_node_read_ahead in libdm-common.c

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
 test/shell/lvconvert-repair-raid.sh |  2 +-
 test/shell/lvcreate-usage.sh        | 11 ++++++-----
 test/shell/read-ahead.sh            |  6 ++++--
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/test/shell/lvconvert-repair-raid.sh b/test/shell/lvconvert-repair-raid.sh
index 711f386..b2c6a6f 100644
--- a/test/shell/lvconvert-repair-raid.sh
+++ b/test/shell/lvconvert-repair-raid.sh
@@ -39,7 +39,7 @@ function delay
 RAID_SIZE=32
 
 # Fast sync and repair afterwards
-delay 0
+delay 1
 
 # RAID1 transient failure check
 lvcreate --type raid1 -m 1 -L $RAID_SIZE -n $lv1 $vg "$dev1" "$dev2"
diff --git a/test/shell/lvcreate-usage.sh b/test/shell/lvcreate-usage.sh
index 6d46939..4102a2c 100644
--- a/test/shell/lvcreate-usage.sh
+++ b/test/shell/lvcreate-usage.sh
@@ -178,18 +178,19 @@ check lv_field $vg/$lv3 lv_kernel_read_ahead "8.00k"
 lvcreate -L 8 -n $lv4 --readahead auto $vg "$dev1"
 check lv_field $vg/$lv4 lv_read_ahead "auto"
 # figure RA value of a PV origin device
-DEVICE=$(dmsetup deps -o blkdevname "$dev1" | sed -e "s,.*:\ (\(.*\)),/dev/\1,")
+DEVICE=$dev1
 RASZ=$(( $(blockdev --getra "$DEVICE" ) / 2 ))
 test "$RASZ" -ge 128 || RASZ="128"
 check lv_field $vg/$lv4 lv_kernel_read_ahead "${RASZ}.00k" --units k
 lvcreate -vvvvv -L 8 -n $lv5 -i2 --stripesize 16k --readahead auto $vg
 check lv_field $vg/$lv5 lv_read_ahead "auto"
-# For 16k stripe we set '128k' as the is the minimum size we get when creating DM device
-check lv_field $vg/$lv5 lv_kernel_read_ahead "128.00k" --units k
-lvcreate -L 8 -n $lv6 -i2 --stripesize 128k --readahead auto $vg
+# For 16k stripe we set '$RASZ' as the is the minimum size we get when creating DM device
+check lv_field $vg/$lv5 lv_kernel_read_ahead "${RASZ}.00k" --units k
+lvcreate -L 8 -n $lv6 -i2 --stripesize "${RASZ}"k --readahead auto $vg
 check lv_field $vg/$lv6 lv_read_ahead "auto"
 # For striped device we set double of strip size unrelated to underlaying dev RA size
-check lv_field $vg/$lv6 lv_kernel_read_ahead "512.00k" --units k
+RASZ=$(expr ${RASZ} \* 4)
+check lv_field $vg/$lv6 lv_kernel_read_ahead "${RASZ}.00k" --units k
 lvremove -ff $vg
 
 #
diff --git a/test/shell/read-ahead.sh b/test/shell/read-ahead.sh
index 2f061fa..46a88e6 100644
--- a/test/shell/read-ahead.sh
+++ b/test/shell/read-ahead.sh
@@ -33,11 +33,13 @@ check lv_field $vg/$lv lv_read_ahead 640 --units s --nosuffix
 lvremove -ff $vg
 
 #COMM "read ahead is properly inherited from underlying PV"
-blockdev --setra 768 "$dev1"
+SET_RA=$(blockdev --getra "$dev1")
+SET_RA=$(expr ${SET_RA} + 128)
+blockdev --setra ${SET_RA} "$dev1"
 vgscan
 # is there something in the system changing readahead settings behind the scene...
 RASZ=$(blockdev --getra "$dev1")
-test "$RASZ" -ge 768 || RASZ=768
+test "$RASZ" -ge SET_RA || RASZ=${SET_RA}
 lvcreate -n $lv -L4m $vg "$dev1"
 test "$(blockdev --getra "$DM_DEV_DIR/$vg/$lv")" -eq "$RASZ"
 lvremove -ff $vg
-- 
1.8.3.1
