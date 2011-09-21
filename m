From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:51 +0200
Message-Id: <1316623554-28975-33-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 32/35] fsadm: Update authorship of the fsadm
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

Add authorship into the fsadm header since the fsadm tool has been
significantly changed.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 95b26e2..d732525 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -14,7 +14,12 @@
 #
 # Author: Zdenek Kabelac <zkabelac@redhat.com>
 #
-# Script for resizing devices (usable for LVM resize)
+# Author: Lukas Czerner <lczerner@redhat.com>
+#    - Significantly extended fsadm functionality
+#    - Implemented new commands "add", "create", "list", "remove"
+#    - Rework of "resize" command
+#
+# Utility to manage logical volumes
 #
 # Needed utilities:
 #   mount, umount, grep, readlink, blockdev, blkid, fsck, xfs_check, bc, df
-- 
1.7.4.4
