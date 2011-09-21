From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:42 +0200
Message-Id: <1316623554-28975-24-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 23/35] fsadm: Only use readlink if link is
	provided
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
 scripts/fsadm.sh |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 63600eb..3a00063 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -295,8 +295,10 @@ decode_size() {
 # dereference device name if it is symbolic link
 detect_fs() {
 	VOLUME_ORIG=$1
-	VOLUME=${1/#"${DM_DEV_DIR}/"/}
-	VOLUME=$("$READLINK" $READLINK_E "$DM_DEV_DIR/$VOLUME") || error "Cannot get readlink \"$1\""
+	VOLUME=${DM_DEV_DIR}/${1/#"${DM_DEV_DIR}/"/}
+	if [ -h "$VOLUME" ]; then
+		VOLUME=$("$READLINK" $READLINK_E "$VOLUME") || error "Cannot get readlink \"$VOLUME\""
+	fi
 	RVOLUME=$VOLUME
 	case "$RVOLUME" in
           # hardcoded /dev  since udev does not create these entries elsewhere
-- 
1.7.4.4
