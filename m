From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:34 +0200
Message-Id: <1316623554-28975-16-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 15/35] fsadm: Make all internal math in kilobytes
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

We should make all math in fsadm to count with kilobytes (if possible)
because it will bypass the problem of having too big numbers. Also the
smaller granularity might have troubles with 512B alignment.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   74 ++++++++++++++++++++++++++---------------------------
 1 files changed, 36 insertions(+), 38 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 028bc04..233b4fc 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -181,15 +181,14 @@ humanize_size() {
 		count=$(($count+1))
 	done
 	case $count in
-		0) unit="B" ;;
-		1) unit="KiB" ;;
-		2) unit="MiB" ;;
-		3) unit="GiB" ;;
-		4) unit="TiB" ;;
-		5) unit="PiB" ;;
-		6) unit="EiB" ;;
-		7) unit="ZiB" ;;
-		8) unit="YiB" ;;
+		0) unit="KiB" ;;
+		1) unit="MiB" ;;
+		2) unit="GiB" ;;
+		3) unit="TiB" ;;
+		4) unit="PiB" ;;
+		5) unit="EiB" ;;
+		6) unit="ZiB" ;;
+		7) unit="YiB" ;;
 		*) unit="???" ;;
 	esac
 	echo "$size $unit"
@@ -210,11 +209,11 @@ get_ext_size() {
 		esac
 	done
 
-	total=$(($bcount*$bsize))
+	total=$(($bcount*$bsize/1024))
 	TOTAL=$(humanize_size $total)
-	used=$((($bcount-$fbcount)*$bsize))
+	used=$((($bcount-$fbcount)*$bsize/1024))
 	USED=$(humanize_size $used)
-	free=$((($fbcount-$rbcount)*$bsize))
+	free=$((($fbcount-$rbcount)*$bsize/1024))
 	FREE=$(humanize_size $free)
 	IFS=$IFS_OLD
 }
@@ -241,11 +240,11 @@ get_xfs_size() {
 		bcount=$(($bcount-$lbcount))
 		fbcount=$(($fbcount-(4+(4*$agcount))))
 
-		total=$(($bcount*$bsize))
+		total=$(($bcount*$bsize/1024))
 		TOTAL=$(humanize_size $total)
-		used=$((($bcount-$fbcount)*$bsize))
+		used=$((($bcount-$fbcount)*$bsize/1024))
 		USED=$(humanize_size $used)
-		free=$(($fbcount*$bsize))
+		free=$(($fbcount*$bsize/1024))
 		FREE=$(humanize_size $free)
 		return
 	fi
@@ -273,21 +272,20 @@ detect_fs_size() {
 }
 
 # convert parameter from Exa/Peta/Tera/Giga/Mega/Kilo/Bytes and blocks
-# (2^(60/50/40/30/20/10/0))
+# (2^(60/50/40/30/20/10/0)) into Kilobytes (KiB)
 decode_size() {
 	case "$1" in
-	 *[eE]) NEWSIZE=$(float_math "${1%[eE]} * 1152921504606846976") ;;
-	 *[pP]) NEWSIZE=$(float_math "${1%[pP]} * 1125899906842624") ;;
-	 *[tT]) NEWSIZE=$(float_math "${1%[tT]} * 1099511627776") ;;
-	 *[gG]) NEWSIZE=$(float_math "${1%[gG]} * 1073741824") ;;
-	 *[mM]) NEWSIZE=$(float_math "${1%[mM]} * 1048576") ;;
-	 *[kK]) NEWSIZE=$(float_math "${1%[kK]} * 1024") ;;
-	 *[bB]) NEWSIZE=${1%[bB]} ;;
-	     *) NEWSIZE=$(( $1 * $2 )) ;;
+	 *[eE]) NEWSIZE=$(float_math "${1%[eE]} * 1125899906842624") ;;
+	 *[pP]) NEWSIZE=$(float_math "${1%[pP]} * 1099511627776") ;;
+	 *[tT]) NEWSIZE=$(float_math "${1%[tT]} * 1073741824") ;;
+	 *[gG]) NEWSIZE=$(float_math "${1%[gG]} * 1048576") ;;
+	 *[mM]) NEWSIZE=$(float_math "${1%[mM]} * 1024") ;;
+	 *[kK]) NEWSIZE=${1%[kK]} ;;
+	 *[bB]) NEWSIZE=$(float_math "${1%[bB]} / 1024") ;;
 	esac
 
 	NEWSIZE=${NEWSIZE%%.*}
-	NEWBLOCKCOUNT=$(float_math "$NEWSIZE / $2")
+	NEWBLOCKCOUNT=$(float_math "($NEWSIZE / $2) * 1024")
 	NEWBLOCKCOUNT=${NEWBLOCKCOUNT%%.*}
 }
 
@@ -423,7 +421,7 @@ resize_ext() {
 		esac
 	fi
 
-	verbose "Resizing filesystem on device \"$VOLUME\" to $NEWSIZE bytes ($BLOCKCOUNT -> $NEWBLOCKCOUNT blocks of $BLOCKSIZE bytes)"
+	verbose "Resizing filesystem on device \"$VOLUME\" to $NEWSIZE KiB ($BLOCKCOUNT -> $NEWBLOCKCOUNT blocks of $BLOCKSIZE bytes)"
 	dry "$RESIZE_EXT" $FSFORCE "$VOLUME" $NEWBLOCKCOUNT
 }
 
@@ -444,11 +442,11 @@ resize_reiser() {
 	done
 	validate_parsing "$TUNE_REISER"
 	decode_size $1 $BLOCKSIZE
-	verbose "Resizing \"$VOLUME\" $BLOCKCOUNT -> $NEWBLOCKCOUNT blocks ($NEWSIZE bytes, bs: $NEWBLOCKCOUNT)"
+	verbose "Resizing \"$VOLUME\" $BLOCKCOUNT -> $NEWBLOCKCOUNT blocks ($NEWSIZE KiB, bs: $NEWBLOCKCOUNT)"
 	if [ -n "$YES" ]; then
-		echo y | dry "$RESIZE_REISER" -s $NEWSIZE "$VOLUME"
+		echo y | dry "$RESIZE_REISER" -s ${NEWSIZE}K "$VOLUME"
 	else
-		dry "$RESIZE_REISER" -s $NEWSIZE "$VOLUME"
+		dry "$RESIZE_REISER" -s ${NEWSIZE}K "$VOLUME"
 	fi
 }
 
@@ -552,9 +550,9 @@ resize_fs() {
 resize_lvolume() {
 	lvname=$1
 	newsize=$2
-	lvsize=$(LANG=C $LVM lvs -o lv_size --separator ' ' --noheadings --nosuffix --units b $lvname 2> /dev/null | sed -e 's/^ *//')
+	lvsize=$(LANG=C $LVM lvs -o lv_size --separator ' ' --noheadings --nosuffix --units k $lvname 2> /dev/null | sed -e 's/^ *//')
 	if [ $lvsize != $newsize ]; then
-		dry $LVM lvresize $VERB $FORCE -L${newsize}b $lvname
+		dry $LVM lvresize $VERB $FORCE -L${newsize}k $lvname
 	else
 		verbose "Logical volume already is of the size you're trying to resize it to"
 	fi
@@ -740,8 +738,8 @@ create() {
 	# there is only one vgroup, or use the one with enough
 	# free space in it
 	if [ -z "$vgname" ]; then
-		vgroups=$($LVM vgs -o vg_name,vg_free --separator ' ' --noheadings --units b 2> /dev/null)
-		lines=$($LVM vgs -o vg_name,vg_free --separator ' ' --noheadings --units b 2> /dev/null | wc -l)
+		vgroups=$($LVM vgs -o vg_name,vg_free --separator ' ' --noheadings --units k 2> /dev/null)
+		lines=$($LVM vgs -o vg_name,vg_free --separator ' ' --noheadings --units k 2> /dev/null | wc -l)
 
 		if [ $lines -eq 1 ]; then
 			vgname=$(echo $vgroups | sed -e 's/^ *//' | cut -d' ' -f1)
@@ -935,7 +933,7 @@ remove() {
 		echo "Usage: $TOOL remove [mount point | dm device | voulume group | device | --all]"
 		exit 0
 	elif [ "$1" == "--all" ]; then
-		list="$(LANG=C $LVM vgs -o vg_name --separator ' ' --noheadings --nosuffix --units b 2> /dev/null)"
+		list="$(LANG=C $LVM vgs -o vg_name --separator ' ' --noheadings --nosuffix --units k 2> /dev/null)"
 	else
 		list=$@
 	fi
@@ -957,7 +955,7 @@ remove() {
 list_filesystems() {
 	IFS=$NL
 	local c=0
-	for line in $(LANG=C $LVM lvs -o lv_path,lv_size,segtype --noheadings --separator ' ' --nosuffix --units b 2> /dev/null); do
+	for line in $(LANG=C $LVM lvs -o lv_path,lv_size,segtype --noheadings --separator ' ' --nosuffix --units k 2> /dev/null); do
 		line=$(echo $line | sed -e 's/^ *\//\//')
 		volume=$(echo $line | cut -d' ' -f1)
 		[ "$volume" == "$last_volume" ] && continue
@@ -1041,11 +1039,11 @@ list_devices() {
 	c=0
 	dmnumber=$(cat $PROCDEVICES | grep device-mapper | sed -e 's/^  *//')
 	dmnumber=${dmnumber%% *}
-	LANG=C $LVM pvs -o pv_name,vg_name,pv_size,pv_free,pv_used --separator ' ' --noheadings --nosuffix --units b > $tmp
+	LANG=C $LVM pvs -o pv_name,vg_name,pv_size,pv_free,pv_used --separator ' ' --noheadings --nosuffix --units k > $tmp
 	for line in $(cat $PROCPARTITIONS | tail -n +3 | sed -e 's/^  *//' | grep -v -e "^$dmnumber"); do
 		c=$((c+1))
 		line=$(echo $line | sed -e 's/  */ /g')
-		_total=$(($(echo $line | cut -d' ' -f3)*1024))
+		_total=$(echo $line | cut -d' ' -f3)
 		local total[$c]=$(humanize_size ${_total%%.*})
 		VOLUME=$(echo $line | cut -d' ' -f4)
 		RVOLUME="/dev/$(echo $line | cut -d' ' -f4)"
@@ -1125,7 +1123,7 @@ list_devices() {
 list_pool() {
 	IFS=$NL
 	c=0
-	for line in $(LANG=C $LVM vgs -o vg_name,pv_count,vg_size,vg_free --separator ' ' --noheadings --nosuffix --units b 2> /dev/null); do
+	for line in $(LANG=C $LVM vgs -o vg_name,pv_count,vg_size,vg_free --separator ' ' --noheadings --nosuffix --units k 2> /dev/null); do
 		c=$((c+1))
 		line=$(echo $line | sed -e 's/^ *//')
 		local group[$c]=$(echo $line | cut -d' ' -f1)
-- 
1.7.4.4
