Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7EDUbRx005529
	for <linux-lvm@redhat.com>; Tue, 14 Aug 2007 09:30:37 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.186])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7EDUYL7028781
	for <linux-lvm@redhat.com>; Tue, 14 Aug 2007 09:30:34 -0400
From: Kay Sievers <kay.sievers@vrfy.org>
Content-Type: multipart/mixed; boundary="=-9fJ0BVESzF4zFoTKj7SM"
Date: Tue, 14 Aug 2007 15:34:01 +0200
Message-Id: <1187098441.4312.28.camel@lov.localdomain>
Mime-Version: 1.0
Subject: [linux-lvm] [patch] support /sys/block being symlinks instead of
	directories
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-9fJ0BVESzF4zFoTKj7SM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,
this patch removes the assumption that device directories in /sys are
always real directories. With the work-in-progress unification of all
sysfs devices, they will show up as symlinks pointing into a single
device tree if the kernel does not set CONFIG_SYSFS_DEPRECATED.

It also adds direct support for a future "block as a class", which will
not have any hierarchy to recurse to find all block devices.

 $ diffstat  lvm2-future-proof-sysfs.patch
 filter-sysfs.c |   91 +++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 56 insertions(+), 35 deletions(-)

Thanks,
Kay


--=-9fJ0BVESzF4zFoTKj7SM
Content-Disposition: inline; filename=lvm2-future-proof-sysfs.patch
Content-Type: text/x-patch; name=lvm2-future-proof-sysfs.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

--- lib/filters/filter-sysfs.c.orig	2007-08-11 11:51:59.000000000 +0200
+++ lib/filters/filter-sysfs.c	2007-08-12 15:23:21.000000000 +0200
@@ -20,12 +20,14 @@
 
 #include <dirent.h>
 
-static int _locate_sysfs_blocks(const char *proc, char *path, size_t len)
+static int _locate_sysfs_blocks(const char *proc, char *path, size_t len,
+				int *sys_depth)
 {
 	char proc_mounts[PATH_MAX];
-	int r = 0;
 	FILE *fp;
 	char *split[4], buffer[PATH_MAX + 16];
+	const char *sys_mnt = NULL;
+	struct stat info;
 
 	if (!*proc) {
 		log_verbose("No proc filesystem found: skipping sysfs filter");
@@ -46,10 +48,7 @@
 	while (fgets(buffer, sizeof(buffer), fp)) {
 		if (dm_split_words(buffer, 4, 0, split) == 4 &&
 		    !strcmp(split[2], "sysfs")) {
-			if (dm_snprintf(path, len, "%s/%s", split[1],
-					 "block") >= 0) {
-				r = 1;
-			}
+			sys_mnt = split[1];
 			break;
 		}
 	}
@@ -57,7 +56,34 @@
 	if (fclose(fp))
 		log_sys_error("fclose", proc_mounts);
 
-	return r;
+	if (!sys_mnt) {
+		log_error("Failed to find sysfs mount point");
+		return 0;
+	}
+
+	if (dm_snprintf(path, len, "%s/%s", sys_mnt,
+			"subsystem/block/devices") >= 0) {
+		if (stat(path, &info) >= 0) {
+			*sys_depth = 0;
+			return 1;
+		}
+	}
+
+	if (dm_snprintf(path, len, "%s/%s", sys_mnt, "class/block") >= 0) {
+		if (stat(path, &info) >= 0) {
+			*sys_depth = 0;
+			return 1;
+		}
+	}
+
+	if (dm_snprintf(path, len, "%s/%s", sys_mnt, "block") >= 0) {
+		if (stat(path, &info) >= 0) {
+			*sys_depth = 1;
+			return 1;
+		}
+	}
+
+	return 0;
 }
 
 /*----------------------------------------------------------------
@@ -72,11 +98,13 @@
 struct dev_set {
 	struct dm_pool *mem;
 	const char *sys_block;
+	int sys_depth;
 	int initialised;
 	struct entry *slots[SET_BUCKETS];
 };
 
-static struct dev_set *_dev_set_create(struct dm_pool *mem, const char *sys_block)
+static struct dev_set *_dev_set_create(struct dm_pool *mem,
+				       const char *sys_block, int sys_depth)
 {
 	struct dev_set *ds;
 
@@ -85,6 +113,7 @@
 
 	ds->mem = mem;
 	ds->sys_block = dm_pool_strdup(mem, sys_block);
+	ds->sys_depth = sys_depth;
 	ds->initialised = 0;
 
 	return ds;
@@ -168,13 +197,13 @@
 /*
  * Recurse through sysfs directories, inserting any devs found.
  */
-static int _read_devs(struct dev_set *ds, const char *dir)
+static int _read_devs(struct dev_set *ds, const char *dir, int sysfs_depth)
 {
         struct dirent *d;
         DIR *dr;
-	unsigned char dtype;
 	struct stat info;
 	char path[PATH_MAX];
+	char file[PATH_MAX];
 	dev_t dev = { 0 };
 	int r = 1;
 
@@ -194,31 +223,22 @@
 			continue;
 		}
 
-		dtype = d->d_type;
-
-		if (dtype == DT_UNKNOWN) {
-			if (lstat(path, &info) >= 0) {
-				if (S_ISLNK(info.st_mode))
-					dtype = DT_LNK;
-				else if (S_ISDIR(info.st_mode))
-					dtype = DT_DIR;
-				else if (S_ISREG(info.st_mode))
-					dtype = DT_REG;
-			}
+		/* devices have a "dev" file */
+		if (dm_snprintf(file, sizeof(file), "%s/dev", path) < 0) {
+			log_error("sysfs path name too long: %s in %s",
+				  d->d_name, dir);
+			continue;
 		}
 
-		if (dtype == DT_DIR) {
-			if (!_read_devs(ds, path)) {
-				r = 0;
-				break;
-			}
+		if (stat(file, &info) >= 0) {
+			/* * recurse if we found a device and expect subdirs */
+			if (sysfs_depth > 0)
+				_read_devs(ds, path, sysfs_depth - 1);
+
+			/* add the device we have found */
+			if (_read_dev(file, &dev))
+				_set_insert(ds, dev);
 		}
-
-		if ((dtype == DT_REG && !strcmp(d->d_name, "dev")))
-			if (!_read_dev(path, &dev) || !_set_insert(ds, dev)) {
-				r = 0;
-				break;
-			}
 	}
 
         if (closedir(dr))
@@ -229,7 +249,7 @@
 
 static int _init_devs(struct dev_set *ds)
 {
-	if (!_read_devs(ds, ds->sys_block)) {
+	if (!_read_devs(ds, ds->sys_block, ds->sys_depth)) {
 		ds->initialised = -1;
 		return 0;
 	}
@@ -267,11 +287,12 @@
 struct dev_filter *sysfs_filter_create(const char *proc)
 {
 	char sys_block[PATH_MAX];
+	int sys_depth;
 	struct dm_pool *mem;
 	struct dev_set *ds;
 	struct dev_filter *f;
 
-	if (!_locate_sysfs_blocks(proc, sys_block, sizeof(sys_block)))
+	if (!_locate_sysfs_blocks(proc, sys_block, sizeof(sys_block), &sys_depth))
 		return NULL;
 
 	if (!(mem = dm_pool_create("sysfs", 256))) {
@@ -279,7 +300,7 @@
 		return NULL;
 	}
 
-	if (!(ds = _dev_set_create(mem, sys_block))) {
+	if (!(ds = _dev_set_create(mem, sys_block, sys_depth))) {
 		log_error("sysfs dev_set creation failed");
 		goto bad;
 	}

--=-9fJ0BVESzF4zFoTKj7SM--
