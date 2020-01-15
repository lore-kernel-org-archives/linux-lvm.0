Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EA8110A9F9D
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2020 02:21:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B6B3801E81
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2020 02:21:07 +0000 (UTC)
From: Heming Zhao <heming.zhao@suse.com>
Date: Wed, 15 Jan 2020 02:17:47 +0000
Message-ID: <20200115021744.11868-1-heming.zhao@suse.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [PATCH] [test] fix corosync.conf: no interface error
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

systemctl status corosync (version: 2.4.5) report error:
  parse error in config: No interfaces defined

Signed-off-by: Zhao Heming <heming.zhao@suse.com>
---
 test/lib/test-corosync-conf | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/test/lib/test-corosync-conf b/test/lib/test-corosync-conf
index ccc958f1d1..e04be73998 100644
--- a/test/lib/test-corosync-conf
+++ b/test/lib/test-corosync-conf
@@ -3,6 +3,13 @@ totem {
         version: 2
         secauth: off
         cluster_name: test
+        interface {
+            ingnumber: 0
+            bindnetaddr: 127.0.0.1
+            mcastaddr: 239.255.255.100
+            mcastport: 5405
+            ttl: 1
+        }
 }
 nodelist {
         node {
@@ -12,6 +19,8 @@ nodelist {
 }
 quorum {
         provider: corosync_votequorum
+        expected_votes: 1
+        two_node: 0
 }
 logging {
         to_syslog: yes
-- 
2.24.0
