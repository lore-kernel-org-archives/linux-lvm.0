Return-Path: <Steph@Connex.com>
Message-ID: <B14BF8753E65D211ABCA00104B301EF501C02C88@cairn-gorm.cragtech.com>
From: Dale Stephenson <Steph@Connex.com>
Subject: RE: [linux-lvm] Upgrade to 0.9.1b8 went ok but....
Date: Fri, 27 Jul 2001 11:33:15 -0700
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On the subject of XFS specific changes to LVM:

I happen to have 2.4.7 XFS handy.  The differences between it and beta 6 (on
which it is based) are four in number:

1) Stripping out the OS-version conditionals not applicable to 2.4.7

2) Changing *_hardblock_* to *_hardsect_*, needed for 2.4.4 or later
compilation.  I assume beta8 has this sort of fix in for versions greater
than 2.4.3.

3) Fixing a bug using b_blocknr/b_dev in lvm_map, provided by Jens Axboe.
Beta7 fixed the same bug (code by Heinz), but the actual code of the fix
doesn't match exactly.

4) The extra ioctl, which is a real quickie:

	case BLKBSZGET:
	case BLKBSZSET:
		return blk_ioctl (inode->i_rdev, command, a);

Beta 7 didn't have that, I don't know if beta 8 (conditionally?) includes
it.

Here's the actual differences in patch form, for differences 2, 3, and 4 (I
stripped the OS-version conditionals).

--- LVM_0_9_1/kernel/lvm.c	Fri Jul 27 11:14:57 2001
+++ /usr/src/redhat/BUILD/linux/drivers/md/lvm.c	Fri Jul 27 10:37:38
2001
@@ -194,6 +194,11 @@
  *               - factored lvm_do_pv_flush out of lvm_chr_ioctl (HM)
  *    09/03/2001 - Added _lock_open_count to ensure we only drop the lock
  *                 when the locking process closes.
+ *    05/04/2001 - lvm_map bugs: don't use b_blocknr/b_dev in lvm_map, it
+ *                 destroys stacking devices. call b_end_io on failed maps.
+ *                 (Jens Axboe)
+ *    30/04/2001 - replace get_hardblock_size() with get_hardsect_size()
for
+ *                 2.4.4 kernel.
  *
  */
 
@@ -304,7 +309,7 @@
 static int lvm_do_vg_rename(vg_t *, void *);
 static int lvm_do_vg_remove(int);
 static void lvm_geninit(struct gendisk *);
-static void __update_hardblocksize(lv_t *lv);
+static void __update_hardsectsize(lv_t *lv);
 
 
 #ifdef LVM_HD_NAME
@@ -935,6 +940,9 @@
 			return -EFAULT;
 		break;
 
+	case BLKBSZGET:
+        case BLKBSZSET:
+                return blk_ioctl (inode->i_rdev, command, a);
 
 	case HDIO_GETGEO:
 		/* get disk geometry */
@@ -983,12 +991,11 @@
 		break;
 
 	case LV_BMAP:
-                /* turn logical block into (dev_t, block).  non privileged.
*/
-                /* don't bmap a snapshot, since the mapping can change */
-		if(lv_ptr->lv_access & LV_SNAPSHOT)
+		/* turn logical block into (dev_t, block). non privileged.
*/
+		/* don't bmap a snapshot, since the mapping can change */
+		if (lv_ptr->lv_access & LV_SNAPSHOT)
 			return -EPERM;
 
-		/* turn logical block into (dev_t, block). non privileged.
*/
 		return lvm_user_bmap(inode, (struct lv_bmap *) arg);
 		break;
 
@@ -1079,16 +1086,17 @@
 		return -EFAULT;
 
 	memset(&bh,0,sizeof bh);
-	bh.b_blocknr = block;
-	bh.b_dev = bh.b_rdev = inode->i_rdev;
+	bh.b_rsector = block;
+	bh.b_dev = bh.b_rdev = inode->i_dev;
 	bh.b_size = lvm_get_blksize(bh.b_dev);
 	if ((err=lvm_map(&bh, READ)) < 0)  {
 		printk("lvm map failed: %d\n", err);
 		return -EINVAL;
 	}
 
-	return (put_user(kdev_t_to_nr(bh.b_rdev), &user_result->lv_dev) ||
-		put_user(bh.b_rsector/(bh.b_size>>9),
&user_result->lv_block));
+	return put_user(kdev_t_to_nr(bh.b_rdev), &user_result->lv_dev) ||
+	       put_user(bh.b_rsector/(bh.b_size>>9), &user_result->lv_block)
?
+	       -EFAULT : 0;
 }
 
 
@@ -1109,7 +1117,7 @@
 	ulong index;
 	ulong pe_start;
 	ulong size = bh->b_size >> 9;
-	ulong rsector_org = bh->b_blocknr * size;
+	ulong rsector_org = bh->b_rsector;
 	ulong rsector_map;
 	kdev_t rdev_map;
 	vg_t *vg_this = vg[VG_BLK(minor)];
@@ -1273,10 +1281,15 @@
 /*
  * make request function
  */
-static int lvm_make_request_fn(request_queue_t *q,
-			       int rw,
-			       struct buffer_head *bh) {
-	return (lvm_map(bh, rw) < 0) ? 0 : 1;
+static int lvm_make_request_fn(request_queue_t *q, 
+			       int rw, 
+			       struct buffer_head *bh) 
+{
+	if (lvm_map(bh, rw) >= 0)
+		return 1;
+
+	buffer_IO_error(bh);
+	return 0;
 }
 
 
@@ -1380,7 +1393,7 @@
 					lv_ptr->lv_current_pe[le].pe =
 					    le_remap_req.new_pe;
 
-					__update_hardblocksize(lv_ptr);
+					__update_hardsectsize(lv_ptr);
 					return 0;
 				}
 			}
@@ -1736,31 +1749,31 @@
 }
 
 
-static void __update_hardblocksize(lv_t *lv) {
+static void __update_hardsectsize(lv_t *lv) {
 	int le, e;
-	int max_hardblocksize = 0, hardblocksize;
+	int max_hardsectsize = 0, hardsectsize;
 
 	for (le = 0; le < lv->lv_allocated_le; le++) {
-		hardblocksize =
get_hardblocksize(lv->lv_current_pe[le].dev);
-		if (hardblocksize == 0)
-			hardblocksize = 512;
-		if (hardblocksize > max_hardblocksize)
-			max_hardblocksize = hardblocksize;
+		hardsectsize = get_hardsect_size(lv->lv_current_pe[le].dev);
+		if (hardsectsize == 0)
+			hardsectsize = 512;
+		if (hardsectsize > max_hardsectsize)
+			max_hardsectsize = hardsectsize;
 	}
 
 	if (lv->lv_access & LV_SNAPSHOT) {
 		for (e = 0; e < lv->lv_remap_end; e++) {
-			hardblocksize =
-				get_hardblocksize(
+			hardsectsize =
+				get_hardsect_size(
 					lv->lv_block_exception[e].rdev_new);
-			if (hardblocksize == 0)
-				hardblocksize = 512;
-			if (hardblocksize > max_hardblocksize)
-				max_hardblocksize = hardblocksize;
+			if (hardsectsize == 0)
+				hardsectsize = 512;
+			if (hardsectsize > max_hardsectsize)
+				max_hardsectsize = hardsectsize;
 		}
 	}
 
-	lvm_hardsectsizes[MINOR(lv->lv_dev)] = max_hardblocksize;
+	lvm_hardsectsizes[MINOR(lv->lv_dev)] = max_hardsectsize;
 }
 
 /*
@@ -1945,7 +1958,7 @@
 	vg_ptr->lv_cur++;
 	lv_ptr->lv_status = lv_status_save;
 
-	__update_hardblocksize(lv_ptr);
+	__update_hardsectsize(lv_ptr);
 
 	/* optionally add our new snapshot LV */
 	if (lv_ptr->lv_access & LV_SNAPSHOT) {
@@ -2299,13 +2312,13 @@
 					= old_lv->lv_size;
 				lvm_size[MINOR(snap->lv_dev)] =
 					old_lv->lv_size >> 1;
-				__update_hardblocksize(snap);
+				__update_hardsectsize(snap);
 				up(&snap->lv_snapshot_sem);
 			}
 		}
 	}
 
-	__update_hardblocksize(old_lv);
+	__update_hardsectsize(old_lv);
 	up(&old_lv->lv_snapshot_sem);
 
 	return 0;

----
Dale J. Stephenson
steph@connex.com 

> -----Original Message-----
> From: Joe Thornber [mailto:thornber@btconnect.com]
> Sent: Thursday, July 26, 2001 5:43 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Upgrade to 0.9.1b8 went ok but....
> 
> 
> On Thu, Jul 26, 2001 at 08:16:33AM -0400, Dave Alden wrote:
> > Hi,
> > 
> >   Are you aware that the XFS folks modified LVM to work 
> with XFS (something
> > about a new ioctl or such)?  They state that if you install 
> the latest
> > patches, you'll back out the XFS-specific changes which can 
> cause you to
> > lose your XFS filesystem.  For more info, see the thread 
> with a subject
> > of "When LVM-0.9.1beta7 will be merged to XFS cvs tree?" from:
> > 
> > http://oss.sgi.com/projects/xfs/mail_archive/0107/threads.html#00127
> > 
> > My understanding is that this applies to any LVM patches 
> (including the beta8
> > patches).
> 
> No I wasn't aware of this, though Patrick may be since he uses XFS.
> 
> from http://oss.sgi.com/projects/xfs/mail_archive/0107/msg00132.html:
> 
> > All block devices in a XFS kernel need a special patch to 
> add an ioctl
> > to set the logical block size. The original poster probably 
> didn't add
> > that ioctl to his new hacked in LVM; which will cause all kinds of 
> > problems with xfs user tools and also probably file system 
> corruption.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
