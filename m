Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40E6E2166B2B
	for <linux-lvm@redhat.com>; Mon,  9 Dec 2019 09:20:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED1078F1532
	for <linux-lvm@redhat.com>; Mon,  9 Dec 2019 09:20:51 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Mon,  9 Dec 2019 09:20:11 +0000
From: Heming Zhao <heming.zhao@suse.com>
Date: Mon, 9 Dec 2019 09:20:22 +0000
Message-ID: <9fdc2f47-a4db-f472-e1eb-424f6a6b28d9@suse.com>
Content-Language: en-US
Content-ID: <2B8796CA85800F408FC385B475079E0B@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] It looks wrong for the timeout when lvm test running
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello List,

The lvm test default timeout (--timeout) default value is 180.
But I met below condition when running testcase (in virtual machine):
```
make check_local T=shell/snapshot-merge.sh
    ... ...
###       passed: [ndev-vanilla] shell/snapshot-merge.sh 665
    ... ...
```

Obviously, the timeout doesn't work normally.
If I change below code, the timeout work as expected. (in lib/brick-shelltest.h)
```
         if ( select( nfds, &set, NULL, NULL, &wait ) > 0 ) {
             silent_start = end; /* something happened */
             io.sync( false );
         }
```

And after change the code, some testcase will become timeout, which may pass before.


The whole patch as below:
```
 From bdbd569c2b9ab49d4a4246f203b1cd9f7049db97 Mon Sep 17 00:00:00 2001
From: Zhao Heming <heming.zhao@suse.com>
Date: Mon, 9 Dec 2019 17:09:17 +0800
Subject: [PATCH] test: fix timeout abnormal issue

---
  test/lib/brick-shelltest.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/lib/brick-shelltest.h b/test/lib/brick-shelltest.h
index b58f3d6843..12e08249f3 100644
--- a/test/lib/brick-shelltest.h
+++ b/test/lib/brick-shelltest.h
@@ -822,7 +822,7 @@ struct TestCase {
              }
          }
          if ( select( nfds, &set, NULL, NULL, &wait ) > 0 ) {
-            silent_start = end; /* something happened */
+            //silent_start = end; /* something happened */
              io.sync( false );
          }
  
-- 
2.24.0
```

Thanks.
