From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:20 +0200
Message-Id: <1316623554-28975-2-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 01/35] fsadm: Add "create" command
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

Create command provides the functionality of creating a new logical
volumes including defined file system.

This commit also changes the way how are commands recognised an
executed. The new approach is more suitable for bigger number of
commands.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |  140 ++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 files changed, 131 insertions(+), 9 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index c8cc5e0..42c7da4 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -29,7 +29,7 @@
 #   2 break detected
 #   3 unsupported online filesystem check for given mounted fs
 
-TOOL=fsadm
+TOOL=$(basename $0)
 
 _SAVEPATH=$PATH
 PATH=/sbin:/usr/sbin:/bin:/usr/sbin:$PATH
@@ -76,6 +76,8 @@ REMOUNT=
 PROCMOUNTS="/proc/mounts"
 NULL="$DM_DEV_DIR/null"
 
+MAX_VGS=999
+
 IFS_OLD=$IFS
 # without bash $'\n'
 NL='
@@ -122,6 +124,14 @@ dry() {
 	fi
 	verbose "Executing $@"
 	$@
+	if [ $? -ne 0 ]; then
+		error "FAILED. Exitting!"
+	fi
+}
+
+is_natural() {
+	test "$1" -ge 0 &> /dev/null && return 1
+	return 0
 }
 
 cleanup() {
@@ -365,12 +375,42 @@ resize_xfs() {
 	fi
 }
 
+make_ext() {
+	device=$1
+	fstyp=$2
+	stripe=$3
+	stripesize=$4
+	bsize=4
+
+	if [ "$YES" ]; then
+		force="-F"
+	fi
+	stride=$(($stripesize/$bsize))
+	stripewidth=$(($stride*$stripe))
+
+	dry mkfs.$fstyp $force -b$(($bsize*1024)) -E stride=${stride},stripe-width=${stripewidth} $device
+}
+
+generic_make_fs() {
+	device=$1
+	fstyp=$2
+	bsize=4096
+
+	if [ "$YES" ]; then
+		force="-f"
+	fi
+
+	dry mkfs.$fstyp $force $device
+}
+
 ####################
 # Resize filesystem
 ####################
 resize() {
 	NEWSIZE=$2
 	detect_fs "$1"
+	is_natural $NEWSIZE
+	[ $? -ne 1 ] && error "$NEWSIZE is not valid number for file system size"
 	detect_device_size
 	verbose "Device \"$VOLUME\" size is $DEVSIZE bytes"
 	# if the size parameter is missing use device size
@@ -386,6 +426,89 @@ resize() {
 	cleanup 0
 }
 
+name_exists() {
+	cmd=$1
+	search=$2
+	$LVM $cmd --separator ' ' 2>&1 | tail -n-1 | cut -d' ' -f3 | grep $search 2>&1> /dev/null
+	if [ $? -eq 0 ]; then
+		return 1
+	fi
+	return 0
+}
+
+#############################
+# Create a new logical volume
+#############################
+create() {
+	size="-l 100%FREE"
+	devcount=0
+
+	for i in $@; do
+		if [ -b $i ]; then
+			devices="$devices $i"
+			devcount=$(($devcount+1))
+			continue
+		fi
+		case $i in
+			"stripesize"* | "chunksize"*) stripesize=${i##*=} ;;
+			"name"*) name="--name ${i##*=}" ;;
+			"fstyp"*) fstyp=${i##*=} ;;
+			"size"*) size="-L ${i##*=}" ;;
+			*) error "Wrong option $i. (see: $TOOL --help)"
+		esac
+	done
+
+	for i in $(seq -w $MAX_VGS); do
+		name_exists vgs vg${i}
+		if [ $? -eq 0 ]; then
+			vgname="vg${i}"
+			break;
+		fi
+	done
+
+	[ -z "$vgname" ] && error "No suitable name for volume group found."
+	[ $devcount -eq 0 ] && error "No suitable device specified."
+
+	if [ "$stripesize" ]; then
+		striped="-i $devcount -I $stripesize"
+	fi
+
+	if [ "$name" ]; then
+		lvname="--name $name"
+	else
+		for i in $(seq -w $MAX_VGS); do
+			name_exists "vgs $vgname" lvol${i}
+			if [ $? -eq 0 ]; then
+				name="lvol${i}"
+				lvname="--name $name"
+				break;
+			fi
+		done
+	fi
+
+	dry $LVM vgcreate $VERB $vgname $devices
+	dry $LVM lvcreate $VERB $lvname $size $striped $vgname
+	device="/dev/${vgname}/${name}"
+
+	guess=0
+	echo "$fstyp"
+	if [ -z $fstyp ]; then
+		fstyp=$(echo $TOOL | sed 's/^.*\.//g')
+		guess=1
+	fi
+
+	case $fstyp in
+		ext[234]) make_ext $device $fstyp $devcount $stripesize ;;
+		xfs|reiserfs) generic_make_fs $device $fstyp;;
+		*)	if [ $guess -eq 1 ]; then
+				return 0
+			else
+				error "Filesystem $fstyp is not supported"
+			fi
+			;;
+	esac
+}
+
 ####################################
 # Calclulate diff between two dates
 #  LANG=C input is expected the
@@ -477,18 +600,17 @@ do
 	  "-e"|"--ext-offline") EXTOFF=1 ;;
 	  "-y"|"--yes") YES="-y" ;;
 	  "-l"|"--lvresize") DO_LVRESIZE=1 ;;
-	  "check") CHECK="$2" ; shift ;;
-	  "resize") RESIZE="$2"; NEWSIZE="$3" ; shift 2 ;;
+	  "check") COMMAND=$1; shift; ARGS=$@; break ;;
+	  "resize") COMMAND=$1; shift; ARGS=$@; break ;;
+	  "create") COMMAND=$1; shift; ARGS=$@; break ;;
 	  *) error "Wrong argument \"$1\". (see: $TOOL --help)"
 	esac
 	shift
 done
 
-if [ -n "$CHECK" ]; then
-	check "$CHECK"
-elif [ -n "$RESIZE" ]; then
-	export FSADM_RUNNING="fsadm"
-	resize "$RESIZE" "$NEWSIZE"
-else
+if [ -z $COMMAND ]; then
 	error "Missing command. (see: $TOOL --help)"
 fi
+
+export FSADM_RUNNING="fsadm"
+$COMMAND $ARGS
-- 
1.7.4.4
