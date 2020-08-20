Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F10810087D1
	for <linux-lvm@redhat.com>; Thu, 20 Aug 2020 16:05:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0172102F1E2
	for <linux-lvm@redhat.com>; Thu, 20 Aug 2020 16:05:30 +0000 (UTC)
From: Zhao Heming <heming.zhao@suse.com>
Date: Fri, 21 Aug 2020 00:05:04 +0800
Message-Id: <1597939504-31532-1-git-send-email-heming.zhao@suse.com>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH] gcc: change zero-sized array to fexlible array
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
Cc: mcsontos@redhat.com, Zhao Heming <heming.zhao@suse.com>

this patch makes gcc happy with compiling option: [-Wstringop-overflow=]

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
 device_mapper/libdm-common.c | 2 +-
 lib/activate/fs.c            | 2 +-
 libdm/libdm-common.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/device_mapper/libdm-common.c b/device_mapper/libdm-common.c
index bc691d6..3627457 100644
--- a/device_mapper/libdm-common.c
+++ b/device_mapper/libdm-common.c
@@ -1445,7 +1445,7 @@ struct node_op_parms {
 	char *old_name;
 	int warn_if_udev_failed;
 	unsigned rely_on_udev;
-	char names[0];
+	char names[];
 };
 
 static void _store_str(char **pos, char **ptr, const char *str)
diff --git a/lib/activate/fs.c b/lib/activate/fs.c
index b2c99fc..96f7df6 100644
--- a/lib/activate/fs.c
+++ b/lib/activate/fs.c
@@ -313,7 +313,7 @@ struct fs_op_parms {
 	char *lv_name;
 	char *dev;
 	char *old_lv_name;
-	char names[0];
+	char names[];
 };
 
 static void _store_str(char **pos, char **ptr, const char *str)
diff --git a/libdm/libdm-common.c b/libdm/libdm-common.c
index d75c704..d587c32 100644
--- a/libdm/libdm-common.c
+++ b/libdm/libdm-common.c
@@ -1443,7 +1443,7 @@ struct node_op_parms {
 	char *old_name;
 	int warn_if_udev_failed;
 	unsigned rely_on_udev;
-	char names[0];
+	char names[];
 };
 
 static void _store_str(char **pos, char **ptr, const char *str)
-- 
1.8.3.1
