Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2JDWsof007870
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:54 -0400
Received: from c6-x64-devel.vds-ok.com (r02-ge0-SH.prague.vds-ok.com
	[88.86.97.52] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JDWrPd006346
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:53 -0400
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Date: Tue, 19 Mar 2013 13:32:48 +0000
Message-Id: <1363699970-10002-9-git-send-email-bubble@hoster-ok.com>
In-Reply-To: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
Subject: [linux-lvm] [PATCH 08/10] lvchange: implement remote lock management
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
To: linux-lvm@redhat.com

Signed-off-by: Vladislav Bogdanov <bubble@hoster-ok.com>
---
 lib/commands/toolcontext.h |    1 +
 tools/args.h               |    1 +
 tools/commands.h           |    3 +-
 tools/lvchange.c           |   98 ++++++++++++++++++++++++++++++++++++--------
 tools/pvmove.c             |    2 +-
 tools/vgchange.c           |    2 +-
 6 files changed, 87 insertions(+), 20 deletions(-)

diff --git a/lib/commands/toolcontext.h b/lib/commands/toolcontext.h
index 6e5803f..136ef53 100644
--- a/lib/commands/toolcontext.h
+++ b/lib/commands/toolcontext.h
@@ -112,6 +112,7 @@ struct cmd_context {
 	char dev_dir[PATH_MAX];
 	char proc_dir[PATH_MAX];
 	char sysfs_dir[PATH_MAX]; /* FIXME Use global value instead. */
+	const char *node;
 };
 
 /*
diff --git a/tools/args.h b/tools/args.h
index 0d9605a..7c75cff 100644
--- a/tools/args.h
+++ b/tools/args.h
@@ -76,6 +76,7 @@ arg(discards_ARG, '\0', "discards", discards_arg, 0)
 arg(stripes_long_ARG, '\0', "stripes", int_arg, 0)
 arg(sysinit_ARG, '\0', "sysinit", NULL, 0)
 arg(thinpool_ARG, '\0', "thinpool", string_arg, 0)
+arg(node_ARG, '\0', "node", string_arg, 0)
 
 /* Allow some variations */
 arg(resizable_ARG, '\0', "resizable", yes_no_arg, 0)
diff --git a/tools/commands.h b/tools/commands.h
index 6415d34..555ff87 100644
--- a/tools/commands.h
+++ b/tools/commands.h
@@ -87,6 +87,7 @@ xx(lvchange,
    "\t[-y|--yes]\n"
    "\t[--version]\n"
    "\t[-Z|--zero {y|n}]\n"
+   "\t[--node Node ]\n"
    "\tLogicalVolume[Path] [LogicalVolume[Path]...]\n",
 
    alloc_ARG, autobackup_ARG, activate_ARG, available_ARG, contiguous_ARG,
@@ -94,7 +95,7 @@ xx(lvchange,
    major_ARG, minor_ARG, monitor_ARG, noudevsync_ARG, partial_ARG,
    permission_ARG, persistent_ARG, poll_ARG, readahead_ARG, resync_ARG,
    refresh_ARG, addtag_ARG, deltag_ARG, sysinit_ARG, test_ARG, yes_ARG,
-   zero_ARG)
+   zero_ARG, node_ARG)
 
 xx(lvconvert,
    "Change logical volume layout",
diff --git a/tools/lvchange.c b/tools/lvchange.c
index 5740bea..e136eab 100644
--- a/tools/lvchange.c
+++ b/tools/lvchange.c
@@ -226,11 +226,30 @@ static int _lvchange_activate(struct cmd_context *cmd, struct logical_volume *lv
 	}
 
 	if (activate == CHANGE_ALN) {
-		log_verbose("Deactivating logical volume \"%s\" locally",
-			    lv->name);
-		if (!deactivate_lv_local(cmd, lv))
-			return_0;
+		if (cmd->node) {
+			log_verbose("Deactivating logical volume \"%s\" locally on node %s",
+				    lv->name, cmd->node);
+			if (!deactivate_lv_remote(cmd, lv))
+				return_0;
+		} else {
+			log_verbose("Deactivating logical volume \"%s\" locally",
+				    lv->name);
+			if (!deactivate_lv_local(cmd, lv))
+				return_0;
+		}
 	} else if (activate == CHANGE_AN) {
+		if (cmd->node) {
+			log_error("Use -aln to deactivate volume on a remote node");
+			return_0;
+		}
+		if (vg_is_clustered(lv->vg)) {
+			if (!arg_count(cmd, force_ARG)) {
+				if (lv_is_active_exclusive(lv) && ! lv_is_active_exclusive_locally(lv)) {
+					log_error("Failed to deactivate %s: exclusively activated on a remote node. Use -aln --node Node.", lv->name);
+					return_0;
+				}
+			}
+		}
 		log_verbose("Deactivating logical volume \"%s\"", lv->name);
 		if (!deactivate_lv(cmd, lv))
 			return_0;
@@ -239,29 +258,55 @@ static int _lvchange_activate(struct cmd_context *cmd, struct logical_volume *lv
 		    lv_is_origin(lv) ||
 		    lv_is_thin_type(lv)) {
 			if (arg_count(cmd, force_ARG)) {
-				log_verbose("Activating logical volume \"%s\" "
-					    "exclusively (forced)", lv->name);
+				if (cmd->node)
+					log_verbose("Activating logical volume \"%s\" "
+						    "exclusively on node %s (forced)", lv->name, cmd->node);
+				else
+					log_verbose("Activating logical volume \"%s\" "
+						    "exclusively (forced)", lv->name);
 				if (!activate_lv_excl_force(cmd, lv))
 					return_0;
 			} else {
-				log_verbose("Activating logical volume \"%s\" "
-					    "exclusively", lv->name);
+				if (cmd->node)
+					log_verbose("Activating logical volume \"%s\" "
+						    "exclusively on node %s", lv->name, cmd->node);
+				else
+					log_verbose("Activating logical volume \"%s\" "
+						    "exclusively", lv->name);
 				if (!activate_lv_excl(cmd, lv))
 					return_0;
 			}
 		} else if (activate == CHANGE_ALY) {
-			if (arg_count(cmd, force_ARG)) {
-				log_verbose("Activating logical volume \"%s\" locally (forced)",
-					    lv->name);
-				if (!activate_lv_local_force(cmd, lv))
-					return_0;
+			if (cmd->node) {
+				if (arg_count(cmd, force_ARG)) {
+					log_verbose("Activating logical volume \"%s\" locally on node %s (forced)",
+						    lv->name, cmd->node);
+					if (!activate_lv_remote_force(cmd, lv))
+						return_0;
+				} else {
+					log_verbose("Activating logical volume \"%s\" locally on node %s",
+						    lv->name, cmd->node);
+					if (!activate_lv_remote(cmd, lv))
+						return_0;
+				}
 			} else {
-				log_verbose("Activating logical volume \"%s\" locally",
-					    lv->name);
-				if (!activate_lv_local(cmd, lv))
-					return_0;
+				if (arg_count(cmd, force_ARG)) {
+					log_verbose("Activating logical volume \"%s\" locally (forced)",
+						    lv->name);
+					if (!activate_lv_local_force(cmd, lv))
+						return_0;
+				} else {
+					log_verbose("Activating logical volume \"%s\" locally",
+						    lv->name);
+					if (!activate_lv_local(cmd, lv))
+						return_0;
+				}
 			}
 		} else {
+			if (cmd->node) {
+				log_error("Use -aly or -aey to activate volume on a remote node");
+				return_0;
+			}
 			log_verbose("Activating logical volume \"%s\"",
 				    lv->name);
 			if (!activate_lv(cmd, lv))
@@ -808,6 +853,25 @@ static int lvchange_single(struct cmd_context *cmd, struct logical_volume *lv,
 		return ECMD_FAILED;
 	}
 
+	switch (arg_count(cmd, node_ARG)) {
+		case 1:
+			if (!arg_count(cmd, activate_ARG)) {
+				log_error("--node argument may be used only with -a");
+				return ECMD_FAILED;
+			}
+			if (!vg_is_clustered(lv->vg)) {
+				log_error("--node argument may be used only with clustered volume groups");
+				return ECMD_FAILED;
+			}
+			cmd->node = arg_str_value(cmd, node_ARG, NULL);
+			break;
+		case 0:
+			break;
+		default:
+			log_error("Only one --node argument is supported");
+			return ECMD_FAILED;
+			break;
+	}
 	/*
 	 * FIXME: DEFAULT_BACKGROUND_POLLING should be "unspecified".
 	 * If --poll is explicitly provided use it; otherwise polling
diff --git a/tools/pvmove.c b/tools/pvmove.c
index 9649f11..65718b1 100644
--- a/tools/pvmove.c
+++ b/tools/pvmove.c
@@ -240,7 +240,7 @@ static struct logical_volume *_set_up_pvmove_lv(struct cmd_context *cmd,
 		}
 
 		if (vg_is_clustered(vg) &&
-		    lv_is_active_exclusive_remotely(lv)) {
+		    lv_is_active_exclusive_remotely(lv, NULL)) {
 			lv_skipped = 1;
 			log_print_unless_silent("Skipping LV %s which is activated "
 						"exclusively on remote node.", lv->name);
diff --git a/tools/vgchange.c b/tools/vgchange.c
index a897a85..2d2b37f 100644
--- a/tools/vgchange.c
+++ b/tools/vgchange.c
@@ -125,7 +125,7 @@ static int _activate_lvs_in_vg(struct cmd_context *cmd, struct volume_group *vg,
 		 * If the LV is active exclusive remotely,
 		 * then ignore it here
 		 */
-		if (lv_is_active_exclusive_remotely(lv)) {
+		if (lv_is_active_exclusive_remotely(lv, NULL)) {
 			log_verbose("%s/%s is exclusively active on"
 				    " a remote node", vg->name, lv->name);
 			continue;
-- 
1.7.1
