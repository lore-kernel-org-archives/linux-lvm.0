From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:30 +0200
Message-Id: <1316623554-28975-12-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 11/35] fsadm: Add "remove" command
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

Remove command allows to remove unused devices from the pool (volume
group).

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   82 ++++++++++++++++++++++++++++++++++++++++-------------
 1 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 6617de0..4a4f625 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -823,11 +823,12 @@ list_filesystems() {
 	IFS=$NL
 	local c=0
 	for line in $(LANG=C $LVM lvs -o lv_path,lv_size,segtype --noheadings --separator ' ' --nosuffix --units k 2> /dev/null); do
-		c=$((c+1))
 		line=$(echo $line | sed -e 's/^ *\//\//')
 		volume=$(echo $line | cut -d' ' -f1)
-		volumes[$c]=$volume
-		segtype[$c]=$(echo $line | cut -d' ' -f3)
+		[ "$volume" == "$last_volume" ] && continue
+		c=$((c+1))
+		local volumes[$c]=$volume
+		local segtype[$c]=$(echo $line | cut -d' ' -f3)
 		detect_fs $volume
 		detect_mounted
 		detect_fs_size
@@ -835,16 +836,17 @@ list_filesystems() {
 			total=$(echo $line | cut -d' ' -f2)
 			TOTAL=$(humanize_size ${total%%.})
 		fi
-		total[$c]=$TOTAL
-		fstype[$c]=$FSTYPE
-		free[$c]=$FREE
-		used[$c]=$USED
-		mounted[$c]=$MOUNTED
+		local total[$c]=$TOTAL
+		local fstype[$c]=$FSTYPE
+		local free[$c]=$FREE
+		local used[$c]=$USED
+		local mounted[$c]=$MOUNTED
 		FSTYPE=
 		FREE=
 		USED=
 		TOTAL=
 		MOUNTED=
+		last_volume=$volume
 	done
 	IFS=$IFS_OLD
 
@@ -909,7 +911,7 @@ list_devices() {
 		c=$((c+1))
 		line=$(echo $line | sed -e 's/  */ /g')
 		_total=$(echo $line | cut -d' ' -f3)
-		total[$c]=$(humanize_size ${_total%%.*})
+		local total[$c]=$(humanize_size ${_total%%.*})
 		VOLUME=$(echo $line | cut -d' ' -f4)
 		RVOLUME="/dev/$(echo $line | cut -d' ' -f4)"
 		line=$($GREP -e " $RVOLUME " $tmp)
@@ -921,16 +923,16 @@ list_devices() {
 
 		if [ ! -z $line ]; then
 			line=$(echo $line | sed -e 's/^ *\//\//')
-			group[$c]=$(echo $line | cut -d' ' -f2)
+			local group[$c]=$(echo $line | cut -d' ' -f2)
 			_total=$(echo $line | cut -d' ' -f3)
-			total[$c]=$(humanize_size ${_total%%.*})
+			local total[$c]=$(humanize_size ${_total%%.*})
 			_free=$(echo $line | cut -d' ' -f4)
-			free[$c]=$(humanize_size ${_free%%.*})
+			local free[$c]=$(humanize_size ${_free%%.*})
 			_used=$(echo $line | cut -d' ' -f5)
-			used[$c]=$(humanize_size ${_used%%.*})
+			local used[$c]=$(humanize_size ${_used%%.*})
 		fi
-		volumes[$c]=$RVOLUME
-		mounted[$c]=$MOUNTED
+		local volumes[$c]=$RVOLUME
+		local mounted[$c]=$MOUNTED
 		free=
 		used=
 		total=
@@ -991,14 +993,14 @@ list_pool() {
 	for line in $(LANG=C $LVM vgs -o vg_name,pv_count,vg_size,vg_free --separator ' ' --noheadings --nosuffix --units k 2> /dev/null); do
 		c=$((c+1))
 		line=$(echo $line | sed -e 's/^ *//')
-		group[$c]=$(echo $line | cut -d' ' -f1)
-		devices[$c]=$(echo $line | cut -d' ' -f2)
+		local group[$c]=$(echo $line | cut -d' ' -f1)
+		local devices[$c]=$(echo $line | cut -d' ' -f2)
 		_total=$(echo $line | cut -d' ' -f3)
 		_free=$(echo $line | cut -d' ' -f4)
 		_used=$((${_total%%.*}-${_free%%.*}))
-		used[$c]=$(humanize_size ${_used%%.*})
-		total[$c]=$(humanize_size ${_total%%.*})
-		free[$c]=$(humanize_size ${_free%%.*})
+		local used[$c]=$(humanize_size ${_used%%.*})
+		local total[$c]=$(humanize_size ${_total%%.*})
+		local free[$c]=$(humanize_size ${_free%%.*})
 	done
 	IFS=$IFS_OLD
 
@@ -1122,6 +1124,45 @@ add() {
 	fi
 }
 
+###############################
+# Remove devices form the group
+###############################
+remove() {
+	devices=$@
+	tmp=$(mktemp)
+	tmp2=$(mktemp)
+	nothing=1
+
+	$LVM vgs -o vg_name --separator ' ' --noheadings | sed -e 's/^ *//' > $tmp
+
+	[ "$(cat $tmp | wc -l)" == "0" ] && return
+
+	IFS=$NL
+	for vgname in $(cat $tmp); do
+		if [ -z $devices ]; then
+			$LVM vgreduce -a $vgname
+			nothing=0
+		else
+			$LVM vgs $vgname -o pv_name --separator ' ' --noheadings > $tmp2
+			IFS=$IFS_OLD
+			for dev in $devices; do
+				$GREP $dev $tmp2 &> /dev/null
+				if [ $? -eq 0 ]; then
+					$LVM vgreduce $vgname $dev
+					nothing=0
+				fi
+			done
+			IFS=$NL
+		fi
+	done
+	rm -f $tmp $tmp2
+	IFS=$IFS_OLD
+
+	if [ $nothing -eq 1 ]; then
+		warn "Nothing to do."
+	fi
+}
+
 
 ####################################
 # Calclulate diff between two dates
@@ -1222,6 +1263,7 @@ do
 	  "destroy") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "list") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "add") COMMAND=$1; shift; ARGS=$@; break ;;
+	  "remove") COMMAND=$1; shift; ARGS=$@; break ;;
 	  *) error "Wrong argument \"$1\". (see: $TOOL --help)"
 	esac
 	shift
-- 
1.7.4.4
