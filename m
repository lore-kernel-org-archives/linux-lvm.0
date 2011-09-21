From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:52 +0200
Message-Id: <1316623554-28975-34-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 33/35] test: Add test for fsadm add command
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

The tests exercises the fsadm "add" functionality, by trying various
combinations of arguments and checking the desired results.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 test/t-fsadm-add.sh |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 test/t-fsadm-add.sh

diff --git a/test/t-fsadm-add.sh b/test/t-fsadm-add.sh
new file mode 100644
index 0000000..c2d310e
--- /dev/null
+++ b/test/t-fsadm-add.sh
@@ -0,0 +1,48 @@
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
+test_description='Exercise fsadm add'
+
+. lib/test
+
+DEV_COUNT=10
+aux prepare_devs $DEV_COUNT 10
+TEST_DEVS=$(cat DEVICES)
+export DEFAULT_POOL=$vg1
+
+pool1=$vg2
+pool2=$vg3
+
+# Create default pool with all devices at once
+fsadm add $TEST_DEVS
+check vg_field $DEFAULT_POOL pv_count $DEV_COUNT
+fsadm -f remove $DEFAULT_POOL
+
+# Create default pool by adding devices one per a call
+for i in $TEST_DEVS; do
+        fsadm add $i
+done
+check vg_field $DEFAULT_POOL pv_count $DEV_COUNT
+fsadm -f remove $DEFAULT_POOL
+
+# Create different groups from different devices
+fsadm add $dev1 $dev2 $dev3 $pool1
+fsadm add $dev4 $dev5 $dev6
+fsadm add $dev7 $dev8 $dev9 $pool2
+fsadm add $dev10 $pool2
+check vg_field $DEFAULT_POOL pv_count 3
+check vg_field $pool1 pv_count 3
+check vg_field $pool2 pv_count 4
+
+# Simple remove check
+fsadm -f remove $pool1 $pool2
+check vg_field $pool3 pv_count 4
+fsadm -f remove $pool3
-- 
1.7.4.4
