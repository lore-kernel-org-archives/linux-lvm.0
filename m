Date: Sat, 22 Sep 2012 18:37:37 +0200
From: Miquel van Smoorenburg <mikevs@xs4all.net>
Message-ID: <20120922163737.GB6975@xs4all.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [PATCH] automatically filter disks with imsm or ddf
	superblocks, v3
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair G Kergon <agk@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

The only change wrt v2 is that this fixes a small cosmetic bug
in debug output.

#====#

lvm.conf has a setting called md_component_detection, which makes lvm
ignore disks with a linux "md" raid superblock. This patch adds detection
of more raid superblock formats, ddf and imsm.

diff -ruN orig/LVM2.2.02.97/lib/Makefile.in LVM2.2.02.97/lib/Makefile.in
--- orig/LVM2.2.02.97/lib/Makefile.in	2012-08-07 21:05:15.000000000 +0000
+++ LVM2.2.02.97/lib/Makefile.in	2012-09-17 08:38:14.357742657 +0000
@@ -54,6 +54,8 @@
 	device/dev-cache.c \
 	device/dev-io.c \
 	device/dev-md.c \
+	device/dev-ddf.c \
+	device/dev-imsm.c \
 	device/dev-swap.c \
 	device/dev-luks.c \
 	device/device.c \
diff -ruN orig/LVM2.2.02.97/lib/device/dev-ddf.c LVM2.2.02.97/lib/device/dev-ddf.c
--- orig/LVM2.2.02.97/lib/device/dev-ddf.c	1970-01-01 00:00:00.000000000 +0000
+++ LVM2.2.02.97/lib/device/dev-ddf.c	2012-09-17 08:47:21.298861940 +0000
@@ -0,0 +1,69 @@
+/*
+ * Copyright (C) 2004 Luca Berra
+ * Copyright (C) 2004-2008 Red Hat, Inc. All rights reserved.
+ * Copyright (C) 2012 Miquel van Smoorenburg
+ *
+ * This file is part of LVM2.
+ *
+ * This copyrighted material is made available to anyone wishing to use,
+ * modify, copy, or redistribute it subject to the terms and conditions
+ * of the GNU Lesser General Public License v.2.1.
+ *
+ * You should have received a copy of the GNU Lesser General Public License
+ * along with this program; if not, write to the Free Software Foundation,
+ * Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#include "lib.h"
+#include "metadata.h"
+#include "xlate.h"
+#include "crc.h"
+
+#define DDF_MAGIC 0xDE11DE11
+struct ddf_header {
+	uint32_t magic;
+	uint32_t crc;
+	char guid[24];
+	char revision[8];
+	char padding[472];
+} __attribute__ ((packed));
+
+/*
+ * Returns -1 on error
+ */
+int dev_is_ddf(struct device *dev, uint64_t *sb)
+{
+	struct ddf_header hdr;
+	uint64_t size, sb_offset;
+	uint32_t crc;
+	int ret = 0;
+
+	if (!dev_get_size(dev, &size)) {
+		stack;
+		return -1;
+	}
+
+	if (!dev_open_readonly(dev)) {
+		stack;
+		return -1;
+	}
+
+	/* Also calculate CRC so we have at least 8 bytes to check */
+	sb_offset = (size - 1) << SECTOR_SHIFT;
+	if (dev_read(dev, sb_offset, 512, &hdr) &&
+	    xlate32_be(hdr.magic) == DDF_MAGIC) {
+		crc = xlate32_be(hdr.crc);
+		hdr.crc = 0xffffffff;
+		if (calc_crc(0, (const uint8_t *)&hdr, 512) == crc)
+			ret = 1;
+	}
+
+	if (!dev_close(dev))
+		stack;
+
+	if (ret && sb)
+		*sb = sb_offset;
+
+	return ret;
+}
+
diff -ruN orig/LVM2.2.02.97/lib/device/dev-imsm.c LVM2.2.02.97/lib/device/dev-imsm.c
--- orig/LVM2.2.02.97/lib/device/dev-imsm.c	1970-01-01 00:00:00.000000000 +0000
+++ LVM2.2.02.97/lib/device/dev-imsm.c	2012-09-17 08:47:38.319145785 +0000
@@ -0,0 +1,55 @@
+/*
+ * Copyright (C) 2004 Luca Berra
+ * Copyright (C) 2004-2008 Red Hat, Inc. All rights reserved.
+ * Copyright (C) 2012 Miquel van Smoorenburg
+ *
+ * This file is part of LVM2.
+ *
+ * This copyrighted material is made available to anyone wishing to use,
+ * modify, copy, or redistribute it subject to the terms and conditions
+ * of the GNU Lesser General Public License v.2.1.
+ *
+ * You should have received a copy of the GNU Lesser General Public License
+ * along with this program; if not, write to the Free Software Foundation,
+ * Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#include "lib.h"
+#include "metadata.h"
+
+#define IMSM_SIGNATURE "Intel Raid ISM Cfg Sig. "
+#define IMSM_SIG_LEN (strlen(IMSM_SIGNATURE))
+
+/*
+ * Returns -1 on error
+ */
+int dev_is_imsm(struct device *dev, uint64_t *sb)
+{
+	char imsm_signature[IMSM_SIG_LEN];
+	uint64_t size, sb_offset;
+	int ret = 0;
+
+	if (!dev_get_size(dev, &size)) {
+		stack;
+		return -1;
+	}
+
+	if (!dev_open_readonly(dev)) {
+		stack;
+		return -1;
+	}
+
+	sb_offset = (size - 2) << SECTOR_SHIFT;
+	if (dev_read(dev, sb_offset, IMSM_SIG_LEN, imsm_signature) &&
+	    memcmp(imsm_signature, IMSM_SIGNATURE, IMSM_SIG_LEN) == 0)
+		ret = 1;
+
+	if (!dev_close(dev))
+		stack;
+
+	if (ret && sb)
+		*sb = sb_offset;
+
+	return ret;
+}
+
diff -ruN orig/LVM2.2.02.97/lib/device/device.h LVM2.2.02.97/lib/device/device.h
--- orig/LVM2.2.02.97/lib/device/device.h	2012-08-07 21:05:15.000000000 +0000
+++ LVM2.2.02.97/lib/device/device.h	2012-09-17 08:38:14.357742656 +0000
@@ -101,6 +101,8 @@
 
 /* Does device contain md superblock?  If so, where? */
 int dev_is_md(struct device *dev, uint64_t *sb);
+int dev_is_ddf(struct device *dev, uint64_t *sb);
+int dev_is_imsm(struct device *dev, uint64_t *sb);
 int dev_is_swap(struct device *dev, uint64_t *signature);
 int dev_is_luks(struct device *dev, uint64_t *signature);
 unsigned long dev_md_stripe_width(const char *sysfs_dir, struct device *dev);
diff -ruN orig/LVM2.2.02.97/lib/filters/filter-md.c LVM2.2.02.97/lib/filters/filter-md.c
--- orig/LVM2.2.02.97/lib/filters/filter-md.c	2012-08-07 21:05:15.000000000 +0000
+++ LVM2.2.02.97/lib/filters/filter-md.c	2012-09-22 16:24:18.528609536 +0000
@@ -23,20 +23,26 @@
 		      struct device *dev)
 {
 	int ret;
+	const char *sb_type;
 	
 	if (!md_filtering())
 		return 1;
 	
-	ret = dev_is_md(dev, NULL);
+	if ((ret = dev_is_md(dev, NULL)) != 0)
+		sb_type = "md";
+	else if ((ret = dev_is_ddf(dev, NULL)) != 0)
+		sb_type = "ddf";
+	else if ((ret = dev_is_imsm(dev, NULL)) != 0)
+		sb_type = "imsm";
 
 	if (ret == 1) {
-		log_debug("%s: Skipping md component device", dev_name(dev));
+		log_debug("%s: Skipping %s component device", dev_name(dev), sb_type);
 		return 0;
 	}
 
 	if (ret < 0) {
-		log_debug("%s: Skipping: error in md component detection",
-			  dev_name(dev));
+		log_debug("%s: Skipping: error in %s component detection",
+			  dev_name(dev), sb_type);
 		return 0;
 	}
 
diff -ruN orig/LVM2.2.02.97/lib/metadata/metadata.c LVM2.2.02.97/lib/metadata/metadata.c
--- orig/LVM2.2.02.97/lib/metadata/metadata.c	2012-08-07 21:05:15.000000000 +0000
+++ LVM2.2.02.97/lib/metadata/metadata.c	2012-09-17 08:38:14.357742656 +0000
@@ -1392,6 +1392,12 @@
 	if (!_wipe_sb(dev, "software RAID md superblock", name, 4, pp, dev_is_md))
 		goto_bad;
 
+	if (!_wipe_sb(dev, "software RAID imsm superblock", name, 1024, pp, dev_is_imsm))
+		goto_bad;
+
+	if (!_wipe_sb(dev, "RAID ddf superblock", name, 512, pp, dev_is_ddf))
+		goto_bad;
+
 	if (!_wipe_sb(dev, "swap signature", name, 10, pp, dev_is_swap))
 		goto_bad;
 
diff -ruN orig/LVM2.2.02.97/man/lvm.conf.5.in LVM2.2.02.97/man/lvm.conf.5.in
--- orig/LVM2.2.02.97/man/lvm.conf.5.in	2012-08-07 21:05:15.000000000 +0000
+++ LVM2.2.02.97/man/lvm.conf.5.in	2012-09-17 08:44:52.296377375 +0000
@@ -130,8 +130,10 @@
 .IP
 \fBmd_component_detection\fP \(em If set to 1, LVM2 will ignore devices
 used as components of software RAID (md) devices by looking for md
-superblocks. This doesn't always work satisfactorily e.g. if a device
-has been reused without wiping the md superblocks first.
+superblocks, ddf (common raid Disk Data Format) superblocks, and imsm
+(Intel Matrix Raid or Intel RST) superblocks.  This doesn't always work
+satisfactorily e.g. if a device has been reused without wiping the raid
+superblocks first.
 .IP
 \fBmd_chunk_alignment\fP \(em If set to 1, and a Physical Volume is placed
 directly upon an md device, LVM2 will align its data blocks with the
