From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:25 +0200
Message-Id: <1316623554-28975-7-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 06/35] fsadm: Simple cleanup and comment update
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

Create new comments for various functions and update error messages.
Also remove not used name_exists() function.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   57 ++++++++++++++++++++++++++++++++++++++---------------
 1 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 3e9ed3b..91b0de3 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -395,6 +395,10 @@ resize_xfs() {
 	fi
 }
 
+#####################################
+# Create extN filesystem with respect
+# to the striped volume
+#####################################
 make_ext() {
 	device=$1
 	fstyp=$2
@@ -415,6 +419,9 @@ make_ext() {
 	dry mkfs.$fstyp $force -b$(($bsize*1024)) $extended $device
 }
 
+############################################
+# Create a file system just using mkfs.fstyp
+############################################
 generic_make_fs() {
 	device=$1
 	fstyp=$2
@@ -452,16 +459,10 @@ resize() {
 	cleanup 0
 }
 
-name_exists() {
-	cmd=$1
-	search=$2
-	$LVM $cmd --separator ' ' --noheadings --nosuffix 2>&1 | cut -d' ' -f3 | grep $search 2>&1> /dev/null
-	if [ $? -eq 0 ]; then
-		return 1
-	fi
-	return 0
-}
-
+#################################
+# Check the device list to detect
+# if there is not multiple groups
+#################################
 detect_device_group() {
 	devices=$@
 	ret=0
@@ -633,6 +634,10 @@ create() {
 	esac
 }
 
+#############################
+# Remove the logical volume
+# of the whole volume group
+#############################
 do_destroy() {
 	item=$1
 	device=
@@ -676,10 +681,10 @@ do_destroy() {
 	dry $LVM lvremove $FORCE $device
 }
 
-#############################
-# Remove the logical volume
-# of the whole volume group
-#############################
+###############################
+# Iterate through the arguments
+# and do_destroy on them
+###############################
 destroy() {
 	# help
 	if [ "$1" == "help" ]; then
@@ -718,6 +723,10 @@ humanize_size() {
 	echo "$size $unit"
 }
 
+#############################
+# Get size of entN filesystem
+# by reading tune2fs output
+#############################
 get_ext_size() {
 	IFS=$NL
 	for i in $(LANG=C $TUNE_EXT -l "$VOLUME"); do
@@ -739,6 +748,12 @@ get_ext_size() {
 	IFS=$IFS_OLD
 }
 
+############################
+# Get size of xfs file system
+# by reading the df output or
+# examine file system with
+# xfs_db tool
+#############################
 get_xfs_size() {
 	IFS=$NL
 	if [ -z $MOUNTED ]; then
@@ -787,6 +802,10 @@ detect_fs_size() {
 	return 0
 }
 
+#############################
+# List all file systems built
+# on top of DM device
+#############################
 list_filesystems() {
 	IFS=$NL
 	format="%-20s%-8s%-13s%-13s%-13s%s\n"
@@ -825,6 +844,9 @@ list_filesystems() {
 	IFS=$IFS_OLD
 }
 
+###########################
+# List all physical volumes
+###########################
 list_devices() {
 	IFS=$NL
 
@@ -858,12 +880,15 @@ list_devices() {
 		c=$((c+1))
 	done
 	if [ $c -eq 0 ]; then
-		echo " No devices found in the pool."
+		echo " No devices found."
 	fi
 	echo $separator
 	IFS=$IFS_OLD
 }
 
+################################
+# List all pools (volume groups)
+################################
 list_pool() {
 	IFS=$NL
 
@@ -897,7 +922,7 @@ list_pool() {
 		c=$((c+1))
 	done
 	if [ $c -eq 0 ]; then
-		echo " Pool is empty."
+		echo " No pools found on the system."
 	fi
 	echo $separator
 	IFS=$IFS_OLD
-- 
1.7.4.4
