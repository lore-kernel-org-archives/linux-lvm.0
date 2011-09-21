From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:28 +0200
Message-Id: <1316623554-28975-10-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 09/35] fsadm: Specify number of stripes when no
	device is given
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

We should force user to specify number of stripes, (devices to be used)
if no device is specified on the command line when creating a new
volume.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index d42b759..f368f96 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -514,6 +514,7 @@ create() {
 			"name"*) name=${i##*=} ;;
 			"fstyp"* | "fs"*) fstyp=${i##*=} ;;
 			"size"*) size=${i##*=} ;;
+			"stripes"*) stripes=${i##*=} ;;
 			*) if [ -z $vg ]; then vgname=$i; else
 				error "Wrong option $i. (see: $TOOL --help)"
 			   fi ;;
@@ -582,9 +583,22 @@ create() {
 	[ -z "$vgname" ] && error "No suitable name for volume group found."
 
 	if [ "$stripesize" ]; then
+		if [ -z "$devices" ] && [ -z "$stripes" ]; then
+			error "Chunk size specified ($stripesize), but " \
+				"neither devices, nor number of stripes " \
+				"has been provided"
+		fi
 		striped="-i $devcount -I $stripesize"
 	fi
 
+	if [ "$stripes" ]; then
+		if [ -z "$stripesize" ]; then
+			error "Number of stripes specified, but chunk size " \
+				"has not been provided"
+		fi
+		striped="-i $stripes -I $stripesize"
+	fi
+
 	if [ "$name" ]; then
 		lvname="--name $name"
 	else
-- 
1.7.4.4
