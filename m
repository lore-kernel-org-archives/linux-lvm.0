From: Mike Snitzer <msnitzer@fedoraproject.org>
Date: Mon, 11 Mar 2013 17:25:50 -0400
Message-Id: <1363037150-8757-2-git-send-email-msnitzer@fedoraproject.org>
In-Reply-To: <1363037150-8757-1-git-send-email-msnitzer@fedoraproject.org>
References: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
	<1363037150-8757-1-git-send-email-msnitzer@fedoraproject.org>
Subject: [linux-lvm] [PATCH 4/2] fs snapshot plugin: add LVM tag to allow
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yum-devel@lists.baseurl.org
Cc: okozina@fedoraproject.org, James Antill <james@fedoraproject.org>, linux-lvm@redhat.com

Add a "yum_fs_snapshot_<trans_id>_<origin_volume>" LVM tag to LVM-based
snapshots (old or thinp).  These tags will allow tools (e.g snapper) to
link the pre and post snapshot volumes together.

yum_fs_snapshot_trans_id() uses the first 16 digits of the hash() of the
rpm TransactionSet instance to establish a unique id that is common to
both the pretrans_hook() and posttrans_hook() -- this is quite the hack;
I'm open to using other (more future-proof) methods.

Factored add_lvm_tag_to_snapshot() out to allow for reuse.

Signed-off-by: Mike Snitzer <msnitzer@fedoraproject.org>
---
 plugins/fs-snapshot/fs-snapshot.py | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/plugins/fs-snapshot/fs-snapshot.py b/plugins/fs-snapshot/fs-snapshot.py
index 32a1f17..22582aa 100644
--- a/plugins/fs-snapshot/fs-snapshot.py
+++ b/plugins/fs-snapshot/fs-snapshot.py
@@ -43,6 +43,12 @@ lvm_key = "create_lvm_snapshot"
 dm_snapshot_merge_checked = 0
 dm_snapshot_merge_support = 0
 
+def yum_fs_snapshot_trans_id(ts):
+    # return pseudo yum transaction id string
+    # this string is identical for both {pre,post}trans_hook
+    yum_ts_hash = "%d" % abs(hash(ts.ts))
+    return "yum_fs_snapshot_" + yum_ts_hash[:16]
+
 def _fail(msg):
     raise PluginYumExit(msg)
 
@@ -221,6 +227,14 @@ def _create_btrfs_snapshot(conduit, snapshot_tag, volume):
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
@@ -248,6 +262,8 @@ def _create_lvm_snapshot(conduit, snapshot_tag, volume):
     mntpnt = volume["mntpnt"]
     kern_inst = True # Default to saying it might be.
     ts = conduit._base.rpmdb.readOnlyTS()
+    # save pseudo yum transaction id
+    yum_trans_id = yum_fs_snapshot_trans_id(ts)
     kern_pkgtup = yum.misc.get_running_kernel_pkgtup(ts)
     del ts
     if kern_pkgtup is not None:
@@ -260,6 +276,7 @@ def _create_lvm_snapshot(conduit, snapshot_tag, volume):
                         "                      being altered /boot may need to be manually restored\n"
                         "                      in the event that a system rollback proves necessary.\n")
 
+    orig_lvname = device.split('/')[3]
     snap_device = device + "_" + snapshot_tag
     snap_lvname = snap_device.split('/')[3]
     conduit.info(1, "fs-snapshot: snapshotting %s (%s): %s" %
@@ -278,12 +295,11 @@ def _create_lvm_snapshot(conduit, snapshot_tag, volume):
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
+    if add_lvm_tag_to_snapshot(conduit, yum_trans_id + "_" + orig_lvname, snap_device):
         return 1
     return 2
 
