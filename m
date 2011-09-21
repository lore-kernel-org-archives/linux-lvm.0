From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:40 +0200
Message-Id: <1316623554-28975-22-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 21/35] fsadm: Use DEFAULT_POOL when creating
	volume group
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

I user did not specified group, use DEFAULT_POOL from configuration
file.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   58 ++++++-----------------------------------------------
 1 files changed, 7 insertions(+), 51 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 1968ee3..a66abd1 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -748,49 +748,13 @@ create() {
 		vgname=$GROUP
 	fi
 
-	# Devices are not in any group so we should find some.
-	# Either create a new one, or use the existing one, if
-	# there is only one vgroup, or use the one with enough
-	# free space in it
 	if [ -z "$vgname" ]; then
-		vgroups=$($LVM vgs -o vg_name,vg_free --separator ' ' --noheadings --units k 2> /dev/null)
-		lines=$($LVM vgs -o vg_name,vg_free --separator ' ' --noheadings --units k 2> /dev/null | wc -l)
-
-		if [ $lines -eq 1 ]; then
-			vgname=$(echo $vgroups | sed -e 's/^ *//' | cut -d' ' -f1)
-		elif [ $lines -gt 1 ]; then
-			if [ -z $size ]; then
-				error "Not enough information to create" \
-					"logical volume"
-			fi
-			decode_size $size 1
-			new_size=$NEWBLOCKCOUNT
-			IFS=$NL
-			for i in $vgroups; do
-				vgsize=$(echo $i | sed -e 's/^ *//' | cut -d' ' -f2)
-				vgsize=${vgsize%%B}
-				if [ $vgsize -ge $new_size ]; then
-					vgname=$(echo $i | sed -e 's/^ *//' | cut -d' ' -f1)
-					break;
-				fi
-			done
+		vgname=$DEFAULT_POOL
+		$LVM vgs $vgname &> /dev/null
+		if [ $? -ne 0 ]; then
+			vg_create=1
 		fi
 	fi
-	IFS=$IFS_OLD
-
-	if [ -z "$vgname" ]; then
-		[ $devcount -eq 0 ] && error "No suitable device specified."
-		for i in $(seq -w $MAX_VGS); do
-			$LVM vgs vg${i} &> /dev/null
-			if [ $? -ne 0 ]; then
-				vgname="vg${i}"
-				break;
-			fi
-		done
-		vg_create=1
-	fi
-
-	[ -z "$vgname" ] && error "No suitable name for volume group found."
 
 	if [ "$stripesize" ] || [ "$stripes" ]; then
 		if [ -z "$stripesize" ]; then
@@ -1242,17 +1206,9 @@ add() {
 	$LVM vgs -o vg_name --separator ' ' --noheadings | sed -e 's/^ *//' > $tmp
 
 	if [ -z "$vgname" ]; then
-		lines=$(wc -l $tmp)
-		lines=${lines%% *}
-
-		if [ $lines -eq 1 ]; then
-			vgname=$(cut -d' ' -f1 $tmp)
-		elif [ $lines -gt 1 ]; then
-			list_pool
-			rm -f $tmp
-			error "Please, specify group you want to add the device into"
-		elif [ $lines -eq 0 ]; then
-			vgname="vg001"
+		vgname=$DEFAULT_POOL
+		grep $vgname $tmp &> /dev/null
+		if [ $? -ne 0 ]; then
 			vg_create=1
 		fi
 	else
-- 
1.7.4.4
