Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2JDWrgD020054
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:53 -0400
Received: from c6-x64-devel.vds-ok.com (r02-ge0-SH.prague.vds-ok.com
	[88.86.97.52] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JDWpMJ023568
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:51 -0400
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Date: Tue, 19 Mar 2013 13:32:41 +0000
Message-Id: <1363699970-10002-2-git-send-email-bubble@hoster-ok.com>
In-Reply-To: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
Subject: [linux-lvm] [PATCH 01/10] lvchange: Allow cluster lock conversion
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

Allow clvm locks to be converted shared <-> exclusive with corosync/dlm.

Without this it is impossible to alow both
* VM migration (shared lock is required)
* host-side snapshots of VM disks (exlusive lock is required)

Locks are only converted if --force parameter passed to lvchange.

Internally LKF_CONVERT flag is passed to dlm, so that is a real lock
conversion.

Also deny release of an exclusive lock on a remote note without --force
flag to lvchange -an.

Signed-off-by: Vladislav Bogdanov <bubble@hoster-ok.com>
---
 lib/locking/cluster_locking.c |    6 +++++-
 lib/locking/locking.c         |   32 ++++++++++++++++++++++++++++++++
 lib/locking/locking.h         |   10 +++++++++-
 tools/lvchange.c              |   30 ++++++++++++++++++++++--------
 4 files changed, 68 insertions(+), 10 deletions(-)

diff --git a/lib/locking/cluster_locking.c b/lib/locking/cluster_locking.c
index f9d6328..c3bd202 100644
--- a/lib/locking/cluster_locking.c
+++ b/lib/locking/cluster_locking.c
@@ -330,6 +330,9 @@ static int _lock_for_cluster(struct cmd_context *cmd, unsigned char clvmd_cmd,
 	if (flags & LCK_REVERT)
 		args[1] |= LCK_REVERT_MODE;
 
+	if (flags & LCK_TRY_CONVERT)
+		args[1] |= LCK_CONVERT;
+
 	if (mirror_in_sync())
 		args[1] |= LCK_MIRROR_NOSYNC_MODE;
 
@@ -491,7 +494,7 @@ int lock_resource(struct cmd_context *cmd, const char *resource, uint32_t flags)
 		return 0;
 	}
 
-	log_very_verbose("Locking %s %s %s (%s%s%s%s%s%s%s%s%s) (0x%x)", lock_scope, lockname,
+	log_very_verbose("Locking %s %s %s (%s%s%s%s%s%s%s%s%s%s) (0x%x)", lock_scope, lockname,
 			 lock_type, lock_scope,
 			 flags & LCK_NONBLOCK ? "|NONBLOCK" : "",
 			 flags & LCK_HOLD ? "|HOLD" : "",
@@ -501,6 +504,7 @@ int lock_resource(struct cmd_context *cmd, const char *resource, uint32_t flags)
 			 flags & LCK_CACHE ? "|CACHE" : "",
 			 flags & LCK_ORIGIN_ONLY ? "|ORIGIN_ONLY" : "",
 			 flags & LCK_REVERT ? "|REVERT" : "",
+			 flags & LCK_TRY_CONVERT ? "|CONVERT" : "",
 			 flags);
 
 	/* Send a message to the cluster manager */
diff --git a/lib/locking/locking.c b/lib/locking/locking.c
index 7aa519b..ff46046 100644
--- a/lib/locking/locking.c
+++ b/lib/locking/locking.c
@@ -540,6 +540,16 @@ int suspend_lvs(struct cmd_context *cmd, struct dm_list *lvs,
 	return 1;
 }
 
+int deactivate_lv(struct cmd_context *cmd, struct logical_volume *lv)
+{
+	if (vg_is_clustered(lv->vg)) {
+		if (lv_is_active_exclusive(lv) && ! lv_is_active_exclusive_locally(lv)) {
+			return_0;
+		}
+	}
+	lock_lv_vol(cmd, lv, LCK_LV_DEACTIVATE);
+}
+
 /*
  * First try to activate exclusively locally.
  * Then if the VG is clustered and the LV is not yet active (e.g. due to 
@@ -567,6 +577,28 @@ int activate_lv_excl(struct cmd_context *cmd, struct logical_volume *lv)
 	return lv_is_active_exclusive(lv);
 }
 
+int activate_lv_excl_force(struct cmd_context *cmd, struct logical_volume *lv) 
+{
+	/* Non-clustered VGs are only activated locally. */
+	if (!vg_is_clustered(lv->vg))
+		return activate_lv_excl_local(cmd, lv);
+
+	if (lv_is_active_exclusive_locally(lv))
+		return 1;
+
+	if (!activate_lv_excl_local_force(cmd, lv))
+		return_0;
+
+	if (lv_is_active_exclusive(lv))
+		return 1;
+
+	/* FIXME Deal with error return codes. */
+	if (activate_lv_excl_remote_force(cmd, lv))
+		stack;
+
+	return lv_is_active_exclusive(lv);
+}
+
 /* Lock a list of LVs */
 int activate_lvs(struct cmd_context *cmd, struct dm_list *lvs, unsigned exclusive)
 {
diff --git a/lib/locking/locking.h b/lib/locking/locking.h
index 23c312d..b441a6c 100644
--- a/lib/locking/locking.h
+++ b/lib/locking/locking.h
@@ -101,6 +101,7 @@ int check_lvm1_vg_inactive(struct cmd_context *cmd, const char *vgname);
 #define LCK_CACHE	0x00000100U	/* Operation on cache only using P_ lock */
 #define LCK_ORIGIN_ONLY	0x00000200U	/* Operation should bypass any snapshots */
 #define LCK_REVERT	0x00000400U	/* Revert any incomplete change */
+#define LCK_TRY_CONVERT			0x00004000U	/* Convert existing lock */
 
 /*
  * Additional lock bits for cluster communication via args[1]
@@ -176,19 +177,26 @@ int check_lvm1_vg_inactive(struct cmd_context *cmd, const char *vgname);
 #define revert_lv(cmd, lv)	lock_lv_vol(cmd, lv, LCK_LV_RESUME | LCK_REVERT)
 #define suspend_lv(cmd, lv)	lock_lv_vol(cmd, lv, LCK_LV_SUSPEND | LCK_HOLD)
 #define suspend_lv_origin(cmd, lv)	lock_lv_vol(cmd, lv, LCK_LV_SUSPEND | LCK_HOLD | LCK_ORIGIN_ONLY)
-#define deactivate_lv(cmd, lv)	lock_lv_vol(cmd, lv, LCK_LV_DEACTIVATE)
 
 #define activate_lv(cmd, lv)	lock_lv_vol(cmd, lv, LCK_LV_ACTIVATE | LCK_HOLD)
 #define activate_lv_excl_local(cmd, lv)	\
 				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_LOCAL)
 #define activate_lv_excl_remote(cmd, lv)	\
 				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_REMOTE)
+#define activate_lv_excl_local_force(cmd, lv)	\
+				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_LOCAL | (lv_is_active(lv) && ! lv_is_active_exclusive(lv) ? LCK_TRY_CONVERT : 0))
+#define activate_lv_excl_remote_force(cmd, lv)	\
+				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_REMOTE | (lv_is_active(lv) && ! lv_is_active_exclusive(lv) ? LCK_TRY_CONVERT : 0))
 
 struct logical_volume;
 int activate_lv_excl(struct cmd_context *cmd, struct logical_volume *lv);
+int activate_lv_excl_force(struct cmd_context *cmd, struct logical_volume *lv);
+int deactivate_lv(struct cmd_context *cmd, struct logical_volume *lv);
 
 #define activate_lv_local(cmd, lv)	\
 	lock_lv_vol(cmd, lv, LCK_LV_ACTIVATE | LCK_HOLD | LCK_LOCAL)
+#define activate_lv_local_force(cmd, lv)	\
+	lock_lv_vol(cmd, lv, LCK_LV_ACTIVATE | LCK_HOLD | LCK_LOCAL | (lv_is_active_exclusive_locally(lv) ? LCK_TRY_CONVERT : 0))
 #define deactivate_lv_local(cmd, lv)	\
 	lock_lv_vol(cmd, lv, LCK_LV_DEACTIVATE | LCK_LOCAL)
 #define drop_cached_metadata(vg)	\
diff --git a/tools/lvchange.c b/tools/lvchange.c
index 04facdd..5740bea 100644
--- a/tools/lvchange.c
+++ b/tools/lvchange.c
@@ -238,15 +238,29 @@ static int _lvchange_activate(struct cmd_context *cmd, struct logical_volume *lv
 		if ((activate == CHANGE_AE) ||
 		    lv_is_origin(lv) ||
 		    lv_is_thin_type(lv)) {
-			log_verbose("Activating logical volume \"%s\" "
-				    "exclusively", lv->name);
-			if (!activate_lv_excl(cmd, lv))
-				return_0;
+			if (arg_count(cmd, force_ARG)) {
+				log_verbose("Activating logical volume \"%s\" "
+					    "exclusively (forced)", lv->name);
+				if (!activate_lv_excl_force(cmd, lv))
+					return_0;
+			} else {
+				log_verbose("Activating logical volume \"%s\" "
+					    "exclusively", lv->name);
+				if (!activate_lv_excl(cmd, lv))
+					return_0;
+			}
 		} else if (activate == CHANGE_ALY) {
-			log_verbose("Activating logical volume \"%s\" locally",
-				    lv->name);
-			if (!activate_lv_local(cmd, lv))
-				return_0;
+			if (arg_count(cmd, force_ARG)) {
+				log_verbose("Activating logical volume \"%s\" locally (forced)",
+					    lv->name);
+				if (!activate_lv_local_force(cmd, lv))
+					return_0;
+			} else {
+				log_verbose("Activating logical volume \"%s\" locally",
+					    lv->name);
+				if (!activate_lv_local(cmd, lv))
+					return_0;
+			}
 		} else {
 			log_verbose("Activating logical volume \"%s\"",
 				    lv->name);
-- 
1.7.1
