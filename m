From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:54 +0200
Message-Id: <1316623554-28975-36-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 35/35] test: Add test for fsadm resize command
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

The tests exercises the fsadm "resize" functionality, by trying various
combinations of arguments and checking the desired results. It also
tries to create and resize volumes with various supported file systems,
checking the resulting size.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 test/t-fsadm-resize.sh |  113 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 113 insertions(+), 0 deletions(-)
 create mode 100644 test/t-fsadm-resize.sh

diff --git a/test/t-fsadm-resize.sh b/test/t-fsadm-resize.sh
new file mode 100644
index 0000000..59c3e75
--- /dev/null
+++ b/test/t-fsadm-resize.sh
@@ -0,0 +1,113 @@
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
+DEFAULT_VOLUME=${DEFAULT_POOL}/$lvol1
+
+TEST_FS=
+which mkfs.ext2 && TEST_FS+="ext2 "
+which mkfs.ext3 && TEST_FS+="ext3 "
+which mkfs.ext4 && TEST_FS+="ext4 "
+which mkfs.xfs  && TEST_FS+="xfs"
+
+TEST_MNT=$TESTDIR/mnt
+
+_test_resize()
+{
+	size=$((TEST_MAX_SIZE/2))
+	fsadm -y resize size=${size}M ${DM_DEV_DIR}/$DEFAULT_VOLUME
+	size=$(align_size_up $size)
+	check lv_field $DEFAULT_POOL/$lvol1 lv_size ${size}.00m
+
+	# xfs does not support shrinking (xfs only grows big!! :))
+	if [ "$fs" != "xfs" ]; then
+		fsadm -f -y -v resize size=-$(($TEST_MAX_SIZE/4))M $DEFAULT_VOLUME
+		size=$(align_size_up $(($size-($TEST_MAX_SIZE/4))))
+		check lv_field $DEFAULT_POOL/$lvol1 lv_size ${size}.00m
+	fi
+	fsadm -y -v resize size=+$(($TEST_MAX_SIZE/5))M $DEFAULT_VOLUME
+	size=$(align_size_up $(($size+($TEST_MAX_SIZE/5))))
+	check lv_field $DEFAULT_POOL/$lvol1 lv_size ${size}.00m
+}
+
+fsadm add $TEST_DEVS
+size=$((TEST_MAX_SIZE/3))
+fsadm create size=${size}M $TEST_DEVS
+size=$(align_size_up $size)
+check lv_field $DEFAULT_POOL/$lvol1 lv_size ${size}.00m
+
+fsadm -y resize size=+$(($TEST_MAX_SIZE/3))M ${DM_DEV_DIR}/$DEFAULT_VOLUME
+size=$(align_size_up $(($size+($TEST_MAX_SIZE/3))))
+check lv_field $DEFAULT_POOL/$lvol1 lv_size ${size}.00m
+
+fsadm -f -y resize size=-$(($TEST_MAX_SIZE/2))M $DEFAULT_VOLUME
+size=$(align_size_up $(($size-($TEST_MAX_SIZE/2))))
+check lv_field $DEFAULT_POOL/$lvol1 lv_size ${size}.00m
+
+fsadm -y resize size=$(($TEST_MAX_SIZE/2))M $DEFAULT_VOLUME
+size=$(align_size_up $(($TEST_MAX_SIZE/2)))
+check lv_field $DEFAULT_POOL/$lvol1 lv_size ${size}.00m
+fsadm -f remove $DEFAULT_POOL
+
+fsadm create $dev1
+check lv_field $DEFAULT_POOL/$lvol1 pv_count 1
+devs=${TEST_DEVS##*$dev1 }
+fsadm resize size=+$((TEST_MAX_SIZE/2))M $DEFAULT_VOLUME $devs
+check lv_field $DEFAULT_POOL/$lvol1 pv_count $DEV_COUNT
+fsadm -f remove $DEFAULT_POOL
+
+fsadm create $dev1
+check lv_field $DEFAULT_POOL/$lvol1 pv_count 1
+devs=${TEST_DEVS##*$dev1 }
+fsadm resize size=$((TEST_MAX_SIZE/2))M ${DM_DEV_DIR}/$DEFAULT_VOLUME $devs
+check lv_field $DEFAULT_POOL/$lvol1 pv_count $DEV_COUNT
+fsadm -f remove $DEFAULT_POOL
+
+[ ! -d $TEST_MNT ] && mkdir $TEST_MNT &> /dev/null
+for fs in $TEST_FS; do
+	# umounted test
+	fsadm add $TEST_DEVS
+	size=$((TEST_MAX_SIZE/4))
+	fsadm create fs=$fs size=${size}M $TEST_DEVS
+
+	_test_resize
+	fsadm -f check $DEFAULT_VOLUME
+	fsadm -f remove $DEFAULT_POOL
+
+	# mounted test
+	fsadm add $TEST_DEVS
+	size=$((TEST_MAX_SIZE/4))
+	fsadm create fs=$fs size=${size}M $TEST_DEVS
+
+	mount ${DM_DEV_DIR}/$DEFAULT_VOLUME $TEST_MNT
+
+	_test_resize
+
+	umount $TEST_MNT
+	fsadm -f check $DEFAULT_VOLUME
+	fsadm -f remove $DEFAULT_POOL
+done
-- 
1.7.4.4
