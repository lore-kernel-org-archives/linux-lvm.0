From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:24 +0200
Message-Id: <1316623554-28975-6-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 05/35] fsadm: Teach "destroy" command to take
	more arguments
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

This commit teaches the destroy command to remove more groups or lvs at
one invocation by specifying more arguments.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   59 ++++++++++++++++++++++++++++++++----------------------
 1 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 00b5019..3e9ed3b 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -125,6 +125,10 @@ error() {
 	cleanup 1
 }
 
+warn() {
+	echo "$TOOL: $@" >&2
+}
+
 dry() {
 	if [ "$DRY" -ne 0 ]; then
 		verbose "Dry execution $@"
@@ -517,8 +521,8 @@ create() {
 
 	detect_device_group $devices
 	if [ $? -ne 0 ]; then
-		error "Some of the devices are in different groups. Please run \
-			\"$TOOL list\" to get more information on layout."
+		error "Devices are in different groups. Please run "\
+			"\"$TOOL list\" to get more information on layout."
 	fi
 	if [ $GROUP ] && [ $vgname ];then
 		if [ "$vgname" != "$GROUP" ]; then
@@ -629,29 +633,19 @@ create() {
 	esac
 }
 
-#############################
-# Remove the logical volume
-# of the whole volume group
-#############################
-destroy() {
-	if [ $# -gt 2 ]; then
-		error "Wrong option for destroy. (see: $TOOL --help)"
-	fi
-
-	# help
-	if [ "$1" == "help" ]; then
-		echo "Usage: $TOOL destroy [mount point | dm device | voulume group]"
-		exit 0
-	fi
+do_destroy() {
+	item=$1
+	device=
+	MOUNTED=
 
 	# Block device has been given
-	if [ -b $1 ]; then
-		device=$1
+	if [ -b $item ]; then
+		device=$item
 	fi
 
 	# Mount point has been given
-	if [ -z $device ] && [ -d $1 ]; then
-		mp=$(echo $1 | sed -e 's/\/$//')
+	if [ -z $device ] && [ -d $item ]; then
+		mp=$(echo $item | sed -e 's/\/$//')
 
 		count=$($GREP " $mp " $PROCMOUNTS | wc -l)
 
@@ -659,22 +653,22 @@ destroy() {
 			device=$($GREP " $mp " $PROCMOUNTS | cut -d' ' -f1)
 		else
 			count=$(LANG=C $MOUNT | $GREP " $mp " | wc -l)
-			[ $count -ne 1 ] && error "Could not find device mounted at $mp"
+			[ $count -ne 1 ] && warn "Could not find device mounted at $mp" && return
 			device=$(LANG=C $MOUNT | $GREP " $mp " | cut -d' ' -f1)
 		fi
 		MOUNTED=$device
 	fi
 
 	if [ -z $device ]; then
-		$LVM vgs $1 &> /dev/null
+		$LVM vgs $item &> /dev/null
 		# Volume group has been given
 		if [ $? -eq 0 ]; then
-			dry $LVM vgremove $FORCE $1
+			dry $LVM vgremove $FORCE $item
 			return 0
 		fi
 	fi
 
-	[ -z $device ] && error "$1 is not a valid mount point, dm device nor volume group name."
+	[ -z $device ] && warn "$item is not a valid mount point, dm device nor volume group name."&& return
 
 	if [ $MOUNTED ]; then
 		try_umount
@@ -682,6 +676,23 @@ destroy() {
 	dry $LVM lvremove $FORCE $device
 }
 
+#############################
+# Remove the logical volume
+# of the whole volume group
+#############################
+destroy() {
+	# help
+	if [ "$1" == "help" ]; then
+		echo "Usage: $TOOL destroy [mount point | dm device | voulume group]"
+		exit 0
+	fi
+
+	for item in $@; do
+		do_destroy $item
+	done
+
+}
+
 #####################################
 # Convet the size into human readable
 # form. size in KiB expected
-- 
1.7.4.4
