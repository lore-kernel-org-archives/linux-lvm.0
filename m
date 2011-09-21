From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:45 +0200
Message-Id: <1316623554-28975-27-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 26/35] fsadm: Allow to specify lv in vg/lv format
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

Various lvm tools does allow to specify logical volume in vg/lv
format, which meand no real path is provided.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   24 +++++++++++++++---------
 1 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index f354fec..ba78533 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -288,10 +288,7 @@ decode_size() {
 	NEWBLOCKCOUNT=${NEWBLOCKCOUNT%%.*}
 }
 
-# detect filesystem on the given device
-# dereference device name if it is symbolic link
-detect_fs() {
-	VOLUME_ORIG=$1
+get_volume() {
 	VOLUME=${DM_DEV_DIR}/${1/#"${DM_DEV_DIR}/"/}
 	if [ -h "$VOLUME" ]; then
 		VOLUME=$("$READLINK" $READLINK_E "$VOLUME") || error "Cannot get readlink \"$VOLUME\""
@@ -303,6 +300,12 @@ detect_fs() {
 		read </sys/block/${RVOLUME#/dev/}/dm/name SYSVOLUME 2>&1 && VOLUME="$DM_DEV_DIR/mapper/$SYSVOLUME"
 		;;
 	esac
+}
+
+# detect filesystem on the given device
+# dereference device name if it is symbolic link
+detect_fs() {
+	get_volume $1
 	# use null device as cache file to be sure about the result
 	# not using option '-o value' to be compatible with older version of blkid
 	FSTYPE=$("$BLKID" -c "$NULL" -s TYPE "$VOLUME") || return 1
@@ -532,6 +535,7 @@ resize_fs() {
 	[ $? -eq 1 ] && error "Cannot get FSTYPE of \"$VOLUME\""
 	verbose "\"$FSTYPE\" filesystem found on \"$VOLUME\""
 	if [ "$NEWSIZE" ]; then
+		decode_size $NEWSIZE
 		is_natural $NEWSIZE
 		[ $? -ne 1 ] && error "$NEWSIZE is not valid number for file system size"
 	fi
@@ -571,15 +575,16 @@ resize() {
 	fi
 
 	for i in $@; do
-		if [ -b $i ]; then
+		get_volume $i
+		if [ -b $VOLUME ]; then
 			if [ -z $devcount ]; then
 				$LVM lvs $i &> /dev/null
 				if [ $? -eq 0 ]; then
-					lvname=$i
+					lvname=$VOLUME
 					devcount=0
 					continue
 				else
-					error "$i is not valid logical volume"
+					error "$VOLUME is not valid logical volume"
 				fi
 			fi
 			devices="$devices $i"
@@ -861,8 +866,9 @@ do_remove() {
 	MOUNTED=
 
 	# Block device has been given
-	if [ -b $item ]; then
-		device=$item
+	get_volume $item
+	if [ -b $VOLUME ]; then
+		device=$VOLUME
 	fi
 
 	# Mount point has been given
-- 
1.7.4.4
