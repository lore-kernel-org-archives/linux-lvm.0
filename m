Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0765C2166B27
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2020 15:38:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 333A8101AA40
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2020 15:38:26 +0000 (UTC)
From: Zhao Heming <heming.zhao@suse.com>
Date: Thu, 10 Sep 2020 23:38:07 +0800
Message-Id: <1599752287-29833-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH 2/2] [.gitignore]: ignore all cscope generated
	files
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
Cc: zkabelac@redhat.com, teigland@redhat.com, Zhao Heming <heming.zhao@suse.com>

When using cscope to read code, it will generate below 3 files for speedup
cross-refer: cscope.files, cscope.in.out, cscope.po.out

The .gitignore only contains "/cscope.out". It a little bit messy when
executing 'git status', and other git commands.
This patch add all cscope generated files in .gitignore.

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
 .gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 7ebb8bb..cfd5bee 100644
--- a/.gitignore
+++ b/.gitignore
@@ -30,7 +30,7 @@ make.tmpl
 /config.log
 /config.status
 /configure.scan
-/cscope.out
+/cscope.*
 /html/
 /reports/
 /tags
-- 
1.8.3.1
