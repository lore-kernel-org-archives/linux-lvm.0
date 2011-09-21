From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:46 +0200
Message-Id: <1316623554-28975-28-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 27/35] fsadm: error out when no size is provided
	in resize
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
 scripts/fsadm.sh |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index ba78533..e11f7f9 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -602,6 +602,10 @@ resize() {
 		esac
 	done
 
+	if [ $size -eq 0 ]; then
+		error "Please provide the size argument. (see: $TOOL --help )"
+	fi
+
 	[ -z $lvname ] && error "Logical volume to resize was not specified"
 	[ $devcount -gt 0 ] && [ "$shrink" ] && warn "While shrinking the file system we "\
 						     "do not need additional devices. "\
@@ -630,11 +634,6 @@ resize() {
 		fi
 	fi
 
-	# If no size parameter has been provided, resize the volume to the maximum
-	if [ $size -eq 0 ]; then
-		echo "What??"
-	fi
-
 	# determine new size of the file system
 	if [ "$extend" ] || [ "$shrink" ] || [ "$new_size" ]; then
 		# only one of those variable should be set, so it is safe to do that
-- 
1.7.4.4
