From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:53 +0200
Message-Id: <1316623554-28975-35-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 34/35] test: Add test for fsadm create command
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zkabelac@redhat.com
Cc: Lukas Czerner <lczerner@redhat.com>, dchinner@redhat.com, rwheeler@redhat.com, linux-lvm@redhat.com

The tests exercises the fsadm "create" functionality, by trying various
combinations of arguments and checking the desired results. It also
tries to create volumes with various supported file systems.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 test/t-fsadm-create.sh |  112 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 112 insertions(+), 0 deletions(-)
 create mode 100644 test/t-fsadm-create.sh

diff --git a/test/t-fsadm-create.sh b/test/t-fsadm-create.sh
new file mode 100644
index 0000000..ccf3f9f
--- /dev/null
+++ b/test/t-fsadm-create.sh
@@ -0,0 +1,112 @@
+#!/bin/bash
+# Copyright (C) 2008-2010 Red Hat, Inc. All rights reserved.
+#
+# This copyrighted material is made available to anyone wishing to use,
+# modify, copy, or redistribute it subject to the terms and conditions
+# of the GNU General Public License v.2.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software Foundation,
+# Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+
+test_description='Exercise fsadm create'
+
+. lib/test
+
+DEV_COUNT=10
+DEV_SIZE=10
+TEST_MAX_SIZE=$(($DEV_COUNT*$DEV_SIZE))
+aux prepare_devs $DEV_COUNT $DEV_SIZE
+TEST_DEVS=$(cat DEVICES)
+export DEFAULT_POOL=$vg1
+export LVOL_PREFIX="lvol"
+lvol1=${LVOL_PREFIX}001
+lvol2=${LVOL_PREFIX}002
+lvol3=${LVOL_PREFIX}003
+
+pool1=$vg2
+pool2=$vg3
+
+TEST_FS=
+which mkfs.ext2 && TEST_FS+="ext2 "
+which mkfs.ext3 && TEST_FS+="ext3 "
+which mkfs.ext4 && TEST_FS+="ext4 "
+which mkfs.xfs  && TEST_FS+="xfs"
+
+_do_fsck() {
+	case $1 in
+		ext[234]) call="fsck.$1 -F -n" ;;
+		xfs) call="xfs_check" ;;
+		*) return 1 ;;
+	esac
+	$call $DM_DEV_DIR/$2
+}
+
+# Create volume with all devices at once
+fsadm create $TEST_DEVS
+check lv_field $DEFAULT_POOL/$lvol1 pv_count $DEV_COUNT
+fsadm -f remove $DEFAULT_POOL
+
+# Create the group first and then create volume using the whole group
+fsadm add $TEST_DEVS
+fsadm create
+check lv_field $DEFAULT_POOL/$lvol1 pv_count $DEV_COUNT
+fsadm -f remove $DEFAULT_POOL
+
+# Create a logical volume of fixed size
+size=$(($DEV_SIZE*6))
+fsadm create size=${size}M $TEST_DEVS
+size=$(align_size_up $size)
+check lv_field $DEFAULT_POOL/$lvol1 lv_size ${size}.00m
+fsadm -f remove $DEFAULT_POOL
+
+# Create a striped logical volume
+fsadm create stripesize=32 $TEST_DEVS
+check lv_field $DEFAULT_POOL/$lvol1 stripesize 32.00k
+fsadm  -f remove $DEFAULT_POOL
+
+# Create several volumes with different parameters
+fsadm  add $TEST_DEVS
+fsadm create stripesize=32 stripes=$(($DEV_COUNT/2)) size=$(($DEV_SIZE*2))M
+fsadm create stripesize=8 stripes=$((DEV_COUNT)) size=$(($DEV_SIZE*3))M
+fsadm create
+check lv_field $DEFAULT_POOL/$lvol1 stripesize 32.00k
+check lv_field $DEFAULT_POOL/$lvol1 stripes $(($DEV_COUNT/2))
+check lv_field $DEFAULT_POOL/$lvol2 stripesize 8.00k
+check lv_field $DEFAULT_POOL/$lvol2 stripes $DEV_COUNT
+check lv_field $DEFAULT_POOL/$lvol3 segtype linear
+fsadm  -f remove $DEFAULT_POOL
+
+# Create several volumes with different parameters from different groups
+fsadm add $dev1 $dev2 $dev3 $pool1
+fsadm create $pool1
+fsadm add $dev4 $dev5 $dev6 $pool2
+fsadm create stripesize=32 stripes=3 size=$(($DEV_SIZE*2))M $pool2
+fsadm create $dev7 $dev8 $dev9 stripesize=8
+check lv_field $DEFAULT_POOL/$lvol1 stripesize 8.00k
+check lv_field $pool1/$lvol1 pv_count 3
+check lv_field $pool2/$lvol1 stripesize 32.00k
+check lv_field $pool2/$lvol1 stripes 3
+fsadm  -f remove --all
+
+# Create logical volumes with file system
+for fs in $TEST_FS; do
+	fsadm create fs=$fs size=$(($DEV_SIZE*6))M $TEST_DEVS
+	check lv_field $DEFAULT_POOL/$lvol1 pv_count $DEV_COUNT
+	fsadm -f check ${DEFAULT_POOL}/$lvol1
+	_do_fsck $fs ${DEFAULT_POOL}/$lvol1
+	fsadm  -f remove $DEFAULT_POOL
+
+	fsadm create fs=$fs stripesize=32 size=$(($DEV_SIZE*6))M $TEST_DEVS
+	check lv_field $DEFAULT_POOL/$lvol1 pv_count $DEV_COUNT
+	check lv_field $DEFAULT_POOL/$lvol1 stripesize 32.00k
+	_do_fsck $fs ${DEFAULT_POOL}/$lvol1
+	fsadm  -f remove $DEFAULT_POOL
+
+	fsadm add $TEST_DEVS
+	fsadm create fs=$fs stripesize=8 stripes=$((DEV_COUNT/5)) size=$(($DEV_SIZE*2))M
+	check lv_field $DEFAULT_POOL/$lvol1 stripes $(($DEV_COUNT/5))
+	check lv_field $DEFAULT_POOL/$lvol1 stripesize 8.00k
+	_do_fsck $fs ${DEFAULT_POOL}/$lvol1
+	fsadm  -f remove $DEFAULT_POOL
+done
-- 
1.7.4.4
