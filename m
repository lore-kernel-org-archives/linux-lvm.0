From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:38 +0200
Message-Id: <1316623554-28975-20-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 19/35] fsadm: Align numbers to the decimal point
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

In "list" command align numbers to the decimal point for better
readability.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 7471377..db0fd4b 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -1025,7 +1025,7 @@ list_filesystems() {
 		[ ${#_mounted} -gt "0$len_mounted" ] && len_mounted=${#_mounted}
 	done
 
-	format="%-$(($len_volume+2))s %-$(($len_lvsize+2))s%-$(($len_fstype+2))s%-$(($len_free+2))s%-$(($len_used+2))s%-$(($len_total+2))s%-$(($len_segtype+2))s%-$(($len_mounted+2))s\n"
+	format="%-$(($len_volume+2))s %$(($len_lvsize))s  %-$(($len_fstype+2))s%$(($len_free))s  %$(($len_used))s  %$(($len_total))s  %-$(($len_segtype+2))s%-$(($len_mounted))s\n"
 	header=$(printf "$format" "Volume" "LV size" "FS" "Free" "Used" "Total" "Type" "Mount point")
 	separator=""
 	for i in $(seq ${#header}); do
@@ -1113,14 +1113,14 @@ list_devices() {
 		[ ${#_mounted} -gt "0$len_mounted" ] && len_mounted=${#_mounted}
 	done
 
-	format="%-$(($len_volume+2))s%-$(($len_free+2))s%-$(($len_used+2))s%-$(($len_total+2))s%-$(($len_group+2))s%-$(($len_mounted+2))s\n"
-	header=$(printf $format "Device" "Free" "Used" "Total" "Group" "Mount point")
+	format="%-$(($len_volume+2))s%$(($len_free))s  %$(($len_used))s  %$(($len_total))s  %-$(($len_group+2))s%-$(($len_mounted))s\n"
+	header=$(printf "$format" "Device" "Free" "Used" "Total" "Group" "Mount point")
 	separator=""
 	for i in $(seq ${#header}); do
 		separator+="-"
 	done
 	echo $separator
-	printf $format "Device" "Free" "Used" "Total" "Group" "Mount point"
+	printf "$format" "Device" "Free" "Used" "Total" "Group" "Mount point"
 	echo $separator
 
 	for i in $(seq $c); do
@@ -1173,14 +1173,14 @@ list_pool() {
 		[ ${#_total} -gt "0$len_total" ] && len_total=${#_total}
 	done
 
-	format="%-$(($len_group+2))s%-$(($len_devices+2))s%-$(($len_free+2))s%-$(($len_used+2))s%-$(($len_total+2))s\n"
-	header=$(printf $format "Group" "Devices" "Free" "Used" "Total")
+	format="%-$(($len_group+2))s%-$(($len_devices+2))s%$(($len_free))s  %$(($len_used))s  %$(($len_total))s\n"
+	header=$(printf "$format" "Group" "Devices" "Free" "Used" "Total")
 	separator=""
 	for i in $(seq ${#header}); do
 		separator+="-"
 	done
 	echo $separator
-	printf $format "Group" "Devices" "Free" "Used" "Total"
+	printf "$format" "Group" "Devices" "Free" "Used" "Total"
 	echo $separator
 
 	for i in $(seq $c); do
-- 
1.7.4.4
