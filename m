Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102262238.f1QMc3O11494@webber.adilger.net>
Subject: Re: [linux-lvm] Boot with LVM on RAID1 on entire disk
In-Reply-To: <20010226140905.A523@oro.net> from Ralph Jennings at "Feb 26, 2001
 02:09:05 pm"
Date: Mon, 26 Feb 2001 15:38:02 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

PS - here is that LILO patch I promised.

Note that I don't think it works with LVM on MD yet (I don't use/test MD),
although there is no real reason you couldn't do that.  You definitely can
NOT run a /boot partition on a striped MD or LVM device.  MD MUST be RAID 1
only and not RAID 0 or RAID 5.

Cheers, Andreas
============================================================================
diff -ru lilo-21.6.1/geometry.c lilo-21.6.1a/geometry.c
--- lilo-21.6.1/geometry.c	Sat Dec 16 15:09:21 2000
+++ lilo-21.6.1a/geometry.c	Tue Jan 30 13:40:02 2001
@@ -39,6 +39,15 @@
 #endif
 #endif
 
+struct lv_bmap {
+    __u32 lv_block;
+    __u32 lv_dev;
+};
+
+#ifndef LV_BMAP
+#define LV_BMAP				_IOWR(0xfe, 0x30, 1)
+#endif
+
 #ifndef HDIO_GETGEO
 #define HDIO_GETGEO HDIO_REQ
 #endif
@@ -265,6 +274,22 @@
 }
 
 
+void lvm_bmap(struct lv_bmap *lbm)
+{
+    DEVICE dev;
+    static int lvmfd = -1;
+
+    if (lvmfd == -1) {
+	lvmfd = dev_open(&dev, lbm->lv_dev, O_RDONLY);
+	if (lvmfd < 0)
+		die("can't open LVM device %#x\n", lbm->lv_dev);
+    }
+    if (ioctl(lvmfd, LV_BMAP, lbm) < 0) {
+	perror(__FUNCTION__);
+	pdie("LV_BMAP error or ioctl unsupported, can't have image in LVM.\n");
+    }
+}
+
 void geo_query_dev(GEOMETRY *geo,int device,int all)
 {
     DEVICE dev;
@@ -421,7 +450,9 @@
     DT_ENTRY *walk;
     int inherited,keep_cyls;
 
-    if (MAJOR(device) == MD_MAJOR) {
+    switch (MAJOR(device)) {
+    case MD_MAJOR:
+    {
         char mdxxx[11];
 	int md_fd, pass;
 	md_array_info_t md_array_info;
@@ -446,6 +477,19 @@
 	    }
 	}
 	close(md_fd);
+	break;
+    }
+    case MAJOR_LVM:
+    {
+	struct lv_bmap lbm;
+
+	lbm.lv_dev = device;
+	lbm.lv_block = 0;
+
+	lvm_bmap(&lbm);
+	device = lbm.lv_dev;
+	break;
+    }
     }
     for (walk = disktab; walk; walk = walk->next)
 	if (walk->device == device) break;
@@ -523,7 +567,8 @@
     if (fstat(geo->fd,&st) < 0) die("fstat %s: %s",name,strerror(errno));
     if (!S_ISREG(st.st_mode) && !S_ISBLK(st.st_mode))
 	die("%s: neither a reg. file nor a block dev.",name);
-    geo_get(geo,S_ISREG(st.st_mode) ? st.st_dev : st.st_rdev,user_dev,1);
+    geo->dev = S_ISREG(st.st_mode) ? st.st_dev : st.st_rdev;
+    geo_get(geo, geo->dev, user_dev, 1);
     geo->file = S_ISREG(st.st_mode);
     geo->boot = 0;
 #ifndef FIGETBSZ
@@ -549,16 +594,15 @@
 int geo_open_boot(GEOMETRY *geo,char *name)
 {
     struct stat st;
-    dev_t dev;
 
     if (stat(name,&st) < 0) die("stat %s: %s",name,strerror(errno));
     if (!S_ISREG(st.st_mode) && !S_ISBLK(st.st_mode))
 	die("%s: neither a reg. file nor a block dev.",name);
-    dev = S_ISREG(st.st_mode) ? st.st_dev : st.st_rdev;
-    if (MAJOR(dev) == MAJOR_FD) geo->fd = 0;
+    geo->dev = S_ISREG(st.st_mode) ? st.st_dev : st.st_rdev;
+    if (MAJOR(geo->dev) == MAJOR_FD) geo->fd = 0;
     else if ((geo->fd = open(name,O_NOACCESS)) < 0)
 	    die("open %s: %s",name,strerror(errno));
-    geo_get(geo,dev,-1,0);
+    geo_get(geo, geo->dev, -1, 0);
     geo->file = S_ISREG(st.st_mode);
     geo->boot = 1;
     geo->spb = 1;
@@ -600,6 +643,15 @@
 	if (ioctl(geo->fd,FIBMAP,&block) < 0) pdie("ioctl FIBMAP");
 	if (!block) {
 	    return 0;
+	}
+	if (MAJOR(geo->dev) == MAJOR_LVM) {
+	    struct lv_bmap lbm;
+
+	    lbm.lv_dev = geo->dev;
+	    lbm.lv_block = block;
+
+	    lvm_bmap(&lbm);
+	    block = lbm.lv_block;
 	}
     }
     sector = block*geo->spb+((offset/SECTOR_SIZE) % geo->spb);
diff -ru lilo-21.6.1/geometry.h lilo-21.6.1a/geometry.h
--- lilo-21.6.1/geometry.h	Sat Nov  6 14:09:40 1999
+++ lilo-21.6.1a/geometry.h	Tue Jan 23 18:16:09 2001
@@ -16,6 +16,7 @@
     int spb; /* sectors per block */
     int fd,file;
     int boot; /* non-zero after geo_open_boot */
+    dev_t dev;
 } GEOMETRY;
 
 typedef struct _dt_entry {
diff -ru lilo-21.6.1/lilo.h lilo-21.6.1a/lilo.h
--- lilo-21.6.1/lilo.h	Thu Sep 21 17:18:50 2000
+++ lilo-21.6.1a/lilo.h	Tue Jan 23 14:49:59 2001
@@ -39,8 +39,9 @@
 #define MAJOR_IDE4	34 /* IDE on fourth interface */
 #define MAJOR_ESDI	36 /* PS/2 ESDI drives */
 #define MAJOR_DAC960	48 /* First Mylex DAC960 PCI RAID controller */
-#define MAJOR_IDE5	55 /* IDE on fifth interface */
+#define MAJOR_IDE5	56 /* IDE on fifth interface */
 #define MAJOR_IDE6	57 /* IDE on sixth interface */
+#define MAJOR_LVM	58 /* Logical Volume Manager devices */
 #define COMPAQ_SMART2_MAJOR	72 /* First Smart/2 Major */
 
 #define MAX_IMAGES      ((SECTOR_SIZE*2-2)/sizeof(IMAGE_DESCR))


-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
