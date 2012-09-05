Message-ID: <50477429.8080204@xs4all.net>
Date: Wed, 05 Sep 2012 17:47:53 +0200
From: Miquel van Smoorenburg <mikevs@xs4all.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090405080007020006010304"
Subject: [linux-lvm] automatically filter disks with imsm or ddf superblocks
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
To: linux-lvm@redhat.com
Cc: Miquel van Smoorenburg <mikevs@xs4all.net>, Alasdair G Kergon <agk@redhat.com>

This is a multi-part message in MIME format.
--------------090405080007020006010304
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

An earlier version of this patch was sent to the debian bugsystem (bug 
684712). I am now submitting this as an RFC to the upstream maintainers.

The linux md raid subsystem supports more than just MD formatted 
superblocks - it also works with DDF and IMSM (Intel Matrix RAID) 
superblocks.

Because of that I added reckognition of those types of superblocks to 
lvm, similar to what is already being done for md.

Note that dev-ddf.c and dev-imsm.c have "Copyright: Miquel van 
Smoorenburg" headers.. it looks like lvm only has redhat copyrighted 
stuff in it. Feel free to remove my copyright there, and/or add redhat 
copyright. The contents of those files aren't really original anyway, 
mostly copied from dev-md.c.

Questions:
- mdadm calls this format "imsm", should we keep that name or use
   "matrix", or perhaps "(Intel) RST" since Intel renamed "matrix
   raid" to "Rapid Storage Technology" last year.
- right now the md_component_detection configuration option also
   turns on/off ddf and imsm detection. I think that is fine as in
   linux it is the "md" driver that supports those formats. Or should
   this option be renamed, or perhaps different options for each
   superblock type (not my preference).

Thanks

Mike.

--------------090405080007020006010304
Content-Type: text/x-patch;
 name="filter-md-ddf-imsm.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="filter-md-ddf-imsm.patch"

diff -ruN orig/LVM2.2.02.97/lib/Makefile.in LVM2.2.02.97/lib/Makefile.in
--- orig/LVM2.2.02.97/lib/Makefile.in	2012-08-07 23:05:15.000000000 +0200
+++ LVM2.2.02.97/lib/Makefile.in	2012-09-03 16:31:49.526124693 +0200
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
--- orig/LVM2.2.02.97/lib/device/dev-ddf.c	1970-01-01 01:00:00.000000000 +0100
+++ LVM2.2.02.97/lib/device/dev-ddf.c	2012-09-03 16:31:49.510124426 +0200
@@ -0,0 +1,67 @@
+/*
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
+};
+
+/*
+ * Returns -1 on error
+ */
+int dev_is_ddf(struct device *dev, uint64_t *sb)
+{
+	struct ddf_header hdr;
+	uint32_t crc;
+	int ret = 0;
+	uint64_t size, sb_offset;
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
+	sb_offset = size - 512;
+	if (dev_read(dev, sb_offset, 512, &hdr) &&
+	    (hdr.magic == xlate32(DDF_MAGIC))) {
+		crc = hdr.crc;
+		hdr.crc = 0xffffffff;
+		if (xlate32(calc_crc(0, (const uint8_t *)&hdr, 512)) == crc)
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
--- orig/LVM2.2.02.97/lib/device/dev-imsm.c	1970-01-01 01:00:00.000000000 +0100
+++ LVM2.2.02.97/lib/device/dev-imsm.c	2012-09-03 16:31:49.510124426 +0200
@@ -0,0 +1,53 @@
+/*
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
+	int ret = 0;
+	uint64_t size, sb_offset;
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
+	sb_offset = size - 1024;
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
--- orig/LVM2.2.02.97/lib/device/device.h	2012-08-07 23:05:15.000000000 +0200
+++ LVM2.2.02.97/lib/device/device.h	2012-09-03 16:31:49.510124426 +0200
@@ -101,6 +101,8 @@
 
 /* Does device contain md superblock?  If so, where? */
 int dev_is_md(struct device *dev, uint64_t *sb);
+int dev_is_ddf(struct device *dev, uint64_t *sb);
+int dev_is_imsm(struct device *dev, uint64_t *sb);
 int dev_is_swap(struct device *dev, uint64_t *signature);
 int dev_is_luks(struct device *dev, uint64_t *signature);
 unsigned long dev_md_stripe_width(const char *sysfs_dir, struct device *dev);
diff -ruN orig/LVM2.2.02.97/lib/filters/filter-md.c LVM2.2.02.97/lib/filters/filter-md.c
--- orig/LVM2.2.02.97/lib/filters/filter-md.c	2012-08-07 23:05:15.000000000 +0200
+++ LVM2.2.02.97/lib/filters/filter-md.c	2012-09-03 16:31:49.510124426 +0200
@@ -23,14 +23,24 @@
 		      struct device *dev)
 {
 	int ret;
-	
+	char *type;
+
 	if (!md_filtering())
 		return 1;
 	
+	type = "md";
 	ret = dev_is_md(dev, NULL);
+	if (ret == 0) {
+		type = "ddf";
+		ret = dev_is_ddf(dev, NULL);
+	}
+	if (ret == 0) {
+		type = "imsm";
+		ret = dev_is_imsm(dev, NULL);
+	}
 
 	if (ret == 1) {
-		log_debug("%s: Skipping md component device", dev_name(dev));
+		log_debug("%s: Skipping %s component device", dev_name(dev), type);
 		return 0;
 	}
 
diff -ruN orig/LVM2.2.02.97/lib/metadata/metadata.c LVM2.2.02.97/lib/metadata/metadata.c
--- orig/LVM2.2.02.97/lib/metadata/metadata.c	2012-08-07 23:05:15.000000000 +0200
+++ LVM2.2.02.97/lib/metadata/metadata.c	2012-09-03 16:31:49.510124426 +0200
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
--- orig/LVM2.2.02.97/man/lvm.conf.5.in	2012-08-07 23:05:15.000000000 +0200
+++ LVM2.2.02.97/man/lvm.conf.5.in	2012-09-03 16:34:21.044670793 +0200
@@ -130,8 +130,9 @@
 .IP
 \fBmd_component_detection\fP \(em If set to 1, LVM2 will ignore devices
 used as components of software RAID (md) devices by looking for md
-superblocks. This doesn't always work satisfactorily e.g. if a device
-has been reused without wiping the md superblocks first.
+superblocks, ddf superblocks, and imsm (Intel Matrix Raid) superblocks.
+This doesn't always work satisfactorily e.g. if a device
+has been reused without wiping the raid superblocks first.
 .IP
 \fBmd_chunk_alignment\fP \(em If set to 1, and a Physical Volume is placed
 directly upon an md device, LVM2 will align its data blocks with the

--------------090405080007020006010304--
