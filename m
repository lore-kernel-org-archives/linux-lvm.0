From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:47 +0200
Message-Id: <1316623554-28975-29-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 28/35] fsadm: Umount ext2 file system prior
	resize
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

ext2 does NOT support online resize, so we should attempt to umount the
file system first.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index e11f7f9..87c9bbc 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -411,6 +411,11 @@ resize_ext() {
 	decode_size $1 $BLOCKSIZE
 	FSFORCE=$FORCE
 
+	# ext2 does NOT support online resize
+	if [ "$FSTYPE" == "ext2" ]; then
+		EXTOFF=1
+	fi
+
 	detect_mounted
 	if [ "$NEWBLOCKCOUNT" -lt "$BLOCKCOUNT" -o "$EXTOFF" -eq 1 ]; then
 		[ "$MOUNTED" ] && verbose "$RESIZE_EXT needs unmounted filesystem" && try_umount
-- 
1.7.4.4
