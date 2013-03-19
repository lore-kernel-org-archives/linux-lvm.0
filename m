Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2JDWsS5010324
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:54 -0400
Received: from c6-x64-devel.vds-ok.com (r02-ge0-SH.prague.vds-ok.com
	[88.86.97.52] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JDWrNu026640
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:53 -0400
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Date: Tue, 19 Mar 2013 13:32:45 +0000
Message-Id: <1363699970-10002-6-git-send-email-bubble@hoster-ok.com>
In-Reply-To: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
Subject: [linux-lvm] [PATCH 05/10] clvmd: use correct flags for local
	command execution
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
 daemons/clvmd/clvmd.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/daemons/clvmd/clvmd.c b/daemons/clvmd/clvmd.c
index 4f2f458..fa09464 100644
--- a/daemons/clvmd/clvmd.c
+++ b/daemons/clvmd/clvmd.c
@@ -1417,7 +1417,9 @@ static int distribute_command(struct local_client *thisfd)
 			 * is set so we still get a reply if this is the
 			 * only node.
 			 */
+			inheader->flags |= CLVMD_FLAG_LOCAL;
 			add_to_lvmqueue(thisfd, inheader, len, NULL);
+			inheader->flags &= ~CLVMD_FLAG_LOCAL;
 
 			DEBUGLOG("Sending message to all cluster nodes\n");
 			inheader->xid = thisfd->xid;
@@ -1439,6 +1441,8 @@ static int distribute_command(struct local_client *thisfd)
 				/* Are we the requested node ?? */
 				if (memcmp(csid, our_csid, max_csid_len) == 0) {
 					DEBUGLOG("Doing command on local node only\n");
+					inheader->flags &= ~CLVMD_FLAG_REMOTE;
+					inheader->flags |= CLVMD_FLAG_LOCAL;
 					add_to_lvmqueue(thisfd, inheader, len, NULL);
 				} else {
 					DEBUGLOG("Sending message to single node: %s\n",
@@ -1742,8 +1746,8 @@ static int process_local_command(struct clvm_header *msg, int msglen,
 	if (replybuf == NULL)
 		return -1;
 
-	/* If remote flag is set, just set a successful status code. */
-	if (msg->flags & CLVMD_FLAG_REMOTE)
+	/* If local flag is not set, just set a successful status code. */
+	if (! (msg->flags & CLVMD_FLAG_LOCAL)) {
 		status = 0;
 	else
 		/* FIXME: usage of init_test() is unprotected */
-- 
1.7.1
