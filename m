Date: Tue, 12 Mar 2013 11:00:51 -0400
From: Mike Snitzer <msnitzer@fedoraproject.org>
Message-ID: <20130312150051.GA14156@redhat.com>
References: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-2-git-send-email-msnitzer@fedoraproject.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1363037150-8757-2-git-send-email-msnitzer@fedoraproject.org>
Subject: [linux-lvm] [PATCH 4/2 v2] fs snapshot plugin: add LVM tag to allow
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

Add a "yum_fs_snapshot_<trans_id>_<origin_volume>" LVM tag to LVM-based
snapshots (old or thinp).  These tags will allow tools (e.g snapper) to
link the pre and post snapshot volumes together.

yum_fs_snapshot_trans_id() uses the first 8 digits of the hash() of the
tsInfo instance to establish a unique id that is common to both the
pretrans_hook() and posttrans_hook() -- this is done because the
futureRpmDBVersion(), also included in the trans_id, will not be unique
over time if transactions are rolled back (e.g.: yum history undo last)

Factored out add_lvm_tag_to_snapshot() to allow for reuse.

Signed-off-by: Mike Snitzer <msnitzer@fedoraproject.org>
---
 plugins/fs-snapshot/fs-snapshot.py | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

v2: include the futureRpmDBVersion() in the yum_fs_snapshot_trans_id

diff --git a/plugins/fs-snapshot/fs-snapshot.py b/plugins/fs-snapshot/fs-snapshot.py
index 32a1f17..1625564 100644
--- a/plugins/fs-snapshot/fs-snapshot.py
+++ b/plugins/fs-snapshot/fs-snapshot.py
@@ -43,6 +43,15 @@ lvm_key = "create_lvm_snapshot"
 dm_snapshot_merge_checked = 0
 dm_snapshot_merge_support = 0
 
+def yum_fs_snapshot_trans_id(conduit):
+    # return pseudo yum transaction id string
+    # this string is identical for both {pre,post}trans_hook
+    tsInfo = conduit.getTsInfo()
+    # using hash of tsInfo purely to get unique number that isn't tied to rpmDB
+    tsInfo_hash = "%d" % (abs(hash(tsInfo)))
+    frpmdbv = tsInfo.futureRpmDBVersion()
+    return "yum_fs_snapshot_%s_%s" % (tsInfo_hash[:8], frpmdbv)
+
 def _fail(msg):
     raise PluginYumExit(msg)
 
@@ -221,6 +230,14 @@ def _create_btrfs_snapshot(conduit, snapshot_tag, volume):
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
@@ -260,6 +277,7 @@ def _create_lvm_snapshot(conduit, snapshot_tag, volume):
                         "                      being altered /boot may need to be manually restored\n"
                         "                      in the event that a system rollback proves necessary.\n")
 
+    orig_lvname = device.split('/')[3]
     snap_device = device + "_" + snapshot_tag
     snap_lvname = snap_device.split('/')[3]
     conduit.info(1, "fs-snapshot: snapshotting %s (%s): %s" %
@@ -278,12 +296,12 @@ def _create_lvm_snapshot(conduit, snapshot_tag, volume):
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
+        return 1
+    # Add tag to allow other tools (e.g. snapper) to link pre
+    # and post snapshot LVs together
+    yum_trans_id = yum_fs_snapshot_trans_id(conduit)
+    if add_lvm_tag_to_snapshot(conduit, yum_trans_id + "_" + orig_lvname, snap_device):
         return 1
     return 2
 
