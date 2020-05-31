Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EE02103F273
	for <linux-lvm@redhat.com>; Sun, 31 May 2020 08:47:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F92D811E77
	for <linux-lvm@redhat.com>; Sun, 31 May 2020 08:47:49 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Sun, 31 May 2020 08:46:57 +0000
From: Zhao Heming <heming.zhao@suse.com>
Date: Sun, 31 May 2020 16:46:34 +0800
Message-ID: <1590914794-25072-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH] Change dev->bcache_fd default value from 0 to -1
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: Zhao Heming <heming.zhao@suse.com>

This fix can avoid bcache_fd will mistakenly open/close in later.

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
 lib/device/dev-cache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/device/dev-cache.c b/lib/device/dev-cache.c
index 6af559c..c3f7c49 100644
--- a/lib/device/dev-cache.c
+++ b/lib/device/dev-cache.c
@@ -65,6 +65,7 @@ static int _insert(const char *path, const struct stat *info,
 static void _dev_init(struct device *dev)
 {
 	dev->fd = -1;
+	dev->bcache_fd = -1;
 	dev->read_ahead = -1;
 
 	dev->ext.enabled = 0;
-- 
1.8.3.1
