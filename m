Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2VMvsj31290
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 17:57:54 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2VMvrjj001067
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 17:57:53 -0500
Date: Thu, 1 Apr 2004 00:57:51 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM2 Release 2.00.09 / device-mapper Release 1.00.09
Message-ID: <20040331225751.GD13227@percy.comedia.it>
References: <20040331144130.S17377@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <20040331144130.S17377@homer.msp.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, Mar 31, 2004 at 02:41:30PM -0600, Alasdair G Kergon wrote:
>I have generated new tarballs from today's CVS.
I have created a new patch to ignore md component devices,
The previous one was dubbed as 'hardcoded crap', this one implements a
filter and is controlled by an lvm.conf option, so i hope it can get a
warmer welcome.

Reading this list it seems that some people is confused by the current
behaviour, and it is not safe to touch an md component device, which
could happen if we do 'vgscan;vgchange -a y' before the md is activated.
I really think something has to be done to fix it.

3 patches follows,
- first one changes dev-io.c to use lseek64 instead of lseek, so it can
read large (>2GB) devices. It is required by the next one.
- second one implements the ignore md component devices
- third adds a check for zero sized devices in filter.c, i find it
useful since all /dev/md devices can be open()-ed, even if they are not
started, and it is better to ignore them rather than have label.c
complain later. It could be changed to ignore devices smaller than
LABEL_SIZE, but maybe this could be confusing.

Oh, it is based on a checkout of a couple of days ago, so i believe it
will apply to 2.00.09.

Regards,
L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm2-lseek64.patch"

diff -urN LVM2/lib/device/dev-io.c LVM2.work/lib/device/dev-io.c
--- LVM2/lib/device/dev-io.c	2004-03-28 11:25:44.000000000 +0200
+++ LVM2.work/lib/device/dev-io.c	2004-03-30 21:47:45.000000000 +0200
@@ -42,11 +42,7 @@
 #  endif
 #endif
 
-
-/* FIXME Use _llseek for 64-bit
-_syscall5(int,  _llseek,  uint,  fd, ulong, hi, ulong, lo, loff_t *, res, uint, wh);
- if (_llseek((unsigned) fd, (ulong) (offset >> 32), (ulong) (offset & 0xFFFFFFFF), &pos, SEEK_SET) < 0) { 
-*/
+extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
 
 static LIST_INIT(_open_devices);
 
@@ -77,7 +73,7 @@
 		return 0;
 	}
 
-	if (lseek(fd, (off_t) where->start, SEEK_SET) < 0) {
+	if (lseek64(fd, where->start, SEEK_SET) < 0LL) {
 		log_sys_error("lseek", dev_name(where->dev));
 		return 0;
 	}
@@ -319,7 +315,7 @@
 #endif
 
 	if ((flags & O_CREAT) && !(flags & O_TRUNC)) {
-		dev->end = lseek(dev->fd, (off_t) 0, SEEK_END);
+		dev->end = lseek64(dev->fd, 0, SEEK_END);
 	}
 
 	list_add(&_open_devices, &dev->open_list);

--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm2-ignoremd.patch"

diff -urN LVM2/doc/example.conf LVM2.work/doc/example.conf
--- LVM2/doc/example.conf	2004-03-28 11:25:39.000000000 +0200
+++ LVM2.work/doc/example.conf	2004-03-30 22:06:50.000000000 +0200
@@ -27,9 +27,6 @@
     # the device will be accepted or rejected (ignored).  Devices that
     # don't match any patterns are accepted.
 
-    # If using RAID md devices as physical volumes, you should
-    # set up a filter here to reject the constituent devices.
-
     # Remember to run vgscan after you change this parameter to ensure 
     # that the cache file gets regenerated (see below).
 
@@ -48,6 +45,12 @@
     # Use anchors if you want to be really specific
     # filter = [ "a|^/dev/hda8$|", "r/.*/" ]
 
+    # This option tells LVM2 to search for a RAID md superblock inside
+    # every device and to ignore those that contain one.
+    # If using RAID md devices as physical volumes, you should leave
+    # it at 1 or set up a filter to reject the constituent devices.
+    ignore_md_component = 1
+
     # The results of the filtering are cached on disk to avoid
     # rescanning dud devices (which can take a very long time).  By
     # default this cache file is hidden in the /etc/lvm directory.
diff -urN LVM2/include/.symlinks LVM2.work/include/.symlinks
--- LVM2/include/.symlinks	2004-03-28 11:25:39.000000000 +0200
+++ LVM2.work/include/.symlinks	2004-03-30 23:04:43.000000000 +0200
@@ -17,6 +17,7 @@
 ../lib/filters/filter-persistent.h
 ../lib/filters/filter-regex.h
 ../lib/filters/filter-sysfs.h
+../lib/filters/filter-md.h
 ../lib/filters/filter.h
 ../lib/format1/format1.h
 ../lib/format_text/format-text.h
diff -urN LVM2/lib/commands/toolcontext.c LVM2.work/lib/commands/toolcontext.c
--- LVM2/lib/commands/toolcontext.c	2004-03-26 12:44:59.000000000 +0100
+++ LVM2.work/lib/commands/toolcontext.c	2004-03-30 23:27:00.000000000 +0200
@@ -17,6 +17,7 @@
 #include "filter-persistent.h"
 #include "filter-regex.h"
 #include "filter-sysfs.h"
+#include "filter-md.h"
 #include "label.h"
 #include "lvm-file.h"
 #include "format-text.h"
@@ -266,7 +267,7 @@
 	return 1;
 }
 
-#define MAX_FILTERS 3
+#define MAX_FILTERS 4
 
 static struct dev_filter *_init_filter_components(struct cmd_context *cmd)
 {
@@ -300,6 +301,13 @@
 		return NULL;
 	}
 
+	/* filter to skip md components */
+	if (find_config_bool(cmd->cft->root, "devices/ignore_md_component",
+			     DEFAULT_IGNORE_MD)) {
+		if ((filters[nr_filt] = md_filter_create()))
+			nr_filt++;
+	}
+
 	/* only build a composite filter if we really need it */
 	return (nr_filt == 1) ?
 	    filters[0] : composite_filter_create(nr_filt, filters);
diff -urN LVM2/lib/config/defaults.h LVM2.work/lib/config/defaults.h
--- LVM2/lib/config/defaults.h	2004-03-28 11:25:44.000000000 +0200
+++ LVM2.work/lib/config/defaults.h	2004-03-30 21:58:12.000000000 +0200
@@ -20,6 +20,7 @@
 #define DEFAULT_DEV_DIR "/dev"
 #define DEFAULT_PROC_DIR "/proc"
 #define DEFAULT_SYSFS_SCAN 1
+#define DEFAULT_IGNORE_MD 1
 
 #define DEFAULT_LOCK_DIR "/var/lock/lvm"
 #define DEFAULT_LOCKING_LIB "lvm2_locking.so"
diff -urN LVM2/lib/filters/filter-md.c LVM2.work/lib/filters/filter-md.c
--- LVM2/lib/filters/filter-md.c	1970-01-01 01:00:00.000000000 +0100
+++ LVM2.work/lib/filters/filter-md.c	2004-03-31 09:41:34.000000000 +0200
@@ -0,0 +1,71 @@
+/*
+ * Copyright (C) 2004 Luca Berra
+ *
+ * This file is released under the LGPL.
+ */
+
+#include "lib.h"
+#include "metadata.h"
+#include "filter-md.h"
+
+#define MD_SB_MAGIC 0xa92b4efc
+#define MD_RESERVED_BYTES (64 * 1024)
+#define MD_RESERVED_SECTORS (MD_RESERVED_BYTES / SECTOR_SIZE)
+#define MD_NEW_SIZE_SECTORS(x) ((x & ~(MD_RESERVED_SECTORS - 1)) - MD_RESERVED_SECTORS)
+
+
+static int _ignore_md(struct dev_filter *f, struct device *dev)
+{
+	uint64_t sector = 0;
+	uint32_t md_magic;
+
+
+	dev_get_size(dev, &sector);
+	if (sector < MD_RESERVED_SECTORS * 2)
+		return 1; /* we could ignore it since it is obviously too */
+			  /* small, but it is not our job */
+
+	if (!dev_open(dev)) {
+		stack;
+		return 0;
+	}
+
+	sector = MD_NEW_SIZE_SECTORS(sector);
+	sector *= SECTOR_SIZE; 
+	/* check if it is an md component device */
+	if (dev_read(dev, sector, sizeof(uint32_t), &md_magic)) {
+		if (md_magic == MD_SB_MAGIC) {
+			log_very_verbose("%s: Skipping md component device",
+					 dev_name(dev));
+			if (!dev_close(dev))
+				stack;
+			return 0;
+		}
+	}
+
+	if (!dev_close(dev))
+		stack;
+
+	return 1;
+}
+
+static void _destroy(struct dev_filter *f)
+{
+	dbg_free(f);
+}
+
+struct dev_filter *md_filter_create(void)
+{
+	struct dev_filter *f;
+
+	if (!(f = dbg_malloc(sizeof(*f)))) {
+		log_error("md filter allocation failed");
+		return NULL;
+	}
+
+	f->passes_filter = _ignore_md;
+	f->destroy = _destroy;
+	f->private = NULL;
+
+	return f;
+}
diff -urN LVM2/lib/filters/filter-md.h LVM2.work/lib/filters/filter-md.h
--- LVM2/lib/filters/filter-md.h	1970-01-01 01:00:00.000000000 +0100
+++ LVM2.work/lib/filters/filter-md.h	2004-03-30 22:39:27.000000000 +0200
@@ -0,0 +1,15 @@
+/*
+ * Copyright (C) 2004 Luca Berra
+ *
+ * This file is released under the GPL.
+ */
+
+#ifndef _LVM_FILTER_MD_H
+#define _LVM_FILTER_MD_H
+
+#include "config.h"
+#include "dev-cache.h"
+
+struct dev_filter *md_filter_create(void);
+
+#endif
diff -urN LVM2/lib/Makefile.in LVM2.work/lib/Makefile.in
--- LVM2/lib/Makefile.in	2004-03-28 11:25:39.000000000 +0200
+++ LVM2.work/lib/Makefile.in	2004-03-30 23:00:05.000000000 +0200
@@ -29,6 +29,7 @@
 	filters/filter-persistent.c \
 	filters/filter-regex.c \
 	filters/filter-sysfs.c \
+	filters/filter-md.c \
 	filters/filter.c \
 	format_text/archive.c \
 	format_text/export.c \

--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm2-filter-zero.patch"

diff -urN LVM2/lib/filters/filter.c LVM2.work/lib/filters/filter.c
--- LVM2/lib/filters/filter.c	2004-03-28 11:25:44.000000000 +0200
+++ LVM2.work/lib/filters/filter.c	2004-03-31 09:44:02.000000000 +0200
@@ -64,7 +65,7 @@
 static int _passes_lvm_type_device_filter(struct dev_filter *f,
 					  struct device *dev)
 {
-	int fd;
+	uint64_t size = 0;
 	const char *name = dev_name(dev);
 
 	/* Is this a recognised device type? */
@@ -74,15 +75,13 @@
 		return 0;
 	}
 
-	/* Check it's accessible */
-	if ((fd = open(name, O_RDONLY)) < 0) {
-		log_debug("%s: Skipping: open failed: %s", name,
-			  strerror(errno));
+	/* Check it's accessible and not empty */
+	dev_get_size(dev, &size);
+	if (size == 0) {
+		log_debug("%s: Skipping: Cannot open or empty", name);
 		return 0;
 	}
 
-	close(fd);
-
 	return 1;
 }
 

--nVMJ2NtxeReIH9PS--
