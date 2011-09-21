From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:32 +0200
Message-Id: <1316623554-28975-14-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 13/35] fsadm: Merge "destroy" and "remove" into
	one command
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

We do not actually need both "remove" and "destroy" command because we
can do everything with only one "remove" command. Also it is confusing
to have both. This commit mergers the functionality of destroy to
remove.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |  526 ++++++++++++++++++++++++++++++++----------------------
 1 files changed, 310 insertions(+), 216 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 517d10d..66ecf1eb 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -66,7 +66,6 @@ DRY=0
 VERB=
 FORCE=
 EXTOFF=0
-DO_LVRESIZE=0
 FSTYPE=unknown
 VOLUME=unknown
 TEMPDIR="${TMPDIR:-/tmp}/${TOOL}_${RANDOM}$$/m"
@@ -106,7 +105,6 @@ tool_usage() {
 	echo "    -e | --ext-offline  unmount filesystem before ext2/ext3/ext4 resize"
 	echo "    -f | --force        Bypass sanity checks"
 	echo "    -n | --dry-run      Print commands without running them"
-	echo "    -l | --lvresize     Resize given device (if it is LVM device)"
 	echo "    -y | --yes          Answer \"yes\" at any prompts"
 	echo
 	echo "  new_size - Absolute number of filesystem blocks to be in the filesystem,"
@@ -167,41 +165,130 @@ cleanup() {
 
 	test "$1" -eq 2 && verbose "Break detected"
 
-	if [ "$DO_LVRESIZE" -eq 2 ]; then
-		# start LVRESIZE with the filesystem modification flag
-		# and allow recursive call of fsadm
-		_FSADM_YES=$YES
-		export _FSADM_YES
-		unset FSADM_RUNNING
-		test -n "$LVM_BINARY" && PATH=$_SAVEPATH
-		dry exec "$LVM" lvresize $VERB $FORCE -r -L${NEWSIZE}b "$VOLUME_ORIG"
-	fi
-
 	# error exit status for break
 	exit ${1:-1}
 }
 
+#####################################
+# Convet the size into human readable
+# form. size in Bytes expected
+#####################################
+humanize_size() {
+	size=$1
+	count=0
+	while [ ${size%%.*} -ge 1024 ] && [ $count -lt 7 ]; do
+		size=$(float_math $size/1024)
+		count=$(($count+1))
+	done
+	case $count in
+		0) unit="B" ;;
+		1) unit="KiB" ;;
+		2) unit="MiB" ;;
+		3) unit="GiB" ;;
+		4) unit="TiB" ;;
+		5) unit="PiB" ;;
+		6) unit="EiB" ;;
+		7) unit="ZiB" ;;
+		8) unit="YiB" ;;
+		*) unit="???" ;;
+	esac
+	echo "$size $unit"
+}
+
+#############################
+# Get size of entN filesystem
+# by reading tune2fs output
+#############################
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
+	total=$(($bcount*$bsize))
+	TOTAL=$(humanize_size $total)
+	used=$((($bcount-$fbcount)*$bsize))
+	USED=$(humanize_size $used)
+	free=$((($fbcount-$rbcount)*$bsize))
+	FREE=$(humanize_size $free)
+	IFS=$IFS_OLD
+}
+
+############################
+# Get size of xfs file system
+# by reading the df output or
+# examine file system with
+# xfs_db tool
+#############################
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
+	line=$($DF -k $VOLUME | grep -e "$MOUNTED$" | sed -e 's/  */ /g')
+	line=${line#* }
+	total=$(echo $line | cut -d' ' -f1)
+	TOTAL=$(humanize_size $total)
+	free=$(echo $line | cut -d' ' -f3)
+	FREE=$(humanize_size $free)
+	used=$(echo $line | cut -d' ' -f2)
+	USED=$(humanize_size $used)
+	IFS=$IFS_OLD
+}
+
+detect_fs_size() {
+	if [ -z $FSTYPE ]; then
+		return
+	fi
+	case $FSTYPE in
+		ext[234]) get_ext_size ;;
+		xfs) get_xfs_size ;;
+		*) return 1 ;;
+	esac
+	return 0
+}
+
 # convert parameter from Exa/Peta/Tera/Giga/Mega/Kilo/Bytes and blocks
 # (2^(60/50/40/30/20/10/0))
 decode_size() {
 	case "$1" in
-	 *[eE]) NEWSIZE=$(( ${1%[eE]} * 1152921504606846976 )) ;;
-	 *[pP]) NEWSIZE=$(( ${1%[pP]} * 1125899906842624 )) ;;
-	 *[tT]) NEWSIZE=$(( ${1%[tT]} * 1099511627776 )) ;;
-	 *[gG]) NEWSIZE=$(( ${1%[gG]} * 1073741824 )) ;;
-	 *[mM]) NEWSIZE=$(( ${1%[mM]} * 1048576 )) ;;
-	 *[kK]) NEWSIZE=$(( ${1%[kK]} * 1024 )) ;;
+	 *[eE]) NEWSIZE=$(float_math "${1%[eE]} * 1152921504606846976") ;;
+	 *[pP]) NEWSIZE=$(float_math "${1%[pP]} * 1125899906842624") ;;
+	 *[tT]) NEWSIZE=$(float_math "${1%[tT]} * 1099511627776") ;;
+	 *[gG]) NEWSIZE=$(float_math "${1%[gG]} * 1073741824") ;;
+	 *[mM]) NEWSIZE=$(float_math "${1%[mM]} * 1048576") ;;
+	 *[kK]) NEWSIZE=$(float_math "${1%[kK]} * 1024") ;;
 	 *[bB]) NEWSIZE=${1%[bB]} ;;
 	     *) NEWSIZE=$(( $1 * $2 )) ;;
 	esac
-	#NEWBLOCKCOUNT=$(round_block_size $NEWSIZE $2)
-	NEWBLOCKCOUNT=$(( $NEWSIZE / $2 ))
 
-	if [ $DO_LVRESIZE -eq 1 ]; then
-		# start lvresize, but first cleanup mounted dirs
-		DO_LVRESIZE=2
-		cleanup 0
-	fi
+	NEWSIZE=${NEWSIZE%%.*}
+	NEWBLOCKCOUNT=$(float_math "$NEWSIZE / $2")
+	NEWBLOCKCOUNT=${NEWBLOCKCOUNT%%.*}
 }
 
 # detect filesystem on the given device
@@ -325,13 +412,15 @@ resize_ext() {
 	if [ "$NEWBLOCKCOUNT" -lt "$BLOCKCOUNT" -o "$EXTOFF" -eq 1 ]; then
 		detect_mounted && verbose "$RESIZE_EXT needs unmounted filesystem" && try_umount
 		REMOUNT=$MOUNTED
-		if test -n "$MOUNTED" ; then
-			# Forced fsck -f for umounted extX filesystem.
-			case "$-" in
-			  *i*) dry "$FSCK" $YES -f "$VOLUME" ;;
-			  *) dry "$FSCK" -f -p "$VOLUME" ;;
-			esac
-		fi
+	fi
+
+	# We should really do the fsck before every resize.
+	if [ -z $MOUNTED ] || [ "$REMOUNT" ]; then
+		# Forced fsck -f for umounted extX filesystem.
+		case "$-" in
+		  *i*) dry $FSCK $YES -f "$VOLUME" ;;
+		  *) dry $FSCK -f -p "$VOLUME" ;;
+		esac
 	fi
 
 	verbose "Resizing filesystem on device \"$VOLUME\" to $NEWSIZE bytes ($BLOCKCOUNT -> $NEWBLOCKCOUNT blocks of $BLOCKSIZE bytes)"
@@ -437,13 +526,15 @@ generic_make_fs() {
 ####################
 # Resize filesystem
 ####################
-resize() {
+resize_fs() {
 	NEWSIZE=$2
 	detect_fs "$1"
 	[ $? -eq 1 ] && error "Cannot get FSTYPE of \"$VOLUME\""
 	verbose "\"$FSTYPE\" filesystem found on \"$VOLUME\""
-	is_natural $NEWSIZE
-	[ $? -ne 1 ] && error "$NEWSIZE is not valid number for file system size"
+	if [ "$NEWSIZE" ]; then
+		is_natural $NEWSIZE
+		[ $? -ne 1 ] && error "$NEWSIZE is not valid number for file system size"
+	fi
 	detect_device_size
 	verbose "Device \"$VOLUME\" size is $DEVSIZE bytes"
 	# if the size parameter is missing use device size
@@ -456,7 +547,112 @@ resize() {
 	  "xfs") resize_xfs $NEWSIZE ;;
 	  *) error "Filesystem \"$FSTYPE\" on device \"$VOLUME\" is not supported by this tool" ;;
 	esac || error "Resize $FSTYPE failed"
-	cleanup 0
+}
+
+resize_lvolume() {
+	lvname=$1
+	newsize=$2
+	lvsize=$(LANG=C $LVM lvs -o lv_size --separator ' ' --noheadings --nosuffix --units b $lvname 2> /dev/null | sed -e 's/^ *//')
+	if [ $lvsize != $newsize ]; then
+		dry $LVM lvresize $VERB $FORCE -L${newsize}b $lvname
+	else
+		verbose "Logical volume already is of the size you're trying to resize it to"
+	fi
+}
+
+resize() {
+	local size=0
+
+	# Special case for the situation we have been called from within the lvresize code.
+	# How crazy is that ?:) But anyway to preserve the old behaviour it is there.
+	if [ "$RESIZE_FS_ONLY" ]; then
+		resize_fs $@
+		return
+	fi
+
+	for i in $@; do
+		if [ -b $i ]; then
+			if [ -z $devcount ]; then
+				$LVM lvs $i &> /dev/null
+				if [ $? -eq 0 ]; then
+					lvname=$i
+					devcount=0
+					continue
+				else
+					error "$i is not valid logical volume"
+				fi
+			fi
+			devices="$devices $i"
+			devcount=$(($devcount+1))
+			continue
+		fi
+		case $i in
+			"size=+"*) [ $size -eq 0 ] && extend=${i##*+} && size=1;;
+			"size=-"*) [ $size -eq 0 ] && shrink=${i##*-} && size=1;;
+			"size="*)  [ $size -eq 0 ] && new_size=${i##*=} && size=1;;
+			*) error "Wrong option $i. (see: $TOOL --help)";;
+		esac
+	done
+
+	[ -z $lvname ] && error "Logical volume to resize was not specified"
+	[ $devcount -gt 0 ] && [ "$shrink" ] && warn "While shrinking the file system we "\
+						     "do not need additional devices. "\
+						     "Those provided will be ignored"
+
+	# We need to add provided devices into particular group
+	if [ $devcount -gt 0 ] && [ -z $shrink ]; then
+		# Get the volume group of the logical volume
+		vgname=$(detect_volume_group $lvname)
+		[ -z $vgname ] && error "Wrong argument $lvname. (see: $TOOL --help)"
+
+		# Determine whether the devices are in the group
+		detect_device_group $devices
+		if [ $? -ne 0 ]; then
+			error "Devices are in different groups. Please run "\
+				"\"$TOOL list\" to get more information on layout."
+		fi
+
+		[ "$GROUP" ] && [ "$GROUP" != "$vgname" ] && error "Some devices are in different"\
+								   "group than the logical volume"\
+								   "($lvname). Please provide unused"\
+								   "devices"
+		# Add missing devices into the group
+		if [ "$NOT_IN_GROUP" ]; then
+			dry $LVM vgextend $VERB $vgname $NOT_IN_GROUP
+		fi
+	fi
+
+	# If no size parameter has been provided, resize the volume to the maximum
+	if [ $size -eq 0 ]; then
+		echo "What??"
+	fi
+
+	# determine new size of the file system
+	if [ "$extend" ] || [ "$shrink" ] || [ "$new_size" ]; then
+		# only one of those variable should be set, so it is safe to do that
+		decode_size $extend $shrink $new_size 1
+		detect_fs $lvname
+		detect_fs_size
+		[ "$extend" ] && size=$(($total + $NEWSIZE))
+		[ "$shrink" ] && size=$(($total - $NEWSIZE))
+		if [ "$new_size" ]; then
+			[ $NEWSIZE -ge $total ] && extend=1 || shrink=1
+			size=$NEWSIZE
+		fi
+	fi
+
+	# Do the actual resize
+	if [ "$shrink" ]; then
+		resize_fs $lvname $size
+		# The file system might decide to alight the size a bit, so we
+		# have to resize the volume to the exact size of the file system
+		# so we do not corrupt it.
+		detect_fs_size
+		resize_lvolume $lvname $total
+	elif [ "$extend" ]; then
+		resize_lvolume $lvname $size
+		resize_fs $lvname
+	fi
 }
 
 #################################
@@ -518,7 +714,7 @@ create() {
 			"fstyp"* | "fs"*) fstyp=${i##*=} ;;
 			"size"*) size=${i##*=} ;;
 			"stripes"*) stripes=${i##*=} ;;
-			*) if [ -z $vg ]; then vgname=$i; else
+			*) if [ -z $vgname ]; then vgname=$i; else
 				error "Wrong option $i. (see: $TOOL --help)"
 			   fi ;;
 		esac
@@ -538,7 +734,6 @@ create() {
 	elif [ $GROUP ]; then
 		vgname=$GROUP
 	fi
-	echo $vgname
 
 	# Devices are not in any group so we should find some.
 	# Either create a new one, or use the existing one, if
@@ -585,20 +780,17 @@ create() {
 
 	[ -z "$vgname" ] && error "No suitable name for volume group found."
 
-	if [ "$stripesize" ]; then
-		if [ -z "$devices" ] && [ -z "$stripes" ]; then
-			error "Chunk size specified ($stripesize), but " \
-				"neither devices, nor number of stripes " \
-				"has been provided"
-		fi
-		striped="-i $devcount -I $stripesize"
-	fi
-
-	if [ "$stripes" ]; then
+	if [ "$stripesize" ] || [ "$stripes" ]; then
 		if [ -z "$stripesize" ]; then
 			error "Number of stripes specified, but chunk size " \
 				"has not been provided"
 		fi
+		if [ -z "$stripes" ] && [ $devcount -eq 0 ]; then
+			error "Chunk size specified ($stripesize), but " \
+				"neither devices, nor number of stripes " \
+				"has been provided"
+		fi
+		[ $devcount -gt 0 ] && [ -z "$stripes" ] && stripes=$devcount
 		striped="-i $stripes -I $stripesize"
 	fi
 
@@ -617,7 +809,6 @@ create() {
 		done
 		rm -f $tmp
 	fi
-	echo "going to create logical volume $lvname"
 
 	[ -z "$lvname" ] && error "No suitable name for the logical volume."
 
@@ -642,7 +833,7 @@ create() {
 	fi
 
 	case $fstyp in
-		ext[234]) make_ext $device $fstyp $devcount $stripesize ;;
+		ext[234]) make_ext $device $fstyp $stripes $stripesize ;;
 		xfs|reiserfs) generic_make_fs $device $fstyp;;
 		*)	if [ $guess -eq 1 ]; then
 				return 0
@@ -653,11 +844,40 @@ create() {
 	esac
 }
 
+###############################
+# Remove device form the group
+###############################
+remove_device() {
+	device=$@
+	tmp=$(mktemp)
+	removed=0
+
+	$LVM vgs -o vg_name --separator ' ' --noheadings | sed -e 's/^ *//' > $tmp
+	IFS=$NL
+	for vgname in $(cat $tmp); do
+		if [ -z "$device" ]; then
+			$LVM vgreduce -a $vgname
+			removed=1
+		else
+			$LVM vgs $vgname -o pv_name --separator ' ' --noheadings | $GREP -e "$device$" &> /dev/null
+			if [ $? -eq 0 ]; then
+				$LVM vgreduce $vgname $device
+				removed=1
+			fi
+		fi
+	done
+	IFS=$IFS_OLD
+	rm -f $tmp
+
+	return $removed
+}
+
 #############################
 # Remove the logical volume
-# of the whole volume group
+# volume group, or the device
+# from the group
 #############################
-do_destroy() {
+do_remove() {
 	item=$1
 	device=
 	MOUNTED=
@@ -696,129 +916,35 @@ do_destroy() {
 
 	if [ $MOUNTED ]; then
 		try_umount
+		dry $LVM lvremove $FORCE $device
+		return
+	fi
+
+	remove_device $device
+	if [ $? -eq 0 ]; then
+		dry $LVM lvremove $FORCE $device
 	fi
-	dry $LVM lvremove $FORCE $device
 }
 
 ###############################
 # Iterate through the arguments
-# and do_destroy on them
+# and do_remove on them
 ###############################
-destroy() {
+remove() {
 	# help
 	if [ "$1" == "help" ]; then
-		echo "Usage: $TOOL destroy [mount point | dm device | voulume group]"
+		echo "Usage: $TOOL remove [mount point | dm device | voulume group | device]"
 		exit 0
 	fi
 
 	for item in $@; do
-		do_destroy $item
-	done
-
-}
-
-#####################################
-# Convet the size into human readable
-# form. size in KiB expected
-#####################################
-humanize_size() {
-	size=$1
-	count=0
-	while [ ${size%%.*} -ge 1024 ] && [ $count -lt 7 ]; do
-		size=$(float_math $size/1024)
-		count=$(($count+1))
+		do_remove $item
 	done
-	case $count in
-		0) unit="KiB" ;;
-		1) unit="MiB" ;;
-		2) unit="GiB" ;;
-		3) unit="TiB" ;;
-		4) unit="PiB" ;;
-		5) unit="EiB" ;;
-		6) unit="ZiB" ;;
-		7) unit="YiB" ;;
-		*) unit="???" ;;
-	esac
-	echo "$size $unit"
-}
 
-#############################
-# Get size of entN filesystem
-# by reading tune2fs output
-#############################
-get_ext_size() {
-	IFS=$NL
-	for i in $(LANG=C $TUNE_EXT -l "$VOLUME"); do
-		case "$i" in
-			"Block size"*) bsize=${i##*  } ;;
-			"Block count"*) bcount=${i##*  } ;;
-			"Reserved block count"*) rbcount=${i##*  } ;;
-			"Free blocks"*) fbcount=${i##*  } ;;
-		esac
-	done
-
-	bsize=$(($bsize/1024))
-	total=$(($bcount*$bsize))
-	TOTAL=$(humanize_size $total)
-	used=$((($bcount-$fbcount)*$bsize))
-	USED=$(humanize_size $used)
-	free=$((($fbcount-$rbcount)*$bsize))
-	FREE=$(humanize_size $free)
-	IFS=$IFS_OLD
-}
-
-############################
-# Get size of xfs file system
-# by reading the df output or
-# examine file system with
-# xfs_db tool
-#############################
-get_xfs_size() {
-	IFS=$NL
-	if [ -z $MOUNTED ]; then
-
-		for i in $(LANG=C xfs_db -c 'sb' -c 'print blocksize fdblocks dblocks logblocks agcount' $VOLUME); do
-			case "$i" in
-				"blocksize ="*) bsize=${i##* } ;;
-				"fdblocks ="*) fbcount=${i##* } ;;
-				"dblocks ="*) bcount=${i##* } ;;
-				"logblocks ="*) lbcount=${i##* } ;;
-				"agcount ="*) agcount=${i##* } ;;
-			esac
-		done
-		bsize=$(($bsize/1024))
-		bcount=$(($bcount-$lbcount))
-		fbcount=$(($fbcount-(4+(4*$agcount))))
-
-		total=$(($bcount*$bsize))
-		TOTAL=$(humanize_size $total)
-		used=$((($bcount-$fbcount)*$bsize))
-		USED=$(humanize_size $used)
-		free=$(($fbcount*$bsize))
-		FREE=$(humanize_size $free)
-		return
+	if [ $# -eq 0 ]; then
+		remove_device
 	fi
-	line=$($DF -k $VOLUME | grep -e "$MOUNTED$" | sed -e 's/  */ /g')
-	line=${line#* }
-	total=$(echo $line | cut -d' ' -f1)
-	TOTAL=$(humanize_size $total)
-	free=$(echo $line | cut -d' ' -f3)
-	FREE=$(humanize_size $free)
-	used=$(echo $line | cut -d' ' -f2)
-	USED=$(humanize_size $used)
-	IFS=$IFS_OLD
-}
 
-detect_fs_size() {
-	if [ -z $FSTYPE ]; then
-		return
-	fi
-	case $FSTYPE in
-		ext[234]) get_ext_size ;;
-		xfs) get_xfs_size ;;
-		*) return 1 ;;
-	esac
-	return 0
 }
 
 #############################
@@ -828,20 +954,17 @@ detect_fs_size() {
 list_filesystems() {
 	IFS=$NL
 	local c=0
-	for line in $(LANG=C $LVM lvs -o lv_path,lv_size,segtype --noheadings --separator ' ' --nosuffix --units k 2> /dev/null); do
+	for line in $(LANG=C $LVM lvs -o lv_path,lv_size,segtype --noheadings --separator ' ' --nosuffix --units b 2> /dev/null); do
 		line=$(echo $line | sed -e 's/^ *\//\//')
 		volume=$(echo $line | cut -d' ' -f1)
 		[ "$volume" == "$last_volume" ] && continue
 		c=$((c+1))
 		local volumes[$c]=$volume
 		local segtype[$c]=$(echo $line | cut -d' ' -f3)
+		local lvsize[$c]=$(humanize_size $(echo $line | cut -d' ' -f2))
 		detect_fs $volume
 		detect_mounted
 		detect_fs_size
-		if [ -z "$TOTAL" ]; then
-			total=$(echo $line | cut -d' ' -f2)
-			TOTAL=$(humanize_size ${total%%.})
-		fi
 		local total[$c]=$TOTAL
 		local fstype[$c]=$FSTYPE
 		local free[$c]=$FREE
@@ -868,6 +991,7 @@ list_filesystems() {
 	len_total=5
 	len_mounted=11
 	len_segtype=4
+	len_lvsize=4
 	for i in $(seq $c); do
 		local _volume=${volumes[$i]}
 		local _fstype=${fstype[$i]}
@@ -875,6 +999,7 @@ list_filesystems() {
 		local _free=${free[$i]}
 		local _used=${used[$i]}
 		local _segtype=${segtype[$i]}
+		local _lvsize=${lvsize[$i]}
 		local _mounted=${mounted[$i]}
 		[ ${#_volume} -gt "0$len_volume" ] && len_volume=${#_volume}
 		[ ${#_fstype} -gt "0$len_fstype" ] && len_fstype=${#_fstype}
@@ -882,21 +1007,22 @@ list_filesystems() {
 		[ ${#_free} -gt "0$len_free" ] && len_free=${#_free}
 		[ ${#_used} -gt "0$len_used" ] && len_used=${#_used}
 		[ ${#_segtype} -gt "0$len_segtype" ] && len_segtype=${#_segtype}
+		[ ${#_lvsize} -gt "0$len_lvsize" ] && len_lvsize=${#_lvsize}
 		[ ${#_mounted} -gt "0$len_mounted" ] && len_mounted=${#_mounted}
 	done
 
-	format="%-$(($len_volume+2))s%-$(($len_fstype+2))s%-$(($len_free+2))s%-$(($len_used+2))s%-$(($len_total+2))s%-$(($len_segtype+2))s%-$(($len_mounted+2))s\n"
-	header=$(printf "$format" "Volume" "FS" "Free" "Used" "Total" "Type" "Mount point")
+	format="%-$(($len_volume+2))s %-$(($len_lvsize+2))s%-$(($len_fstype+2))s%-$(($len_free+2))s%-$(($len_used+2))s%-$(($len_total+2))s%-$(($len_segtype+2))s%-$(($len_mounted+2))s\n"
+	header=$(printf "$format" "Volume" "LV size" "FS" "Free" "Used" "Total" "Type" "Mount point")
 	separator=""
 	for i in $(seq ${#header}); do
 		separator+="-"
 	done
 	echo $separator
-	printf "$format" "Volume" "FS" "Free" "Used" "Total" "Type" "Mount point"
+	printf "$format" "Volume" "LV size" "FS" "Free" "Used" "Total" "Type" "Mount point"
 	echo $separator
 
 	for i in $(seq $c); do
-		printf "$format" "${volumes[$i]}" "${fstype[$i]}" "${free[$i]}" "${used[$i]}" "${total[$i]}" "${segtype[$i]}" "${mounted[$i]}"
+		printf "$format" "${volumes[$i]}" "${lvsize[$i]}" "${fstype[$i]}" "${free[$i]}" "${used[$i]}" "${total[$i]}" "${segtype[$i]}" "${mounted[$i]}"
 	done
 
 	echo $separator
@@ -912,11 +1038,11 @@ list_devices() {
 	c=0
 	dmnumber=$(cat $PROCDEVICES | grep device-mapper | sed -e 's/^  *//')
 	dmnumber=${dmnumber%% *}
-	LANG=C $LVM pvs -o pv_name,vg_name,pv_size,pv_free,pv_used --separator ' ' --noheadings --nosuffix --units k > $tmp
+	LANG=C $LVM pvs -o pv_name,vg_name,pv_size,pv_free,pv_used --separator ' ' --noheadings --nosuffix --units b > $tmp
 	for line in $(cat $PROCPARTITIONS | tail -n +3 | sed -e 's/^  *//' | grep -v -e "^$dmnumber"); do
 		c=$((c+1))
 		line=$(echo $line | sed -e 's/  */ /g')
-		_total=$(echo $line | cut -d' ' -f3)
+		_total=$(($(echo $line | cut -d' ' -f3)*1024))
 		local total[$c]=$(humanize_size ${_total%%.*})
 		VOLUME=$(echo $line | cut -d' ' -f4)
 		RVOLUME="/dev/$(echo $line | cut -d' ' -f4)"
@@ -996,7 +1122,7 @@ list_devices() {
 list_pool() {
 	IFS=$NL
 	c=0
-	for line in $(LANG=C $LVM vgs -o vg_name,pv_count,vg_size,vg_free --separator ' ' --noheadings --nosuffix --units k 2> /dev/null); do
+	for line in $(LANG=C $LVM vgs -o vg_name,pv_count,vg_size,vg_free --separator ' ' --noheadings --nosuffix --units b 2> /dev/null); do
 		c=$((c+1))
 		line=$(echo $line | sed -e 's/^ *//')
 		local group[$c]=$(echo $line | cut -d' ' -f1)
@@ -1072,6 +1198,13 @@ list() {
 	fi
 }
 
+detect_volume_group() {
+	_vg=$($LVM lvs -o vg_name --separator ' ' --noheadings $1 2> /dev/null)
+	ret=$?
+	echo $_vg | sed -e 's/^ *//'
+	return $ret
+}
+
 ############################
 # Add devices into the group
 ############################
@@ -1084,8 +1217,8 @@ add() {
 			devices="$devices $i"
 			devcount=$(($devcount+1))
 			continue
-		elif [ -z $vg ]; then vgname=$i; else
-			error "Wrong option $i. (see: $TOOL --help)"
+		elif [ -z $vgname ]; then vgname=$i; else
+			error "Wrong argument $i. (see: $TOOL --help)"
 		fi
 	done
 
@@ -1117,53 +1250,13 @@ add() {
 
 	if [ $vg_create -eq 1 ]; then
 		dry $LVM vgcreate $VERB $vgname $devices
-	elif [ ! -z $NOT_IN_GROUP ]; then
+	elif [ ! -z "$NOT_IN_GROUP" ]; then
 		dry $LVM vgextend $VERB $vgname $NOT_IN_GROUP
 	else
 		warn "Nothing to do"
 	fi
 }
 
-###############################
-# Remove devices form the group
-###############################
-remove() {
-	devices=$@
-	tmp=$(mktemp)
-	tmp2=$(mktemp)
-	nothing=1
-
-	$LVM vgs -o vg_name --separator ' ' --noheadings | sed -e 's/^ *//' > $tmp
-
-	[ "$(cat $tmp | wc -l)" == "0" ] && return
-
-	IFS=$NL
-	for vgname in $(cat $tmp); do
-		if [ -z $devices ]; then
-			$LVM vgreduce -a $vgname
-			nothing=0
-		else
-			$LVM vgs $vgname -o pv_name --separator ' ' --noheadings > $tmp2
-			IFS=$IFS_OLD
-			for dev in $devices; do
-				$GREP $dev $tmp2 &> /dev/null
-				if [ $? -eq 0 ]; then
-					$LVM vgreduce $vgname $dev
-					nothing=0
-				fi
-			done
-			IFS=$NL
-		fi
-	done
-	rm -f $tmp $tmp2
-	IFS=$IFS_OLD
-
-	if [ $nothing -eq 1 ]; then
-		warn "Nothing to do."
-	fi
-}
-
-
 ####################################
 # Calclulate diff between two dates
 #  LANG=C input is expected the
@@ -1255,12 +1348,12 @@ do
 	  "-n"|"--dry-run") DRY=1 ;;
 	  "-f"|"--force") FORCE="-f" ;;
 	  "-e"|"--ext-offline") EXTOFF=1 ;;
+	  "-o"|"--resize-fs-only") RESIZE_FS_ONLY=1 ;;
 	  "-y"|"--yes") YES="-y" ;;
-	  "-l"|"--lvresize") DO_LVRESIZE=1 ;;
+	  "-l"|"--lvresize") ;;
 	  "check") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "resize") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "create") COMMAND=$1; shift; ARGS=$@; break ;;
-	  "destroy") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "list") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "add") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "remove") COMMAND=$1; shift; ARGS=$@; break ;;
@@ -1275,3 +1368,4 @@ fi
 
 export FSADM_RUNNING="fsadm"
 $COMMAND $ARGS
+cleanup 0
-- 
1.7.4.4
