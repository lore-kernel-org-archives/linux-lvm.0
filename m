Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2JDWsZ9007868
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:54 -0400
Received: from c6-x64-devel.vds-ok.com (r02-ge0-SH.prague.vds-ok.com
	[88.86.97.52] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JDWrcG017061
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:53 -0400
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Date: Tue, 19 Mar 2013 13:32:46 +0000
Message-Id: <1363699970-10002-7-git-send-email-bubble@hoster-ok.com>
In-Reply-To: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
Subject: [linux-lvm] [PATCH 06/10] clvmd: additional debugging - print
	message bodies
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
 daemons/clvmd/clvmd.c |   52 ++++++++++++++++++++++++++++++++++++++++++++----
 1 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/daemons/clvmd/clvmd.c b/daemons/clvmd/clvmd.c
index fa09464..c4d6e03 100644
--- a/daemons/clvmd/clvmd.c
+++ b/daemons/clvmd/clvmd.c
@@ -1403,6 +1403,8 @@ static int distribute_command(struct local_client *thisfd)
 
 	/* Forward it to other nodes in the cluster if needed */
 	if (!(inheader->flags & CLVMD_FLAG_LOCAL)) {
+		char *args_printable = strdup_printable(inheader->args + strlen(inheader->node), inheader->arglen);
+
 		/* if node is empty then do it on the whole cluster */
 		if (inheader->node[0] == '\0') {
 			thisfd->bits.localsock.expected_replies =
@@ -1423,6 +1425,10 @@ static int distribute_command(struct local_client *thisfd)
 
 			DEBUGLOG("Sending message to all cluster nodes\n");
 			inheader->xid = thisfd->xid;
+			DEBUGLOG("Sending message of size %u: xid=%u, cmd=%s, status=%u, flags=%u, clientid=%u, arglen=%u, node='%s', args='%s'\n",
+				     len,
+				     inheader->xid, decode_cmd(inheader->cmd), inheader->status, inheader->flags, inheader->clientid, inheader->arglen,
+				     inheader->node, inheader->arglen > 0 ? args_printable : "");
 			send_message(inheader, len, NULL, -1,
 				     "Error forwarding message to cluster");
 		} else {
@@ -1440,25 +1446,35 @@ static int distribute_command(struct local_client *thisfd)
 
 				/* Are we the requested node ?? */
 				if (memcmp(csid, our_csid, max_csid_len) == 0) {
-					DEBUGLOG("Doing command on local node only\n");
+					DEBUGLOG("Doing command on local node only (by destination)\n");
 					inheader->flags &= ~CLVMD_FLAG_REMOTE;
 					inheader->flags |= CLVMD_FLAG_LOCAL;
 					add_to_lvmqueue(thisfd, inheader, len, NULL);
 				} else {
-					DEBUGLOG("Sending message to single node: %s\n",
-						 inheader->node);
+					unsigned int a, b;
+					memcpy(&a, csid, max_csid_len);
+					memcpy(&b, our_csid, max_csid_len);
+					
+					DEBUGLOG("Sending message to single node: %s, csid=0x%x, our_csid=0x%x\n",
+						 inheader->node, a, b);
 					inheader->xid = thisfd->xid;
+					DEBUGLOG("Sending mesaage of size %u: xid=%u, cmd=%s, status=%u, flags=%u, clientid=%u, arglen=%u, node='%s', args='%s'\n",
+						     len,
+						     inheader->xid, decode_cmd(inheader->cmd), inheader->status, inheader->flags, inheader->clientid, inheader->arglen,
+						     inheader->node, inheader->arglen > 0 ? args_printable : "");
 					send_message(inheader, len,
 						     csid, -1,
 						     "Error forwarding message to cluster node");
 				}
 			}
 		}
+		free(args_printable);
 	} else {
 		/* Local explicitly requested, ignore nodes */
 		thisfd->bits.localsock.in_progress = TRUE;
 		thisfd->bits.localsock.expected_replies = 1;
 		thisfd->bits.localsock.num_replies = 0;
+		DEBUGLOG("Doing command on local node only (by flag)\n");
 		add_to_lvmqueue(thisfd, inheader, len, NULL);
 	}
 	return 0;
@@ -1532,8 +1548,16 @@ static void process_remote_command(struct clvm_header *msg, int msglen, int fd,
 	if (replyargs != NULL) {
 		/* Run the command */
 		/* FIXME: usage of init_test() is unprotected */
+		char *args_printable = strdup_printable(msg->args, msg->arglen);
+
+		DEBUGLOG("Processing request of size %u: xid=%u, cmd=%s, status=%u, flags=%u, clientid=%u, arglen=%u, node='%s', args='%s'\n",
+			     msglen,
+			     msg->xid, decode_cmd(msg->cmd), msg->status, msg->flags, msg->clientid, msg->arglen,
+			     msg->node, msg->arglen > 0 ? args_printable : "");
+
 		status = do_command(NULL, msg, msglen, &replyargs,
 				    buflen, &replylen);
+		free(args_printable);
 	} else {
 		status = ENOMEM;
 	}
@@ -1547,6 +1571,7 @@ static void process_remote_command(struct clvm_header *msg, int msglen, int fd,
 		if (aggreply) {
 			struct clvm_header *agghead =
 			    (struct clvm_header *) aggreply;
+			char *args_printable = strdup_printable(replyargs, replylen);
 
 			replyargs = aggreply;
 			/* Move it up so there's room for a header in front of the data */
@@ -1560,6 +1585,11 @@ static void process_remote_command(struct clvm_header *msg, int msglen, int fd,
 			agghead->clientid = msg->clientid;
 			agghead->arglen = replylen;
 			agghead->node[0] = '\0';
+			DEBUGLOG("Sending reply of size %u: xid=%u, cmd=%s, status=%u, flags=%u, clientid=%u, arglen=%u, node='%s', args='%s'\n",
+				     (unsigned int) sizeof(struct clvm_header) + replylen,
+				     agghead->xid, decode_cmd(agghead->cmd), agghead->status, agghead->flags, agghead->clientid, agghead->arglen,
+				     agghead->node, agghead->arglen > 0 ? args_printable : "");
+			free(args_printable);
 			send_message(aggreply,
 				     sizeof(struct clvm_header) +
 				     replylen, csid, fd,
@@ -1748,16 +1778,28 @@ static int process_local_command(struct clvm_header *msg, int msglen,
 
 	/* If local flag is not set, just set a successful status code. */
 	if (! (msg->flags & CLVMD_FLAG_LOCAL)) {
+		DEBUGLOG("Setting success for remote msg in process_local_command\n");
 		status = 0;
-	else
+	}
+	else {
+		char *args_printable = strdup_printable(msg->args, msg->arglen);
+		DEBUGLOG("Processing request of size %u: xid=%u, cmd=%s, status=%u, flags=%u, clientid=%u, arglen=%u, node='%s', args='%s'\n",
+			     msglen,
+			     msg->xid, decode_cmd(msg->cmd), msg->status, msg->flags, msg->clientid, msg->arglen,
+			     msg->node, msg->arglen > 0 ? args_printable : "");
+
 		/* FIXME: usage of init_test() is unprotected */
 		status = do_command(client, msg, msglen, &replybuf, buflen, &replylen);
-
+		free(args_printable);
+	}
 	if (status)
 		client->bits.localsock.all_success = 0;
 
 	/* If we took too long then discard the reply */
 	if (xid == client->xid) {
+		char *args_printable = strdup_printable(replybuf, replylen);
+		DEBUGLOG("Adding local reply of size %u: '%s'\n", replylen, replylen > 0 ? args_printable : "");
+		free(args_printable);
 		add_reply_to_list(client, status, our_csid, replybuf, replylen);
 	} else {
 		DEBUGLOG
-- 
1.7.1
