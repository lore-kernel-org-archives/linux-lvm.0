From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:27 +0200
Message-Id: <1316623554-28975-9-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 08/35] fsadm: Update "list" command for better
	alignment
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

The output of list command is now dynamically aligned so it should be
well readably even in the case there are long names. It looks much
better this way.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |  206 +++++++++++++++++++++++++++++++++++++-----------------
 1 files changed, 141 insertions(+), 65 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 5dc945b..d42b759 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -807,19 +807,12 @@ detect_fs_size() {
 #############################
 list_filesystems() {
 	IFS=$NL
-	format="%-20s%-8s%-13s%-13s%-13s%s\n"
-	header=$(printf $format "Volume" "Type" "Free" "Used" "Total" "Mount point")
-	separator=""
-	for i in $(seq ${#header}); do
-		separator+="-"
-	done
-	echo $separator
-	echo $header
-	echo $separator
-	c=0
+	local c=0
 	for line in $(LANG=C $LVM lvs -o lv_path,lv_size --noheadings --separator ' ' --nosuffix --units k 2> /dev/null); do
+		c=$((c+1))
 		line=$(echo $line | sed -e 's/^ *\//\//')
 		volume=$(echo $line | cut -d' ' -f1)
+		volumes[$c]=$volume
 		detect_fs $volume
 		detect_mounted
 		detect_fs_size
@@ -827,20 +820,60 @@ list_filesystems() {
 			total=$(echo $line | cut -d' ' -f2)
 			TOTAL=$(humanize_size ${total%%.})
 		fi
-		printf "$format" "$volume" "$FSTYPE" "$FREE" "$USED" "$TOTAL" "$MOUNTED"
-		volume=
+		total[$c]=$TOTAL
+		fstype[$c]=$FSTYPE
+		free[$c]=$FREE
+		used[$c]=$USED
+		mounted[$c]=$MOUNTED
 		FSTYPE=
 		FREE=
 		USED=
 		TOTAL=
 		MOUNTED=
-		c=$((c+1))
 	done
+	IFS=$IFS_OLD
+
 	if [ $c -eq 0 ]; then
 		echo " No file systems suitable for managing by $TOOL found."
+		return
 	fi
+
+	len_volume=6
+	len_fstype=2
+	len_free=4
+	len_used=4
+	len_total=5
+	len_mounted=11
+	for i in $(seq $c); do
+		local _volume=${volumes[$i]}
+		local _fstype=${fstype[$i]}
+		local _total=${total[$i]}
+		local _free=${free[$i]}
+		local _used=${used[$i]}
+		local _mounted=${mounted[$i]}
+		[ ${#_volume} -gt "0$len_volume" ] && len_volume=${#_volume}
+		[ ${#_fstype} -gt "0$len_fstype" ] && len_fstype=${#_fstype}
+		[ ${#_total} -gt "0$len_total" ] && len_total=${#_total}
+		[ ${#_free} -gt "0$len_free" ] && len_free=${#_free}
+		[ ${#_used} -gt "0$len_used" ] && len_used=${#_used}
+		[ ${#_mounted} -gt "0$len_mounted" ] && len_mounted=${#_mounted}
+	done
+
+	format="%-$(($len_volume+2))s%-$(($len_fstype+2))s%-$(($len_free+2))s%-$(($len_used+2))s%-$(($len_total+2))s%-$(($len_mounted+2))s\n"
+	header=$(printf "$format" "Volume" "FS" "Free" "Used" "Total" "Mount point")
+	separator=""
+	for i in $(seq ${#header}); do
+		separator+="-"
+	done
+	echo $separator
+	printf "$format" "Volume" "FS" "Free" "Used" "Total" "Mount point"
+	echo $separator
+
+	for i in $(seq $c); do
+		printf "$format" "${volumes[$i]}" "${fstype[$i]}" "${free[$i]}" "${used[$i]}" "${total[$i]}" "${mounted[$i]}"
+	done
+
 	echo $separator
-	IFS=$IFS_OLD
 }
 
 ###########################
@@ -850,23 +883,15 @@ list_devices() {
 	IFS=$NL
 	tmp=$(mktemp)
 
-	format="%-13s%-13s%-13s%-13s%-13s%s\n"
-	header=$(printf $format "Device" "Free" "Used" "Total" "Group" "Mount point")
-	separator=""
-	for i in $(seq ${#header}); do
-		separator+="-"
-	done
-	echo $separator
-	echo $header
-	echo $separator
 	c=0
 	dmnumber=$(cat $PROCDEVICES | grep device-mapper | sed -e 's/^  *//')
 	dmnumber=${dmnumber%% *}
 	LANG=C $LVM pvs -o pv_name,vg_name,pv_size,pv_free,pv_used --separator ' ' --noheadings --nosuffix --units k > $tmp
 	for line in $(cat $PROCPARTITIONS | tail -n +3 | sed -e 's/^  *//' | grep -v -e "^$dmnumber"); do
+		c=$((c+1))
 		line=$(echo $line | sed -e 's/  */ /g')
-		total=$(echo $line | cut -d' ' -f3)
-		total=$(humanize_size ${total%%.*})
+		_total=$(echo $line | cut -d' ' -f3)
+		total[$c]=$(humanize_size ${_total%%.*})
 		VOLUME=$(echo $line | cut -d' ' -f4)
 		RVOLUME="/dev/$(echo $line | cut -d' ' -f4)"
 		line=$($GREP -e " $RVOLUME " $tmp)
@@ -878,31 +903,65 @@ list_devices() {
 
 		if [ ! -z $line ]; then
 			line=$(echo $line | sed -e 's/^ *\//\//')
-			RVOLUME=$(echo $line | cut -d' ' -f1)
-			group=$(echo $line | cut -d' ' -f2)
-			total=$(echo $line | cut -d' ' -f3)
-			total=$(humanize_size ${total%%.*})
-			free=$(echo $line | cut -d' ' -f4)
-			free=$(humanize_size ${free%%.*})
-			used=$(echo $line | cut -d' ' -f5)
-			used=$(humanize_size ${used%%.*})
+			group[$c]=$(echo $line | cut -d' ' -f2)
+			_total=$(echo $line | cut -d' ' -f3)
+			total[$c]=$(humanize_size ${_total%%.*})
+			_free=$(echo $line | cut -d' ' -f4)
+			free[$c]=$(humanize_size ${_free%%.*})
+			_used=$(echo $line | cut -d' ' -f5)
+			used[$c]=$(humanize_size ${_used%%.*})
 		fi
-
-		printf "$format" "$RVOLUME" "$free" "$used" "$total" "$group" "$MOUNTED"
-		RVOLUME=
+		volumes[$c]=$RVOLUME
+		mounted[$c]=$MOUNTED
 		free=
 		used=
 		total=
-		group=
 		MOUNTED=
-		c=$((c+1))
 	done
+	IFS=$IFS_OLD
+	rm -f $tmp
+
 	if [ $c -eq 0 ]; then
 		echo " No devices found."
+		return
 	fi
+
+	len_volume=6
+	len_free=4
+	len_used=4
+	len_total=5
+	len_group=5
+	len_mounted=11
+	for i in $(seq $c); do
+		local _volume=${volumes[$i]}
+		local _free=${free[$i]}
+		local _used=${used[$i]}
+		local _total=${total[$i]}
+		local _group=${group[$i]}
+		local _mounted=${mounted[$i]}
+		[ ${#_volume} -gt "0$len_volume" ] && len_volume=${#_volume}
+		[ ${#_free} -gt "0$len_free" ] && len_free=${#_free}
+		[ ${#_used} -gt "0$len_used" ] && len_used=${#_used}
+		[ ${#_total} -gt "0$len_total" ] && len_total=${#_total}
+		[ ${#_group} -gt "0$len_group" ] && len_group=${#_group}
+		[ ${#_mounted} -gt "0$len_mounted" ] && len_mounted=${#_mounted}
+	done
+
+	format="%-$(($len_volume+2))s%-$(($len_free+2))s%-$(($len_used+2))s%-$(($len_total+2))s%-$(($len_group+2))s%-$(($len_mounted+2))s\n"
+	header=$(printf $format "Device" "Free" "Used" "Total" "Group" "Mount point")
+	separator=""
+	for i in $(seq ${#header}); do
+		separator+="-"
+	done
+	echo $separator
+	printf $format "Device" "Free" "Used" "Total" "Group" "Mount point"
+	echo $separator
+
+	for i in $(seq $c); do
+		printf "$format" "${volumes[$i]}" "${free[$i]}" "${used[$i]}" "${total[$i]}" "${group[$i]}" "${mounted[$i]}"
+	done
+
 	echo $separator
-	IFS=$IFS_OLD
-	rm -f $tmp
 }
 
 ################################
@@ -910,41 +969,58 @@ list_devices() {
 ################################
 list_pool() {
 	IFS=$NL
+	c=0
+	for line in $(LANG=C $LVM vgs -o vg_name,pv_count,vg_size,vg_free --separator ' ' --noheadings --nosuffix --units k 2> /dev/null); do
+		c=$((c+1))
+		line=$(echo $line | sed -e 's/^ *//')
+		group[$c]=$(echo $line | cut -d' ' -f1)
+		devices[$c]=$(echo $line | cut -d' ' -f2)
+		_total=$(echo $line | cut -d' ' -f3)
+		_free=$(echo $line | cut -d' ' -f4)
+		_used=$((${_total%%.*}-${_free%%.*}))
+		used[$c]=$(humanize_size ${_used%%.*})
+		total[$c]=$(humanize_size ${_total%%.*})
+		free[$c]=$(humanize_size ${_free%%.*})
+	done
+	IFS=$IFS_OLD
 
-	format="%-10s%-9s%-13s%-13s%s\n"
+	if [ $c -eq 0 ]; then
+		echo " No pools found on the system."
+		return
+	fi
+
+	len_group=5
+	len_devices=6
+	len_free=4
+	len_used=4
+	len_total=5
+	for i in $(seq $c); do
+		local _group=${group[$i]}
+		local _devices=${devices[$i]}
+		local _free=${free[$i]}
+		local _used=${used[$i]}
+		local _total=${total[$i]}
+		[ ${#_group} -gt "0$len_group" ] && len_group=${#_group}
+		[ ${#_devices} -gt "0$len_devices" ] && len_devices=${#_devices}
+		[ ${#_free} -gt "0$len_free" ] && len_free=${#_free}
+		[ ${#_used} -gt "0$len_used" ] && len_used=${#_used}
+		[ ${#_total} -gt "0$len_total" ] && len_total=${#_total}
+	done
+
+	format="%-$(($len_group+2))s%-$(($len_devices+2))s%-$(($len_free+2))s%-$(($len_used+2))s%-$(($len_total+2))s\n"
 	header=$(printf $format "Group" "Devices" "Free" "Used" "Total")
 	separator=""
 	for i in $(seq ${#header}); do
 		separator+="-"
 	done
 	echo $separator
-	echo $header
+	printf $format "Group" "Devices" "Free" "Used" "Total"
 	echo $separator
-	c=0
-	for line in $(LANG=C $LVM vgs -o vg_name,pv_count,vg_size,vg_free --separator ' ' --noheadings --nosuffix --units k 2> /dev/null); do
-		line=$(echo $line | sed -e 's/^ *//')
-		group=$(echo $line | cut -d' ' -f1)
-		devices=$(echo $line | cut -d' ' -f2)
-		total=$(echo $line | cut -d' ' -f3)
-		free=$(echo $line | cut -d' ' -f4)
-		used=$((${total%%.*}-${free%%.*}))
-		used=$(humanize_size ${used%%.*})
-		total=$(humanize_size ${total%%.*})
-		free=$(humanize_size ${free%%.*})
-
-		printf "$format" "$group" "$devices" "$free" "$used" "$total"
-		group=
-		devices=
-		total=
-		free=
-		used=
-		c=$((c+1))
+
+	for i in $(seq $c); do
+		printf "$format" "${group[$i]}" "${devices[$i]}" "${free[$i]}" "${used[$i]}" "${total[$i]}"
 	done
-	if [ $c -eq 0 ]; then
-		echo " No pools found on the system."
-	fi
 	echo $separator
-	IFS=$IFS_OLD
 }
 
 #############################
-- 
1.7.4.4
