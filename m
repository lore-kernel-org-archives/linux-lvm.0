From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] reiserfs panic
References: <20011129164915.I1408@tykepenguin.com> <20011130102423.E1452@tykepenguin.com>
In-Reply-To: <20011130102423.E1452@tykepenguin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20011130124421.05D5F76F5@oscar.casa.dyndns.org>
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
Date: Fri Nov 30 17:59:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Patrick Caulfield <patrick@tykepenguin.com>
Cc: Chris Mason <mason@suse.com>

Wonder if this is the result of something not getting into cvs?  Mid October
Chris fixed a bunch of snapshot problems.  One was with full snapshots...
He posted a fix here, some one else posted an alternate.  Bet neither has 
been put into cvs.  Here is what I am using with 'rc4ish'.  Does it help?

Ed Tomlinson

------------------ (From Chris Mason)
Hi guys,

Here's a repost of the patch that fixes oopsen when snapshots
get full.  Please comment and/or include ;-)

Against 1.0.1rc4, the bug should affect all kernel versions.

-chris

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


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
------------------

On November 30, 2001 05:24 am, Patrick Caulfield wrote:
> I'm posting this here partly because I hope Chris Mason is reading(!) and
> partly because it may be of some use to others on the list.
>
> There seems to be a problem when reading from a deactivated snapshot of a
> reiserfs volume that causes a panic.
>
> The problem is caused by the fact that when a snapshot becomes full, LVM
> returns I/O errors for the volume and when reiserfs hits an I/O error it
> panics.
>
> The solution is, of course, to make your snapshots large enough that this
> never happens :-) but just in case this is not possible the following patch
> may be of use:
>
>
> diff -u fs/reiserfs/namei.c.orig fs/reiserfs/namei.c
> --- fs/reiserfs/namei.c.orig    Thu Nov 29 16:13:28 2001
> +++ fs/reiserfs/namei.c Thu Nov 29 16:34:49 2001
> @@ -320,9 +320,10 @@
>
>      while (1) {
>         retval = search_by_entry_key (dir->i_sb, &key_to_search,
> path_to_entry, de); -       if (retval == IO_ERROR)
> +       if (retval == IO_ERROR)
> +           return NAME_NOT_FOUND;
>             // FIXME: still has to be dealt with
> -           reiserfs_panic (dir->i_sb, "zam-7001: io error in "
> __FUNCTION__ "\n"); +           // reiserfs_panic (dir->i_sb, "zam-7001: io
> error in " __FUNCTION__ "\n");
>
>         /* compare names for all entries having given hash value */
>         retval = linear_search_in_dir_item (&key_to_search, de, name,
> namelen);
>
>
>
> patrick
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
