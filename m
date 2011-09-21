From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:44 +0200
Message-Id: <1316623554-28975-26-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 25/35] fsadm: Allow to specify size without
	"size=" prefix in "resize"
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

For backwards compatibility we should allow to specify plain number as a
new size in resize command.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 55b4688..f354fec 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -587,9 +587,12 @@ resize() {
 			continue
 		fi
 		case $i in
-			"size=+"*) [ $size -eq 0 ] && extend=${i##*+} && size=1;;
-			"size=-"*) [ $size -eq 0 ] && shrink=${i##*-} && size=1;;
-			"size="*)  [ $size -eq 0 ] && new_size=${i##*=} && size=1;;
+			"size=+"*)	[ $size -eq 0 ] && extend=${i##*+} && size=1;;
+			+[[:digit:]]*)	[ $size -eq 0 ] && extend=${i##*+} && size=1;;
+			"size=-"*)	[ $size -eq 0 ] && shrink=${i##*-} && size=1;;
+			-[[:digit:]]*)	[ $size -eq 0 ] && shrink=${i##*-} && size=1;;
+			"size="*) 	[ $size -eq 0 ] && new_size=${i##*=} && size=1;;
+			[[:digit:]]*) 	[ $size -eq 0 ] && new_size=${i} && size=1;;
 			*) error "Wrong option $i. (see: $TOOL --help)";;
 		esac
 	done
-- 
1.7.4.4
