Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o297rBZ3018415
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2010 02:53:11 -0500
Received: from qw-out-2122.google.com (qw-out-2122.google.com [74.125.92.24])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o297quBq019884
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2010 02:52:56 -0500
Received: by qw-out-2122.google.com with SMTP id 8so1557554qwh.39
	for <linux-lvm@redhat.com>; Mon, 08 Mar 2010 23:52:55 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 9 Mar 2010 15:52:55 +0800
Message-ID: <1cafab771003082352qbce64e2idf24cddbe30c4e55@mail.gmail.com>
From: Xinwei Hu <hxinwei@gmail.com>
Subject: [linux-lvm] vgscan fails when other nodes quit cleanly.
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

   Here's an interesting issue. When we shutdown the cluster stack
cleanly, all lvm commands will
fail to grab the global lock. Like this:
--->8----
sys3:~ # vgscan
  cluster request failed: Host is down
  Unable to obtain global lock.
---8<----
   I went through the code history a bit. It seems to be caused by
e65ffb8e, which is for gulm only I think.
--->8----
commit e65ffb8e687bbce4e7edff70ebff2b3f1c0b6157
Author: Christine Caulfield <ccaulfie@redhat.com>
Date:   Fri Jun 20 10:58:28 2008 +0000

    Make clvmd return immediately if other nodes are down in a gulm cluster.
    bz#447799

diff --git a/WHATS_NEW b/WHATS_NEW
index ec7ff54..023659e 100644
--- a/WHATS_NEW
+++ b/WHATS_NEW
@@ -1,5 +1,6 @@
 Version 2.02.39 -
 ================================
+  Make clvmd return immediately if other nodes are down in a gulm cluster.
   Improve/Fix read ahead 'auto' calculation for stripe_size
   Fix lvchange output for -r auto setting if auto is already set
   Add testcase for read ahead
diff --git a/daemons/clvmd/clvmd-gulm.c b/daemons/clvmd/clvmd-gulm.c
index 3a230b5..a2f2148 100644
--- a/daemons/clvmd/clvmd-gulm.c
+++ b/daemons/clvmd/clvmd-gulm.c
@@ -665,6 +665,7 @@ static int _cluster_do_node_callback(struct
local_client *master_client,
 {
     struct dm_hash_node *hn;
     struct node_info *ninfo;
+    int somedown = 0;

     dm_hash_iterate(hn, node_hash)
     {
@@ -686,12 +687,14 @@ static int _cluster_do_node_callback(struct
local_client *master_client,
            client = dm_hash_lookup_binary(sock_hash, csid, GULM_MAX_CSID_LEN);

        }
+ DEBUGLOG("down_callback2. node %s, state = %d\n", ninfo->name, ninfo->state);
        if (ninfo->state != NODE_DOWN)
                callback(master_client, csid, ninfo->state == NODE_CLVMD);

-
+ if (ninfo->state != NODE_CLVMD)
+         somedown = -1;
     }
-    return 0;
+    return somedown;
 }

 /* Convert gulm error codes to unix errno numbers */
---8<----

  clvmd-corosync.c is copied over from clvmd-openais.c, then from clvmd-gulm.c.
I'd suggest to remove this patch for both clvmd-corosync and clvmd-gulm.

  Any comments ?
  Thanks.
