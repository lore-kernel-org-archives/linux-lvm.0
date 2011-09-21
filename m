From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:21 +0200
Message-Id: <1316623554-28975-3-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 02/35] fsadm: Add "destroy" command
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

This commit adds new command "destroy" which provides the functionality
of removing logical volumes or volume group.

Several fixes for filesystem creation are also involved including fix
for creating extn file system on striped logical volume.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   67 +++++++++++++++++++++++++++++++++++++++++++++++++----
 1 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 42c7da4..2895371 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -385,10 +385,14 @@ make_ext() {
 	if [ "$YES" ]; then
 		force="-F"
 	fi
-	stride=$(($stripesize/$bsize))
-	stripewidth=$(($stride*$stripe))
 
-	dry mkfs.$fstyp $force -b$(($bsize*1024)) -E stride=${stride},stripe-width=${stripewidth} $device
+	if [ ! -z $stripesize ]; then
+		stride=$(($stripesize/$bsize))
+		stripewidth=$(($stride*$stripe))
+		extended="-E stride=${stride},stripe-width=${stripewidth}"
+	fi
+
+	dry mkfs.$fstyp $force -b$(($bsize*1024)) $extended $device
 }
 
 generic_make_fs() {
@@ -452,7 +456,7 @@ create() {
 		case $i in
 			"stripesize"* | "chunksize"*) stripesize=${i##*=} ;;
 			"name"*) name="--name ${i##*=}" ;;
-			"fstyp"*) fstyp=${i##*=} ;;
+			"fstyp"* | "fs"*) fstyp=${i##*=} ;;
 			"size"*) size="-L ${i##*=}" ;;
 			*) error "Wrong option $i. (see: $TOOL --help)"
 		esac
@@ -491,7 +495,6 @@ create() {
 	device="/dev/${vgname}/${name}"
 
 	guess=0
-	echo "$fstyp"
 	if [ -z $fstyp ]; then
 		fstyp=$(echo $TOOL | sed 's/^.*\.//g')
 		guess=1
@@ -509,6 +512,59 @@ create() {
 	esac
 }
 
+#############################
+# Remove the logical volume
+# of the whole volume group
+#############################
+destroy() {
+	if [ $# -gt 2 ]; then
+		error "Wrong option for destroy. (see: $TOOL --help)"
+	fi
+
+	# help
+	if [ "$1" == "help" ]; then
+		echo "Usage: $TOOL destroy [mount point | dm device | voulume group]"
+		exit 0
+	fi
+
+	# Block device has been given
+	if [ -b $1 ]; then
+		device=$1
+	fi
+
+	# Mount point has been given
+	if [ -z $device ] && [ -d $1 ]; then
+		mp=$(echo $1 | sed -e 's/\/$//')
+
+		count=$($GREP " $mp " $PROCMOUNTS | wc -l)
+
+		if [ $count -eq 1 ]; then
+			device=$($GREP " $mp " $PROCMOUNTS | cut -d' ' -f1)
+		else
+			count=$(LANG=C $MOUNT | $GREP " $mp " | wc -l)
+			[ $count -ne 1 ] && error "Could not find device mounted at $mp"
+			device=$(LANG=C $MOUNT | $GREP " $mp " | cut -d' ' -f1)
+		fi
+		MOUNTED=$device
+	fi
+
+	if [ -z $device ]; then
+		$LVM vgs $1
+		# Volume group has been given
+		if [ $? -eq 0 ]; then
+			dry $LVM vgremove $FORCE $1
+			return 0
+		fi
+	fi
+
+	[ -z $device ] && error "$1 is not a valid mount point, dm device nor volume group name."
+
+	if [ $MOUNTED ]; then
+		try_umount
+	fi
+	dry $LVM lvremove $FORCE $device
+}
+
 ####################################
 # Calclulate diff between two dates
 #  LANG=C input is expected the
@@ -603,6 +659,7 @@ do
 	  "check") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "resize") COMMAND=$1; shift; ARGS=$@; break ;;
 	  "create") COMMAND=$1; shift; ARGS=$@; break ;;
+	  "destroy") COMMAND=$1; shift; ARGS=$@; break ;;
 	  *) error "Wrong argument \"$1\". (see: $TOOL --help)"
 	esac
 	shift
-- 
1.7.4.4
