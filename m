Date: Fri, 8 Sep 2000 16:25:25 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] LVM support for LILO
Message-ID: <20000908162525.A4383@gruyere.muc.suse.de>
References: <20000908004640.A24191@gruyere.muc.suse.de> <200009072344.RAA21636@lynx.turbolabs.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="7AUc2qLy4jB3hD7Z"
In-Reply-To: <200009072344.RAA21636@lynx.turbolabs.com>; from adilger@turbolinux.com on Thu, Sep 07, 2000 at 05:44:03PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii

On Thu, Sep 07, 2000 at 05:44:03PM -0600, Andreas Dilger wrote:
> Yes, please send me a copy...

Sorry for the delay. I cleaned the patch a bit up and appended it. I also
noticed that I sent you the wrong version of the kernel patch earlier, the
patched lilo needs the ioctl on the character device (the patch I sent adds
it to the block device, because I used that first). I appended a new
kernel patch against 2.2.16 + LVM 0.9 and a patch against lilo 21.5. Again
a warning, the lilo patch is not really tested and may just break.


-Andi


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lilo-21.5-lvm-patch"

diff -ur lilo-21.5/geometry.c lilo-21.5-work/geometry.c
--- lilo-21.5/geometry.c	Sat Jul 15 22:33:06 2000
+++ lilo-21.5-work/geometry.c	Fri Aug 11 14:02:21 2000
@@ -30,6 +30,18 @@
 #define HDIO_GETGEO HDIO_REQ
 #endif
 
+#define LV_BMAP   _IOWR ( 0xfe, 0x51, 1)
+#ifndef MAJOR
+#define MAJOR(x) (((x) >> 8) & 0xff) 
+#endif
+#define LVM_MAJOR 58
+
+typedef unsigned short kernel_dev_t; 
+
+typedef struct lv_bmap {
+    ulong lv_block;
+    kernel_dev_t lv_dev;           
+} lv_bmap_t;
 
 typedef struct _st_buf {
     struct _st_buf *next;
@@ -40,6 +52,7 @@
 DT_ENTRY *disktab = NULL;
 int old_disktab = 0;
 
+int lvmbmap(dev_t dev, unsigned block, dev_t *curdev);
 
 void geo_init(char *name)
 {
@@ -408,7 +421,9 @@
     DT_ENTRY *walk;
     int inherited,keep_cyls;
 
-    if (MAJOR(device) == MD_MAJOR) {
+    switch (MAJOR(device)) { 
+    case MD_MAJOR:
+    {
         char mdxxx[11];
 	int md_fd, pass;
 	md_array_info_t md_array_info;
@@ -433,7 +448,19 @@
 	    }
 	}
 	close(md_fd);
+	break;	
     }
+    case LVM_MAJOR:
+    {
+	dev_t realdev = 0;	
+	int blk = lvmbmap(device,1,&realdev);
+
+	if (!blk) 
+		pdie("cannot find underlying LVM PV");
+	device = realdev;
+	break;	
+    } 
+    } 
     for (walk = disktab; walk; walk = walk->next)
 	if (walk->device == device) break;
     inherited = !walk && !old_disktab;
@@ -549,6 +576,7 @@
     geo->file = S_ISREG(st.st_mode);
     geo->boot = 1;
     geo->spb = 1;
+    geo->dev = st.st_dev; 
     return geo->fd;
 }
 
@@ -559,6 +587,36 @@
 }
 
 
+int lvmbmap(dev_t dev, unsigned block, dev_t *curdev)
+{
+	static int lvmfd = -1; 
+	lv_bmap_t bm; 
+
+	if (lvmfd < 0) {
+		lvmfd = open("/dev/lvm", O_RDWR); 
+		if (lvmfd < 0) pdie("open of /dev/lvm");
+	}	
+	bm.lv_dev = dev;
+	bm.lv_block = block;
+	
+	if (bm.lv_dev != dev) 
+		pdie("glibc dev_t does not match kernel_dev_t"); 
+ 
+	if (ioctl(lvmfd, LV_BMAP, &bm) < 0) 
+		return 0; 
+	
+	if (!(*curdev)) 
+		*curdev = bm.lv_dev;
+	else if (*curdev != bm.lv_dev) {   
+		/* FIXME: should check if they're really on different
+		   BIOS devices */ 
+		pdie("LVM boot file over multiple PVs"); 
+	}
+
+	return bm.lv_block; 
+}
+
+
 #ifndef FIBMAP
 #define FIBMAP BMAP_IOCTL
 #endif
@@ -576,6 +634,11 @@
     if (geo->file) {
 	if (ioctl(geo->fd,FIBMAP,&block) < 0) pdie("ioctl FIBMAP");
 	if (!block) return 0;
+
+	if (MAJOR(geo->dev) == LVM_MAJOR) { 
+		block = lvmbmap(geo->dev, block, &geo->curdev); 
+		if (!block) return 0; 
+	} 
     }
     sector = block*geo->spb+((offset/SECTOR_SIZE) % geo->spb);
     sector += geo->start;
diff -ur lilo-21.5/geometry.h lilo-21.5-work/geometry.h
--- lilo-21.5/geometry.h	Sat Nov  6 22:09:40 1999
+++ lilo-21.5-work/geometry.h	Thu Aug 10 17:57:37 2000
@@ -16,6 +16,9 @@
     int spb; /* sectors per block */
     int fd,file;
     int boot; /* non-zero after geo_open_boot */
+    dev_t dev; 
+    dev_t curdev;
+    int delayed;
 } GEOMETRY;
 
 typedef struct _dt_entry {
Binary files lilo-21.5/lilo.o and lilo-21.5-work/lilo.o differ
Binary files lilo-21.5/map.o and lilo-21.5-work/map.o differ

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=lvm-bmap-4

--- include/linux/lvm.h.LVBMAP	Fri Sep  1 17:40:55 2000
+++ include/linux/lvm.h	Fri Sep  8 13:11:58 2000
@@ -355,6 +355,10 @@
 
 /* lock the logical volume manager */
 #define	LVM_LOCK_LVM            _IO ( 0xfe, 0x100)
+
+/* bmap, argument lv_bmap_t */
+#define LV_BMAP		_IOWR ( 0xfe, 0x51, 1)
+
 /* END ioctls */
 
 
@@ -534,7 +538,10 @@
    ulong    new_pe;
 } le_remap_req_t;
 
-
+typedef struct lv_bmap {
+    ulong lv_block;
+    dev_t lv_dev;	    
+} lv_bmap_t;
 
 /*
  * Structure Logical Volume (LV) Version 1
--- drivers/block/lvm.c.LVBMAP	Mon Aug 28 15:04:34 2000
+++ drivers/block/lvm.c	Fri Sep  8 15:59:53 2000
@@ -1025,6 +1025,10 @@
          }
          return 0;
 
+	case LV_BMAP:
+		/* turn logical block into (dev_t, block). non privileged. */ 
+		return lvm_user_bmap(inode, (struct lv_bmap *) arg);  		
+		break; 
 
       default:
          printk ( KERN_WARNING
@@ -1076,6 +1080,28 @@
  *
  ********************************************************************/
 
+static int lvm_user_bmap(struct inode *inode, struct lv_bmap *user_result) 
+{ 
+	struct buffer_head bh; 
+	unsigned long block; 
+	int err;
+
+	if (get_user(block, &user_result->lv_block)) 
+		return -EFAULT; 	
+
+	memset(&bh,0,sizeof bh); 
+	bh.b_size = 512; /* XXX */ 
+	bh.b_rsector = block;
+	bh.b_dev = bh.b_rdev = inode->i_dev;
+	if ((err=lvm_map(&bh, READ)) < 0)  {
+		printk("lvm map failed: %d\n", err); 
+		return -EINVAL; 
+	}	
+
+	return put_user(  kdev_t_to_nr(bh.b_rdev), &user_result->lv_dev) ||
+		put_user(bh.b_rsector, &user_result->lv_block) ? -EFAULT : 0;
+} 
+
 /*
  * block device open routine
  */

--7AUc2qLy4jB3hD7Z--
