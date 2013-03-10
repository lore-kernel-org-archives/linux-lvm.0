From: Mike Snitzer <msnitzer@fedoraproject.org>
Date: Sun, 10 Mar 2013 12:18:09 -0400
Message-Id: <1362932290-28679-2-git-send-email-msnitzer@fedoraproject.org>
In-Reply-To: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
References: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
Subject: [linux-lvm] [PATCH 1/2] fs snapshot plugin: fix inspect_volume_lvm
	to use supported dmsetup splitname options
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

dmsetup splitname -o vg_name,lv_name no longer works (fails with "Option
not recognised").  An additional -c argument is required by newer lvm2;
this is an lvm2 regression but moving forward -c -o vg_name,lv_name will
work as intended.

Signed-off-by: Mike Snitzer <msnitzer@fedoraproject.org>
---
 plugins/fs-snapshot/fs-snapshot.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/fs-snapshot/fs-snapshot.py b/plugins/fs-snapshot/fs-snapshot.py
index ef4afe8..2a7c65d 100644
--- a/plugins/fs-snapshot/fs-snapshot.py
+++ b/plugins/fs-snapshot/fs-snapshot.py
@@ -80,7 +80,7 @@ def inspect_volume_lvm(conduit, volume):
         # convert /dev/mapper name to /dev/vg/lv for use with LVM2 tools
         # - 'dmsetup splitname' will collapse any escaped characters
         p = Popen(["/sbin/dmsetup", "splitname", "--separator", "/",
-                   "--noheadings",
+                   "--noheadings", "-c",
                    "-o", "vg_name,lv_name", device], stdout=PIPE, stderr=PIPE)
         err = p.wait()
         if err:
-- 
1.8.1
