Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012230200.eBN20hU29913@webber.adilger.net>
Date: Fri, 22 Dec 2000 19:00:43 -0700 (MST)
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH] some strange things I noticed
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
To: Linux LVM mailing list <linux-lvm@sistina.com>
Cc: lvm-devel@sistina.com

Heinz,
here are some things I noticed while looking at the LVM permissions.

When you are checking the file mode in the kernel, I don't think O_RDWR
is the right thing, but rather FMODE_WRITE (see filp_open).  Also, it
is hard to tell what you originally intended with the LV_ACTIVE check,
but basically, it should be that any access to the block device on an
inactive LV is an error, right?

The second chunk is also a bit strange - if lv_open == 1, then it will
become negative, I believe.  I'm not really sure why you want an extra
reference on the opens, but reversing the checks would seem to be the
right thing to do, based on how the increments are done.

The last part is a bit of indentation cleanup, but also the I'm not sure
the return value is being calculated correctly.  According to my K&R book,
|| has a higher precedence than ?: so if there is an error you are returning
a positive int (for the first put_user), or -EFAULT (for the second put_user).
I had this same problem in my code and it was hard to find.

Cheers, Andreas
============================================================================
--- drivers/block/lvm.c.orig	Mon Dec 18 17:46:40 2000
+++ drivers/block/lvm.c	Fri Dec 22 16:17:50 2000
@@ -982,10 +982,11 @@
 		if (lv_ptr->lv_status & LV_SPINDOWN) return -EPERM;
 
 		/* Check inactive LV and open for read/write */
-		if (file->f_mode & O_RDWR) {
-			if (!(lv_ptr->lv_status & LV_ACTIVE)) return -EPERM;
-			if (!(lv_ptr->lv_access & LV_WRITE))  return -EACCES;
-		}
+		if (!(lv_ptr->lv_status & LV_ACTIVE))
+			return -EPERM;
+		if (!(lv_ptr->lv_access & LV_WRITE) &&
+		    file->f_mode & FMODE_WRITE))
+			return -EACCES;
 
 #ifndef BLOCK_DEVICE_OPERATIONS
 		file->f_op = &lvm_blk_fops;
@@ -1220,8 +1219,8 @@
 #endif
 
 	sync_dev(inode->i_rdev);
-	if (lv_ptr->lv_open == 1) vg_ptr->lv_open--;
 	lv_ptr->lv_open--;
+	if (lv_ptr->lv_open == 1) vg_ptr->lv_open--;
 
 	MOD_DEC_USE_COUNT;
 
@@ -1234,22 +1233,23 @@
 	struct buffer_head bh;
 	unsigned long block;
 	int err;
-	
+
 	if (get_user(block, &user_result->lv_block))
-	return -EFAULT;
-	
+		return -EFAULT;
+
 	memset(&bh,0,sizeof bh);
 	bh.b_rsector = block;
 	bh.b_dev = bh.b_rdev = inode->i_dev;
 	bh.b_size = lvm_get_blksize(bh.b_dev);
-	if ((err=lvm_map(bh.b_rdev, &bh.b_rdev, &bh.b_rsector, bh.b_size >> 9, READ)) < 0)  {
-	printk("lvm map failed: %d\n", err);
-	return -EINVAL;
+	if ((err = lvm_map(bh.b_rdev, &bh.b_rdev, &bh.b_rsector, bh.b_size >> 9,
+			   READ)) < 0)  {
+		printk("lvm map failed: %d\n", err);
+		return -EINVAL;
 	}
-	
-	return put_user(  kdev_t_to_nr(bh.b_rdev), &user_result->lv_dev) ||
-	put_user(bh.b_rsector, &user_result->lv_block) ? -EFAULT : 0;
-}     
+
+	return (put_user(kdev_t_to_nr(bh.b_rdev), &user_result->lv_dev) ||
+		put_user(bh.b_rsector, &user_result->lv_block)) ? -EFAULT : 0;
+}
 
 
 /*

-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
