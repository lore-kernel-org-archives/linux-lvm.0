From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:48 +0200
Message-Id: <1316623554-28975-30-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
Subject: [linux-lvm] [PATCH 29/35] lvresize: Specify --resize-fs-only when
	going to use fsadm resize
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

When lvresize is calling fsadm to resize the file system, originally
it was the default action. However now fsadm support much more
features and it is doing the lvresize by itself. Luckily there is
still a way to tell fsadm to resize only the file system ane leave
the rest up to the lvresize - provide "--resize-fs-only" argument.

This commit adds "--resize-fs-only" argument when we are going to
use fsadm to resize the fs from within the lvresize.

Signed-off-by: Lukas Czerner <lczerner@redhat.com>
---
 tools/lvresize.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/lvresize.c b/tools/lvresize.c
index ccd6c6e..959c953 100644
--- a/tools/lvresize.c
+++ b/tools/lvresize.c
@@ -128,7 +128,7 @@ static int _request_confirmation(struct cmd_context *cmd,
 
 enum fsadm_cmd_e { FSADM_CMD_CHECK, FSADM_CMD_RESIZE };
 #define FSADM_CMD "fsadm"
-#define FSADM_CMD_MAX_ARGS 6
+#define FSADM_CMD_MAX_ARGS 7
 #define FSADM_CHECK_FAILS_FOR_MOUNTED 3 /* shell exist status code */
 
 /*
@@ -157,7 +157,15 @@ static int _fsadm_cmd(struct cmd_context *cmd,
 	if (arg_count(cmd, force_ARG))
 		argv[i++] = "--force";
 
-	argv[i++] = (fcmd == FSADM_CMD_RESIZE) ? "resize" : "check";
+	switch (fcmd) {
+		case FSADM_CMD_RESIZE:
+			argv[i++] = "--resize-fs-only";
+			argv[i++] = "resize";
+			break;
+		case FSADM_CMD_CHECK:
+			argv[i++] = "check";
+			break;
+	}
 
 	if (dm_snprintf(lv_path, PATH_MAX, "%s%s/%s", cmd->dev_dir, lp->vg_name,
 			lp->lv_name) < 0) {
-- 
1.7.4.4
