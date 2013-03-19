Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2JDWrFx029147
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:53 -0400
Received: from c6-x64-devel.vds-ok.com (r02-ge0-SH.prague.vds-ok.com
	[88.86.97.52] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JDWpWW023566
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:51 -0400
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Date: Tue, 19 Mar 2013 13:32:43 +0000
Message-Id: <1363699970-10002-4-git-send-email-bubble@hoster-ok.com>
In-Reply-To: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
Subject: [linux-lvm] [PATCH 03/10] clvmd: Allow node names to be obtained
	from corosync's CMAP
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

Use pacemaker-like algorithm to obtain node names from CMAP (corosync2).
Fix incorrect parameter is passed to dm_hash_lookup_binary() in
_csid_from_name() in clvmd-corosync.c
Do not close CMAP connection after local node ID is obtained, and reuse
it to get node names.

Signed-off-by: Vladislav Bogdanov <bubble@hoster-ok.com>
---
 daemons/clvmd/clvmd-corosync.c |  147 +++++++++++++++++++++++++++++++++++----
 1 files changed, 132 insertions(+), 15 deletions(-)

diff --git a/daemons/clvmd/clvmd-corosync.c b/daemons/clvmd/clvmd-corosync.c
index d85ec1e..0af02a2 100644
--- a/daemons/clvmd/clvmd-corosync.c
+++ b/daemons/clvmd/clvmd-corosync.c
@@ -71,6 +71,9 @@ static struct local_client *cluster_client;
 /* Corosync handles */
 static cpg_handle_t cpg_handle;
 static quorum_handle_t quorum_handle;
+#if defined HAVE_COROSYNC_CMAP_H
+static cmap_handle_t cmap_handle = 0;
+#endif
 
 /* DLM Handle */
 static dlm_lshandle_t *lockspace;
@@ -208,7 +211,7 @@ static void corosync_cpg_deliver_callback (cpg_handle_t handle,
 	memcpy(&target_nodeid, msg, COROSYNC_CSID_LEN);
 
 	DEBUGLOG("%u got message from nodeid %d for %d. len %zd\n",
-		 our_nodeid, nodeid, target_nodeid, msg_len-4);
+		 our_nodeid, nodeid, target_nodeid, msg_len-COROSYNC_CSID_LEN);
 
 	if (nodeid != our_nodeid)
 		if (target_nodeid == our_nodeid || target_nodeid == 0)
@@ -297,6 +300,17 @@ static int _init_cluster(void)
 		return cs_to_errno(err);
 	}
 
+#if defined HAVE_COROSYNC_CMAP_H
+	err = cmap_initialize(&cmap_handle);
+	if (err != CS_OK) {
+		syslog(LOG_ERR, "Cannot initialise Corosync CMAP service: %d",
+		       err);
+		DEBUGLOG("Cannot initialise Corosync CMAP service: %d", err);
+		cpg_finalize(cpg_handle);
+		return cs_to_errno(err);
+	}
+#endif
+
 #ifdef QUORUM_SET
 	err = quorum_initialize(&quorum_handle,
 				&quorum_callbacks,
@@ -305,6 +319,10 @@ static int _init_cluster(void)
 	if (quorum_type != QUORUM_SET) {
 		syslog(LOG_ERR, "Corosync quorum service is not configured");
 		DEBUGLOG("Corosync quorum service is not configured");
+#if defined HAVE_COROSYNC_CMAP_H
+		cmap_finalize(cmap_handle);
+#endif
+		cpg_finalize(cpg_handle);
 		return EINVAL;
 	}
 #else
@@ -315,6 +333,10 @@ static int _init_cluster(void)
 	if (err != CS_OK) {
 		syslog(LOG_ERR, "Cannot initialise Corosync quorum service: %d",
 		       err);
+#if defined HAVE_COROSYNC_CMAP_H
+		cmap_finalize(cmap_handle);
+#endif
+		cpg_finalize(cpg_handle);
 		DEBUGLOG("Cannot initialise Corosync quorum service: %d", err);
 		return cs_to_errno(err);
 	}
@@ -325,6 +347,10 @@ static int _init_cluster(void)
 		lockspace = dlm_create_lockspace(LOCKSPACE_NAME, 0600);
 		if (!lockspace) {
 			syslog(LOG_ERR, "Unable to create DLM lockspace for CLVM: %m");
+#if defined HAVE_COROSYNC_CMAP_H
+			cmap_finalize(cmap_handle);
+#endif
+			cpg_finalize(cpg_handle);
 			return -1;
 		}
 		DEBUGLOG("Created DLM lockspace for CLVMD.\n");
@@ -339,6 +365,9 @@ static int _init_cluster(void)
 	cpg_group_name.length = strlen((char *)cpg_group_name.value);
 	err = cpg_join(cpg_handle, &cpg_group_name);
 	if (err != CS_OK) {
+#if defined HAVE_COROSYNC_CMAP_H
+		cmap_finalize(cmap_handle);
+#endif
 		cpg_finalize(cpg_handle);
 		quorum_finalize(quorum_handle);
 		dlm_release_lockspace(LOCKSPACE_NAME, lockspace, 1);
@@ -350,6 +379,9 @@ static int _init_cluster(void)
 	err = cpg_local_get(cpg_handle,
 			    &our_nodeid);
 	if (err != CS_OK) {
+#if defined HAVE_COROSYNC_CMAP_H
+		cmap_finalize(cmap_handle);
+#endif
 		cpg_finalize(cpg_handle);
 		quorum_finalize(quorum_handle);
 		dlm_release_lockspace(LOCKSPACE_NAME, lockspace, 1);
@@ -371,6 +403,9 @@ static void _cluster_closedown(void)
 	dlm_release_lockspace(LOCKSPACE_NAME, lockspace, 1);
 	cpg_finalize(cpg_handle);
 	quorum_finalize(quorum_handle);
+#if defined HAVE_COROSYNC_CMAP_H
+	cmap_finalize(cmap_handle);
+#endif
 }
 
 static void _get_our_csid(char *csid)
@@ -379,17 +414,56 @@ static void _get_our_csid(char *csid)
 }
 
 /* Corosync doesn't really have nmode names so we
-   just use the node ID in hex instead */
+   just use the node ID in hex instead.
+   The only case when we have name is when nodelist is configured for
+   pacemaker the way described in pacemaker docs (has nodelist.node.X.name) */
 static int _csid_from_name(char *csid, const char *name)
 {
-	int nodeid;
+	int nodeid = 0;
 	struct node_info *ninfo;
 
-	if (sscanf(name, "%x", &nodeid) == 1) {
-		ninfo = dm_hash_lookup_binary(node_hash, csid, COROSYNC_CSID_LEN);
-		if (ninfo)
+#if defined HAVE_COROSYNC_CMAP_H
+	int idx = 0;
+	char key[128];
+
+	while (1) {
+		cs_error_t rc;
+		char *n_name = NULL;
+
+		snprintf(key, 128, "nodelist.node.%d.name", idx);
+		rc = cmap_get_string(cmap_handle, key, &n_name);
+
+		if (rc != CS_OK) {
+			snprintf(key, 128, "nodelist.node.%d.ring0_ipaddr", idx);
+			rc = cmap_get_string(cmap_handle, key, &n_name);
+
+			if (rc != CS_OK) {
+				break;
+			}
+		}
+		if (strcmp(name, n_name) == 0) {
+			free(n_name);
+			snprintf(key, 128, "nodelist.node.%d.nodeid", idx);
+			rc = cmap_get_uint32(cmap_handle, key, (uint32_t *)&nodeid);
+			if (rc != CS_OK) {
+				break;
+			}
+			
+		} else {
+			free(n_name);
+		}
+		idx++;
+	}
+#endif
+
+	if (nodeid || sscanf(name, "%d", &nodeid) == 1) {
+		ninfo = dm_hash_lookup_binary(node_hash, (char *)&nodeid, COROSYNC_CSID_LEN);
+		if (ninfo) {
+			memcpy(csid, &nodeid, COROSYNC_CSID_LEN);
 			return nodeid;
+		}
 	}
+	*csid = 0;
 	return -1;
 }
 
@@ -397,14 +471,64 @@ static int _name_from_csid(const char *csid, char *name)
 {
 	struct node_info *ninfo;
 
+#if defined HAVE_COROSYNC_CMAP_H
+	int nodeid = 0;
+	int idx = 0;
+	char key[128];
+
+	memcpy(&nodeid, csid, COROSYNC_CSID_LEN);
+
+	*name = '\0';
+
+	while (1) {
+		cs_error_t rc;
+		char *n_name = NULL;
+		uint32_t id;
+
+		snprintf(key, 128, "nodelist.node.%d.nodeid", idx);
+		rc = cmap_get_uint32(cmap_handle, key, &id);
+		if (rc != CS_OK) {
+			break;
+		}
+		if (id == nodeid) {
+			snprintf(key, 128, "nodelist.node.%d.name", idx);
+			rc = cmap_get_string(cmap_handle, key, &n_name);
+			if (rc != CS_OK || !n_name) {
+				int octet;
+				snprintf(key, 128, "nodelist.node.%d.ring0_ipaddr", idx);
+				rc = cmap_get_string(cmap_handle, key, &n_name);
+
+				if (rc != CS_OK || !n_name) {
+					break;
+				}
+				if (sscanf(n_name, "%d.%d.%d.%d", &octet, &octet, &octet, &octet) == 4 || strstr(n_name, ":") != NULL) {
+					/* ring0_ipaddr contains IP address */
+					free(n_name);
+					n_name = NULL;
+					break;
+				}
+			}
+			snprintf(name, COROSYNC_MAX_CLUSTER_MEMBER_NAME_LEN, "%s", n_name);
+			free(n_name);
+			break;
+		}
+
+		idx++;
+	}
+#endif
+
 	ninfo = dm_hash_lookup_binary(node_hash, csid, COROSYNC_CSID_LEN);
 	if (!ninfo)
 	{
-		sprintf(name, "UNKNOWN %s", print_corosync_csid(csid));
+		if (! *name)
+			snprintf(name, COROSYNC_MAX_CLUSTER_MEMBER_NAME_LEN, "UNKNOWN %s", print_corosync_csid(csid));
+
 		return -1;
 	}
 
-	sprintf(name, "%x", ninfo->nodeid);
+	if (! *name)
+		snprintf(name, COROSYNC_MAX_CLUSTER_MEMBER_NAME_LEN, "%d", ninfo->nodeid);
+
 	return 0;
 }
 
@@ -627,18 +751,12 @@ out:
 
 static int _get_cluster_name(char *buf, int buflen)
 {
-	cmap_handle_t cmap_handle = 0;
 	int result;
 	char *name = NULL;
 
 	/* This is a default in case everything else fails */
 	strncpy(buf, "Corosync", buflen);
 
-	/* Look for a cluster name in cmap */
-	result = cmap_initialize(&cmap_handle);
-	if (result != CS_OK)
-		return 0;
-
 	result = cmap_get_string(cmap_handle, "totem.cluster_name", &name);
 	if (result != CS_OK)
 		goto out;
@@ -649,7 +767,6 @@ static int _get_cluster_name(char *buf, int buflen)
 out:
 	if (name)
 		free(name);
-	cmap_finalize(cmap_handle);
 	return 0;
 }
 
-- 
1.7.1
