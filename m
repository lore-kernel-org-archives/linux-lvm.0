Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBRDFnAK030919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 27 Dec 2015 08:15:49 -0500
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mx1.redhat.com (Postfix) with ESMTPS id 5676CC0B932D
	for <linux-lvm@redhat.com>; Sun, 27 Dec 2015 13:15:48 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id b35so3210664qge.0
	for <linux-lvm@redhat.com>; Sun, 27 Dec 2015 05:15:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <567D8CE9.3030101@redhat.com>
References: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
	<567BB51A.4070101@redhat.com>
	<CAAYit8RpRFgYyeHmxyhOco=gxnYgoGPJBa_ssY+xq-D3S70GPw@mail.gmail.com>
	<567D8CE9.3030101@redhat.com>
Date: Sun, 27 Dec 2015 21:09:39 +0800
Message-ID: <CAAYit8SMcJUi7oAqX45FmW77BmmJL1Ls46vouu5zbMctKi1ZRA@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: Re: [linux-lvm] Possible bug in expanding thinpool: lvextend
 doens't expand the top-level dm-linear device
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

Sorry, I sent a wrong mail before. Please ignore it.

2015-12-26 2:37 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
> Dne 25.12.2015 v 03:27 M.H. Tsai napsal(a):
>
> It's not so simple - since the user may activate  thin-pool without
> activation of any thin-volume, and keep thin-pool active while thin-volumes
> are activated and deactivated - so it's different case if user activates
> thin-pool explicitly or thin-pool is activated as thin volume dependency.
>
> Also thin-pool LV has its own cluster lock which is quite complicated to
> explain, but for now -  thin-pool size is unimportant, but it's existence is
> mandatory :)

I have three questions:

1. If we need to preserve the -tpool layer, why the commit 00a45ca4
activates a new thinpool (transaction_id == 0) without overlay?

2. Is it necessary to suspend any thin volume while extending a
thinpool? If not, the commit fa648234 might need some fix.

3. Similary to question(2), is it necessary to suspend thin-pool while
expanding a thin-volume ? If no, we should adopt the approach of
a900d150e for thin-volume expansion. The following is my solution:

diff --git a/lib/activate/dev_manager.c b/lib/activate/dev_manager.c
index 588031d..ab75e9e 100644
--- a/lib/activate/dev_manager.c
+++ b/lib/activate/dev_manager.c
@@ -1980,6 +1980,18 @@ static int _add_lv_to_dtree(struct dev_manager
*dm, struct dm_tree *dtree,
  if ((node = dm_tree_find_node_by_uuid(dtree, uuid)))
  dm_tree_node_skip_childrens(node, 1);
 #endif
+ /* Add target when building SUSPEND tree for origin-only thin-volume */
+ if (!dm->activation && dm->suspend) {
+ struct lv_activate_opts laopts = {
+ .origin_only = 1,
+ };
+ log_debug_activation("Adding target of %s to SUSPEND tree", lv->name);
+ if (!(uuid = build_dm_uuid(dm->mem, lv->lvid.s, NULL)))
+ return_0;
+ if ((node = dm_tree_find_node_by_uuid(dtree, uuid)) &&
+    !_add_target_to_dtree(dm, node, first_seg(lv), &laopts))
+ return_0;
+ }
  }

  if (origin_only && dm->activation && !dm->skip_external_lv &&
diff --git a/lib/metadata/lv_manip.c b/lib/metadata/lv_manip.c
index 76e7895..f55d9a7 100644
--- a/lib/metadata/lv_manip.c
+++ b/lib/metadata/lv_manip.c
@@ -5336,6 +5336,7 @@ int lv_resize(struct cmd_context *cmd, struct
logical_volume *lv,
  struct volume_group *vg = lv->vg;
  struct logical_volume *lock_lv = NULL;
  int inactive = 0;
+ int ret = 0;

  if (lv_is_cache_type(lv)) {
  log_error("Unable to resize logical volumes of cache type.");
@@ -5381,7 +5382,9 @@ int lv_resize(struct cmd_context *cmd, struct
logical_volume *lv,
  }

  /* store vg on disk(s) */
- if (!lv_update_and_reload(lock_lv))
+ if (!(ret = lv_is_thin_volume(lock_lv) ?
+    lv_update_and_reload_origin(lock_lv) :
+    lv_update_and_reload(lock_lv)))
  goto_bad;

  if (lv_is_cow_covering_origin(lv))
diff --git a/libdm/libdm-deptree.c b/libdm/libdm-deptree.c
index 73f2e4c..c7ee955 100644
--- a/libdm/libdm-deptree.c
+++ b/libdm/libdm-deptree.c
@@ -1744,6 +1744,7 @@ int dm_tree_suspend_children(struct dm_tree_node *dnode,
  const struct dm_info *dinfo;
  const char *name;
  const char *uuid;
+ struct load_segment *seg = NULL;

  /* Suspend nodes at this level of the tree */
  while ((child = dm_tree_next_child(&handle, dnode, 0))) {
@@ -1787,6 +1788,13 @@ int dm_tree_suspend_children(struct dm_tree_node *dnode,
  continue;
  }

+ /* Do not suspend the thinpool while reloading the table of a thin volume */
+ seg = dm_list_item(dm_list_last(&child->props.segs), struct load_segment);
+ if (dinfo->inactive_table && r && seg && seg->type == SEG_THIN) {
+ log_debug_activation("Skipping suspend children of %s.", _node_name(child));
+ child->props.skip_suspend++;
+ }
+
  if (!_suspend_node(name, info.major, info.minor,
    child->dtree->skip_lockfs,
    child->dtree->no_flush, &newinfo)) {
