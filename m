Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2JDWqVJ029144
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:52 -0400
Received: from c6-x64-devel.vds-ok.com (r02-ge0-SH.prague.vds-ok.com
	[88.86.97.52] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JDWpaq023565
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:51 -0400
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Date: Tue, 19 Mar 2013 13:32:44 +0000
Message-Id: <1363699970-10002-5-git-send-email-bubble@hoster-ok.com>
In-Reply-To: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
Subject: [linux-lvm] [PATCH 04/10] clvmd: fix positive return value is not
	an error in csid->name translation
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

csid_from_name() returns
* zero (cman) - should be fixed?
* positive value - nodeid (openais, corosync)
on success, but clvmd assumes only zero is a valid result.

Signed-off-by: Vladislav Bogdanov <bubble@hoster-ok.com>
---
 daemons/clvmd/clvmd.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/daemons/clvmd/clvmd.c b/daemons/clvmd/clvmd.c
index 07a318e..4f2f458 100644
--- a/daemons/clvmd/clvmd.c
+++ b/daemons/clvmd/clvmd.c
@@ -1284,7 +1284,7 @@ static int read_from_local_sock(struct local_client *thisfd)
 		}
 
 		/* Check the node name for validity */
-		if (inheader->node[0] && clops->csid_from_name(csid, inheader->node)) {
+		if (inheader->node[0] && clops->csid_from_name(csid, inheader->node) <= 0) {
 			/* Error, node is not in the cluster */
 			struct clvm_header reply = {
 				.cmd = CLVMD_CMD_REPLY,
@@ -1427,7 +1427,7 @@ static int distribute_command(struct local_client *thisfd)
                         /* Do it on a single node */
 			char csid[MAX_CSID_LEN];
 
-			if (clops->csid_from_name(csid, inheader->node)) {
+			if (clops->csid_from_name(csid, inheader->node) <= 0) {
 				/* This has already been checked so should not happen */
 				return 0;
 			} else {
-- 
1.7.1
