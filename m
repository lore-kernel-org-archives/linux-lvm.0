From: Alasdair G Kergon <agk@uk.sistina.com>
Message-ID: <20030830232657.A13763@uk.sistina.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
Subject: [linux-lvm] dm mirror target (pvmove) fixes
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
Date: Sat Aug 30 17:30:02 2003
List-Id: <linux-lvm.redhat.com>
To: dm-devel@sistina.com
Cc: linux-lvm@sistina.com

--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Some critical fixes to the mirror target (used by pvmove) are attached 
for more people to test before I put out a new tarball incorporating
them.  Until the fixes have received more testing and been applied to 
your machine, you should err on the safe side and not read/write data 
to a logical volume while it is being pvmoved with LVM2.

dm-io.c:
  Add safety checks for some assumptions the code makes.
  Amend do_page() algorithm:
    Avoid 1 << -1 if b is 0    [led to endless loop on s390]
    Avoid doing I/O beyond the supplied page if data is mis-aligned.
      [Led to alignment changes in the first part of a copy - a
       hole in the data, and the last bit chopped off.]

dm-log.c:
  Correct bitset size calculations [accessed beyond allocated memory]

dm-raid1.c:
  Use b_rsector instead of b_blocknr in mapping in case sector has
  already been mapped
    [Caused the wrong device offset to be used sometimes if doing I/O
    to a device during a pvmove i.e. data corruption]
  Increase DM_IO_PAGES to 256.  This and related constants need tuning.
  The current minimum for this constant is 128.
    [It was 64. Depending on copying lengths, the last region to be
    copied may need up to 128 pages and therefore never have been able
    to get enough pages to proceed.  Resulted in the end of status lines 
    saying things like "243/244" and some mirrors never finishing.]

kcopyd.c:
  Refuse to register a client that requests insufficient pages.
    [Intended to detect if 64 was used above.]

dm-ioctl.h:
  Increment version number to 4.0.4-ioctl (2003-08-30)


Alasdair
-- 
agk@uk.sistina.com

--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dm_mirror_misc.patches"

--- linux-2.4.21/drivers/md/dm-io.c	Fri Aug 22 15:48:52 2003
+++ linux/drivers/md/dm-io.c	Sat Aug 30 17:37:44 2003
@@ -204,7 +204,13 @@
 	sector_t b = *block;
 	sector_t blocks_per_page = PAGE_SIZE / block_size;
 	unsigned int this_size; /* holds the size of the current io */
-	unsigned int len;
+	sector_t len;
+
+	if (!blocks_per_page) {
+		DMERR("dm-io: PAGE_SIZE (%lu) < block_size (%u) unsupported",
+		      PAGE_SIZE, block_size);
+		return 0;
+	}
 
 	while ((offset < PAGE_SIZE) && (b != end_block)) {
 		bh = mempool_alloc(_buffer_pool, GFP_NOIO);
@@ -215,10 +221,20 @@
 		 * Block size must be a power of 2 and aligned
 		 * correctly.
 		 */
-		len = end_block - b;
-		this_size = min((sector_t) 1 << log2_floor(b), blocks_per_page);
-		if (this_size > len)
-			this_size = 1 << log2_align(len);
+
+		len = min(end_block - b, blocks_per_page);
+		len = min(len, blocks_per_page - offset / block_size);
+
+		if (!len) {
+			DMERR("dm-io: Invalid offset/block_size (%u/%u).",
+			      offset, block_size);
+			return 0;
+		}
+
+		this_size = 1 << log2_align(len);
+		if (b)
+			this_size = min(this_size,
+					(unsigned) 1 << log2_floor(b));
 
 		/*
 		 * Add in the job offset.
--- linux-2.4.21/drivers/md/dm-log.c	Fri Aug 22 15:48:52 2003
+++ linux/drivers/md/dm-log.c	Sat Aug 30 22:35:06 2003
@@ -153,7 +153,8 @@
 	clog->region_size = region_size;
 	clog->region_count = region_count;
 
-	bitset_size = dm_round_up(region_count >> 3, sizeof(*clog->clean_bits));
+	bitset_size = dm_round_up((region_count + 7) >> 3,
+				  sizeof(*clog->clean_bits));
 	clog->clean_bits = vmalloc(bitset_size);
 	if (!clog->clean_bits) {
 		DMWARN("couldn't allocate clean bitset");
--- linux-2.4.21/drivers/md/dm-raid1.c	Fri Aug 22 15:48:52 2003
+++ linux/drivers/md/dm-raid1.c	Sat Aug 30 22:36:11 2003
@@ -720,11 +720,8 @@
 static void map_buffer(struct mirror_set *ms,
 		       struct mirror *m, struct buffer_head *bh)
 {
-	sector_t bsize = bh->b_size >> 9;
-	sector_t rsector = bh->b_blocknr * bsize;
-
 	bh->b_rdev = m->dev->dev;
-	bh->b_rsector = m->offset + (rsector - ms->ti->begin);
+	bh->b_rsector = m->offset + (bh->b_rsector - ms->ti->begin);
 }
 
 static void do_reads(struct mirror_set *ms, struct buffer_list *reads)
@@ -1048,7 +1045,7 @@
  * For now, #log_params = 1, log_type = "core"
  *
  */
-#define DM_IO_PAGES 64
+#define DM_IO_PAGES 256
 static int mirror_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 {
 	int r;
--- linux-2.4.21/drivers/md/kcopyd.c	Fri Aug 22 15:48:52 2003
+++ linux/drivers/md/kcopyd.c	Sat Aug 30 22:16:41 2003
@@ -582,6 +582,12 @@
 	int r = 0;
 	struct kcopyd_client *kc;
 
+	if (nr_pages * SECTORS_PER_PAGE < SUB_JOB_SIZE * SPLIT_COUNT) {
+		DMERR("kcopyd client requested %u pages: minimum is %lu",
+		      nr_pages, SUB_JOB_SIZE * SPLIT_COUNT / SECTORS_PER_PAGE);
+		return -ENOMEM;
+	}
+
 	kc = kmalloc(sizeof(*kc), GFP_KERNEL);
 	if (!kc)
 		return -ENOMEM;
--- linux-2.4.21/include/linux/dm-ioctl.h	Fri Aug 22 15:48:52 2003
+++ linux/include/linux/dm-ioctl.h	Mon Aug 18 21:08:03 2003
@@ -207,8 +207,8 @@
 
 #define DM_VERSION_MAJOR	4
 #define DM_VERSION_MINOR	0
-#define DM_VERSION_PATCHLEVEL	3
-#define DM_VERSION_EXTRA	"-ioctl (2003-08-22)"
+#define DM_VERSION_PATCHLEVEL	4
+#define DM_VERSION_EXTRA	"-ioctl (2003-08-30)"
 
 /* Status bits */
 #define DM_READONLY_FLAG	(1 << 0) /* In/Out */

--0F1p//8PRICkK4MW--
