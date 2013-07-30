Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6UFJ4p5001742
	for <linux-lvm@redhat.com>; Tue, 30 Jul 2013 11:19:04 -0400
Received: from arafel.iwakd.de (arafel.iwakd.de [78.46.72.57])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6UFJ2LZ002287
	for <linux-lvm@redhat.com>; Tue, 30 Jul 2013 11:19:02 -0400
From: Christian Seiler <christian@iwakd.de>
Date: Tue, 30 Jul 2013 17:18:02 +0200
Message-Id: <1375197482-4824-1-git-send-email-christian@iwakd.de>
Subject: [linux-lvm] [PATCH] lvremove: perform retry logic also on -real
	subvolume for snapshots
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
To: linux-lvm@redhat.com
Cc: Christian Seiler <christian@iwakd.de>

Many people have reported that lvremove may fail spuriously, even with
the -f option. This has been identified to be due to a combination of
LVM, udev and possibly other utilities, in that somehow udev rules may
be triggered (either by lvremove itself or by external utilities) that
cause small helper programs to open the LV for a short time to retrieve
information about its contents, which in turn causes the volume to be
in use in the precise moment that lvremove tries to remove it. In the
past, two main changes were made to solve this problem:

 - LVM2 will try to remove the logical volume several times if it is
   just opened by a program and not mounted, so that if a udev rule
   just happened to be triggered at the same time, the retry will
   hopefully take place once udev processing is over and the removal
   can succeed.
 - LVM2 tries really hard not to trigger those udev rules by itself,
   by not opening the devices R/W during initialization.

This commit is a follow-up on the first change. If the last snapshot of
a volume is removed, the -real subvolume is not removed via the
codepath that has the retry logic, but by just doing a cleanup of
unused volumes. This means that spurious failures may still occur,
although not as often.

This patch adds the same retry logic to the cleanup codepath in order
to make it even more unlikely that such a spurious error may occur.

Signed-off-by: Christian Seiler <christian@iwakd.de>
---
 lib/activate/dev_manager.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/lib/activate/dev_manager.c b/lib/activate/dev_manager.c
index 6a68653..1708946 100644
--- a/lib/activate/dev_manager.c
+++ b/lib/activate/dev_manager.c
@@ -2614,6 +2614,8 @@ static int _tree_action(struct dev_manager *dm, struct logical_volume *lv,
 	/* Only process nodes with uuid of "LVM-" plus VG id. */
 	switch(action) {
 	case CLEAN:
+		if (retry_deactivation())
+			dm_tree_retry_remove(root);
 		/* Deactivate any unused non-toplevel nodes */
 		if (!_clean_tree(dm, root, laopts->origin_only ? dlid : NULL))
 			goto_out;
-- 
1.7.2.5
