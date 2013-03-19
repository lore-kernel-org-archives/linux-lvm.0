Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2JDWqV0010312
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:52 -0400
Received: from c6-x64-devel.vds-ok.com (r02-ge0-SH.prague.vds-ok.com
	[88.86.97.52] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JDWpQ8023567
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:51 -0400
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Date: Tue, 19 Mar 2013 13:32:42 +0000
Message-Id: <1363699970-10002-3-git-send-email-bubble@hoster-ok.com>
In-Reply-To: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
Subject: [linux-lvm] [PATCH 02/10] clvmd: Fix buffer size
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
 daemons/clvmd/clvmd.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/daemons/clvmd/clvmd.c b/daemons/clvmd/clvmd.c
index ac465d9..07a318e 100644
--- a/daemons/clvmd/clvmd.c
+++ b/daemons/clvmd/clvmd.c
@@ -1488,7 +1488,7 @@ static void process_remote_command(struct clvm_header *msg, int msglen, int fd,
 	   clvmd-command.c */
 	if (msg->cmd == CLVMD_CMD_VERSION) {
 		int version_nums[3];
-		char node[256];
+		char node[max_cluster_member_name_len];
 
 		memcpy(version_nums, msg->args, sizeof(version_nums));
 
-- 
1.7.1
