Date: Mon, 08 Oct 2001 22:29:24 -0400
From: Chris Mason <mason@suse.com>
Message-ID: <175160000.1002594564@tiny>
In-Reply-To: <20011009015759.BF5E472AE3@oscar.casa.dyndns.org>
References: <20011003230330.508E91104F@oscar.casa.dyndns.org> <20011008170549.3B15E76467@oscar.casa.dyndns.org> <61620000.1002570709@tiny> <20011009015759.BF5E472AE3@oscar.casa.dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Re: [OOPS] full snapshot (with test vfs locking patch for reiserfs snapshots in 11-pre)
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Ed Tomlinson <tomlins@CAM.ORG>
Cc: linux-lvm@sistina.com


On Monday, October 08, 2001 09:57:59 PM -0400 Ed Tomlinson <tomlins@CAM.ORG> wrote:

> Hi Chris
> 
>> Ok, that first patch won't quite fix it, as we can still oops
>> in lvm_snapshot_COW.  This one works better for me:
> 
> Looks like this one has problems too.  Here is the oops I get with it:
>>> EIP; d680b178 <[lvm-mod]_disable_snapshot+10/44>   <=====
> Trace; d680a50a <[lvm-mod]lvm_drop_snapshot+22/94>
> Trace; d680aafc <[lvm-mod]lvm_snapshot_COW+3b4/3f4>
> Trace; d680d3ca <[lvm-mod]lvm_name+8c2/e76>

Hmmm, this should be the same as the bug fixed by the second patch.  We know the snapshot hasn't been released yet when lvm_snapshot_COW is called, so _disable_snapshot should not oops.

We've got a write lock on the lv semaphore, so nobody else should be calling lvm_drop_snapshot on us.  I hate to ask, but are you sure you did an rmmod before the modules_install?

Regardless, we can fix the oops in _disable_snapshot, I just don't see how the locking allows it to happen.  This incremental fix should do it:

--- 0.21/drivers/md/lvm-snap.c Sat, 06 Oct 2001 00:07:22 -0400 
+++ 0.21(w)/drivers/md/lvm-snap.c Mon, 08 Oct 2001 22:39:54 -0400 
@@ -687,6 +694,10 @@
 
 static void _disable_snapshot(vg_t *vg, lv_t *lv) {
 	const char *err;
+	if (!lv->lv_block_exception) {
+		printk(KERN_ERR "%s -- snapshot already disabled\n", lvm_name);
+		return ;
+	}
 	lv->lv_block_exception[0].rsector_org = LVM_SNAPSHOT_DROPPED_SECTOR;
 	if(_write_COW_table_block(vg, lv, 0, &err) < 0) {
 		printk(KERN_ERR "%s -- couldn't disable snapshot: %s\n",
