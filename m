From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:22 +0200
Message-Id: <1316623554-28975-4-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 03/35] fsadm: Add "list" command
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

List command provides the functionality of listing useful information
about the logical volumes, file systems and devices.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |  231 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 229 insertions(+), 2 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 2895371..803c6a5 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -17,7 +17,8 @@
 # Script for resizing devices (usable for LVM resize)
 #
 # Needed utilities:
-#   mount, umount, grep, readlink, blockdev, blkid, fsck, xfs_check
+#   mount, umount, grep, readlink, blockdev, blkid, fsck, xfs_check, bc, df
+#   xfs_db
 #
 # ext2/ext3/ext4: resize2fs, tune2fs
 # reiserfs: resize_reiserfs, reiserfstune
@@ -54,6 +55,8 @@ READLINK=readlink
 READLINK_E="-e"
 FSCK=fsck
 XFS_CHECK=xfs_check
+BC=bc
+DF=df
 
 # user may override lvm location by setting LVM_BINARY
 LVM=${LVM_BINARY:-lvm}
@@ -74,6 +77,8 @@ MOUNTPOINT=
 MOUNTED=
 REMOUNT=
 PROCMOUNTS="/proc/mounts"
+PROCDEVICES="/proc/devices"
+PROCPARTITIONS="/proc/partitions"
 NULL="$DM_DEV_DIR/null"
 
 MAX_VGS=999
@@ -202,7 +207,6 @@ detect_fs() {
 	FSTYPE=$("$BLKID" -c "$NULL" -s TYPE "$VOLUME") || error "Cannot get FSTYPE of \"$VOLUME\""
 	FSTYPE=${FSTYPE##*TYPE=\"} # cut quotation marks
 	FSTYPE=${FSTYPE%%\"*}
-	verbose "\"$FSTYPE\" filesystem found on \"$VOLUME\""
 }
 
 # check if the given device is already mounted and where
@@ -413,6 +417,7 @@ generic_make_fs() {
 resize() {
 	NEWSIZE=$2
 	detect_fs "$1"
+	verbose "\"$FSTYPE\" filesystem found on \"$VOLUME\""
 	is_natural $NEWSIZE
 	[ $? -ne 1 ] && error "$NEWSIZE is not valid number for file system size"
 	detect_device_size
@@ -565,6 +570,226 @@ destroy() {
 	dry $LVM lvremove $FORCE $device
 }
 
+float_math() {
+	if [ $# -le 0 ]; then
+		return
+	fi
+	result=$(LANG=C echo "scale=2; $@" | $BC -q 2> /dev/null)
+	echo $result
+}
+
+#####################################
+# Convet the size into human readable
+# form. size in KiB expected
+#####################################
+humanize_size() {
+	size=$1
+	count=0
+	while [ ${size%%.*} -ge 1024 ] && [ $count -lt 7 ]; do
+		size=$(float_math $size/1024)
+		count=$(($count+1))
+	done
+	case $count in
+		0) unit="KiB" ;;
+		1) unit="MiB" ;;
+		2) unit="GiB" ;;
+		3) unit="TiB" ;;
+		4) unit="PiB" ;;
+		5) unit="EiB" ;;
+		6) unit="ZiB" ;;
+		7) unit="YiB" ;;
+		*) unit="???" ;;
+	esac
+	echo "$size $unit"
+}
+
+get_ext_size() {
+	IFS=$NL
+	for i in $(LANG=C $TUNE_EXT -l "$VOLUME"); do
+		case "$i" in
+			"Block size"*) bsize=${i##*  } ;;
+			"Block count"*) bcount=${i##*  } ;;
+			"Reserved block count"*) rbcount=${i##*  } ;;
+			"Free blocks"*) fbcount=${i##*  } ;;
+		esac
+	done
+
+	bsize=$(($bsize/1024))
+	total=$(($bcount*$bsize))
+	TOTAL=$(humanize_size $total)
+	used=$((($bcount-$fbcount)*$bsize))
+	USED=$(humanize_size $used)
+	free=$((($fbcount-$rbcount)*$bsize))
+	FREE=$(humanize_size $free)
+	IFS=$OLD_IFS
+}
+
+get_xfs_size() {
+	IFS=$NL
+	if [ -z $MOUNTED ]; then
+
+		for i in $(LANG=C xfs_db -c 'sb' -c 'print blocksize fdblocks dblocks logblocks agcount' $VOLUME); do
+			case "$i" in
+				"blocksize ="*) bsize=${i##* } ;;
+				"fdblocks ="*) fbcount=${i##* } ;;
+				"dblocks ="*) bcount=${i##* } ;;
+				"logblocks ="*) lbcount=${i##* } ;;
+				"agcount ="*) agcount=${i##* } ;;
+			esac
+		done
+		bsize=$(($bsize/1024))
+		bcount=$(($bcount-$lbcount))
+		fbcount=$(($fbcount-(4+(4*$agcount))))
+
+		total=$(($bcount*$bsize))
+		TOTAL=$(humanize_size $total)
+		used=$((($bcount-$fbcount)*$bsize))
+		USED=$(humanize_size $used)
+		free=$(($fbcount*$bsize))
+		FREE=$(humanize_size $free)
+		return
+	fi
+
+	line=$($DF -k $VOLUME | grep -e "$MOUNTED$" | sed -e 's/  */ /g')
+	line=${line#* }
+	total=$(echo $line | cut -d' ' -f1)
+	TOTAL=$(humanize_size $total)
+	free=$(echo $line | cut -d' ' -f3)
+	FREE=$(humanize_size $free)
+	used=$(echo $line | cut -d' ' -f2)
+	USED=$(humanize_size $used)
+	IFS=$OLD_IFS
+}
+
+detect_fs_size() {
+	case $FSTYPE in
+		ext[234]) get_ext_size ;;
+		xfs) get_xfs_size ;;
+		*) error "Filesystem $FSTYM is not supported by $TOOL"
+	esac
+}
+
+list_filesystems() {
+	IFS=$NL
+	format="%-20s%-8s%-13s%-13s%-13s%s\n"
+	header=$(printf $format "Volume" "Type" "Free" "Used" "Total" "Mount point")
+	separator=""
+	for i in $(seq ${#header}); do
+		separator+="-"
+	done
+	echo $separator
+	echo $header
+	echo $separator
+	IFS=$NL
+	c=0
+	for line in $($LVM lvs -o lv_path,lv_size --noheadings --separator ' ' --nosuffix --units k 2> /dev/null); do
+		line=$(echo $line | sed -e 's/^ *\//\//')
+		volume=$(echo $line | cut -d' ' -f1)
+		detect_fs $volume
+		detect_mounted
+		detect_fs_size
+		printf $format $volume $FSTYPE $FREE $USED $TOTAL $MOUNTED
+		c=$((c+1))
+	done
+	if [ $c -eq 0 ]; then
+		echo " No file systems suitable for managing by $TOOL found."
+	fi
+	echo $separator
+	IFS=$OLD_IFS
+}
+
+list_devices() {
+	IFS=$NL
+
+	format="%-13s%-13s%-13s%-13s%s\n"
+	header=$(printf $format "Device" "Free" "Used" "Total" "Group")
+	separator=""
+	for i in $(seq ${#header}); do
+		separator+="-"
+	done
+	echo $separator
+	echo $header
+	echo $separator
+	c=0
+	for line in $(LANG=C $LVM pvs -o pv_name,vg_name,pv_size,pv_free,pv_used --separator ' ' --noheadings --nosuffix --units k); do
+		line=$(echo $line | sed -e 's/^ *\//\//')
+		device=$(echo $line | cut -d' ' -f1)
+		group=$(echo $line | cut -d' ' -f2)
+		total=$(echo $line | cut -d' ' -f3)
+		total=$(humanize_size ${total%%.*})
+		free=$(echo $line | cut -d' ' -f4)
+		free=$(humanize_size ${free%%.*})
+		used=$(echo $line | cut -d' ' -f5)
+		used=$(humanize_size ${used%%.*})
+
+		printf $format $device $free $used $total $group
+		c=$((c+1))
+	done
+	if [ $c -eq 0 ]; then
+		echo " No devices found in the pool."
+	fi
+	echo $separator
+	IFS=$OLD_IFS
+}
+
+list_pool() {
+	IFS=$NL
+
+	format="%-10s%-9s%-13s%-13s%s\n"
+	header=$(printf $format "Group" "Devices" "Free" "Used" "Total")
+	separator=""
+	for i in $(seq ${#header}); do
+		separator+="-"
+	done
+	echo $separator
+	echo $header
+	echo $separator
+	c=0
+	for line in $(LANG=C $LVM vgs -o vg_name,pv_count,vg_size,vg_free --separator ' ' --noheadings --nosuffix --units k); do
+		line=$(echo $line | sed -e 's/^ *//')
+		group=$(echo $line | cut -d' ' -f1)
+		devices=$(echo $line | cut -d' ' -f2)
+		total=$(echo $line | cut -d' ' -f3)
+		free=$(echo $line | cut -d' ' -f4)
+
+		used=$((${total%%.*}-${free%%.*}))
+		used=$(humanize_size ${used%%.*})
+		total=$(humanize_size ${total%%.*})
+		free=$(humanize_size ${free%%.*})
+		printf $format $group $devices $total $free $used
+		c=$((c+1))
+	done
+	if [ $c -eq 0 ]; then
+		echo " Pool is empty."
+	fi
+	echo $separator
+	IFS=$OLD_IFS
+}
+
+#############################
+# List the available storage
+# and file systems
+#############################
+list() {
+	for i in $@; do
+		case $i in
+			"filesystems" | "fs") list_filesystems ;;
+			"devices" | "dev") list_devices ;;
+			"pool") list_pool ;;
+			*) error "Wrong option $i. (see: $TOOL --help)"
+		esac
+	done
+
+	if [ $# -eq 0 ]; then
+		list_devices
+		echo ""
+		list_pool
+		echo ""
+		list_filesystems
+	fi
+}
+
+
 ####################################
 # Calclulate diff between two dates
 #  LANG=C input is expected the
@@ -579,6 +804,7 @@ diff_dates() {
 ###################
 check() {
 	detect_fs "$1"
+	verbose "\"$FSTYPE\" filesystem found on \"$VOLUME\""
 	if detect_mounted ; then
 		verbose "Skipping filesystem check for device \"$VOLUME\" as the filesystem is mounted on $MOUNTED";
 		cleanup 3
@@ -660,6 +886,7 @@ do
 	  "resize") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "create") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "destroy") COMMAND=$1; shift; ARGS=$@; break ;;
+	  "list") COMMAND=$1; shift; ARGS=$@; break ;;
 	  *) error "Wrong argument \"$1\". (see: $TOOL --help)"
 	esac
 	shift
-- 
1.7.4.4
