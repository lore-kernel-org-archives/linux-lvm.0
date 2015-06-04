Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t54A2eYs022601
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 4 Jun 2015 06:02:41 -0400
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mx1.redhat.com (Postfix) with ESMTPS id 2408A347A53
	for <linux-lvm@redhat.com>; Thu,  4 Jun 2015 10:02:40 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so35663984igb.0
	for <linux-lvm@redhat.com>; Thu, 04 Jun 2015 03:02:39 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 4 Jun 2015 18:02:39 +0800
Message-ID: <CAAYit8QCcaGvb5QPw_Xuk+oavthHR1c32oB0GsGd+Ypk0rPtRg@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: [linux-lvm] libdm cannot swap names between two child volumes
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

Hi All,

I found that there's a potential bug in libdm when I try to swap sub
volume's name. By executing the following code, the function
dm_tree_activate_children() will go into infinite loop since that
_rename_conflict_exists() still reports "resolvable=1" in this case.

logical_volume *parent = ...;
logical_volume *child1 = seg_lv(parent, 0);
logical_volume *child2 = seg_lv(parent, 1);
char const *tmp = child1->name;
child1->name = child2->name;
child2->name = tmp;
resume_lv(cmd, parent);

Although this scenario might not happen through command-line
operation, some programmers might need this feature. I think that this
issue could be resolve in libdm by assigning a temporary name, as the
following patch does. Is it safe to do this?

diff --git libdm/libdm-deptree.c libdm/libdm-deptree.c
index 1335351..b0c5f13 100644
--- a/libdm/libdm-deptree.c
+++ b/libdm/libdm-deptree.c
@@ -1771,7 +1771,8 @@ static int _rename_conflict_exists(struct
dm_tree_node *parent,
                }

                if (!strcmp(node->props.new_name, sibling_name)) {
-                       if (sibling->props.new_name)
+                       if (sibling->props.new_name &&
+                           strcmp(sibling->props.new_name,
dm_tree_node_get_name(node)))
                                *resolvable = 1;
                        return 1;
                }
@@ -1790,8 +1791,10 @@ int dm_tree_activate_children(struct dm_tree_node *dnode,
        struct dm_tree_node *child = dnode;
        struct dm_info newinfo;
        const char *name;
+       const char *new_name = NULL;
        const char *uuid;
        int priority;
+       int rename_conflict = 0;

        /* Activate children first */
        while ((child = dm_tree_next_child(&handle, dnode, 0))) {
@@ -1831,12 +1834,21 @@ int dm_tree_activate_children(struct
dm_tree_node *dnode,

                        /* Rename? */
                        if (child->props.new_name) {
-                               if (_rename_conflict_exists(dnode,
child, &resolvable_name_conflict) &&
-                                   resolvable_name_conflict) {
-                                       awaiting_peer_rename++;
-                                       continue;
+                               rename_conflict =
_rename_conflict_exists(dnode, child, &resolvable_name_conflict);
+                               if (rename_conflict) {
+                                       if (resolvable_name_conflict) {
+                                               awaiting_peer_rename++;
+                                               continue;
+                                       } else {
+                                               /* assign a temporary
name for swapping names */
+                                               new_name =
dm_pool_zalloc(dnode->dtree->mem, strlen(child->props.new_name) + 5);
+
dm_snprintf((char*)new_name, strlen(child->props.new_name) + 5,
"%s_tmp", child->props.new_name);
+                                               awaiting_peer_rename++;
+                                       }
+                               } else {
+                                       new_name = child->props.new_name;
                                }
-                               if (!_rename_node(name,
child->props.new_name, child->info.major,
+                               if (!_rename_node(name, new_name,
child->info.major,
                                                  child->info.minor,
&child->dtree->cookie,
                                                  child->udev_flags)) {
                                        log_error("Failed to rename %s
(%" PRIu32
@@ -1844,8 +1856,10 @@ int dm_tree_activate_children(struct dm_tree_node *dnode,
                                                  child->info.minor,
child->props.new_name);
                                        return 0;
                                }
-                               child->name = child->props.new_name;
-                               child->props.new_name = NULL;
+                               child->name = new_name;
+
+                               if (!rename_conflict)
+                                       child->props.new_name = NULL;
                        }

                        if (!child->info.inactive_table &&
!child->info.suspended)


Thanks,
Ming-Hung Tsai
