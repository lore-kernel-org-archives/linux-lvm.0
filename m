Subject: Re: [linux-lvm] Problem with 2.5.x DM + LVM1 metadata
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20030611213456.GC29685@lug-owl.de>
References: <20030611213456.GC29685@lug-owl.de>
Message-Id: <1055423437.1575.2.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Jun 12 08:11:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-lvm@sistina.com

Hi!

> I'm running a machine since quite some time with DM-patches 2.4.x and
> LVM1 metadata PVs/VGs/LVs. It's a Debian box with lvm2-1.95.15 intalled.
> 
> Today, I tried to boot this machine with 2.5.70-bk16. Everything went
> well (most of my machines run 2.5.x since some time, so I'm used to the
> gotchas like modutils<-> module-init-tools etc.), but the 2.5.x DM seems
> so cause problems. During "vgchange -a y" (called by init scripts), one
> of my LVs cannot be activated. Here's the transcript of "/etc/init.d/lvm2
> start" (which basically only consists of the vgchange call):
> ---------------------------------------------------------------------
> Initializing LVM:   /dev/hdc2: open failed: No such device or address
> [...]
>  device-mapper ioctl cmd 2 failed: No such device or address

A cleanup patch somewhere in the -bk kernels introduced a problem.
Either go back to an older kernel or fix it.

Joe Thornber posted a repair fix for this yesterday on the lkml list:

From:	Joe Thornber <thornber@sistina.com>
To:	Linus Torvalds <torvalds@transmeta.com>, Linux Mailing List
<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] dm: Repair persistent minors

Split the dm_create() function into two variants, depending on whether
you want the device to have a specific minor number.  This avoids
the broken overloading of the minor argument to the old dm_create().

--- diff/drivers/md/dm-ioctl.c	2003-06-11 10:31:17.000000000 +0100
+++ source/drivers/md/dm-ioctl.c	2003-06-11 10:32:11.000000000 +0100
@@ -560,7 +560,6 @@
 	int r;
 	struct dm_table *t;
 	struct mapped_device *md;
-	unsigned int minor = 0;
 
 	r = check_name(param->name);
 	if (r)
@@ -577,9 +576,10 @@
 	}
 
 	if (param->flags & DM_PERSISTENT_DEV_FLAG)
-		minor = minor(to_kdev_t(param->dev));
+		r = dm_create_with_minor(minor(to_kdev_t(param->dev)), t, &md);
+	else
+		r = dm_create(t, &md);
 
-	r = dm_create(minor, t, &md);
 	if (r) {
 		dm_table_put(t);
 		return r;
--- diff/drivers/md/dm.c	2003-06-11 10:31:41.000000000 +0100
+++ source/drivers/md/dm.c	2003-06-11 10:32:54.000000000 +0100
@@ -569,7 +569,7 @@
 /*
  * Allocate and initialise a blank device with a given minor.
  */
-static struct mapped_device *alloc_dev(unsigned int minor)
+static struct mapped_device *alloc_dev(unsigned int minor, int
persistent)
 {
 	int r;
 	struct mapped_device *md = kmalloc(sizeof(*md), GFP_KERNEL);
@@ -580,7 +580,7 @@
 	}
 
 	/* get a minor number for the dev */
-	r = (minor < 0) ? next_free_minor(&minor) : specific_minor(minor);
+	r = persistent ? specific_minor(minor) : next_free_minor(&minor);
 	if (r < 0) {
 		kfree(md);
 		return NULL;
@@ -660,13 +660,13 @@
 /*
  * Constructor for a new device.
  */
-int dm_create(unsigned int minor, struct dm_table *table,
-	      struct mapped_device **result)
+static int create_aux(unsigned int minor, int persistent,
+		      struct dm_table *table, struct mapped_device **result)
 {
 	int r;
 	struct mapped_device *md;
 
-	md = alloc_dev(minor);
+	md = alloc_dev(minor, persistent);
 	if (!md)
 		return -ENXIO;
 
@@ -681,6 +681,17 @@
 	return 0;
 }
 
+int dm_create(struct dm_table *table, struct mapped_device **result)
+{
+	return create_aux(0, 0, table, result);
+}
+
+int dm_create_with_minor(unsigned int minor,
+			 struct dm_table *table, struct mapped_device **result)
+{
+	return create_aux(minor, 1, table, result);
+}
+
 void dm_get(struct mapped_device *md)
 {
 	atomic_inc(&md->holders);
--- diff/drivers/md/dm.h	2003-06-11 10:31:27.000000000 +0100
+++ source/drivers/md/dm.h	2003-06-11 10:32:11.000000000 +0100
@@ -51,8 +51,9 @@
  * Functions for manipulating a struct mapped_device.
  * Drop the reference with dm_put when you finish with the object.
  *---------------------------------------------------------------*/
-int dm_create(unsigned int minor, struct dm_table *table,
-	      struct mapped_device **md);
+int dm_create(struct dm_table *table, struct mapped_device **md);
+int dm_create_with_minor(unsigned int minor, struct dm_table *table,
+			 struct mapped_device **md);
 
 /*
  * Reference counting for md.

-- 
Christophe Saout <christophe@saout.de>
