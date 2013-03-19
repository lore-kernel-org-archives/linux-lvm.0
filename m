Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2JDWwKk032463
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:59 -0400
Received: from c6-x64-devel.vds-ok.com (r02-ge0-SH.prague.vds-ok.com
	[88.86.97.52] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JDWrFZ026535
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:53 -0400
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Date: Tue, 19 Mar 2013 13:32:47 +0000
Message-Id: <1363699970-10002-8-git-send-email-bubble@hoster-ok.com>
In-Reply-To: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
Subject: [linux-lvm] [PATCH 07/10] locking: Allow lock management
	(activation, deactivation, conversion) on a remote nodes
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

* add node argument to _query_resource()
* add node argument to remote_lock_held()
* add node argument to [_]lv_is_active[*] where needed
* rework _lv_is_active() logic a bit
* add activation calls for a "remote node" mode

Signed-off-by: Vladislav Bogdanov <bubble@hoster-ok.com>
---
 lib/activate/activate.c        |   55 ++++++++++++++++++++------------
 lib/activate/activate.h        |    3 +-
 lib/locking/cluster_locking.c  |   20 ++++++++---
 lib/locking/external_locking.c |    2 +-
 lib/locking/locking.c          |   68 ++++++++++++++++++++++++----------------
 lib/locking/locking.h          |   10 +++++-
 lib/locking/locking_types.h    |    2 +-
 7 files changed, 101 insertions(+), 59 deletions(-)

diff --git a/lib/activate/activate.c b/lib/activate/activate.c
index 185ba5f..1c8fd88 100644
--- a/lib/activate/activate.c
+++ b/lib/activate/activate.c
@@ -270,7 +270,7 @@ int lv_is_active_exclusive_locally(const struct logical_volume *lv)
 {
 	return 0;
 }
-int lv_is_active_exclusive_remotely(const struct logical_volume *lv)
+int lv_is_active_exclusive_remotely(const struct logical_volume *lv, const char *node)
 {
 	return 0;
 }
@@ -1014,27 +1014,33 @@ int lvs_in_vg_opened(const struct volume_group *vg)
  * Returns: 0 or 1
  */
 static int _lv_is_active(const struct logical_volume *lv,
-			 int *locally, int *exclusive)
+			 int *locally, int *exclusive, const char *node)
 {
 	int r, l, e; /* remote, local, and exclusive */
 
 	r = l = e = 0;
 
-	if (_lv_active(lv->vg->cmd, lv))
-		l = 1;
+	if (!node) {
+		if (_lv_active(lv->vg->cmd, lv))
+			l = 1;
 
-	if (!vg_is_clustered(lv->vg)) {
-		if (l)
-			e = 1;  /* exclusive by definition */
-		goto out;
-	}
+		if (!vg_is_clustered(lv->vg)) {
+			if (l)
+				e = 1;  /* exclusive by definition */
+			goto out;
+		}
 
-	/* Active locally, and the caller doesn't care about exclusive */
-	if (l && !exclusive)
-		goto out;
+		/* Active locally, and the caller doesn't care about exclusive */
+		if (l && !exclusive)
+			goto out;
+	}
 
-	if ((r = remote_lock_held(lv->lvid.s, &e)) >= 0)
+	if ((r = remote_lock_held(lv->lvid.s, &e, node)) >= 0) {
+		if (node && r > 0) {
+			l = 1;
+		}
 		goto out;
+	}
 
 	/*
 	 * If lock query is not supported (due to interfacing with old
@@ -1060,45 +1066,52 @@ out:
 	if (exclusive)
 		*exclusive = e;
 
-	log_very_verbose("%s/%s is %sactive%s%s",
+	log_very_verbose("%s/%s is %sactive%s%s%s%s",
 			 lv->vg->name, lv->name,
 			 (r || l) ? "" : "not ",
 			 (exclusive && e) ? " exclusive" : "",
-			 e ? (l ? " locally" : " remotely") : "");
+			 e ? (l ? " locally" : " remotely") : "",
+			 node ? " on node " : "", node ? node : "" );
 
 	return r || l;
 }
 
 int lv_is_active(const struct logical_volume *lv)
 {
-	return _lv_is_active(lv, NULL, NULL);
+	return _lv_is_active(lv, NULL, NULL, NULL);
+}
+
+int lv_is_active_remotely(const struct logical_volume *lv, const char *node)
+{
+	int l;
+	return _lv_is_active(lv, &l, NULL, node);
 }
 
 int lv_is_active_but_not_locally(const struct logical_volume *lv)
 {
 	int l;
-	return _lv_is_active(lv, &l, NULL) && !l;
+	return _lv_is_active(lv, &l, NULL, NULL) && !l;
 }
 
 int lv_is_active_exclusive(const struct logical_volume *lv)
 {
 	int e;
 
-	return _lv_is_active(lv, NULL, &e) && e;
+	return _lv_is_active(lv, NULL, &e, NULL) && e;
 }
 
 int lv_is_active_exclusive_locally(const struct logical_volume *lv)
 {
 	int l, e;
 
-	return _lv_is_active(lv, &l, &e) && l && e;
+	return _lv_is_active(lv, &l, &e, NULL) && l && e;
 }
 
-int lv_is_active_exclusive_remotely(const struct logical_volume *lv)
+int lv_is_active_exclusive_remotely(const struct logical_volume *lv, const char *node)
 {
 	int l, e;
 
-	return _lv_is_active(lv, &l, &e) && !l && e;
+	return _lv_is_active(lv, &l, &e, node) && e;
 }
 
 #ifdef DMEVENTD
diff --git a/lib/activate/activate.h b/lib/activate/activate.h
index ba24d2a..3a1931a 100644
--- a/lib/activate/activate.h
+++ b/lib/activate/activate.h
@@ -130,10 +130,11 @@ int lvs_in_vg_activated(const struct volume_group *vg);
 int lvs_in_vg_opened(const struct volume_group *vg);
 
 int lv_is_active(const struct logical_volume *lv);
+int lv_is_active_remotely(const struct logical_volume *lv, const char *node);
 int lv_is_active_but_not_locally(const struct logical_volume *lv);
 int lv_is_active_exclusive(const struct logical_volume *lv);
 int lv_is_active_exclusive_locally(const struct logical_volume *lv);
-int lv_is_active_exclusive_remotely(const struct logical_volume *lv);
+int lv_is_active_exclusive_remotely(const struct logical_volume *lv, const char *node);
 
 int lv_has_target_type(struct dm_pool *mem, struct logical_volume *lv,
 		       const char *layer, const char *target_type);
diff --git a/lib/locking/cluster_locking.c b/lib/locking/cluster_locking.c
index c3bd202..f4f396e 100644
--- a/lib/locking/cluster_locking.c
+++ b/lib/locking/cluster_locking.c
@@ -190,8 +190,10 @@ static void _build_header(struct clvm_header *head, int clvmd_cmd, const char *n
 	} else if (!strcmp(node, NODE_REMOTE)) {
 		head->node[0] = '\0';
 		head->flags = CLVMD_FLAG_REMOTE;
-	} else
-		strcpy(head->node, node);
+	} else {
+		memcpy(head->node, node, strlen(node) + 1);
+		head->flags = CLVMD_FLAG_REMOTE;
+	}
 }
 
 /*
@@ -236,6 +238,7 @@ static int _cluster_request(char clvmd_cmd, const char *node, void *data, int le
 		inptr += strlen(inptr) + 1;
 	}
 
+	log_debug("Got %u responses", num_responses);
 	/*
 	 * Allocate response array.
 	 * With an extra pair of INTs on the front to sanity
@@ -315,6 +318,9 @@ static int _lock_for_cluster(struct cmd_context *cmd, unsigned char clvmd_cmd,
 
 	assert(name);
 
+	if (node == NULL) {
+		node = "";
+	}
 	len = strlen(name) + 3;
 	args = alloca(len);
 	strcpy(args + 2, name);
@@ -374,7 +380,7 @@ static int _lock_for_cluster(struct cmd_context *cmd, unsigned char clvmd_cmd,
 		     !(flags & LCK_CLUSTER_VG)))
 			node = NODE_LOCAL;
 		else if (flags & LCK_REMOTE)
-			node = NODE_REMOTE;
+			node = cmd->node ? cmd->node : NODE_REMOTE;
 	}
 
 	status = _cluster_request(clvmd_cmd, node, args, len,
@@ -527,16 +533,18 @@ static int decode_lock_type(const char *response)
 }
 
 #ifdef CLUSTER_LOCKING_INTERNAL
-static int _query_resource(const char *resource, int *mode)
+static int _query_resource(const char *resource, int *mode, const char *node)
 #else
-int query_resource(const char *resource, int *mode)
+int query_resource(const char *resource, int *mode, const char *node)
 #endif
 {
 	int i, status, len, num_responses, saved_errno;
-	const char *node = "";
 	char *args;
 	lvm_response_t *response = NULL;
 
+	if (node == NULL) {
+		node = "";
+	}
 	saved_errno = errno;
 	len = strlen(resource) + 3;
 	args = alloca(len);
diff --git a/lib/locking/external_locking.c b/lib/locking/external_locking.c
index 4dacbe4..4c038f8 100644
--- a/lib/locking/external_locking.c
+++ b/lib/locking/external_locking.c
@@ -28,7 +28,7 @@ static int (*_lock_fn) (struct cmd_context * cmd, const char *resource,
 			uint32_t flags) = NULL;
 static int (*_init_fn) (int type, struct dm_config_tree * cft,
 			uint32_t *flags) = NULL;
-static int (*_lock_query_fn) (const char *resource, int *mode) = NULL;
+static int (*_lock_query_fn) (const char *resource, int *mode, const char *node) = NULL;
 
 static int _lock_resource(struct cmd_context *cmd, const char *resource,
 			  uint32_t flags)
diff --git a/lib/locking/locking.c b/lib/locking/locking.c
index ff46046..712e293 100644
--- a/lib/locking/locking.c
+++ b/lib/locking/locking.c
@@ -542,12 +542,8 @@ int suspend_lvs(struct cmd_context *cmd, struct dm_list *lvs,
 
 int deactivate_lv(struct cmd_context *cmd, struct logical_volume *lv)
 {
-	if (vg_is_clustered(lv->vg)) {
-		if (lv_is_active_exclusive(lv) && ! lv_is_active_exclusive_locally(lv)) {
-			return_0;
-		}
-	}
 	lock_lv_vol(cmd, lv, LCK_LV_DEACTIVATE);
+	return 1;
 }
 
 /*
@@ -561,20 +557,29 @@ int activate_lv_excl(struct cmd_context *cmd, struct logical_volume *lv)
 	if (!vg_is_clustered(lv->vg))
 		return activate_lv_excl_local(cmd, lv);
 
-	if (lv_is_active_exclusive_locally(lv))
-		return 1;
+	if (!cmd->node) {
+		if (lv_is_active_exclusive_locally(lv))
+			return 1;
 
-	if (!activate_lv_excl_local(cmd, lv))
-		return_0;
+		if (!activate_lv_excl_local(cmd, lv))
+			return_0;
 
-	if (lv_is_active_exclusive(lv))
-		return 1;
 
-	/* FIXME Deal with error return codes. */
-	if (activate_lv_excl_remote(cmd, lv))
-		stack;
+		if (lv_is_active_exclusive(lv))
+			return 1;
+	} else {
+		if (lv_is_active_exclusive_remotely(lv, cmd->node))
+			return 1;
+
+		if (!activate_lv_excl_remote(cmd, lv))
+			return_0;
+
+
+		if (lv_is_active_exclusive(lv))
+			return 1;
+	}
 
-	return lv_is_active_exclusive(lv);
+	return_0;
 }
 
 int activate_lv_excl_force(struct cmd_context *cmd, struct logical_volume *lv) 
@@ -583,20 +588,29 @@ int activate_lv_excl_force(struct cmd_context *cmd, struct logical_volume *lv)
 	if (!vg_is_clustered(lv->vg))
 		return activate_lv_excl_local(cmd, lv);
 
-	if (lv_is_active_exclusive_locally(lv))
-		return 1;
+	if (!cmd->node) {
+		if (lv_is_active_exclusive_locally(lv))
+			return 1;
 
-	if (!activate_lv_excl_local_force(cmd, lv))
-		return_0;
+		if (!activate_lv_excl_local_force(cmd, lv))
+			return_0;
 
-	if (lv_is_active_exclusive(lv))
-		return 1;
 
-	/* FIXME Deal with error return codes. */
-	if (activate_lv_excl_remote_force(cmd, lv))
-		stack;
+		if (lv_is_active_exclusive(lv))
+			return 1;
+	} else {
+		if (lv_is_active_exclusive_remotely(lv, cmd->node))
+			return 1;
+
+		if (!activate_lv_excl_remote_force(cmd, lv))
+			return_0;
+
+
+		if (lv_is_active_exclusive(lv))
+			return 1;
+	}
 
-	return lv_is_active_exclusive(lv);
+	return_0;
 }
 
 /* Lock a list of LVs */
@@ -635,7 +649,7 @@ int locking_is_clustered(void)
 	return (_locking.flags & LCK_CLUSTERED) ? 1 : 0;
 }
 
-int remote_lock_held(const char *vol, int *exclusive)
+int remote_lock_held(const char *vol, int *exclusive, const char *node)
 {
 	int mode = LCK_NULL;
 
@@ -648,7 +662,7 @@ int remote_lock_held(const char *vol, int *exclusive)
 	/*
 	 * If an error occured, expect that volume is active
 	 */
-	if (!_locking.query_resource(vol, &mode)) {
+	if (!_locking.query_resource(vol, &mode, node)) {
 		stack;
 		return 1;
 	}
diff --git a/lib/locking/locking.h b/lib/locking/locking.h
index b441a6c..ce20ff5 100644
--- a/lib/locking/locking.h
+++ b/lib/locking/locking.h
@@ -25,7 +25,7 @@ void reset_locking(void);
 int vg_write_lock_held(void);
 int locking_is_clustered(void);
 
-int remote_lock_held(const char *vol, int *exclusive);
+int remote_lock_held(const char *vol, int *exclusive, const char *node);
 
 /*
  * LCK_VG:
@@ -186,7 +186,7 @@ int check_lvm1_vg_inactive(struct cmd_context *cmd, const char *vgname);
 #define activate_lv_excl_local_force(cmd, lv)	\
 				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_LOCAL | (lv_is_active(lv) && ! lv_is_active_exclusive(lv) ? LCK_TRY_CONVERT : 0))
 #define activate_lv_excl_remote_force(cmd, lv)	\
-				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_REMOTE | (lv_is_active(lv) && ! lv_is_active_exclusive(lv) ? LCK_TRY_CONVERT : 0))
+				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_REMOTE | (lv_is_active_remotely(lv, cmd->node) && ! lv_is_active_exclusive(lv) ? LCK_TRY_CONVERT : 0))
 
 struct logical_volume;
 int activate_lv_excl(struct cmd_context *cmd, struct logical_volume *lv);
@@ -197,8 +197,14 @@ int deactivate_lv(struct cmd_context *cmd, struct logical_volume *lv);
 	lock_lv_vol(cmd, lv, LCK_LV_ACTIVATE | LCK_HOLD | LCK_LOCAL)
 #define activate_lv_local_force(cmd, lv)	\
 	lock_lv_vol(cmd, lv, LCK_LV_ACTIVATE | LCK_HOLD | LCK_LOCAL | (lv_is_active_exclusive_locally(lv) ? LCK_TRY_CONVERT : 0))
+#define activate_lv_remote(cmd, lv)	\
+	lock_lv_vol(cmd, lv, LCK_LV_ACTIVATE | LCK_HOLD | LCK_REMOTE)
+#define activate_lv_remote_force(cmd, lv)	\
+	lock_lv_vol(cmd, lv, LCK_LV_ACTIVATE | LCK_HOLD | LCK_REMOTE | (lv_is_active_exclusive_remotely(lv, cmd->node) ? LCK_TRY_CONVERT : 0))
 #define deactivate_lv_local(cmd, lv)	\
 	lock_lv_vol(cmd, lv, LCK_LV_DEACTIVATE | LCK_LOCAL)
+#define deactivate_lv_remote(cmd, lv)	\
+	lock_lv_vol(cmd, lv, LCK_LV_DEACTIVATE | LCK_REMOTE)
 #define drop_cached_metadata(vg)	\
 	lock_vol((vg)->cmd, (vg)->name, LCK_VG_DROP_CACHE)
 #define remote_commit_cached_metadata(vg)	\
diff --git a/lib/locking/locking_types.h b/lib/locking/locking_types.h
index 53c7016..787a922 100644
--- a/lib/locking/locking_types.h
+++ b/lib/locking/locking_types.h
@@ -18,7 +18,7 @@
 
 typedef int (*lock_resource_fn) (struct cmd_context * cmd, const char *resource,
 				 uint32_t flags);
-typedef int (*query_resource_fn) (const char *resource, int *mode);
+typedef int (*query_resource_fn) (const char *resource, int *mode, const char *node);
 
 typedef void (*fin_lock_fn) (void);
 typedef void (*reset_lock_fn) (void);
-- 
1.7.1
