Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200106181848.f5IImbxC026404@webber.adilger.int>
Subject: Re: [linux-lvm] LVM and lilo
In-Reply-To: <Pine.LNX.4.33.0106181211400.22455-100000@vie-ac.office.ecetra.com>
 "from Adam Cioccarelli at Jun 18, 2001 12:19:51 pm"
Date: Mon, 18 Jun 2001 12:48:36 -0600 (MDT)
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
To: linux-lvm@sistina.com

Adam Cioccarelli writes:
> Everything went fine but now I would like to modify my lilo.conf and all I
> get is; Fatal: Sorry, don't know how to handle device 0x3a00
> 
> I am using LVM 0.9.1_beta6 and LILO version 21.7-5

You need the LILO patch for LVM.  I have attached it below.  I will NOT
be submitting it to the LILO maintainer until the stock Linus kernel has
something more than the 0.9.1-beta2 LVM kernel code (because it crashes
your kernel instantly), OR the LVM developers say it is OK for me to
submit a kernel patch to Linus to fix this problem (which I'm sure would
be accepted right away because of the terrible secutiry problem it is)...
I have repeatedly said that I would fix this, and have been repeatedly
told "we are working on getting patches to Linus, don't do this".  Oh well.

Cheers, Andreas
=======================  lilo-21.7-5-lvm.diff =========================
diff -ru lilo-21.7.5/geometry.c lilo-21.7.5a/geometry.c
--- lilo-21.7.5/geometry.c	Tue Apr 17 14:38:21 2001
+++ lilo-21.7.5a/geometry.c	Fri Jun  1 23:37:54 2001
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
@@ -278,6 +290,40 @@
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
+	last_dev = lbm->lv_dev;
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
@@ -468,6 +514,34 @@
     DT_ENTRY *walk;
     int inherited,keep_cyls;
 
+    /*
+     * Find underlying device (PV) for LVM.  It is OK if the underlying PV is
+     * really an MD RAID1 device, because the geometry of the RAID1 device is
+     * exactly the same as the underlying disk, so FIBMAP and LV_BMAP will
+     * return the correct block numbers regardless of MD (I think, not tested).
+     *
+     * We do a quick test to see if the LVM LV_BMAP ioctl is working correctly.
+     * It should map the two blocks with the same difference as they were input,
+     * with a constant offset from their original block numbers.  If this is not
+     * the case then LV_BMAP is not working correctly (some widely distributed
+     * kernels did not have working LV_BMAP support, some just oops here).
+     */
+    if (MAJOR(device) == MAJOR_LVM)
+    {
+	struct lv_bmap lbmA, lbmB;
+#define DIFF 255
+
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
         char mdxxx[16];
 	int md_fd, pass;
@@ -574,7 +642,8 @@
     if (fstat(geo->fd,&st) < 0) die("fstat %s: %s",name,strerror(errno));
     if (!S_ISREG(st.st_mode) && !S_ISBLK(st.st_mode))
 	die("%s: neither a reg. file nor a block dev.",name);
-    geo_get(geo,S_ISREG(st.st_mode) ? st.st_dev : st.st_rdev,user_dev,1);
+    geo->dev = S_ISREG(st.st_mode) ? st.st_dev : st.st_rdev;
+    geo_get(geo, geo->dev, user_dev, 1);
     geo->file = S_ISREG(st.st_mode);
     geo->boot = 0;
 #ifndef FIGETBSZ
@@ -600,16 +669,15 @@
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
@@ -652,6 +720,17 @@
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
diff -ru lilo-21.7.5/geometry.h lilo-21.7.5a/geometry.h
--- lilo-21.7.5/geometry.h	Thu Apr  5 21:49:26 2001
+++ lilo-21.7.5a/geometry.h	Fri Jun  1 15:20:19 2001
@@ -16,6 +16,7 @@
     int spb; /* sectors per block */
     int fd,file;
     int boot; /* non-zero after geo_open_boot */
+    dev_t dev, base_dev; /* real device if remapping (LVM, etc) */
 } GEOMETRY;
 
 typedef struct _dt_entry {
diff -ru lilo-21.7.5/lilo.h lilo-21.7.5a/lilo.h
--- lilo-21.7.5/lilo.h	Tue Mar 20 14:30:29 2001
+++ lilo-21.7.5a/lilo.h	Fri Jun  1 15:23:14 2001
@@ -44,6 +45,7 @@
 #define MAJOR_DAC960	48 /* First Mylex DAC960 PCI RAID controller */
 #define MAJOR_IDE5	56 /* IDE on fifth interface */
 #define MAJOR_IDE6	57 /* IDE on sixth interface */
+#define MAJOR_LVM	58 /* Logical Volume Manager block device */
 #define MAJOR_IDE7	88 /* IDE on seventh interface */
 #define MAJOR_IDE8	89 /* IDE on eighth interface */
 #define MAJOR_IDE9	90 /* IDE on ninth interface */

-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
