Date: Tue, 12 Mar 2013 14:16:42 -0400
From: Mike Snitzer <msnitzer@fedoraproject.org>
Message-ID: <20130312181641.GB14883@redhat.com>
References: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-2-git-send-email-msnitzer@fedoraproject.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1363037150-8757-2-git-send-email-msnitzer@fedoraproject.org>
Subject: [linux-lvm] [PATCH 4/2 v3] fs snapshot plugin: add LVM tag to allow
 tools to link pre and post snapshots
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
To: James Antill <james@fedoraproject.org>
Cc: okozina@fedoraproject.org, yum-devel@lists.baseurl.org, linux-lvm@redhat.com

Add a "yum_fs_snapshot_pre_lv_name=<pre_snapshot_lv>" LVM tag to the
post transaction LVM-based snapshot (old or thinp).  This tag will
allow tools (e.g snapper) to link the pre and post snapshot volumes
together.

Factored out add_lvm_tag_to_snapshot() to allow for reuse.

Signed-off-by: Mike Snitzer <msnitzer@fedoraproject.org>
---
 plugins/fs-snapshot/fs-snapshot.py | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/plugins/fs-snapshot/fs-snapshot.py b/plugins/fs-snapshot/fs-snapshot.py
index 32a1f17..38496c5 100644
--- a/plugins/fs-snapshot/fs-snapshot.py
+++ b/plugins/fs-snapshot/fs-snapshot.py
@@ -221,6 +221,14 @@ def _create_btrfs_snapshot(conduit, snapshot_tag, volume):
         return 1
     return 2
 
+def add_lvm_tag_to_snapshot(conduit, tag, snap_volume):
+    p = Popen(["/sbin/lvchange", "--addtag", tag, snap_volume],
+              stdout=PIPE, stderr=PIPE)
+    err = p.wait()
+    if err:
+        conduit.error(1, "fs-snapshot: couldn't add tag to snapshot: %s" %
+                      snap_volume)
+
 def _create_lvm_snapshot(conduit, snapshot_tag, volume):
     """
     Create LVM snapshot LV and tag it with $snapshot_tag.
@@ -278,13 +287,15 @@ def _create_lvm_snapshot(conduit, snapshot_tag, volume):
     # Add tag ($snapshot_tag) to snapshot LV
     # - should help facilitate merge of all snapshot LVs created
     #   by a yum transaction, e.g.: lvconvert --merge @snapshot_tag
-    p = Popen(["/sbin/lvchange", "--addtag", snapshot_tag, snap_device],
-              stdout=PIPE, stderr=PIPE)
-    err = p.wait()
-    if err:
-        conduit.error(1, "fs-snapshot: couldn't add tag to snapshot: %s" %
-                      snap_device)
+    if add_lvm_tag_to_snapshot(conduit, snapshot_tag, snap_device):
         return 1
+    if conduit._base.__plugin_fs_snapshot_post_snapshot_tag == snapshot_tag:
+        # Add tag to allow other tools (e.g. snapper) to link pre
+        # and post snapshot LVs together
+        pre_snap_lv_name = "%s_%s" % (device, conduit._base.__plugin_fs_snapshot_pre_snapshot_tag)
+        pre_snapshot_tag = "yum_fs_snapshot_pre_lv_name=" + pre_snap_lv_name
+        if add_lvm_tag_to_snapshot(conduit, pre_snapshot_tag, snap_device):
+            return 1
     return 2
 
 def create_snapshots(conduit):
@@ -295,6 +306,10 @@ def create_snapshots(conduit):
     """
     # common snapshot tag format: yum_${year}${month}${day}${hour}${minute}${sec}
     snapshot_tag = "yum_" + time.strftime("%Y%m%d%H%M%S")
+    if not conduit._base.__plugin_fs_snapshot_pre_snapshot_tag:
+        conduit._base.__plugin_fs_snapshot_pre_snapshot_tag = snapshot_tag
+    else:
+        conduit._base.__plugin_fs_snapshot_post_snapshot_tag = snapshot_tag
 
     volumes = get_volumes(conduit)
     for volume in volumes:
@@ -306,6 +321,8 @@ def create_snapshots(conduit):
             conduit.registerPackageName("yum-plugin-fs-snapshot")
 
 def pretrans_hook(conduit):
+    conduit._base.__plugin_fs_snapshot_pre_snapshot_tag = None
+    conduit._base.__plugin_fs_snapshot_post_snapshot_tag = None
     create_snapshots(conduit)
 
 def posttrans_hook(conduit):
