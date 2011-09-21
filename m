From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:26 +0200
Message-Id: <1316623554-28975-8-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 07/35] fsadm: Create "add" command
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

Add command allows to add devices into volume groups (pool).

Also update device listing so we see all block devices in the system
with appropriate mount points and information whether it has partitions.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |  116 +++++++++++++++++++++++++++++++++++++++++++++---------
 1 files changed, 97 insertions(+), 19 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 91b0de3..5dc945b 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -18,7 +18,7 @@
 #
 # Needed utilities:
 #   mount, umount, grep, readlink, blockdev, blkid, fsck, xfs_check, bc, df
-#   xfs_db
+#   xfs_db, mktemp
 #
 # ext2/ext3/ext4: resize2fs, tune2fs
 # reiserfs: resize_reiserfs, reiserfstune
@@ -230,10 +230,10 @@ detect_fs() {
 detect_mounted()  {
 	test -e "$PROCMOUNTS" || error "Cannot detect mounted device \"$VOLUME\""
 
-	MOUNTED=$("$GREP" ^"$VOLUME" "$PROCMOUNTS")
+	MOUNTED=$("$GREP" -e "^$VOLUME " "$PROCMOUNTS")
 
 	# for empty string try again with real volume name
-	test -z "$MOUNTED" && MOUNTED=$("$GREP" ^"$RVOLUME" "$PROCMOUNTS")
+	test -z "$MOUNTED" && MOUNTED=$("$GREP" -e "^$RVOLUME " "$PROCMOUNTS")
 
 	# cut device name prefix and trim everything past mountpoint
 	# echo translates \040 to spaces
@@ -242,8 +242,8 @@ detect_mounted()  {
 
 	# for systems with different device names - check also mount output
 	if test -z "$MOUNTED" ; then
-		MOUNTED=$(LANG=C "$MOUNT" | "$GREP" ^"$VOLUME")
-		test -z "$MOUNTED" && MOUNTED=$(LANG=C "$MOUNT" | "$GREP" ^"$RVOLUME")
+		MOUNTED=$(LANG=C "$MOUNT" | "$GREP" -e "^$VOLUME ")
+		test -z "$MOUNTED" && MOUNTED=$(LANG=C "$MOUNT" | $GREP -e "^$RVOLUME ")
 		MOUNTED=${MOUNTED##* on }
 		MOUNTED=${MOUNTED% type *} # allow type in the mount name
 	fi
@@ -543,7 +543,6 @@ create() {
 	if [ -z "$vgname" ]; then
 		vgroups=$($LVM vgs -o vg_name,vg_free --separator ' ' --noheadings --units b 2> /dev/null)
 		lines=$($LVM vgs -o vg_name,vg_free --separator ' ' --noheadings --units b 2> /dev/null | wc -l)
-		echo "lines = $lines"
 
 		if [ $lines -eq 1 ]; then
 			vgname=$(echo $vgroups | sed -e 's/^ *//' | cut -d' ' -f1)
@@ -845,13 +844,14 @@ list_filesystems() {
 }
 
 ###########################
-# List all physical volumes
+# List all non DM devices
 ###########################
 list_devices() {
 	IFS=$NL
+	tmp=$(mktemp)
 
-	format="%-13s%-13s%-13s%-13s%s\n"
-	header=$(printf $format "Device" "Free" "Used" "Total" "Group")
+	format="%-13s%-13s%-13s%-13s%-13s%s\n"
+	header=$(printf $format "Device" "Free" "Used" "Total" "Group" "Mount point")
 	separator=""
 	for i in $(seq ${#header}); do
 		separator+="-"
@@ -860,23 +860,41 @@ list_devices() {
 	echo $header
 	echo $separator
 	c=0
-	for line in $(LANG=C $LVM pvs -o pv_name,vg_name,pv_size,pv_free,pv_used --separator ' ' --noheadings --nosuffix --units k); do
-		line=$(echo $line | sed -e 's/^ *\//\//')
-		device=$(echo $line | cut -d' ' -f1)
-		group=$(echo $line | cut -d' ' -f2)
+	dmnumber=$(cat $PROCDEVICES | grep device-mapper | sed -e 's/^  *//')
+	dmnumber=${dmnumber%% *}
+	LANG=C $LVM pvs -o pv_name,vg_name,pv_size,pv_free,pv_used --separator ' ' --noheadings --nosuffix --units k > $tmp
+	for line in $(cat $PROCPARTITIONS | tail -n +3 | sed -e 's/^  *//' | grep -v -e "^$dmnumber"); do
+		line=$(echo $line | sed -e 's/  */ /g')
 		total=$(echo $line | cut -d' ' -f3)
 		total=$(humanize_size ${total%%.*})
-		free=$(echo $line | cut -d' ' -f4)
-		free=$(humanize_size ${free%%.*})
-		used=$(echo $line | cut -d' ' -f5)
-		used=$(humanize_size ${used%%.*})
+		VOLUME=$(echo $line | cut -d' ' -f4)
+		RVOLUME="/dev/$(echo $line | cut -d' ' -f4)"
+		line=$($GREP -e " $RVOLUME " $tmp)
+		detect_mounted
+		if [ -z $MOUNTED ]; then
+			count=$($GREP $VOLUME $PROCPARTITIONS | wc -l)
+			[ $count -gt 1 ] && MOUNTED="PARTITIONED"
+		fi
 
-		printf "$format" "$device" "$free" "$used" "$total" "$group"
-		device=
+		if [ ! -z $line ]; then
+			line=$(echo $line | sed -e 's/^ *\//\//')
+			RVOLUME=$(echo $line | cut -d' ' -f1)
+			group=$(echo $line | cut -d' ' -f2)
+			total=$(echo $line | cut -d' ' -f3)
+			total=$(humanize_size ${total%%.*})
+			free=$(echo $line | cut -d' ' -f4)
+			free=$(humanize_size ${free%%.*})
+			used=$(echo $line | cut -d' ' -f5)
+			used=$(humanize_size ${used%%.*})
+		fi
+
+		printf "$format" "$RVOLUME" "$free" "$used" "$total" "$group" "$MOUNTED"
+		RVOLUME=
 		free=
 		used=
 		total=
 		group=
+		MOUNTED=
 		c=$((c+1))
 	done
 	if [ $c -eq 0 ]; then
@@ -884,6 +902,7 @@ list_devices() {
 	fi
 	echo $separator
 	IFS=$IFS_OLD
+	rm -f $tmp
 }
 
 ################################
@@ -951,6 +970,64 @@ list() {
 	fi
 }
 
+############################
+# Add devices into the group
+############################
+add() {
+	vg_create=0
+	tmp=$(mktemp)
+
+	for i in $@; do
+		if [ -b $i ]; then
+			devices="$devices $i"
+			devcount=$(($devcount+1))
+			continue
+		elif [ -z $vg ]; then vgname=$i; else
+			error "Wrong option $i. (see: $TOOL --help)"
+		fi
+	done
+
+	[ $devcount -eq 0 ] && error "No suitable device specified."
+	$LVM vgs -o vg_name --separator ' ' --noheadings | sed -e 's/^ *//' > $tmp
+
+	if [ -z "$vgname" ]; then
+		lines=$(wc -l $tmp)
+		lines=${lines%% *}
+
+		if [ $lines -eq 1 ]; then
+			vgname=$(cut -d' ' -f1 $tmp)
+		elif [ $lines -gt 1 ]; then
+			list_pool
+			rm -f $tmp
+			error "Please, specify group you want to add the device into"
+		elif [ $lines -eq 0 ]; then
+			for i in $(seq -w $MAX_VGS); do
+				$LVM vgs vg${i} &> /dev/null
+				if [ $? -ne 0 ]; then
+					vgname="vg${i}"
+					break;
+				fi
+			done
+			vg_create=1
+		fi
+	else
+		$GREP -e "$vgname" $tmp &> /dev/null
+		vg_create=$?
+	fi
+	rm -f $tmp
+
+	[ -z "$vgname" ] && error "No suitable name for volume group found."
+	detect_device_group $devices
+
+	if [ $vg_create -eq 1 ]; then
+		dry $LVM vgcreate $VERB $vgname $devices
+	elif [ ! -z $NOT_IN_GROUP ]; then
+		dry $LVM vgextend $VERB $vgname $NOT_IN_GROUP
+	else
+		warn "Nothing to do"
+	fi
+}
+
 
 ####################################
 # Calclulate diff between two dates
@@ -1050,6 +1127,7 @@ do
 	  "create") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "destroy") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "list") COMMAND=$1; shift; ARGS=$@; break ;;
+	  "add") COMMAND=$1; shift; ARGS=$@; break ;;
 	  *) error "Wrong argument \"$1\". (see: $TOOL --help)"
 	esac
 	shift
-- 
1.7.4.4
