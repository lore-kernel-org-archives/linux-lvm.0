From: Andres Salomon <dilinger@mp3revolution.net>
Message-ID: <20021019213851.GA6900@chunk.voxel.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
Subject: [linux-lvm] [PATCH] dm-2.5-unstable patches
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
Date: Sat Oct 19 16:39:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

07.patch
 [dm-hash]
 There doesn't appear to be any reason for the hash tables to be
 dynamically allocated; this just seems to require extra init and
 teardown code.  So, make them a fixed size, and remove some
 unnecessary code.

08.patch
 [dm-hash]
 wli started a reasonable trend w/ hash.h; move the hash functions
 there.  The string stuff should stay (unless someone has a
 faster/better string hashing algorithm).  Note that I changed
 HASH_MULT to GOLDEN_PRIME_RATIO.
 The kdev_t hashing stuff is temporary, until kdev_t is removed.  I'm
 not sure how its shortness will affect hash_long(), but it's not worth
 researching.

09.patch
 [disk_alloc]
 Stop dm from oopsing under 2.5; the gendisk structure isn't being
 properly initialized.  I'm not too comfortable w/ the block code yet.


More patches to follow, once they're debugged...

-- 
It's not denial.  I'm just selective about the reality I accept.
	-- Bill Watterson

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="07.patch"

--- a/drivers/md/dm-hash.c	2002-10-18 20:09:50.000000000 -0400
+++ b/drivers/md/dm-hash.c	2002-10-18 20:10:19.000000000 -0400
@@ -28,9 +28,9 @@
 #define NUM_BUCKETS 64
 #define MASK_BUCKETS (NUM_BUCKETS - 1)
 #define HASH_MULT 2654435387U
-static struct list_head *_dev_buckets;
-static struct list_head *_name_buckets;
-static struct list_head *_uuid_buckets;
+static struct list_head _dev_buckets[NUM_BUCKETS];
+static struct list_head _name_buckets[NUM_BUCKETS];
+static struct list_head _uuid_buckets[NUM_BUCKETS];
 
 /*
  * Guards access to all three tables.
@@ -43,44 +43,20 @@
  *---------------------------------------------------------------*/
 void dm_hash_exit(void)
 {
-	kfree(_dev_buckets);
-	kfree(_name_buckets);
-	kfree(_uuid_buckets);
-}
-
-static struct list_head *alloc_buckets(void)
-{
-	struct list_head *buckets;
-	unsigned int i, len;
-
-	len = NUM_BUCKETS * sizeof(struct list_head);
-	buckets = kmalloc(len, GFP_KERNEL);
-	if (buckets)
-		for (i = 0; i < NUM_BUCKETS; i++)
-			INIT_LIST_HEAD(buckets + i);
-
-	return buckets;
+	/* nothing */
 }
 
 int dm_hash_init(void)
 {
-	_dev_buckets = alloc_buckets();
-	if (!_dev_buckets)
-		goto bad;
+	int i;
 
-	_name_buckets = alloc_buckets();
-	if (!_name_buckets)
-		goto bad;
-
-	_uuid_buckets = alloc_buckets();
-	if (!_uuid_buckets)
-		goto bad;
+	for (i = 0; i < NUM_BUCKETS; i++) {
+		INIT_LIST_HEAD(&_dev_buckets[i]);
+		INIT_LIST_HEAD(&_name_buckets[i]);
+		INIT_LIST_HEAD(&_uuid_buckets[i]);
+	}
 
 	return 0;
-
- bad:
-	dm_hash_exit();
-	return -ENOMEM;
 }
 
 

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="08.patch"

--- a/include/linux/hash.h	2002-10-18 20:19:00.000000000 -0400
+++ b/include/linux/hash.h	2002-10-18 23:46:42.000000000 -0400
@@ -55,4 +55,15 @@
 {
 	return hash_long((unsigned long)ptr, bits);
 }
+
+static inline unsigned long hash_str(const char *str, unsigned int bits)
+{
+	unsigned long hash = 0;
+
+	while (*str)
+		hash = (hash + (unsigned long) *str++) * GOLDEN_RATIO_PRIME;
+
+	return hash & ((1<<bits) - 1);
+}
+
 #endif /* _LINUX_HASH_H */
--- a/drivers/md/dm-hash.c	2002-10-18 20:20:40.000000000 -0400
+++ b/drivers/md/dm-hash.c	2002-10-18 23:57:26.000000000 -0400
@@ -15,6 +15,7 @@
  */
 
 #include <linux/list.h>
+#include <linux/hash.h>
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 
@@ -26,8 +27,7 @@
 };
 
 #define NUM_BUCKETS 64
-#define MASK_BUCKETS (NUM_BUCKETS - 1)
-#define HASH_MULT 2654435387U
+#define NUM_BITS 6
 static struct list_head _dev_buckets[NUM_BUCKETS];
 static struct list_head _name_buckets[NUM_BUCKETS];
 static struct list_head _uuid_buckets[NUM_BUCKETS];
@@ -61,36 +61,13 @@
 
 
 /*-----------------------------------------------------------------
- * Hash functions
- *---------------------------------------------------------------*/
-static inline unsigned int hash_dev(kdev_t dev)
-{
-	return (HASHDEV(dev) * HASH_MULT) & MASK_BUCKETS;
-}
-
-/*
- * We're not really concerned with the str hash function being
- * fast since it's only used by the ioctl interface.
- */
-static unsigned int hash_str(const char *str)
-{
-	unsigned int h = 0;
-
-	while (*str)
-		h = (h + (unsigned int) *str++) * HASH_MULT;
-
-	return h & MASK_BUCKETS;
-}
-
-
-/*-----------------------------------------------------------------
  * Code for looking up the device by kdev_t.
  *---------------------------------------------------------------*/
 static struct hash_cell *__get_dev_cell(kdev_t dev)
 {
 	struct list_head *tmp;
 	struct hash_cell *hc;
-	unsigned int h = hash_dev(dev);
+	unsigned int h = hash_long((unsigned long) kdev_t_to_nr(dev), NUM_BITS);
 
 	list_for_each (tmp, _dev_buckets + h) {
 		hc = list_entry(tmp, struct hash_cell, list);
@@ -152,7 +129,7 @@
 {
 	struct list_head *tmp, *buckets;
 	struct hash_cell *hc;
-	unsigned int h = hash_str(str);
+	unsigned int h = hash_str(str, NUM_BITS);
 
 	buckets = uuid ? _uuid_buckets : _name_buckets;
 	list_for_each (tmp, buckets + h) {
@@ -247,13 +224,13 @@
 	if (__get_dev_cell(md->dev))
 		goto bad;
 
-	list_add(&dev_cell->list, _dev_buckets + hash_dev(md->dev));
+	list_add(&dev_cell->list, _dev_buckets + hash_long((unsigned long) kdev_t_to_nr(md->dev), NUM_BITS));
 
 	if (__get_str_cell(md->name, 0)) {
 		list_del(&dev_cell->list);
 		goto bad;
 	}
-	list_add(&name_cell->list, _name_buckets + hash_str(md->name));
+	list_add(&name_cell->list, _name_buckets + hash_str(md->name, NUM_BITS));
 
 	if (md->uuid) {
 		if (__get_str_cell(md->uuid, 1)) {
@@ -261,7 +238,7 @@
 			list_del(&dev_cell->list);
 			goto bad;
 		}
-		list_add(&uuid_cell->list, _uuid_buckets + hash_str(md->uuid));
+		list_add(&uuid_cell->list, _uuid_buckets + hash_str(md->uuid, NUM_BITS));
 	}
 	up_write(&_hash_lock);
 
@@ -370,7 +347,7 @@
 	list_del(&hc->list);
 	old_name = hc->md->name;
 	hc->md->name = new_name;
-	list_add(&hc->list, _name_buckets + hash_str(new_name));
+	list_add(&hc->list, _name_buckets + hash_str(new_name, NUM_BITS));
 
 	up_write(&_hash_lock);
 	kfree(old_name);

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="09.patch"

--- linux-2.5.44/drivers/md/dm.c.orig	2002-10-19 15:49:21.000000000 -0400
+++ linux-2.5.44/drivers/md/dm.c	2002-10-19 15:50:58.000000000 -0400
@@ -12,6 +12,7 @@
 #include <linux/blkpg.h>
 #include <linux/bio.h>
 #include <linux/mempool.h>
+#include <linux/genhd.h>
 
 #define DEFAULT_READ_AHEAD 64
 
@@ -709,6 +710,7 @@
 {
 	int r;
 	struct mapped_device *md;
+	struct gendisk *disk;
 
 	r = check_name(name);
 	if (r)
@@ -734,6 +736,10 @@
 	if (r)
 		goto bad;
 
+	disk = alloc_disk(1);
+	if (!disk)
+		goto bad;
+	md->disk = *disk;
 	md->disk.major = _major;
 	md->disk.first_minor = minor(md->dev);
 	md->disk.minor_shift = 0;

--n8g4imXOkfNTN/H1--
