From: Mike Snitzer <msnitzer@fedoraproject.org>
Date: Sun, 10 Mar 2013 12:18:10 -0400
Message-Id: <1362932290-28679-3-git-send-email-msnitzer@fedoraproject.org>
In-Reply-To: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
References: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
Subject: [linux-lvm] [PATCH 2/2] fs snapshot plugin: add support for
	snapshotting thinly provisioned LVM volumes
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

Thinly provisioned LVM volumes offer more scalable snapshots than the
original LVM snapshots.  Thinly provisioned snapshots use a single
shared pool of storage (aka thin-pool) so there is no need to require
the user to have configured "lvcreate_size_args" in the
yum-fs-snapshot.conf for them.

When inspecting an LVM volume we now record the LVM "segtype" in the
volume dict.  is_thin_volume() was introduced to simplify checking
whether an LVM volume is thinly provisioned or not.

Signed-off-by: Mike Snitzer <msnitzer@fedoraproject.org>
---
 docs/yum-fs-snapshot.conf.5        |  3 ++-
 plugins/fs-snapshot/fs-snapshot.py | 32 ++++++++++++++++++++------------
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/docs/yum-fs-snapshot.conf.5 b/docs/yum-fs-snapshot.conf.5
index a4b4f02..dc5c0c1 100644
--- a/docs/yum-fs-snapshot.conf.5
+++ b/docs/yum-fs-snapshot.conf.5
@@ -28,7 +28,8 @@ created for filesystems built on LVM logical volumes.
 .IP lvcreate_size_args
 This is the space delimited lvcreate argument list that is used to
 specify the size of the snapshot LV.  Valid lvcreate size options are -l
-or -L.  If not specified then LVM snapshots will not be created.
+or -L.  If not specified then LVM snapshots will not be created for
+volumes that are not thinly provisioned.
 .SH AUTHOR
 .RS
 Josef Bacik <josef@toxicpanda.com>
diff --git a/plugins/fs-snapshot/fs-snapshot.py b/plugins/fs-snapshot/fs-snapshot.py
index 2a7c65d..7483c2d 100644
--- a/plugins/fs-snapshot/fs-snapshot.py
+++ b/plugins/fs-snapshot/fs-snapshot.py
@@ -62,6 +62,9 @@ def kernel_supports_dm_snapshot_merge():
         dm_snapshot_merge_checked = 1
     return dm_snapshot_merge_support
 
+def is_thin_volume(volume):
+    return volume["segtype"] == "thin"
+
 def inspect_volume_lvm(conduit, volume):
     """
     If volume is an LVM logical volume:
@@ -92,12 +95,14 @@ def inspect_volume_lvm(conduit, volume):
     # Check if device is managed by lvm
     # - FIXME filter out snapshot (and other) LVs; for now just rely
     #   on 'lvcreate' to prevent snapshots of unsupported LV types
-    p = Popen(["/sbin/lvs", device], stdout=PIPE, stderr=PIPE)
+    p = Popen(["/sbin/lvs", "--noheadings", "-o", "segtype", device], stdout=PIPE, stderr=PIPE)
     err = p.wait()
     if not err:
+        volume["segtype"] = p.communicate()[0].strip()
+
         # FIXME allow creating snapshot LVs even if kernel doesn't
         # support snapshot-merge based system rollback? make configurable?
-        if not kernel_supports_dm_snapshot_merge():
+        if not is_thin_volume(volume) and not kernel_supports_dm_snapshot_merge():
             conduit.error(1, "fs-snapshot: skipping volume: %s, "
                           "kernel doesn't support snapshot-merge" % device)
             return 0
@@ -223,16 +228,18 @@ def _create_lvm_snapshot(conduit, snapshot_tag, volume):
       has enough free space to accommodate a snapshot LV.
     - Also assumes user has configured 'lvcreate_size_args'.
     """
-    lvcreate_size_args = conduit.confString('lvm', 'lvcreate_size_args',
-                                            default=None)
-    if not lvcreate_size_args:
-        conduit.error(1, "fs-snapshot: 'lvcreate_size_args' was not provided "
-                      "in the '[lvm]' section of the config file")
-        return 1
+    if not is_thin_volume(volume):
+        lvcreate_size_args = conduit.confString('lvm', 'lvcreate_size_args',
+                                                default=None)
 
-    if not lvcreate_size_args.startswith("-L") and not lvcreate_size_args.startswith("-l"):
-        conduit.error(1, "fs-snapshot: 'lvcreate_size_args' did not use -L or -l")
-        return 1
+        if not lvcreate_size_args:
+            conduit.error(1, "fs-snapshot: 'lvcreate_size_args' was not provided "
+                          "in the '[lvm]' section of the config file")
+            return 1
+
+        if not lvcreate_size_args.startswith("-L") and not lvcreate_size_args.startswith("-l"):
+            conduit.error(1, "fs-snapshot: 'lvcreate_size_args' did not use -L or -l")
+            return 1
 
     device = volume["device"]
     if device.count('/') != 3:
@@ -259,7 +266,8 @@ def _create_lvm_snapshot(conduit, snapshot_tag, volume):
                  (mntpnt, device, snap_lvname))
     # Create snapshot LV
     lvcreate_cmd = ["/sbin/lvcreate", "-s", "-n", snap_lvname]
-    lvcreate_cmd.extend(lvcreate_size_args.split())
+    if not is_thin_volume(volume):
+        lvcreate_cmd.extend(lvcreate_size_args.split())
     lvcreate_cmd.append(device)
     p = Popen(lvcreate_cmd, stdout=PIPE, stderr=PIPE)
     err = p.wait()
-- 
1.8.1
