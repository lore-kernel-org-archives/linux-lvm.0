Mime-Version: 1.0 (Apple Message framework v551)
From: "Dale J. Stephenson" <dalestephenson@mac.com>
Content-Transfer-Encoding: 7bit
Message-Id: <A00B669E-3934-11D7-A9B9-0003937830E4@mac.com>
Subject: [linux-lvm] Snapshot resizing bug (LVM1)
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Feb  5 12:08:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I've discovered a problem with using lvreduce/lvextend on LVM.  The 
resized snapshot will have a new exception table and hash table 
allocated for it.  But lvm_hash_link will be called for these in a loop 
that depends on the lv_remap_ptr counter passed down from userspace -- 
which will always be zero.  The result is that existing COW on the 
snapshot are ignored, and the contents of the snapshot can magically 
change to reflect the current state of the source volume.  Reboot (or 
deactivating and reactivating the volume group) should solve the 
problem, although it may be possible in the meantime to store a new COW 
exception for a chunk that already has one.

The fix is simple:

--- lvm.c.orig  Tue Feb  4 18:36:58 2003
+++ lvm.c       Tue Feb  4 18:43:26 2003
@@ -2792,7 +2792,7 @@
                 old_lv->lv_snapshot_hash_mask =
                     new_lv->lv_snapshot_hash_mask;

-               for (e = 0; e < new_lv->lv_remap_ptr; e++)
+               for (e = 0; e < old_lv->lv_remap_ptr; e++)
                         lvm_hash_link(new_lv->lv_block_exception + e,
                                       new_lv->lv_block_exception[e].
                                       rdev_org,

As a side note, why not revert the main LVM cvs tree back to LVM 1.0.6? 
  1.1 is dead.

Dale J. Stephenson
dalestephenson@mac.com
