From: Mike Snitzer <msnitzer@fedoraproject.org>
Date: Mon, 11 Mar 2013 17:25:49 -0400
Message-Id: <1363037150-8757-1-git-send-email-msnitzer@fedoraproject.org>
In-Reply-To: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
References: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
Subject: [linux-lvm] [PATCH 3/2] fs snapshot plugin: add ability to create
	snapshots during post transaction
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

It can be useful to create a post transaction snapshot to allow tools
(e.g. snapper) to analyze the differences introduced by the yum
transaction.

Add 'create_snapshots_in_post' to main section of fs-snapshot.conf.

Signed-off-by: Mike Snitzer <msnitzer@fedoraproject.org>
---
 docs/yum-fs-snapshot.conf.5          |  4 ++++
 plugins/fs-snapshot/fs-snapshot.conf |  1 +
 plugins/fs-snapshot/fs-snapshot.py   | 10 +++++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/docs/yum-fs-snapshot.conf.5 b/docs/yum-fs-snapshot.conf.5
index dc5c0c1..4ac623a 100644
--- a/docs/yum-fs-snapshot.conf.5
+++ b/docs/yum-fs-snapshot.conf.5
@@ -20,6 +20,10 @@ utilizes configuration options in the form of
 .IP exclude
 This is a space delimited list of the mount points you do not wish to have
 snapshotted by this plugin.
+.SH OPTION
+.IP create_snapshots_in_post
+This is a boolean value used to control whether snapshots are also created
+after running the yum transaction.
 .SH OPTION - [lvm] section
 .IP enabled
 This is a boolean value used to control whether LVM snapshots will be
diff --git a/plugins/fs-snapshot/fs-snapshot.conf b/plugins/fs-snapshot/fs-snapshot.conf
index 3a67c69..9ada717 100644
--- a/plugins/fs-snapshot/fs-snapshot.conf
+++ b/plugins/fs-snapshot/fs-snapshot.conf
@@ -1,5 +1,6 @@
 [main]
 enabled = 1
+create_snapshots_in_post = 0
 
 [lvm]
 enabled = 0
diff --git a/plugins/fs-snapshot/fs-snapshot.py b/plugins/fs-snapshot/fs-snapshot.py
index 7483c2d..32a1f17 100644
--- a/plugins/fs-snapshot/fs-snapshot.py
+++ b/plugins/fs-snapshot/fs-snapshot.py
@@ -287,7 +287,7 @@ def _create_lvm_snapshot(conduit, snapshot_tag, volume):
         return 1
     return 2
 
-def pretrans_hook(conduit):
+def create_snapshots(conduit):
     """
     This runs before the transaction starts.  Try to snapshot anything and
     everything that is snapshottable, since we do not know what an RPM will
@@ -304,3 +304,11 @@ def pretrans_hook(conduit):
         elif rc == 2 and hasattr(conduit, 'registerPackageName'):
             # A snapshot was successfully created
             conduit.registerPackageName("yum-plugin-fs-snapshot")
+
+def pretrans_hook(conduit):
+    create_snapshots(conduit)
+
+def posttrans_hook(conduit):
+    create_snapshots_in_post = conduit.confBool('main', 'create_snapshots_in_post', default=0)
+    if create_snapshots_in_post:
+        create_snapshots(conduit)
-- 
1.8.1
