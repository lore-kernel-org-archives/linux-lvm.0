From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:31 +0200
Message-Id: <1316623554-28975-13-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 12/35] fsadm: Try to avoid calling LVM in the
	loops
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

We should try to avoid calling LVM in the loops since it will cause
significant slowdown when the loop has many iteration (there is a lot of
devices/lvs/vgs). Instead use temporary files to store the listing
before the loop and the just grep for it.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 4a4f625..517d10d 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -468,11 +468,13 @@ detect_device_group() {
 	ret=0
 	prev_vgname=""
 	vgs=""
+	tmp=$(mktemp)
 
+	LANG=C $LVM vgs -o vg_name,pv_name --separator ' ' --noheadings --nosuffix 2> /dev/null | sed -e 's/^ *//' | sort | uniq > $tmp
 	NOT_IN_GROUP=
 	IN_GROUP=
 	for i in $devices; do
-		cur_vgname=$(LANG=C $LVM pvs -o vg_name --separator ' ' --noheadings --nosuffix --units k $i 2> /dev/null | sed -e 's/^ *//')
+		cur_vgname=$($GREP -e "$i$" $tmp | cut -d' ' -f1)
 
 		if [ -z $cur_vgname ]; then
 			NOT_IN_GROUP+="$i "
@@ -492,6 +494,7 @@ detect_device_group() {
 			vgs+=" $cur_vgname"
 		fi
 	done
+	rm -f $tmp
 	GROUP=$vgs
 	return $ret
 }
@@ -540,7 +543,7 @@ create() {
 	# Devices are not in any group so we should find some.
 	# Either create a new one, or use the existing one, if
 	# there is only one vgroup, or use the one with enough
-	# in it
+	# free space in it
 	if [ -z "$vgname" ]; then
 		vgroups=$($LVM vgs -o vg_name,vg_free --separator ' ' --noheadings --units b 2> /dev/null)
 		lines=$($LVM vgs -o vg_name,vg_free --separator ' ' --noheadings --units b 2> /dev/null | wc -l)
@@ -602,14 +605,17 @@ create() {
 	if [ "$name" ]; then
 		lvname="--name $name"
 	else
+		tmp=$(mktemp)
+		$LVM lvs $vgname --separator ' ' --noheadings > $tmp
 		for i in $(seq -w $MAX_VGS); do
-			$LVM lvs $vgname --separator ' ' --noheadings | grep -e " lvol${i} " &> /dev/null
+			$GREP -e " lvol${i} " $tmp &> /dev/null
 			if [ $? -ne 0 ]; then
 				name="lvol${i}"
 				lvname="--name $name"
 				break;
 			fi
 		done
+		rm -f $tmp
 	fi
 	echo "going to create logical volume $lvname"
 
@@ -617,7 +623,7 @@ create() {
 
 	if [ $vg_create -eq 1 ]; then
 		dry $LVM vgcreate $VERB $vgname $devices
-	elif [ ! -z $NOT_IN_GROUP ]; then
+	elif [ ! -z "$NOT_IN_GROUP" ]; then
 		dry $LVM vgextend $VERB $vgname $NOT_IN_GROUP
 	fi
 
@@ -1097,13 +1103,7 @@ add() {
 			rm -f $tmp
 			error "Please, specify group you want to add the device into"
 		elif [ $lines -eq 0 ]; then
-			for i in $(seq -w $MAX_VGS); do
-				$LVM vgs vg${i} &> /dev/null
-				if [ $? -ne 0 ]; then
-					vgname="vg${i}"
-					break;
-				fi
-			done
+			vgname="vg001"
 			vg_create=1
 		fi
 	else
-- 
1.7.4.4
