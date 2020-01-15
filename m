Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B475A2026D67
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2020 02:44:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4EA7802A4B
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2020 02:44:38 +0000 (UTC)
From: Heming Zhao <heming.zhao@suse.com>
Date: Wed, 15 Jan 2020 02:44:30 +0000
Message-ID: <20200115024413.13144-1-heming.zhao@suse.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [PATCH] [vgreduce] add suggestion message for mirror LVs
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
Content-Type: text/plain; charset="us-ascii"
To: "zkabelac@redhat.com" <zkabelac@redhat.com>, "teigland@redhat.com" <teigland@redhat.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Cc: Heming Zhao <heming.zhao@suse.com>

Currently the error messages are not clear. This very easy to
guide user to execute "--removemissing --force", it is dangerous
and will make the LVs to be destroied.

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
 tools/vgreduce.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/vgreduce.c b/tools/vgreduce.c
index b001ccbbd7..4a4202e868 100644
--- a/tools/vgreduce.c
+++ b/tools/vgreduce.c
@@ -67,6 +67,8 @@ static int _consolidate_vg(struct cmd_context *cmd, struct volume_group *vg)
 		cmd->handles_missing_pvs = 1;
 		log_error("There are still partial LVs in VG %s.", vg->name);
 		log_error("To remove them unconditionally use: vgreduce --removemissing --force.");
+		log_error("To remove them unconditionally from mirror LVs use: vgreduce"
+				  " --removemissing --mirrorsonly --force.");
 		log_warn("WARNING: Proceeding to remove empty missing PVs.");
 	}
 
-- 
2.24.0
