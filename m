From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:41 +0200
Message-Id: <1316623554-28975-23-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 22/35] fsadm: Add LVOL_PREFIX configuration
	option
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

This commit adds new configuration option LVOL_PREFIX which defines a
prefix for new logical volumes. The prefix will be concatenated with a
sequential number of the logical volume.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index a66abd1..63600eb 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -776,9 +776,9 @@ create() {
 		tmp=$(mktemp)
 		$LVM lvs $vgname --separator ' ' --noheadings > $tmp
 		for i in $(seq -w $MAX_VGS); do
-			$GREP -e " lvol${i} " $tmp &> /dev/null
+			$GREP -e " ${LVOL_PREFIX}${i} " $tmp &> /dev/null
 			if [ $? -ne 0 ]; then
-				name="lvol${i}"
+				name="${LVOL_PREFIX}${i}"
 				lvname="--name $name"
 				break;
 			fi
@@ -1285,12 +1285,14 @@ check() {
 
 set_default_config() {
 	[ -z "$DEFAULT_POOL" ] && DEFAULT_POOL="default_pool"
+	[ -z "$LVOL_PREFIX" ] && LVOL_PREFIX="lvol"
 }
 
 parse_config() {
 	for line in $(cat $1); do
 		case "$line" in
 		  "DEFAULT_POOL"*) DEFAULT_POOL=${line##*=} ;;
+		  "LVOL_PREFIX"*) LVOL_PREFIX=${line##*=} ;;
 		  "#"*) continue ;;
 		  *) error "Unknown value \"$line\" in configuration file"
 		esac
-- 
1.7.4.4
