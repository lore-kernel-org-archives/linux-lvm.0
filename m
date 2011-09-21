From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:29 +0200
Message-Id: <1316623554-28975-11-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 10/35] fsadm: Print type of the volume in
	filesystem listing
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

Type of the volume is useful information so we should list that as well.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index f368f96..6617de0 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -822,11 +822,12 @@ detect_fs_size() {
 list_filesystems() {
 	IFS=$NL
 	local c=0
-	for line in $(LANG=C $LVM lvs -o lv_path,lv_size --noheadings --separator ' ' --nosuffix --units k 2> /dev/null); do
+	for line in $(LANG=C $LVM lvs -o lv_path,lv_size,segtype --noheadings --separator ' ' --nosuffix --units k 2> /dev/null); do
 		c=$((c+1))
 		line=$(echo $line | sed -e 's/^ *\//\//')
 		volume=$(echo $line | cut -d' ' -f1)
 		volumes[$c]=$volume
+		segtype[$c]=$(echo $line | cut -d' ' -f3)
 		detect_fs $volume
 		detect_mounted
 		detect_fs_size
@@ -858,33 +859,36 @@ list_filesystems() {
 	len_used=4
 	len_total=5
 	len_mounted=11
+	len_segtype=4
 	for i in $(seq $c); do
 		local _volume=${volumes[$i]}
 		local _fstype=${fstype[$i]}
 		local _total=${total[$i]}
 		local _free=${free[$i]}
 		local _used=${used[$i]}
+		local _segtype=${segtype[$i]}
 		local _mounted=${mounted[$i]}
 		[ ${#_volume} -gt "0$len_volume" ] && len_volume=${#_volume}
 		[ ${#_fstype} -gt "0$len_fstype" ] && len_fstype=${#_fstype}
 		[ ${#_total} -gt "0$len_total" ] && len_total=${#_total}
 		[ ${#_free} -gt "0$len_free" ] && len_free=${#_free}
 		[ ${#_used} -gt "0$len_used" ] && len_used=${#_used}
+		[ ${#_segtype} -gt "0$len_segtype" ] && len_segtype=${#_segtype}
 		[ ${#_mounted} -gt "0$len_mounted" ] && len_mounted=${#_mounted}
 	done
 
-	format="%-$(($len_volume+2))s%-$(($len_fstype+2))s%-$(($len_free+2))s%-$(($len_used+2))s%-$(($len_total+2))s%-$(($len_mounted+2))s\n"
-	header=$(printf "$format" "Volume" "FS" "Free" "Used" "Total" "Mount point")
+	format="%-$(($len_volume+2))s%-$(($len_fstype+2))s%-$(($len_free+2))s%-$(($len_used+2))s%-$(($len_total+2))s%-$(($len_segtype+2))s%-$(($len_mounted+2))s\n"
+	header=$(printf "$format" "Volume" "FS" "Free" "Used" "Total" "Type" "Mount point")
 	separator=""
 	for i in $(seq ${#header}); do
 		separator+="-"
 	done
 	echo $separator
-	printf "$format" "Volume" "FS" "Free" "Used" "Total" "Mount point"
+	printf "$format" "Volume" "FS" "Free" "Used" "Total" "Type" "Mount point"
 	echo $separator
 
 	for i in $(seq $c); do
-		printf "$format" "${volumes[$i]}" "${fstype[$i]}" "${free[$i]}" "${used[$i]}" "${total[$i]}" "${mounted[$i]}"
+		printf "$format" "${volumes[$i]}" "${fstype[$i]}" "${free[$i]}" "${used[$i]}" "${total[$i]}" "${segtype[$i]}" "${mounted[$i]}"
 	done
 
 	echo $separator
-- 
1.7.4.4
