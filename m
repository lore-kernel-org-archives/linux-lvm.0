Return-Path: <ben@trez42.net>
From: Benoit Gaussen <ben@trez42.net>
Date: Mon, 12 Feb 2001 20:52:29 +0100
Message-ID: <20010212205229.A3375@trez42.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM with devfs questions and patches
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
To: linux-lvm@sistina.com

Hi,

I'm running LVM 0.9.1_beta2 from kernel 2.4.1 with devfs and I had some little
troubles, all related to /dev entries and devfs registration :

- my LVM startup script does as indicated in the mailing list a vgchange -ay.
  The result is that when I look at the VG directory in /dev (say /dev/vg0)
  there is only the character device group, and the LVs are registered by devfs
  directly in /dev (/dev/lv0 and /dev/lv1).
  Doing a vgchange -an then another vgchange -ay re-registers the LVs in the VG
  directory (/dev/vg0/lv0 and /dev/vg0/lv1).
  I had a look a the kernel code in lvm_do_vg_create() and I saw that
  lvm_do_create_devfs_entry_of_vg() is called after lvm_do_lv_create() loop, so
  all LVs devfs entries are first created with a parent dir handle of NULL.  

- another trouble I had, and I saw some people here had the same, is the
  'devfs_register(): device already registered: "group"' message while doing
  vgchange.
  I did not find an=y answer about the cause of it. So I looked at the code
  of vgchange and discovered that the /dev/vg0 and /dev/vg0/group are created
  by mkdir and mknod (in the function vg_create_dir_and_group() ).
  So when the kernel code tries to register the group device, the devfs code
  finds it, since it was already registered by doing the mknod.
  I understand the group device must exist since the VG_CREATE ioctl uses its
  minor to select the VG to create. But since the minor is based on
  vg->vg_number, and the vg structure is passed as argument to the VG_CREATE
  ioctl, why not using vg->vg_number to select the VG ?
  So we could open /dev/lvm to do the VG_CREATE ioctl instead of using
  /dev/vg0/group ?  

Attached to this mail are the patches I made to propose a possible solution
to correct those two problems. The lvm kernel part patch is against LVM
0.9.1_beta2 in the kernel 2.4.1.
The userspace utils patch is against 0.9.1_beta2, and is mainly focused on
vgchange... I didn't check all the utils...

Those patches are working well with my config, but I did not test them
intensively.

I have another little question, I read the recent thread concerning the
startup scripts, and the fact to put vgscan in them. But when the startup
script is launched, the file system is mounted read only and since vgscan
updates the /etc/lvmtab files, it fails...  or maybe I missed something ?

I hope this will help.


Ben.

-- 
Unix IS user friendly, it is just selective about who his friends are.
                                                             Anonymous

----- kernel patch --------
--- linux-2.4.1.orig/drivers/md/lvm.c	Mon Jan 29 01:11:20 2001
+++ linux-2.4.1/drivers/md/lvm.c	Sun Feb 11 22:17:19 2001
@@ -289,7 +289,7 @@
 static int lvm_do_pv_change(vg_t*, void*);
 static int lvm_do_pv_status(vg_t *, void *);
 
-static int lvm_do_vg_create(int, void *);
+static int lvm_do_vg_create(void *);
 static int lvm_do_vg_extend(vg_t *, void *);
 static int lvm_do_vg_reduce(vg_t *, void *);
 static int lvm_do_vg_rename(vg_t *, void *);
@@ -400,20 +400,20 @@
 {
 	struct gendisk *gendisk_ptr = NULL;
 
-	if (register_chrdev(LVM_CHAR_MAJOR, lvm_name, &lvm_chr_fops) < 0) {
+	if (devfs_register_chrdev(LVM_CHAR_MAJOR, lvm_name, &lvm_chr_fops) < 0) {
 		printk(KERN_ERR "%s -- register_chrdev failed\n", lvm_name);
 		return -EIO;
 	}
-	if (register_blkdev(MAJOR_NR, lvm_name, &lvm_blk_dops) < 0)
+	if (devfs_register_blkdev(MAJOR_NR, lvm_name, &lvm_blk_dops) < 0)
 	{
 		printk("%s -- register_blkdev failed\n", lvm_name);
-		if (unregister_chrdev(LVM_CHAR_MAJOR, lvm_name) < 0)
+		if (devfs_unregister_chrdev(LVM_CHAR_MAJOR, lvm_name) < 0)
 			printk(KERN_ERR "%s -- unregister_chrdev failed\n", lvm_name);
 		return -EIO;
 	}
 
 	lvm_devfs_handle = devfs_register(
-		0 , "lvm", 0, 0, LVM_CHAR_MAJOR,
+		0 , "lvm", 0, LVM_CHAR_MAJOR, 0,
 		S_IFCHR | S_IRUSR | S_IWUSR | S_IRGRP,
 		&lvm_chr_fops, NULL);
 
@@ -477,10 +477,10 @@
 
 	devfs_unregister (lvm_devfs_handle);
 
-	if (unregister_chrdev(LVM_CHAR_MAJOR, lvm_name) < 0) {
+	if (devfs_unregister_chrdev(LVM_CHAR_MAJOR, lvm_name) < 0) {
 		printk(KERN_ERR "%s -- unregister_chrdev failed\n", lvm_name);
 	}
-	if (unregister_blkdev(MAJOR_NR, lvm_name) < 0) {
+	if (devfs_unregister_blkdev(MAJOR_NR, lvm_name) < 0) {
 		printk(KERN_ERR "%s -- unregister_blkdev failed\n", lvm_name);
 	}
 
@@ -650,7 +650,7 @@
 
 	case VG_CREATE:
 		/* create a VGDA */
-		return lvm_do_vg_create(minor, arg);
+		return lvm_do_vg_create(arg);
 
 	case VG_EXTEND:
 		/* extend a volume group */
@@ -1793,16 +1793,15 @@
 /*
  * character device support function VGDA create
  */
-int lvm_do_vg_create(int minor, void *arg)
+int lvm_do_vg_create(void *arg)
 {
 	int ret = 0;
+	int minor;
 	ulong l, ls = 0, p, size;
 	lv_t lv;
 	vg_t *vg_ptr;
 	lv_t **snap_lv_ptr;
 
-	if (vg[VG_CHR(minor)] != NULL) return -EPERM;
-
 	if ((vg_ptr = kmalloc(sizeof(vg_t),GFP_KERNEL)) == NULL) {
 		printk(KERN_CRIT
 		       "%s -- VG_CREATE: kmalloc error VG@line %d\n",
@@ -1815,6 +1814,13 @@
 		return -EFAULT;
 	}
 
+	minor = vg_ptr->vg_number;
+
+	if (vg[VG_CHR(minor)] != NULL) {
+		kfree(vg_ptr);
+		return -EPERM;
+	}
+
 	/* we are not that active so far... */
 	vg_ptr->vg_status &= ~VG_ACTIVE;
 	vg[VG_CHR(minor)] = vg_ptr;
@@ -1860,6 +1866,8 @@
 	}
 	memset(snap_lv_ptr, 0, size);
 
+	lvm_do_create_devfs_entry_of_vg ( vg_ptr);
+	
 	/* get the logical volume structures */
 	vg_ptr->lv_cur = 0;
 	for (l = 0; l < vg_ptr->lv_max; l++) {
@@ -1883,8 +1891,6 @@
 			}
 		}
 	}
-
-	lvm_do_create_devfs_entry_of_vg ( vg_ptr);
 
 	/* Second path to correct snapshot logical volumes which are not
 	   in place during first path above */


------- utils patch ----------
diff -ur 0.9.1_beta2.orig/tools/lib/vg_create_dir_and_group.c 0.9.1_beta2/tools/lib/vg_create_dir_and_group.c
--- 0.9.1_beta2.orig/tools/lib/vg_create_dir_and_group.c	Mon Nov 13 01:20:11 2000
+++ 0.9.1_beta2/tools/lib/vg_create_dir_and_group.c	Sun Feb 11 20:00:36 2001
@@ -51,6 +51,7 @@
 #endif
 
    if ( vg == NULL || vg_check_name ( vg->vg_name) < 0) ret = -LVM_EPARAM;
+	else if (lvm_check_devfs()) ret = 0;
    else {
       vg_remove_dir_and_group_and_nodes ( vg->vg_name);
       mkdir ( LVM_DIR_PREFIX, 0555);
diff -ur 0.9.1_beta2.orig/tools/lib/vg_create_remove.c 0.9.1_beta2/tools/lib/vg_create_remove.c
--- 0.9.1_beta2.orig/tools/lib/vg_create_remove.c	Mon Nov 13 01:20:11 2000
+++ 0.9.1_beta2/tools/lib/vg_create_remove.c	Sun Feb 11 22:06:22 2001
@@ -49,9 +49,9 @@
 
 
 int vg_create_remove ( char *vg_name, vg_t *vg, int cr) {
-   int group = -1;
+   int lvm_dev = -1;
    int ret = 0;
-   char group_file[NAME_LEN];
+	char lvm_dev_name[NAME_LEN];
 
 #ifdef DEBUG
    debug_enter ( "vg_create_remove -- CALLED\n");
@@ -59,6 +59,7 @@
 
    switch ( cr) {
       case VG_CREATE:
+			strcpy(lvm_dev_name, LVM_DEV); 
          if ( vg_name == NULL ||
               vg == NULL ||
               vg_check_name ( vg_name) < 0 ||
@@ -66,6 +67,7 @@
          break;
 
       case VG_REMOVE:
+			sprintf ( lvm_dev_name, LVM_DIR_PREFIX "%s/group%c", vg_name, 0);
          if ( vg_name == NULL ||
               vg_check_name ( vg_name) < 0) ret = -LVM_EPARAM;
          break;
@@ -75,19 +77,18 @@
    }
 
    if ( ret == 0) {
-      sprintf ( group_file, LVM_DIR_PREFIX "%s/group%c", vg_name, 0);
-      if ( ( group = open ( group_file, O_RDWR)) == -1)
+      if ( ( lvm_dev = open ( lvm_dev_name, O_RDWR)) == -1)
          ret = -LVM_EVG_CREATE_REMOVE_OPEN;
       else {
 #ifdef DEBUG
          debug ( "vg_create_remove -- IOCTL\n");
 #endif
-         if ( ( ret = ioctl ( group, cr, vg)) == -1) ret = -errno;
+         if ( ( ret = ioctl ( lvm_dev, cr, vg)) == -1) ret = -errno;
 #ifdef DEBUG
          debug ( "vg_create_remove -- IOCTL returned: %d\n", ret);
 #endif
       }
-      if ( group != -1) close ( group);
+      if ( lvm_dev != -1) close ( lvm_dev);
    }
 
 #ifdef DEBUG
