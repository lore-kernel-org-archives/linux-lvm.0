Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103132055.f2DKt4t05316@webber.adilger.int>
Subject: Re: [linux-lvm] Changing device numbers.
In-Reply-To: <003301c0ac47$0ed576e0$0f01a8c0@myplace.net> from Bas at "Mar 13,
 2001 09:24:35 pm"
Date: Tue, 13 Mar 2001 13:55:04 -0700 (MST)
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

Bas writes:
> Because since I removed a couple of LVs and created a few, lilo seems to
> have some trouble when it's told that root=/dev/rootvg/root. (this number
> has changed). Plus I think it looks a lot "nicer" ...

You have two significant problems:

1) The most important problem is that it is IMPOSSIBLE for LILO to boot
   from a striped LV (or MD RAID 0 for that matter).  No matter what you
   do, this will not be fixed, because the BIOS cannot handle a kernel
   image on multiple disks.

2) The next problem is that LILO doesn't support booting from an LV (yet).
   I posted a patch to lvm-devel with a fix for LILO, and if you are using
   the current CVS LVM kernel patch, you _can_ boot from an LV, but not
   a striped LV.

3) No matter what you do with LVM, you still need to follow the limitations
   that LILO already has - BIOS accessible drive, use "lba32" option for
   kernel images above 1024 cylinders, etc.  LILO _should_ give you a
   warning or error if these are broken, even with LVM.  However, with an
   LVM /boot partition, it is not always clear how things are layed out
   on disk (or at least less so than with DOS partitions).

"Niceness" has nothing to do with it.  LILO is complaining about not
recognizing device "58:15" (or whatever), but it would also complain about
device "58:0" until you apply the LILO patch.  After that, it will work no
matter what you do, as long as LILO is happy with where the kernel is
physically located on disk.

Here is the LILO patch again.  The LVM patch is in beta6.  If you use it
with anything older than beta3, it will crash your system.

Cheers, Andreas

PS - it would be interesting if you tried a patched LILO on your current
     setup (with striped LV) before you fix it.  I want to know if checks
     for a kernel over multiple devices is working (geo->base_dev test).
==========================================================================
diff -ru lilo-21.6.1/geometry.c lilo-21.6.1a/geometry.c
--- lilo-21.6.1/geometry.c	Sat Dec 16 15:09:21 2000
+++ lilo-21.6.1a/geometry.c	Wed Mar  7 23:30:10 2001
@@ -39,6 +39,18 @@
 #endif
 #endif
 
+struct lv_bmap {
+    __u32 lv_block;
+    __u16 lv_dev;
+};
+
+#ifndef LV_BMAP
+#define LV_BMAP				_IOWR(0xfe, 0x30, 1)
+#endif
+#ifndef LVM_GET_IOP_VERSION
+#define LVM_GET_IOP_VERSION		_IOR(0xfe, 0x98, 1)
+#endif
+
 #ifndef HDIO_GETGEO
 #define HDIO_GETGEO HDIO_REQ
 #endif
@@ -265,6 +277,39 @@
 }
 
 
+void lvm_bmap(struct lv_bmap *lbm)
+{
+    DEVICE dev;
+    static int lvmfd = -1;
+    static dev_t last_dev = 0;
+
+    if (lbm->lv_dev != last_dev) {
+	char lvm_char[] = "/dev/lvm";
+	unsigned short iop;
+
+	if (lvmfd != -1)
+	    close(lvmfd);
+
+	if ((lvmfd = open(lvm_char, lbm->lv_dev, O_RDONLY)) < 0)
+	    die("can't open LVM char device %s\n", lvm_char);
+
+	if (ioctl(lvmfd, LVM_GET_IOP_VERSION, &iop) < 0)
+	    die("LVM_GET_IOP_VERSION failed on %s\n", lvm_char);
+
+	if (iop < 10)
+	    die("LVM IOP %d not supported for booting\n", iop);
+	close(lvmfd);
+
+	lvmfd = dev_open(&dev, lbm->lv_dev, O_RDONLY);
+	if (lvmfd < 0)
+	    die("can't open LVM block device %#x\n", lbm->lv_dev);
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
@@ -421,6 +472,28 @@
     DT_ENTRY *walk;
     int inherited,keep_cyls;
 
+    /*
+     * Find underlying device (PV) for LVM.  It is OK if the underlying
+     * PV is really an MD RAID1 device, because the geometry of the RAID1
+     * device is exactly the same as the underlying disk, so FIBMAP and
+     * LV_BMAP will return the correct block numbers regardless of MD.
+     */
+    if (MAJOR(device) == MAJOR_LVM)
+    {
+	struct lv_bmap lbmA, lbmB;
+
+#define DIFF 10
+	lbmA.lv_dev = lbmB.lv_dev = device;
+	lbmA.lv_block = 0;
+	lbmB.lv_block = DIFF;
+
+	lvm_bmap(&lbmA);
+	lvm_bmap(&lbmB);
+	if (lbmB.lv_block - lbmA.lv_block != DIFF)
+	    die("This version of LVM does not support boot LVs");
+	device = geo->base_dev = lbmA.lv_dev;
+    }
+    /* Find underlying device for MD RAID */
     if (MAJOR(device) == MD_MAJOR) {
         char mdxxx[11];
 	int md_fd, pass;
@@ -523,7 +592,8 @@
     if (fstat(geo->fd,&st) < 0) die("fstat %s: %s",name,strerror(errno));
     if (!S_ISREG(st.st_mode) && !S_ISBLK(st.st_mode))
 	die("%s: neither a reg. file nor a block dev.",name);
-    geo_get(geo,S_ISREG(st.st_mode) ? st.st_dev : st.st_rdev,user_dev,1);
+    geo->dev = S_ISREG(st.st_mode) ? st.st_dev : st.st_rdev;
+    geo_get(geo, geo->dev, user_dev, 1);
     geo->file = S_ISREG(st.st_mode);
     geo->boot = 0;
 #ifndef FIGETBSZ
@@ -549,16 +619,15 @@
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
@@ -596,6 +667,18 @@
 	if (ioctl(geo->fd,FIBMAP,&block) < 0) pdie("ioctl FIBMAP");
 	if (!block) {
 	    return 0;
 	}
+    }
+    if (MAJOR(geo->dev) == MAJOR_LVM) {
+	struct lv_bmap lbm;
+
+	lbm.lv_dev = geo->dev;
+	lbm.lv_block = block;
+
+	lvm_bmap(&lbm);
+	if (lbm.lv_dev != geo->base_dev)
+	    die("LVM boot LV cannot be on multiple PVs\n");
+	block = lbm.lv_block;
     }
     sector = block*geo->spb+((offset/SECTOR_SIZE) % geo->spb);
     sector += geo->start;
diff -ru lilo-21.6.1/geometry.h lilo-21.6.1a/geometry.h
--- lilo-21.6.1/geometry.h	Sat Nov  6 14:09:40 1999
+++ lilo-21.6.1a/geometry.h	Wed Mar  7 23:20:30 2001
@@ -16,6 +16,7 @@
     int spb; /* sectors per block */
     int fd,file;
     int boot; /* non-zero after geo_open_boot */
+    dev_t dev, base_dev;
 } GEOMETRY;
 
 typedef struct _dt_entry {
diff -ru lilo-21.6.1/lilo.h lilo-21.6.1a/lilo.h
--- lilo-21.6.1/lilo.h	Thu Sep 21 17:18:50 2000
+++ lilo-21.6.1a/lilo.h	Tue Jan 23 14:49:59 2001
@@ -41,6 +41,7 @@
 #define MAJOR_DAC960	48 /* First Mylex DAC960 PCI RAID controller */
 #define MAJOR_IDE5	55 /* IDE on fifth interface */
 #define MAJOR_IDE6	57 /* IDE on sixth interface */
+#define MAJOR_LVM	58 /* Logical Volume Manager devices */
 #define COMPAQ_SMART2_MAJOR	72 /* First Smart/2 Major */
 
 #define MAX_IMAGES      ((SECTOR_SIZE*2-2)/sizeof(IMAGE_DESCR))
 			  /* maximum number of images */
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
