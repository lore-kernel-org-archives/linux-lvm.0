Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011291857.eATIvOL22853@webber.adilger.net>
Subject: Re: [linux-lvm] Re: Installation Problems with 0.9
In-Reply-To: <3A255040.275AE009@cup.hp.com> "from John DeFranco at Nov 29, 2000
 10:51:44 am"
Date: Wed, 29 Nov 2000 11:57:24 -0700 (MST)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John DeFranco <defranco@cup.hp.com>
Cc: Linux LVM mailing list <linux-lvm@sistina.com>

John DeFranc writes:
> Thanks Heinz, one other question then, if I install
> things in the following sequence:
> 
> 2.2.17
> raid-2.2.17-A0
> linux-2.2.17-rawio.patch
> lvm-0.9-2.2.17-stock.patch
> 
> I get two hunk failures (#3,4) in drivers/block/ll_rw_blk.c.
> Are these expected or is there some other problem? If I don't
> load the raid-2.2.17-A0 patch everything is ok, but then
> after I boot that kernel I cannot create any raid devices
> so I need the raid-2.2.17-A0 patch.

Here is a "patch for the patch" which should allow the new_raid patch
to work properly.  YMMV, as I don't use MD devices, but it is essentially
what I had in my old 0.8 patchset (which was based on the new RAID code),
and is mostly just removing conflicting parts of the patch:

Cheers, Andreas
=========================================================================
diff -u -r1.1 lvm-0.9-2.2.17-new_raid.patch
--- lvm-0.9-2.2.17-new_raid.patch	2000/11/21 10:01:46	1.1
+++ lvm-0.9-2.2.17-new_raid.patch	2000/11/28 07:02:13
@@ -47,42 +47,6 @@
  Multiple devices driver support
  CONFIG_BLK_DEV_MD
    This driver lets you combine several hard disk partitions into one
-@@ -961,6 +985,13 @@
- 
-   If unsure, say N.
- 
-+Autodetect RAID partitions
-+CONFIG_AUTODETECT_RAID
-+  This feature lets the kernel detect RAID partitions on bootup.
-+  An autodetect RAID partition is a normal partition with partition
-+  type 0xfd. Use this if you want to boot RAID devices, or want to
-+  run them automatically.
-+
- Linear (append) mode
- CONFIG_MD_LINEAR
-   If you say Y here, then your multiple devices driver will be able to
-@@ -1039,6 +1070,21 @@
-   Documentation/modules.txt.
- 
-   If unsure, say Y.
-+
-+Translucent Block Device Support (EXPERIMENTAL)
-+CONFIG_MD_TRANSLUCENT
-+  DO NOT USE THIS STUFF YET!
-+
-+  currently there is only a placeholder there as the implementation
-+  is not yet usable.
-+
-+Hierarchical Storage Management support (EXPERIMENTAL)
-+CONFIG_MD_HSM
-+  DO NOT USE THIS STUFF YET!
-+
-+  i have released this so people can comment on the architecture,
-+  but user-space tools are still unusable so there is nothing much
-+  you can do with this.
- 
- Boot support (linear, striped)
- CONFIG_MD_BOOT
 --- linux-2.2.17-new_raid.orig/Documentation/LVM-HOWTO	Tue Nov 14 15:49:41 2000
 +++ linux-2.2.17-new_raid/Documentation/LVM-HOWTO	Tue Nov 14 15:49:41 2000
 @@ -0,0 +1,118 @@
@@ -206,7 +170,7 @@
 +    "e2fsadm -L+100 /dev/test_vg/another_test_lv"
 --- linux-2.2.17-new_raid.orig/drivers/block/Config.in	Tue Nov 14 15:49:41 2000
 +++ linux-2.2.17-new_raid/drivers/block/Config.in	Tue Nov 14 15:49:41 2000
-@@ -96,16 +96,23 @@
+@@ -96,6 +96,10 @@
  
  comment 'Additional Block Devices'
  
@@ -217,19 +181,6 @@
  tristate 'Loopback device support' CONFIG_BLK_DEV_LOOP
  if [ "$CONFIG_NET" = "y" ]; then
    tristate 'Network block device support' CONFIG_BLK_DEV_NBD
- fi
- bool 'Multiple devices driver support' CONFIG_BLK_DEV_MD
- if [ "$CONFIG_BLK_DEV_MD" = "y" ]; then
-+  bool 'Autodetect RAID partitions' CONFIG_AUTODETECT_RAID
-   tristate '   Linear (append) mode' CONFIG_MD_LINEAR
-   tristate '   RAID-0 (striping) mode' CONFIG_MD_STRIPED
-   tristate '   RAID-1 (mirroring) mode' CONFIG_MD_MIRRORING
-   tristate '   RAID-4/RAID-5 mode' CONFIG_MD_RAID5
-+  tristate '   Translucent mode' CONFIG_MD_TRANSLUCENT
-+  tristate '   Hierarchical Storage Management support' CONFIG_MD_HSM
- fi
- if [ "$CONFIG_MD_LINEAR" = "y" -o "$CONFIG_MD_STRIPED" = "y" ]; then
-   bool '      Boot support (linear, striped)' CONFIG_MD_BOOT
 --- linux-2.2.17-new_raid.orig/drivers/block/Makefile	Tue Nov 14 15:49:41 2000
 +++ linux-2.2.17-new_raid/drivers/block/Makefile	Tue Nov 14 15:49:41 2000
 @@ -254,6 +254,14 @@
@@ -247,38 +198,6 @@
  ifeq ($(CONFIG_BLK_DEV_MD),y)
  LX_OBJS += md.o
  
-@@ -282,13 +290,31 @@
- endif
- 
- ifeq ($(CONFIG_MD_RAID5),y)
-+LX_OBJS += xor.o
- L_OBJS += raid5.o
- else
-   ifeq ($(CONFIG_MD_RAID5),m)
-+  LX_OBJS += xor.o
-   M_OBJS += raid5.o
-   endif
- endif
- 
-+ifeq ($(CONFIG_MD_TRANSLUCENT),y)
-+L_OBJS += translucent.o
-+else
-+  ifeq ($(CONFIG_MD_TRANSLUCENT),m)
-+  M_OBJS += translucent.o
-+  endif
-+endif
-+
-+ifeq ($(CONFIG_MD_HSM),y)
-+L_OBJS += hsm.o
-+else
-+  ifeq ($(CONFIG_MD_HSM),m)
-+  M_OBJS += hsm.o
-+  endif
-+endif
-+
- endif
- 
- ifeq ($(CONFIG_BLK_DEV_NBD),y)
 @@ -309,6 +335,9 @@
  endif
  
@@ -302,14 +221,6 @@
 +
 --- linux-2.2.17-new_raid.orig/drivers/block/genhd.c	Tue Nov 14 15:49:41 2000
 +++ linux-2.2.17-new_raid/drivers/block/genhd.c	Tue Nov 14 15:49:41 2000
-@@ -28,6 +28,7 @@
- #include <linux/string.h>
- #include <linux/blk.h>
- #include <linux/init.h>
-+#include <linux/raid/md.h>
- 
- #include <asm/system.h>
- #include <asm/byteorder.h>
 @@ -50,6 +51,11 @@
  				le32_to_cpu(__a); \
  			})
@@ -337,108 +248,80 @@
  	}
  	part = minor & ((1 << hd->minor_shift) - 1);
  	if (hd->major >= SCSI_DISK1_MAJOR && hd->major <= SCSI_DISK7_MAJOR) {
-@@ -1671,6 +1685,9 @@
- 	else
- #endif
- 	rd_load();
-+#endif
-+#ifdef CONFIG_BLK_DEV_MD
-+	autodetect_raid();
- #endif
- #ifdef CONFIG_MD_BOOT
-         md_setup_drive();
 --- linux-2.2.17-new_raid.orig/drivers/block/ll_rw_blk.c	Tue Nov 14 15:49:41 2000
 +++ linux-2.2.17-new_raid/drivers/block/ll_rw_blk.c	Tue Nov 14 15:49:41 2000
-@@ -23,6 +23,7 @@
- #include <asm/io.h>
- #include <asm/uaccess.h>
- #include <linux/blk.h>
-+#include <linux/raid/md.h>
+@@ -26,6 +26,14 @@
  
  #include <linux/module.h>
  
-@@ -53,6 +54,11 @@
- spinlock_t io_request_lock = SPIN_LOCK_UNLOCKED;
- 
- /*
-+ * per-major idle-IO detection
-+ */
-+unsigned long io_events[MAX_BLKDEV] = {0, };
++#if defined CONFIG_BLK_DEV_LVM || defined CONFIG_BLK_DEV_LVM_MODULE
++#include <linux/lvm.h>
++   /* function pointer to the LVM driver remapping function
++      which will be setup during driver/module init; neccessary
++      to be able to load LVM as a module */
++int (*lvm_map_ptr) (struct buffer_head *, int) = NULL;
++#endif
 +
-+/*
-  * used to wait on when there are no free requests
-  */
- struct wait_queue * wait_for_request;
-@@ -641,6 +647,8 @@
- 		return;
- 	/* Maybe the above fixes it, and maybe it doesn't boot. Life is interesting */
- 	lock_buffer(bh);
-+	if (!buffer_lowprio(bh))
-+		io_events[major]++;
- 
- 	if (blk_size[major]) {
- 		unsigned long maxsector = (blk_size[major][MINOR(bh->b_rdev)] << 1) + 1;
-@@ -886,19 +894,6 @@
- 			       correct_size, bh[i]->b_size);
+ /*
+  * The request-struct contains all necessary data
+  * to load a nr of sectors into memory
+@@ -719,6 +727,9 @@
+ 	if (!req) {
+ 		/* MD and loop can't handle plugging without deadlocking */
+ 		if (major != MD_MAJOR && major != LOOP_MAJOR && 
++#if defined CONFIG_BLK_DEV_LVM || defined CONFIG_BLK_DEV_LVM_MODULE
++		    major != LVM_BLK_MAJOR &&
++#endif
+ 		    major != DDV_MAJOR && major != NBD_MAJOR)
+ 			plug_device(blk_dev + major); /* is atomic */
+ 	} else switch (major) {
+@@ -887,12 +898,34 @@
  			goto sorry;
  		}
--
--		/* Md remaps blocks now */
--		bh[i]->b_rdev = bh[i]->b_dev;
--		bh[i]->b_rsector=bh[i]->b_blocknr*(bh[i]->b_size >> 9);
--#ifdef CONFIG_BLK_DEV_MD
--		if (major==MD_MAJOR &&
--		    md_map (MINOR(bh[i]->b_dev), &bh[i]->b_rdev,
--			    &bh[i]->b_rsector, bh[i]->b_size >> 9)) {
--		        printk (KERN_ERR
--				"Bad md_map in ll_rw_block\n");
--		        goto sorry;
--		}
--#endif
- 	}
- 
- 	if ((rw == WRITE || rw == WRITEA) && is_read_only(bh[0]->b_dev)) {
-@@ -909,14 +904,26 @@
  
- 	for (i = 0; i < nr; i++) {
+-		/* Md remaps blocks now */
++		/* LVM and MD remap blocks now */
++#if defined CONFIG_BLK_DEV_LVM || defined CONFIG_BLK_DEV_LVM_MODULE
++		major = MAJOR(bh[i]->b_dev);
++		if (major == LVM_BLK_MAJOR) {
++			if (lvm_map_ptr == NULL) {
++				printk(KERN_ERR
++				     "Bad lvm_map_ptr in ll_rw_block\n");
++				goto sorry;
++			}
++			if ((lvm_map_ptr) (bh[i], rw) != 0) {
++				printk(KERN_ERR
++				       "Bad lvm_map in ll_rw_block\n");
++				goto sorry;
++			}
++			/* remap major too ... */
++			major = MAJOR(bh[i]->b_rdev);
++		} else {
++			bh[i]->b_rdev = bh[i]->b_dev;
++			bh[i]->b_rsector = bh[i]->b_blocknr * (bh[i]->b_size >> 9);
++		}
++#else
+ 		bh[i]->b_rdev = bh[i]->b_dev;
+ 		bh[i]->b_rsector=bh[i]->b_blocknr*(bh[i]->b_size >> 9);
++#endif
+ #ifdef CONFIG_BLK_DEV_MD
+ 		if (major==MD_MAJOR &&
+-			md_map (bh[i]->b_dev, &bh[i]->b_rdev,
++		    /* changed       v   to allow LVM to remap */
++		    md_map (bh[i]->b_rdev, &bh[i]->b_rdev,
+ 			    &bh[i]->b_rsector, bh[i]->b_size >> 9)) {
+ 		        printk (KERN_ERR
+ 				"Bad md_map in ll_rw_block\n");
+@@ -911,7 +944,8 @@
  		if (bh[i]) {
-+			int r = 1;
-+
  			set_bit(BH_Req, &bh[i]->b_state);
--#ifdef CONFIG_BLK_DEV_MD
+ #ifdef CONFIG_BLK_DEV_MD
 -			if (MAJOR(bh[i]->b_dev) == MD_MAJOR) {
--				md_make_request(MINOR (bh[i]->b_dev), rw, bh[i]);
--				continue;
-+
-+			bh[i]->b_rdev = bh[i]->b_dev;
-+			bh[i]->b_rsector=bh[i]->b_blocknr*(bh[i]->b_size >> 9);
-+
-+			dev = blk_dev + MAJOR(bh[i]->b_rdev);
-+			while(dev->make_req_fn) {
-+				if((r = dev->make_req_fn(bh[i], rw)) < 0) {
-+					printk(KERN_NOTICE "Custom request function failed\n");
-+					goto sorry;
-+				}
-+
-+				dev = blk_dev + MAJOR(bh[i]->b_rdev);
-+				if(!r) break;
++			/* changed         v  to allow LVM to remap */
++			if (MAJOR(bh[i]->b_rdev) == MD_MAJOR) {
+ 				md_make_request(bh[i], rw);
+ 				continue;
  			}
--#endif
--			make_request(MAJOR(bh[i]->b_rdev), rw, bh[i]);
-+
-+			if(r > 0)
-+				make_request(MAJOR(bh[i]->b_rdev), rw, bh[i]);
- 		}
- 	}
- 	return;
-@@ -996,6 +1003,7 @@
- 
- 	for (dev = blk_dev + MAX_BLKDEV; dev-- != blk_dev;) {
- 		dev->request_fn      = NULL;
-+		dev->make_req_fn          = NULL;
- 		dev->queue           = NULL;
- 		dev->current_request = NULL;
- 		dev->plug.rq_status  = RQ_INACTIVE;
 @@ -1097,6 +1105,9 @@
  #ifdef CONFIG_SJCD
  	sjcd_init();
@@ -4365,6 +4248,18 @@
 +		lv->lv_COW_table_page = NULL;
 +	}
 +}
+--- linux/drivers/block/md.c.orig	Sun Jun 18 10:10:09 2000
++++ linux/drivers/block/md.c	Sun Jun 18 10:13:02 2000
+@@ -2898,7 +2898,8 @@
+ int md_make_request (struct buffer_head * bh, int rw)
+ {
+ 	int err;
+-	mddev_t *mddev = kdev_to_mddev(bh->b_dev);
++	/* changed                           v  to allow LVM to remap */
++	mddev_t *mddev = kdev_to_mddev(bh->b_rdev);
+
+ 	if (!mddev || !mddev->pers) {
+ 		err = -ENXIO;
 --- linux-2.2.17-new_raid.orig/include/linux/lvm.h	Tue Nov 14 15:49:41 2000
 +++ linux-2.2.17-new_raid/include/linux/lvm.h	Tue Nov 14 15:49:41 2000
 @@ -0,0 +1,883 @@
@@ -5251,116 +5146,8 @@
 +} lv_snapshot_use_rate_req_t;
 +
 +#endif				/* #ifndef _LVM_H_INCLUDE */
---- linux-2.2.17-new_raid.orig/include/linux/major.h	Tue Nov 14 15:49:41 2000
-+++ linux-2.2.17-new_raid/include/linux/major.h	Tue Nov 14 15:49:41 2000
-@@ -117,6 +117,8 @@
- 
- #define AURORA_MAJOR 79
- 
-+#define RAW_MAJOR	162
-+
- #define UNIX98_PTY_MASTER_MAJOR	128
- #define UNIX98_PTY_MAJOR_COUNT	8
- #define UNIX98_PTY_SLAVE_MAJOR	(UNIX98_PTY_MASTER_MAJOR+UNIX98_PTY_MAJOR_COUNT)
---- linux-2.2.17-new_raid.orig/include/linux/fs.h	Tue Nov 14 15:49:41 2000
-+++ linux-2.2.17-new_raid/include/linux/fs.h	Tue Nov 14 15:49:41 2000
-@@ -185,6 +185,7 @@
- #define BH_Lock		2	/* 1 if the buffer is locked */
- #define BH_Req		3	/* 0 if the buffer has been invalidated */
- #define BH_Protected	6	/* 1 if the buffer is protected */
-+#define BH_LowPrio	7	/* 1 if the buffer is lowprio */
- 
- /*
-  * Try to keep the most commonly used fields in single cache lines (16
-@@ -755,6 +756,7 @@
- extern void refile_buffer(struct buffer_head * buf);
- extern void set_writetime(struct buffer_head * buf, int flag);
- extern int try_to_free_buffers(struct page *, int wait);
-+extern void cache_drop_behind(struct buffer_head *bh);
- 
- extern int nr_buffers;
- extern long buffermem;
-@@ -775,6 +777,25 @@
- 	}
- }
- 
-+extern inline void mark_buffer_highprio(struct buffer_head * bh)
-+{
-+	clear_bit(BH_LowPrio, &bh->b_state);
-+}
-+
-+extern inline void mark_buffer_lowprio(struct buffer_head * bh)
-+{
-+	/*
-+	 * dirty buffers cannot be marked lowprio.
-+	 */
-+	if (!buffer_dirty(bh))
-+		set_bit(BH_LowPrio, &bh->b_state);
-+}
-+
-+static inline int buffer_lowprio(struct buffer_head * bh)
-+{
-+	return test_bit(BH_LowPrio, &bh->b_state);
-+}
-+
- extern inline void mark_buffer_dirty(struct buffer_head * bh, int flag)
- {
- 	if (!test_and_set_bit(BH_Dirty, &bh->b_state)) {
-@@ -782,6 +803,23 @@
- 		if (bh->b_list != BUF_DIRTY)
- 			refile_buffer(bh);
- 	}
-+	/*
-+	 * if a buffer gets marked dirty then it has to lose
-+	 * it's lowprio state.
-+	 */
-+	mark_buffer_highprio(bh);
-+}
-+
-+extern inline void mark_buffer_dirty_lowprio(struct buffer_head * bh)
-+{
-+	if (!test_and_set_bit(BH_Dirty, &bh->b_state)) {
-+		if (bh->b_list != BUF_DIRTY)
-+			refile_buffer(bh);
-+		/*
-+		 * Mark it lowprio only if it was not dirty before!
-+		 */
-+		set_bit(BH_LowPrio, &bh->b_state);
-+	}
- }
- 
- extern int check_disk_change(kdev_t dev);
-@@ -855,6 +893,7 @@
- extern struct buffer_head * find_buffer(kdev_t dev, int block, int size);
- extern void ll_rw_block(int, int, struct buffer_head * bh[]);
- extern int is_read_only(kdev_t);
-+extern int is_device_idle(kdev_t);
- extern void __brelse(struct buffer_head *);
- extern inline void brelse(struct buffer_head *buf)
- {
-@@ -870,8 +909,12 @@
- extern void set_blocksize(kdev_t dev, int size);
- extern unsigned int get_hardblocksize(kdev_t dev);
- extern struct buffer_head * bread(kdev_t dev, int block, int size);
-+extern struct buffer_head * buffer_ready (kdev_t dev, int block, int size);
-+extern void bread_ahead (kdev_t dev, int block, int size);
- extern struct buffer_head * breada(kdev_t dev,int block, int size, 
- 				   unsigned int pos, unsigned int filesize);
-+extern struct buffer_head * breada_blocks(kdev_t dev,int block,
-+						int size, int blocks);
- 
- extern int brw_page(int, struct page *, kdev_t, int [], int, int);
- 
 --- linux-2.2.17-new_raid.orig/kernel/ksyms.c	Tue Nov 14 15:49:41 2000
 +++ linux-2.2.17-new_raid/kernel/ksyms.c	Tue Nov 14 15:49:41 2000
-@@ -39,6 +39,7 @@
- #include <linux/poll.h>
- #include <linux/mm.h>
- #include <linux/capability.h>
-+#include <linux/iobuf.h>
- 
- #if defined(CONFIG_PROC_FS)
- #include <linux/proc_fs.h>
 @@ -83,6 +84,11 @@
  #endif
  EXPORT_SYMBOL(get_options);
@@ -5373,26 +5160,3 @@
  /* process memory management */
  EXPORT_SYMBOL(do_mmap);
  EXPORT_SYMBOL(do_munmap);
-@@ -108,6 +114,7 @@
- EXPORT_SYMBOL(mem_map);
- EXPORT_SYMBOL(remap_page_range);
- EXPORT_SYMBOL(max_mapnr);
-+EXPORT_SYMBOL(num_physpages);
- EXPORT_SYMBOL(high_memory);
- EXPORT_SYMBOL(update_vm_cache);
- EXPORT_SYMBOL(update_vm_cache_conditional);
-@@ -240,6 +247,14 @@
- EXPORT_SYMBOL(max_sectors);
- EXPORT_SYMBOL(max_segments);
- EXPORT_SYMBOL(max_readahead);
-+
-+/* kiobuf support */
-+EXPORT_SYMBOL(map_user_kiobuf);
-+EXPORT_SYMBOL(unmap_kiobuf);
-+EXPORT_SYMBOL(alloc_kiovec);
-+EXPORT_SYMBOL(free_kiovec);
-+EXPORT_SYMBOL(expand_kiobuf);
-+EXPORT_SYMBOL(brw_kiovec);
- 
- /* tty routines */
- EXPORT_SYMBOL(tty_hangup);

-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
