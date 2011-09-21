From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:39 +0200
Message-Id: <1316623554-28975-21-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 20/35] fsadm: Add simple configuration file
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

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index db0fd4b..1968ee3 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -83,6 +83,8 @@ PROCDEVICES="/proc/devices"
 PROCPARTITIONS="/proc/partitions"
 NULL="$DM_DEV_DIR/null"
 
+CONFIG_PATHS="/etc/fsadm.conf ~/fsadm.conf"
+
 MAX_VGS=999
 
 IFS_OLD=$IFS
@@ -1325,6 +1327,20 @@ check() {
 	esac
 }
 
+set_default_config() {
+	[ -z "$DEFAULT_POOL" ] && DEFAULT_POOL="default_pool"
+}
+
+parse_config() {
+	for line in $(cat $1); do
+		case "$line" in
+		  "DEFAULT_POOL"*) DEFAULT_POOL=${line##*=} ;;
+		  "#"*) continue ;;
+		  *) error "Unknown value \"$line\" in configuration file"
+		esac
+	done
+}
+
 #############################
 # start point of this script
 # - parsing parameters
@@ -1365,6 +1381,7 @@ do
 	  "-o"|"--resize-fs-only") RESIZE_FS_ONLY=1 ;;
 	  "-y"|"--yes") YES="-y" ;;
 	  "-l"|"--lvresize") ;;
+	  "-c"|"--config") CONFIG=$2; shift 1 ;;
 	  "check") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "resize") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "create") COMMAND=$1; shift; ARGS=$@; break ;;
@@ -1380,6 +1397,17 @@ if [ -z $COMMAND ]; then
 	error "Missing command. (see: $TOOL --help)"
 fi
 
+set_default_config
+if [ "$CONFIG" ]; then
+	[ ! -f "$CONFIG" ] && error "\"$CONFIG\" is not proper configuration file"
+	parse_config $CONFIG
+else
+	for i in $CONFIG_PATHS; do
+		[ ! -f "$i" ] && continue
+		parse_config $i
+	done
+fi
+
 export FSADM_RUNNING="fsadm"
 $COMMAND $ARGS
 cleanup 0
-- 
1.7.4.4
