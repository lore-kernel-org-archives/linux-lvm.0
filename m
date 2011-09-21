From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:35 +0200
Message-Id: <1316623554-28975-17-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 16/35] fsadm: Use warn for warnings in list
	command
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

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 233b4fc..3b47a21 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -981,7 +981,7 @@ list_filesystems() {
 	IFS=$IFS_OLD
 
 	if [ $c -eq 0 ]; then
-		echo " No file systems suitable for managing by $TOOL found."
+		warn " No file systems suitable for managing by $TOOL found."
 		return
 	fi
 
@@ -1075,7 +1075,7 @@ list_devices() {
 	rm -f $tmp
 
 	if [ $c -eq 0 ]; then
-		echo " No devices found."
+		warn " No devices found."
 		return
 	fi
 
@@ -1138,7 +1138,7 @@ list_pool() {
 	IFS=$IFS_OLD
 
 	if [ $c -eq 0 ]; then
-		echo " No pools found on the system."
+		warn " No pools found on the system."
 		return
 	fi
 
-- 
1.7.4.4
