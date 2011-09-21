From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:33 +0200
Message-Id: <1316623554-28975-15-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 14/35] fsadm: Allow to remove all volume groups
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

Add new argument to the "remove" command --all to remove all volume
groups.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 66ecf1eb..028bc04 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -757,7 +757,6 @@ create() {
 				vgsize=$(echo $i | sed -e 's/^ *//' | cut -d' ' -f2)
 				vgsize=${vgsize%%B}
 				if [ $vgsize -ge $new_size ]; then
-					echo "Yes"
 					vgname=$(echo $i | sed -e 's/^ *//' | cut -d' ' -f1)
 					break;
 				fi
@@ -933,11 +932,15 @@ do_remove() {
 remove() {
 	# help
 	if [ "$1" == "help" ]; then
-		echo "Usage: $TOOL remove [mount point | dm device | voulume group | device]"
+		echo "Usage: $TOOL remove [mount point | dm device | voulume group | device | --all]"
 		exit 0
+	elif [ "$1" == "--all" ]; then
+		list="$(LANG=C $LVM vgs -o vg_name --separator ' ' --noheadings --nosuffix --units b 2> /dev/null)"
+	else
+		list=$@
 	fi
 
-	for item in $@; do
+	for item in $list; do
 		do_remove $item
 	done
 
-- 
1.7.4.4
