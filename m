From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:49 +0200
Message-Id: <1316623554-28975-31-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 30/35] test: add helper to compute aligned lv
	size
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

For test purposes add a helper function to compute lv size as it
would be done by lvm tools.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 test/lib/utils.sh |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/test/lib/utils.sh b/test/lib/utils.sh
index 4c3cd93..c555e45 100644
--- a/test/lib/utils.sh
+++ b/test/lib/utils.sh
@@ -177,6 +177,29 @@ kernel_at_least() {
     return 1
 }
 
+align_size_up() {
+    size=$1
+    [ -z $2 ] && stripes=0
+    [ -z $3 ] && extent=4
+
+    [ -z $size ] || [ -z $stripes ] || [ -z $extent ] && exit 1
+
+    tmp=$((size%extent))
+    if [ $tmp -ne 0 ]; then
+        size=$(($size+($extent-$tmp)))
+    fi
+    if [ $stripes -eq 0 ]; then
+        echo "$size"
+        return 0
+    fi
+    extents=$(($size/$extent))
+    tmp=$(($extents%$stripes))
+    if [ $tmp -ne 0 ]; then
+        extents=$(($extents-$tmp+$stripes))
+    fi
+    echo "$(($extents*$extent))"
+}
+
 . lib/paths || { echo >&2 you must run make first; exit 1; }
 
 PATH=$abs_top_builddir/test/lib:$PATH
-- 
1.7.4.4
