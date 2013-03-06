Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r267wvK4032735
	for <linux-lvm@redhat.com>; Wed, 6 Mar 2013 02:58:57 -0500
Received: from h01.hoster-ok.com (h01.hoster-ok.com [88.86.111.110])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r267wqDj024606
	for <linux-lvm@redhat.com>; Wed, 6 Mar 2013 02:58:53 -0500
Message-ID: <5136F738.1010707@hoster-ok.com>
Date: Wed, 06 Mar 2013 10:58:48 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
MIME-Version: 1.0
References: <513090CA.8050904@pse-consulting.de>
	<aac9d40a-ad92-41bc-a19a-6998bb8b057d@email.android.com>
	<5136F2F1.3020202@pse-consulting.de>
In-Reply-To: <5136F2F1.3020202@pse-consulting.de>
Content-Type: multipart/mixed; boundary="------------090105050009050303060201"
Subject: Re: [linux-lvm] LVM snapshot with Clustered VG
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
To: Andreas Pflug <pgadmin@pse-consulting.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------090105050009050303060201
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

06.03.2013 10:40, Andreas Pflug wrote:
> Am 01.03.13 16:41, schrieb Vladislav Bogdanov:
>> Sorry, forgot to reply to list from the first attempt.
>>
>> Andreas Pflug <pgadmin@pse-consulting.de> wrote:
>>
>>> Hi Vladislav,
>>>
>>> I tried the patch you mentioned in
>>> https://www.redhat.com/archives/linux-lvm/2013-January/msg00006.html ,
>>> but apparently it doesn't work for me. On a locally active LV, I still
>>> get
>>>
>>> ./lvm lvchange -aey -vvvv vg/locktest
>>>
>>> ...
>>> Activating logical volume "locktest" exclusively
>>> #activate/dev_manager.c:284         Getting device info for vg-locktest
>>>
>>> [LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
>>> #ioctl/libdm-iface.c:1724         dm info
>>> LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN
>>> NF   [16384] (*1)
>>> #locking/cluster_locking.c:568         Lock held for
>>> oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN, node
>>> 7400a8c0 : CR
>>> #activate/activate.c:1067       vg/locktest is active
>>> #locking/cluster_locking.c:508       Locking LV
>>> oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN EX
>>> (LV|NONBLOCK|CLUSTER|LOCAL) (0xdd)
>>> #locking/cluster_locking.c:395   Error locking on node 7400a8c0: Device
>>>
>>> or resource busy
>>>
>>> Can you give me a hint what to try further?
>>>
>>> Regards
>>> Andreas
>> Hi Andreas,
>> Lock convertion is only enabled if you pass --force flag.
>> Also, to upgrade local lock to exclusive one, you need to ensure IIRC
>> that no more node holds local lock.
> 
> Hm, tried that as well:
> 
> tools/lvm lvchange --force -aey  -vvvv vg/locktest
> 
> --force changes the error from "resource busy" to "invalid argument":

Is volume active on other nodes at that time?
And do you run clvmd from that build tree as well?

Also, can you please try attached patch (on top of that one you have)? I
polished conversion a bit more, denying -an if volume is ex-locked
somewhere and other fixes to logic.
This patch also allows locking (activation) to be performed on remote
nodes. I only tested this with corosync2 (which is set up in a way
latest pacemaker - post-1.1.8 git master - needs, nodes has additional
'name' value in nodelist, please see
http://clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Pacemaker_Explained/s-node-name.html).

I did not have a time to split this all into git commits suitable for
sending upstream, so it all is a little bit messy yet.

> 
> #lvchange.c:243     Activating logical volume "locktest" exclusively
> (forced)
> #activate/dev_manager.c:284         Getting device info for vg-locktest
> [LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
> #ioctl/libdm-iface.c:1724         dm info
> LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN
> NF   [16384] (*1)
> #locking/cluster_locking.c:568         Lock held for
> oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN, node
> 7400a8c0 : CR
> #activate/activate.c:1067       vg/locktest is active
> #activate/dev_manager.c:284         Getting device info for vg-locktest
> [LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
> #ioctl/libdm-iface.c:1724         dm info
> LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN
> NF   [16384] (*1)
> #activate/activate.c:1067       vg/locktest is active
> #activate/dev_manager.c:284         Getting device info for vg-locktest
> [LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN]
> #ioctl/libdm-iface.c:1724         dm info
> LVM-oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN
> NF   [16384] (*1)
> #locking/cluster_locking.c:568         Lock held for
> oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN, node
> 7400a8c0 : CR
> #activate/activate.c:1067       vg/locktest is active
> #locking/cluster_locking.c:508       Locking LV
> oW2W7O2cgWRLUhoVR8qqqQY7wlcYexmWU8y83bGQz9IcnXh3GfXslBN6ziZrC3BN EX
> (LV|NONBLOCK|CLUSTER|LOCAL|CONVERT) (0x40dd)
> #locking/cluster_locking.c:395   Error locking on node 7400a8c0: Invalid
> argument
> 
> 
> Regards
> Andreas


--------------090105050009050303060201
Content-Type: text/x-patch;
 name="LVM2.2.02.98-remote-activation.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="LVM2.2.02.98-remote-activation.patch"

diff -urNp LVM2.2.02.98.orig/daemons/clvmd/clvmd.c LVM2.2.02.98/daemons/clvmd/clvmd.c
--- LVM2.2.02.98.orig/daemons/clvmd/clvmd.c	2012-12-28 13:32:10.000000000 +0000
+++ LVM2.2.02.98/daemons/clvmd/clvmd.c	2013-03-05 10:59:47.874192528 +0000
@@ -1293,7 +1293,7 @@ static int read_from_local_sock(struct l
 		}
 
 		/* Check the node name for validity */
-		if (inheader->node[0] && clops->csid_from_name(csid, inheader->node)) {
+		if (inheader->node[0] && clops->csid_from_name(csid, inheader->node) <= 0) {
 			/* Error, node is not in the cluster */
 			struct clvm_header reply = {
 				.cmd = CLVMD_CMD_REPLY,
@@ -1436,7 +1436,7 @@ static int distribute_command(struct loc
                         /* Do it on a single node */
 			char csid[MAX_CSID_LEN];
 
-			if (clops->csid_from_name(csid, inheader->node)) {
+			if (clops->csid_from_name(csid, inheader->node) <= 0) {
 				/* This has already been checked so should not happen */
 				return 0;
 			} else {
@@ -1448,6 +1448,8 @@ static int distribute_command(struct loc
 				/* Are we the requested node ?? */
 				if (memcmp(csid, our_csid, max_csid_len) == 0) {
 					DEBUGLOG("Doing command on local node only\n");
+					inheader->flags &= ~CLVMD_FLAG_REMOTE;
+					inheader->flags |= CLVMD_FLAG_LOCAL;
 					add_to_lvmqueue(thisfd, inheader, len, NULL);
 				} else {
 					DEBUGLOG("Sending message to single node: %s\n",
@@ -1497,7 +1499,7 @@ static void process_remote_command(struc
 	   clvmd-command.c */
 	if (msg->cmd == CLVMD_CMD_VERSION) {
 		int version_nums[3];
-		char node[256];
+		char node[max_cluster_member_name_len];
 
 		memcpy(version_nums, msg->args, sizeof(version_nums));
 
diff -urNp LVM2.2.02.98.orig/daemons/clvmd/clvmd-corosync.c LVM2.2.02.98/daemons/clvmd/clvmd-corosync.c
--- LVM2.2.02.98.orig/daemons/clvmd/clvmd-corosync.c	2012-12-28 13:32:10.000000000 +0000
+++ LVM2.2.02.98/daemons/clvmd/clvmd-corosync.c	2013-03-05 10:59:47.874192528 +0000
@@ -72,6 +72,9 @@ static struct local_client *cluster_clie
 /* Corosync handles */
 static cpg_handle_t cpg_handle;
 static quorum_handle_t quorum_handle;
+#if defined HAVE_COROSYNC_CMAP_H
+static cmap_handle_t cmap_handle = 0;
+#endif
 
 /* DLM Handle */
 static dlm_lshandle_t *lockspace;
@@ -298,6 +301,17 @@ static int _init_cluster(void)
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
@@ -306,6 +320,10 @@ static int _init_cluster(void)
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
@@ -316,6 +334,10 @@ static int _init_cluster(void)
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
@@ -326,6 +348,10 @@ static int _init_cluster(void)
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
@@ -340,6 +366,9 @@ static int _init_cluster(void)
 	cpg_group_name.length = strlen((char *)cpg_group_name.value);
 	err = cpg_join(cpg_handle, &cpg_group_name);
 	if (err != CS_OK) {
+#if defined HAVE_COROSYNC_CMAP_H
+		cmap_finalize(cmap_handle);
+#endif
 		cpg_finalize(cpg_handle);
 		quorum_finalize(quorum_handle);
 		dlm_release_lockspace(LOCKSPACE_NAME, lockspace, 1);
@@ -351,6 +380,9 @@ static int _init_cluster(void)
 	err = cpg_local_get(cpg_handle,
 			    &our_nodeid);
 	if (err != CS_OK) {
+#if defined HAVE_COROSYNC_CMAP_H
+		cmap_finalize(cmap_handle);
+#endif
 		cpg_finalize(cpg_handle);
 		quorum_finalize(quorum_handle);
 		dlm_release_lockspace(LOCKSPACE_NAME, lockspace, 1);
@@ -372,6 +404,9 @@ static void _cluster_closedown(void)
 	dlm_release_lockspace(LOCKSPACE_NAME, lockspace, 1);
 	cpg_finalize(cpg_handle);
 	quorum_finalize(quorum_handle);
+#if defined HAVE_COROSYNC_CMAP_H
+	cmap_finalize(cmap_handle);
+#endif
 }
 
 static void _get_our_csid(char *csid)
@@ -380,17 +415,56 @@ static void _get_our_csid(char *csid)
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
 
@@ -398,14 +472,64 @@ static int _name_from_csid(const char *c
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
 
@@ -629,18 +753,12 @@ out:
 
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
@@ -651,7 +769,6 @@ static int _get_cluster_name(char *buf, 
 out:
 	if (name)
 		free(name);
-	cmap_finalize(cmap_handle);
 	return 0;
 }
 
diff -urNp LVM2.2.02.98.orig/lib/activate/activate.c LVM2.2.02.98/lib/activate/activate.c
--- LVM2.2.02.98.orig/lib/activate/activate.c	2012-10-15 14:24:58.000000000 +0000
+++ LVM2.2.02.98/lib/activate/activate.c	2013-03-05 10:59:47.876252746 +0000
@@ -270,7 +270,7 @@ int lv_is_active_exclusive_locally(const
 {
 	return 0;
 }
-int lv_is_active_exclusive_remotely(const struct logical_volume *lv)
+int lv_is_active_exclusive_remotely(const struct logical_volume *lv, const char *node)
 {
 	return 0;
 }
@@ -1014,7 +1014,7 @@ int lvs_in_vg_opened(const struct volume
  * Returns: 0 or 1
  */
 static int _lv_is_active(const struct logical_volume *lv,
-			 int *locally, int *exclusive)
+			 int *locally, int *exclusive, const char *node)
 {
 	int r, l, e; /* remote, local, and exclusive */
 
@@ -1033,7 +1033,7 @@ static int _lv_is_active(const struct lo
 	if (l && !exclusive)
 		goto out;
 
-	if ((r = remote_lock_held(lv->lvid.s, &e)) >= 0)
+	if ((r = remote_lock_held(lv->lvid.s, &e, node)) >= 0)
 		goto out;
 
 	/*
@@ -1071,34 +1071,40 @@ out:
 
 int lv_is_active(const struct logical_volume *lv)
 {
-	return _lv_is_active(lv, NULL, NULL);
+	return _lv_is_active(lv, NULL, NULL, NULL);
+}
+
+int lv_is_active_remotely(const struct logical_volume *lv, const char *node)
+{
+	int l;
+	return _lv_is_active(lv, &l, NULL, node) && !l;
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
+	return _lv_is_active(lv, &l, &e, node) && !l && e;
 }
 
 #ifdef DMEVENTD
diff -urNp LVM2.2.02.98.orig/lib/activate/activate.h LVM2.2.02.98/lib/activate/activate.h
--- LVM2.2.02.98.orig/lib/activate/activate.h	2012-10-15 14:24:58.000000000 +0000
+++ LVM2.2.02.98/lib/activate/activate.h	2013-03-05 10:59:47.878201236 +0000
@@ -130,10 +130,11 @@ int lvs_in_vg_activated(const struct vol
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
diff -urNp LVM2.2.02.98.orig/lib/commands/toolcontext.h LVM2.2.02.98/lib/commands/toolcontext.h
--- LVM2.2.02.98.orig/lib/commands/toolcontext.h	2012-10-15 14:24:58.000000000 +0000
+++ LVM2.2.02.98/lib/commands/toolcontext.h	2013-03-05 10:59:47.879245750 +0000
@@ -112,6 +112,7 @@ struct cmd_context {
 	char dev_dir[PATH_MAX];
 	char proc_dir[PATH_MAX];
 	char sysfs_dir[PATH_MAX]; /* FIXME Use global value instead. */
+	const char *node;
 };
 
 /*
diff -urNp LVM2.2.02.98.orig/lib/locking/cluster_locking.c LVM2.2.02.98/lib/locking/cluster_locking.c
--- LVM2.2.02.98.orig/lib/locking/cluster_locking.c	2012-12-28 13:32:10.000000000 +0000
+++ LVM2.2.02.98/lib/locking/cluster_locking.c	2013-03-05 10:59:47.881190506 +0000
@@ -190,8 +190,10 @@ static void _build_header(struct clvm_he
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
@@ -315,6 +317,9 @@ static int _lock_for_cluster(struct cmd_
 
 	assert(name);
 
+	if (node == NULL) {
+		node = "";
+	}
 	len = strlen(name) + 3;
 	args = alloca(len);
 	strcpy(args + 2, name);
@@ -374,7 +379,7 @@ static int _lock_for_cluster(struct cmd_
 		     !(flags & LCK_CLUSTER_VG)))
 			node = NODE_LOCAL;
 		else if (flags & LCK_REMOTE)
-			node = NODE_REMOTE;
+			node = cmd->node ? cmd->node : NODE_REMOTE;
 	}
 
 	status = _cluster_request(clvmd_cmd, node, args, len,
@@ -527,16 +532,18 @@ static int decode_lock_type(const char *
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
diff -urNp LVM2.2.02.98.orig/lib/locking/external_locking.c LVM2.2.02.98/lib/locking/external_locking.c
--- LVM2.2.02.98.orig/lib/locking/external_locking.c	2012-10-15 14:24:58.000000000 +0000
+++ LVM2.2.02.98/lib/locking/external_locking.c	2013-03-05 10:59:47.882313739 +0000
@@ -28,7 +28,7 @@ static int (*_lock_fn) (struct cmd_conte
 			uint32_t flags) = NULL;
 static int (*_init_fn) (int type, struct dm_config_tree * cft,
 			uint32_t *flags) = NULL;
-static int (*_lock_query_fn) (const char *resource, int *mode) = NULL;
+static int (*_lock_query_fn) (const char *resource, int *mode, const char *node) = NULL;
 
 static int _lock_resource(struct cmd_context *cmd, const char *resource,
 			  uint32_t flags)
diff -urNp LVM2.2.02.98.orig/lib/locking/locking.c LVM2.2.02.98/lib/locking/locking.c
--- LVM2.2.02.98.orig/lib/locking/locking.c	2012-12-28 13:32:10.000000000 +0000
+++ LVM2.2.02.98/lib/locking/locking.c	2013-03-06 06:42:59.043441030 +0000
@@ -544,10 +544,12 @@ int deactivate_lv(struct cmd_context *cm
 {
 	if (vg_is_clustered(lv->vg)) {
 		if (lv_is_active_exclusive(lv) && ! lv_is_active_exclusive_locally(lv)) {
+			log_error("Failed to deactivate %s: exclusively activated on a remote node. Use -aln --node Node.", lv->name);
 			return_0;
 		}
 	}
 	lock_lv_vol(cmd, lv, LCK_LV_DEACTIVATE);
+	return 1;
 }
 
 /*
@@ -561,20 +563,29 @@ int activate_lv_excl(struct cmd_context 
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
@@ -583,20 +594,29 @@ int activate_lv_excl_force(struct cmd_co
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
@@ -635,7 +655,7 @@ int locking_is_clustered(void)
 	return (_locking.flags & LCK_CLUSTERED) ? 1 : 0;
 }
 
-int remote_lock_held(const char *vol, int *exclusive)
+int remote_lock_held(const char *vol, int *exclusive, const char *node)
 {
 	int mode = LCK_NULL;
 
@@ -648,7 +668,7 @@ int remote_lock_held(const char *vol, in
 	/*
 	 * If an error occured, expect that volume is active
 	 */
-	if (!_locking.query_resource(vol, &mode)) {
+	if (!_locking.query_resource(vol, &mode, node)) {
 		stack;
 		return 1;
 	}
diff -urNp LVM2.2.02.98.orig/lib/locking/locking.h LVM2.2.02.98/lib/locking/locking.h
--- LVM2.2.02.98.orig/lib/locking/locking.h	2012-12-28 13:32:10.000000000 +0000
+++ LVM2.2.02.98/lib/locking/locking.h	2013-03-05 10:59:47.885191648 +0000
@@ -25,7 +25,7 @@ void reset_locking(void);
 int vg_write_lock_held(void);
 int locking_is_clustered(void);
 
-int remote_lock_held(const char *vol, int *exclusive);
+int remote_lock_held(const char *vol, int *exclusive, const char *node);
 
 /*
  * LCK_VG:
@@ -186,7 +186,7 @@ int check_lvm1_vg_inactive(struct cmd_co
 #define activate_lv_excl_local_force(cmd, lv)	\
 				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_LOCAL | (lv_is_active(lv) && ! lv_is_active_exclusive(lv) ? LCK_TRY_CONVERT : 0))
 #define activate_lv_excl_remote_force(cmd, lv)	\
-				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_REMOTE | (lv_is_active(lv) && ! lv_is_active_exclusive(lv) ? LCK_TRY_CONVERT : 0))
+				lock_lv_vol(cmd, lv, LCK_LV_EXCLUSIVE | LCK_HOLD | LCK_REMOTE | (lv_is_active_remotely(lv, cmd->node) && ! lv_is_active_exclusive(lv) ? LCK_TRY_CONVERT : 0))
 
 struct logical_volume;
 int activate_lv_excl(struct cmd_context *cmd, struct logical_volume *lv);
@@ -197,8 +197,14 @@ int deactivate_lv(struct cmd_context *cm
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
diff -urNp LVM2.2.02.98.orig/lib/locking/locking_types.h LVM2.2.02.98/lib/locking/locking_types.h
--- LVM2.2.02.98.orig/lib/locking/locking_types.h	2012-10-15 14:24:58.000000000 +0000
+++ LVM2.2.02.98/lib/locking/locking_types.h	2013-03-05 10:59:47.886265186 +0000
@@ -18,7 +18,7 @@
 
 typedef int (*lock_resource_fn) (struct cmd_context * cmd, const char *resource,
 				 uint32_t flags);
-typedef int (*query_resource_fn) (const char *resource, int *mode);
+typedef int (*query_resource_fn) (const char *resource, int *mode, const char *node);
 
 typedef void (*fin_lock_fn) (void);
 typedef void (*reset_lock_fn) (void);
diff -urNp LVM2.2.02.98.orig/tools/args.h LVM2.2.02.98/tools/args.h
--- LVM2.2.02.98.orig/tools/args.h	2012-10-15 14:24:59.000000000 +0000
+++ LVM2.2.02.98/tools/args.h	2013-03-05 10:59:47.888190332 +0000
@@ -76,6 +76,7 @@ arg(discards_ARG, '\0', "discards", disc
 arg(stripes_long_ARG, '\0', "stripes", int_arg, 0)
 arg(sysinit_ARG, '\0', "sysinit", NULL, 0)
 arg(thinpool_ARG, '\0', "thinpool", string_arg, 0)
+arg(node_ARG, '\0', "node", string_arg, 0)
 
 /* Allow some variations */
 arg(resizable_ARG, '\0', "resizable", yes_no_arg, 0)
diff -urNp LVM2.2.02.98.orig/tools/commands.h LVM2.2.02.98/tools/commands.h
--- LVM2.2.02.98.orig/tools/commands.h	2012-10-15 14:24:59.000000000 +0000
+++ LVM2.2.02.98/tools/commands.h	2013-03-05 10:59:47.889258249 +0000
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
diff -urNp LVM2.2.02.98.orig/tools/lvchange.c LVM2.2.02.98/tools/lvchange.c
--- LVM2.2.02.98.orig/tools/lvchange.c	2012-12-28 13:32:10.000000000 +0000
+++ LVM2.2.02.98/tools/lvchange.c	2013-03-05 10:59:47.891443499 +0000
@@ -226,11 +226,22 @@ static int _lvchange_activate(struct cmd
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
 		log_verbose("Deactivating logical volume \"%s\"", lv->name);
 		if (!deactivate_lv(cmd, lv))
 			return_0;
@@ -239,29 +250,55 @@ static int _lvchange_activate(struct cmd
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
@@ -808,6 +845,25 @@ static int lvchange_single(struct cmd_co
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
diff -urNp LVM2.2.02.98.orig/tools/pvmove.c LVM2.2.02.98/tools/pvmove.c
--- LVM2.2.02.98.orig/tools/pvmove.c	2012-10-15 14:24:59.000000000 +0000
+++ LVM2.2.02.98/tools/pvmove.c	2013-03-05 10:59:47.893194162 +0000
@@ -240,7 +240,7 @@ static struct logical_volume *_set_up_pv
 		}
 
 		if (vg_is_clustered(vg) &&
-		    lv_is_active_exclusive_remotely(lv)) {
+		    lv_is_active_exclusive_remotely(lv, NULL)) {
 			lv_skipped = 1;
 			log_print_unless_silent("Skipping LV %s which is activated "
 						"exclusively on remote node.", lv->name);
diff -urNp LVM2.2.02.98.orig/tools/vgchange.c LVM2.2.02.98/tools/vgchange.c
--- LVM2.2.02.98.orig/tools/vgchange.c	2012-10-15 14:24:59.000000000 +0000
+++ LVM2.2.02.98/tools/vgchange.c	2013-03-05 10:59:47.894198836 +0000
@@ -125,7 +125,7 @@ static int _activate_lvs_in_vg(struct cm
 		 * If the LV is active exclusive remotely,
 		 * then ignore it here
 		 */
-		if (lv_is_active_exclusive_remotely(lv)) {
+		if (lv_is_active_exclusive_remotely(lv, NULL)) {
 			log_verbose("%s/%s is exclusively active on"
 				    " a remote node", vg->name, lv->name);
 			continue;

--------------090105050009050303060201--
