Date: Mon, 08 Oct 2001 15:51:49 -0400
From: Chris Mason <mason@suse.com>
Message-ID: <61620000.1002570709@tiny>
In-Reply-To: <20011008170549.3B15E76467@oscar.casa.dyndns.org>
References: <20011003230330.508E91104F@oscar.casa.dyndns.org> <20011008155346.A741C76E3B@oscar.casa.dyndns.org> <4650000.1002560095@tiny> <20011008170549.3B15E76467@oscar.casa.dyndns.org>
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


On Monday, October 08, 2001 01:05:48 PM -0400 Ed Tomlinson <tomlins@CAM.ORG> wrote:

> On October 8, 2001 12:54 pm, Chris Mason wrote:
>> On Monday, October 08, 2001 11:53:46 AM -0400 Ed Tomlinson
>> 
>> <tomlins@CAM.ORG> wrote:
>> > Hi Chris,
>> > 
>> > To summerize, with 2.4.11-pre5 and lvm-1.01-rc4 + your test vfslocking
>> > patch  for 2.4.11-pre I, unlike you, was able to make snapshots and
>> > reiserfsck them without  problems.  Then I tried a debench 50 run and got
>> > an oops.
>> 
>> Confirmed, similar oops here.  Do you get this with rc4 in 2.4.10?
> 
> Funny you should ask...  Guess what was runing when this email arrived?  The 
> answer is that with 2.4.10 + lvm 1.01-rc4 the snapshot deactivates correctly - 
> I do not see an oops.

Ok, that first patch won't quite fix it, as we can still oops
in lvm_snapshot_COW.  This one works better for me:

--- 0.21/drivers/md/lvm.c Sun, 07 Oct 2001 22:15:54 -0400 
+++ 0.21(w)/drivers/md/lvm.c Mon, 08 Oct 2001 15:54:42 -0400 
@@ -1142,7 +1142,8 @@
 
 	/* we must redo lvm_snapshot_remap_block in order to avoid a
 	   race condition in the gap where no lock was held */
-	if (!lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv) &&
+	if (lv->lv_block_exception && 
+	    !lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv) &&
 	    !lvm_snapshot_COW(rdev, rsector, pe_start, rsector, vg, lv))
 		lvm_write_COW_table_block(vg, lv);
 
@@ -1151,11 +1152,12 @@
 
 static inline void _remap_snapshot(kdev_t rdev, ulong rsector,
 				   ulong pe_start, lv_t *lv, vg_t *vg) {
-	int r;
+	int r = 0;
 
 	/* check to see if this chunk is already in the snapshot */
 	down_read(&lv->lv_lock);
-	r = lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv);
+	if (lv->lv_block_exception)
+		r = lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv);
 	up_read(&lv->lv_lock);
 
 	if (!r)
Index: 0.21/drivers/md/lvm-snap.c
--- 0.21/drivers/md/lvm-snap.c Sat, 06 Oct 2001 00:07:22 -0400 root (linux/i/c/38_lvm-snap.c 1.1.2.1.2.1 644)
+++ 0.21(w)/drivers/md/lvm-snap.c Mon, 08 Oct 2001 15:13:10 -0400 root (linux/i/c/38_lvm-snap.c 1.1.2.1.2.1 644)
@@ -140,6 +140,8 @@
 	unsigned long mask = lv->lv_snapshot_hash_mask;
 	int chunk_size = lv->lv_chunk_size;
 
+	if (!hash_table)
+		BUG() ;
 	hash_table = &hash_table[hashfn(org_dev, org_start, mask, chunk_size)];
 	list_add(&exception->hash, hash_table);
 }
