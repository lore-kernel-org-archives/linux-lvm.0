From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:23 +0200
Message-Id: <1316623554-28975-5-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 04/35] fsadm: Make "create" command more vg aware
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

Update create command so we can also specify volume group (pool) from
which we want to create logical volume, or, if neither device with
sufficient space, nor volume group is specified, it decides
automatically ho the logical volume should be created.

Also fix the list command so it will not print wrong data in case that
none was loaded.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |  207 +++++++++++++++++++++++++++++++++++++++++++-----------
 1 files changed, 167 insertions(+), 40 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 803c6a5..00b5019 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -76,6 +76,9 @@ BLOCKCOUNT=
 MOUNTPOINT=
 MOUNTED=
 REMOUNT=
+IN_GROUP=
+NOT_IN_GROUP=
+GROUP=
 PROCMOUNTS="/proc/mounts"
 PROCDEVICES="/proc/devices"
 PROCPARTITIONS="/proc/partitions"
@@ -134,6 +137,14 @@ dry() {
 	fi
 }
 
+float_math() {
+	if [ $# -le 0 ]; then
+		return
+	fi
+	result=$(LANG=C echo "scale=2; $@" | $BC -q 2> /dev/null)
+	echo $result
+}
+
 is_natural() {
 	test "$1" -ge 0 &> /dev/null && return 1
 	return 0
@@ -204,9 +215,10 @@ detect_fs() {
 	esac
 	# use null device as cache file to be sure about the result
 	# not using option '-o value' to be compatible with older version of blkid
-	FSTYPE=$("$BLKID" -c "$NULL" -s TYPE "$VOLUME") || error "Cannot get FSTYPE of \"$VOLUME\""
+	FSTYPE=$("$BLKID" -c "$NULL" -s TYPE "$VOLUME") || return 1
 	FSTYPE=${FSTYPE##*TYPE=\"} # cut quotation marks
 	FSTYPE=${FSTYPE%%\"*}
+	return 0
 }
 
 # check if the given device is already mounted and where
@@ -417,6 +429,7 @@ generic_make_fs() {
 resize() {
 	NEWSIZE=$2
 	detect_fs "$1"
+	[ $? -eq 1 ] && error "Cannot get FSTYPE of \"$VOLUME\""
 	verbose "\"$FSTYPE\" filesystem found on \"$VOLUME\""
 	is_natural $NEWSIZE
 	[ $? -ne 1 ] && error "$NEWSIZE is not valid number for file system size"
@@ -438,19 +451,52 @@ resize() {
 name_exists() {
 	cmd=$1
 	search=$2
-	$LVM $cmd --separator ' ' 2>&1 | tail -n-1 | cut -d' ' -f3 | grep $search 2>&1> /dev/null
+	$LVM $cmd --separator ' ' --noheadings --nosuffix 2>&1 | cut -d' ' -f3 | grep $search 2>&1> /dev/null
 	if [ $? -eq 0 ]; then
 		return 1
 	fi
 	return 0
 }
 
+detect_device_group() {
+	devices=$@
+	ret=0
+	prev_vgname=""
+	vgs=""
+
+	NOT_IN_GROUP=
+	IN_GROUP=
+	for i in $devices; do
+		cur_vgname=$(LANG=C $LVM pvs -o vg_name --separator ' ' --noheadings --nosuffix --units k $i 2> /dev/null | sed -e 's/^ *//')
+
+		if [ -z $cur_vgname ]; then
+			NOT_IN_GROUP+="$i "
+			continue
+		else
+			IN_GROUP+="$i "
+		fi
+
+		if [ -z $prev_vgname ]; then
+			prev_vgname=$cur_vgname
+			vgs=$cur_vgname
+			continue;
+		fi
+
+		if [ "$cur_vgname" != "$prev_vgname" ]; then
+			ret=1
+			vgs+=" $cur_vgname"
+		fi
+	done
+	GROUP=$vgs
+	return $ret
+}
+
 #############################
 # Create a new logical volume
 #############################
 create() {
-	size="-l 100%FREE"
 	devcount=0
+	vg_create=0
 
 	for i in $@; do
 		if [ -b $i ]; then
@@ -460,23 +506,76 @@ create() {
 		fi
 		case $i in
 			"stripesize"* | "chunksize"*) stripesize=${i##*=} ;;
-			"name"*) name="--name ${i##*=}" ;;
+			"name"*) name=${i##*=} ;;
 			"fstyp"* | "fs"*) fstyp=${i##*=} ;;
-			"size"*) size="-L ${i##*=}" ;;
-			*) error "Wrong option $i. (see: $TOOL --help)"
+			"size"*) size=${i##*=} ;;
+			*) if [ -z $vg ]; then vgname=$i; else
+				error "Wrong option $i. (see: $TOOL --help)"
+			   fi ;;
 		esac
 	done
 
-	for i in $(seq -w $MAX_VGS); do
-		name_exists vgs vg${i}
-		if [ $? -eq 0 ]; then
-			vgname="vg${i}"
-			break;
+	detect_device_group $devices
+	if [ $? -ne 0 ]; then
+		error "Some of the devices are in different groups. Please run \
+			\"$TOOL list\" to get more information on layout."
+	fi
+	if [ $GROUP ] && [ $vgname ];then
+		if [ "$vgname" != "$GROUP" ]; then
+			error "You specified group ($vgname) and devices which does "\
+				"belong to a different group ($GROUP). Either remove "\
+				"devices first, or specify devices which are free."
 		fi
-	done
+	elif [ $GROUP ]; then
+		vgname=$GROUP
+	fi
+	echo $vgname
+
+	# Devices are not in any group so we should find some.
+	# Either create a new one, or use the existing one, if
+	# there is only one vgroup, or use the one with enough
+	# in it
+	if [ -z "$vgname" ]; then
+		vgroups=$($LVM vgs -o vg_name,vg_free --separator ' ' --noheadings --units b 2> /dev/null)
+		lines=$($LVM vgs -o vg_name,vg_free --separator ' ' --noheadings --units b 2> /dev/null | wc -l)
+		echo "lines = $lines"
+
+		if [ $lines -eq 1 ]; then
+			vgname=$(echo $vgroups | sed -e 's/^ *//' | cut -d' ' -f1)
+		elif [ $lines -gt 1 ]; then
+			if [ -z $size ]; then
+				error "Not enough information to create" \
+					"logical volume"
+			fi
+			decode_size $size 1
+			new_size=$NEWBLOCKCOUNT
+			IFS=$NL
+			for i in $vgroups; do
+				vgsize=$(echo $i | sed -e 's/^ *//' | cut -d' ' -f2)
+				vgsize=${vgsize%%B}
+				if [ $vgsize -ge $new_size ]; then
+					echo "Yes"
+					vgname=$(echo $i | sed -e 's/^ *//' | cut -d' ' -f1)
+					break;
+				fi
+			done
+		fi
+	fi
+	IFS=$IFS_OLD
+
+	if [ -z "$vgname" ]; then
+		[ $devcount -eq 0 ] && error "No suitable device specified."
+		for i in $(seq -w $MAX_VGS); do
+			$LVM vgs vg${i} &> /dev/null
+			if [ $? -ne 0 ]; then
+				vgname="vg${i}"
+				break;
+			fi
+		done
+		vg_create=1
+	fi
 
 	[ -z "$vgname" ] && error "No suitable name for volume group found."
-	[ $devcount -eq 0 ] && error "No suitable device specified."
 
 	if [ "$stripesize" ]; then
 		striped="-i $devcount -I $stripesize"
@@ -486,17 +585,30 @@ create() {
 		lvname="--name $name"
 	else
 		for i in $(seq -w $MAX_VGS); do
-			name_exists "vgs $vgname" lvol${i}
-			if [ $? -eq 0 ]; then
+			$LVM lvs $vgname --separator ' ' --noheadings | grep -e " lvol${i} " &> /dev/null
+			if [ $? -ne 0 ]; then
 				name="lvol${i}"
 				lvname="--name $name"
 				break;
 			fi
 		done
 	fi
+	echo "going to create logical volume $lvname"
+
+	[ -z "$lvname" ] && error "No suitable name for the logical volume."
+
+	if [ $vg_create -eq 1 ]; then
+		dry $LVM vgcreate $VERB $vgname $devices
+	elif [ ! -z $NOT_IN_GROUP ]; then
+		dry $LVM vgextend $VERB $vgname $NOT_IN_GROUP
+	fi
 
-	dry $LVM vgcreate $VERB $vgname $devices
-	dry $LVM lvcreate $VERB $lvname $size $striped $vgname
+	if [ -z $size ]; then
+		size="-l 100%FREE"
+	else
+		size="-L $size"
+	fi
+	dry $LVM lvcreate $VERB $lvname $size $striped $vgname $devices
 	device="/dev/${vgname}/${name}"
 
 	guess=0
@@ -554,7 +666,7 @@ destroy() {
 	fi
 
 	if [ -z $device ]; then
-		$LVM vgs $1
+		$LVM vgs $1 &> /dev/null
 		# Volume group has been given
 		if [ $? -eq 0 ]; then
 			dry $LVM vgremove $FORCE $1
@@ -570,14 +682,6 @@ destroy() {
 	dry $LVM lvremove $FORCE $device
 }
 
-float_math() {
-	if [ $# -le 0 ]; then
-		return
-	fi
-	result=$(LANG=C echo "scale=2; $@" | $BC -q 2> /dev/null)
-	echo $result
-}
-
 #####################################
 # Convet the size into human readable
 # form. size in KiB expected
@@ -621,7 +725,7 @@ get_ext_size() {
 	USED=$(humanize_size $used)
 	free=$((($fbcount-$rbcount)*$bsize))
 	FREE=$(humanize_size $free)
-	IFS=$OLD_IFS
+	IFS=$IFS_OLD
 }
 
 get_xfs_size() {
@@ -649,7 +753,6 @@ get_xfs_size() {
 		FREE=$(humanize_size $free)
 		return
 	fi
-
 	line=$($DF -k $VOLUME | grep -e "$MOUNTED$" | sed -e 's/  */ /g')
 	line=${line#* }
 	total=$(echo $line | cut -d' ' -f1)
@@ -658,15 +761,19 @@ get_xfs_size() {
 	FREE=$(humanize_size $free)
 	used=$(echo $line | cut -d' ' -f2)
 	USED=$(humanize_size $used)
-	IFS=$OLD_IFS
+	IFS=$IFS_OLD
 }
 
 detect_fs_size() {
+	if [ -z $FSTYPE ]; then
+		return
+	fi
 	case $FSTYPE in
 		ext[234]) get_ext_size ;;
 		xfs) get_xfs_size ;;
-		*) error "Filesystem $FSTYM is not supported by $TOOL"
+		*) return 1 ;;
 	esac
+	return 0
 }
 
 list_filesystems() {
@@ -680,22 +787,31 @@ list_filesystems() {
 	echo $separator
 	echo $header
 	echo $separator
-	IFS=$NL
 	c=0
-	for line in $($LVM lvs -o lv_path,lv_size --noheadings --separator ' ' --nosuffix --units k 2> /dev/null); do
+	for line in $(LANG=C $LVM lvs -o lv_path,lv_size --noheadings --separator ' ' --nosuffix --units k 2> /dev/null); do
 		line=$(echo $line | sed -e 's/^ *\//\//')
 		volume=$(echo $line | cut -d' ' -f1)
 		detect_fs $volume
 		detect_mounted
 		detect_fs_size
-		printf $format $volume $FSTYPE $FREE $USED $TOTAL $MOUNTED
+		if [ -z "$TOTAL" ]; then
+			total=$(echo $line | cut -d' ' -f2)
+			TOTAL=$(humanize_size ${total%%.})
+		fi
+		printf "$format" "$volume" "$FSTYPE" "$FREE" "$USED" "$TOTAL" "$MOUNTED"
+		volume=
+		FSTYPE=
+		FREE=
+		USED=
+		TOTAL=
+		MOUNTED=
 		c=$((c+1))
 	done
 	if [ $c -eq 0 ]; then
 		echo " No file systems suitable for managing by $TOOL found."
 	fi
 	echo $separator
-	IFS=$OLD_IFS
+	IFS=$IFS_OLD
 }
 
 list_devices() {
@@ -722,14 +838,19 @@ list_devices() {
 		used=$(echo $line | cut -d' ' -f5)
 		used=$(humanize_size ${used%%.*})
 
-		printf $format $device $free $used $total $group
+		printf "$format" "$device" "$free" "$used" "$total" "$group"
+		device=
+		free=
+		used=
+		total=
+		group=
 		c=$((c+1))
 	done
 	if [ $c -eq 0 ]; then
 		echo " No devices found in the pool."
 	fi
 	echo $separator
-	IFS=$OLD_IFS
+	IFS=$IFS_OLD
 }
 
 list_pool() {
@@ -745,25 +866,30 @@ list_pool() {
 	echo $header
 	echo $separator
 	c=0
-	for line in $(LANG=C $LVM vgs -o vg_name,pv_count,vg_size,vg_free --separator ' ' --noheadings --nosuffix --units k); do
+	for line in $(LANG=C $LVM vgs -o vg_name,pv_count,vg_size,vg_free --separator ' ' --noheadings --nosuffix --units k 2> /dev/null); do
 		line=$(echo $line | sed -e 's/^ *//')
 		group=$(echo $line | cut -d' ' -f1)
 		devices=$(echo $line | cut -d' ' -f2)
 		total=$(echo $line | cut -d' ' -f3)
 		free=$(echo $line | cut -d' ' -f4)
-
 		used=$((${total%%.*}-${free%%.*}))
 		used=$(humanize_size ${used%%.*})
 		total=$(humanize_size ${total%%.*})
 		free=$(humanize_size ${free%%.*})
-		printf $format $group $devices $total $free $used
+
+		printf "$format" "$group" "$devices" "$free" "$used" "$total"
+		group=
+		devices=
+		total=
+		free=
+		used=
 		c=$((c+1))
 	done
 	if [ $c -eq 0 ]; then
 		echo " Pool is empty."
 	fi
 	echo $separator
-	IFS=$OLD_IFS
+	IFS=$IFS_OLD
 }
 
 #############################
@@ -804,6 +930,7 @@ diff_dates() {
 ###################
 check() {
 	detect_fs "$1"
+	[ $? -eq 1 ] && error "Cannot get FSTYPE of \"$VOLUME\""
 	verbose "\"$FSTYPE\" filesystem found on \"$VOLUME\""
 	if detect_mounted ; then
 		verbose "Skipping filesystem check for device \"$VOLUME\" as the filesystem is mounted on $MOUNTED";
-- 
1.7.4.4
