From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:43 +0200
Message-Id: <1316623554-28975-25-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 24/35] fsadm: Remove unnecessary modification of
	PATH variable
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

User (or the system) should be set properly so there is no need to
modify PATH variable. It also prevent us from setting appropriate PATH
before calling the fsadm.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 scripts/fsadm.sh |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
index 3a00063..55b4688 100755
--- a/scripts/fsadm.sh
+++ b/scripts/fsadm.sh
@@ -32,9 +32,6 @@
 
 TOOL=$(basename $0)
 
-_SAVEPATH=$PATH
-PATH=/sbin:/usr/sbin:/bin:/usr/sbin:$PATH
-
 # utilities
 TUNE_EXT=tune2fs
 RESIZE_EXT=resize2fs
-- 
1.7.4.4
