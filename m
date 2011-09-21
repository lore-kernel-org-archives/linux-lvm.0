From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:36 +0200
Message-Id: <1316623554-28975-18-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 17/35] fsadm: Handle resize if there is no file
	system
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

Resize the logical volume even if there is not file system on it.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |   28 ++++++++++++++++++++--------
 1 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 3b47a21..112ad62 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -630,10 +630,18 @@ resize() {
 		# only one of those variable should be set, so it is safe to do that
 		decode_size $extend $shrink $new_size 1
 		detect_fs $lvname
-		detect_fs_size
+		# What if there is not file system on the volume
+		if [ -z $FSTYP ]; then
+			total=$(LANG=C $LVM lvs -o lv_size --separator ' ' --noheadings --units k $lvname 2> /dev/null)
+			total=${total%%.*}
+		else
+			detect_fs_size
+		fi
+		[ -z $total ] && error "Could not determine the size of the volume"
 		[ "$extend" ] && size=$(($total + $NEWSIZE))
 		[ "$shrink" ] && size=$(($total - $NEWSIZE))
 		if [ "$new_size" ]; then
+			# NEWSIZE is decoded new_size
 			[ $NEWSIZE -ge $total ] && extend=1 || shrink=1
 			size=$NEWSIZE
 		fi
@@ -641,15 +649,19 @@ resize() {
 
 	# Do the actual resize
 	if [ "$shrink" ]; then
-		resize_fs $lvname $size
-		# The file system might decide to alight the size a bit, so we
-		# have to resize the volume to the exact size of the file system
-		# so we do not corrupt it.
-		detect_fs_size
-		resize_lvolume $lvname $total
+		if [ "$FSTYPE" ]; then
+			resize_fs $lvname $size
+			# The file system might decide to alight the size a bit, so we
+			# have to resize the volume to the exact size of the file system
+			# so we do not corrupt it.
+			detect_fs_size
+		fi
+		resize_lvolume $lvname $size
 	elif [ "$extend" ]; then
 		resize_lvolume $lvname $size
-		resize_fs $lvname
+		if [ "$FSTYPE" ]; then
+			resize_fs $lvname
+		fi
 	fi
 }
 
-- 
1.7.4.4
