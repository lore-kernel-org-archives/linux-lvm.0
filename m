From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM 2.0/Device-Mapper 1.0 update
Message-ID: <20030822161605.X29420@uk.sistina.com>
References: <20030821000539.P29420@uk.sistina.com> <20030821175554.GA1717@gondor.com> <20030821201803.T29420@uk.sistina.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="UoPmpPX/dBe4BELn"
Content-Disposition: inline
In-Reply-To: <20030821201803.T29420@uk.sistina.com>; from agk@uk.sistina.com on Thu, Aug 21, 2003 at 08:18:03PM +0100
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
Date: Fri Aug 22 10:21:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: dm-devel@sistina.com

--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 21, 2003 at 08:18:03PM +0100, Alasdair Kergon wrote:
> Well, many thanks for producing all the diagnostics: 
> I don't know what's wrong yet, but I have managed to
> reproduce your setup on a test machine here and 
> I reproduced the problem 5 minutes ago.
 
I attach a patch which should workaround the problem.

Memory that is still referenced gets freed if pvmove
tries to move more than 8 LV segments at once, so all
pvmove (dm_mirror target) users should apply this patch.

It's in CVS now, and I'll update the tarball on the ftp site
to 1.00.04.

Alasdair
-- 
agk@uk.sistina.com

--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Description: pvmove_8_segments.patch
Content-Disposition: attachment; filename=pvmove_corruption_patch1

Supply #targets when creating a table to avoid needing to extend it later.
--- linux-2.4.21/drivers/md/dm-ioctl.c	Mon Aug 18 21:24:26 2003
+++ linux/drivers/md/dm-ioctl.c	Fri Aug 22 13:49:01 2003
@@ -764,7 +764,7 @@
 	struct hash_cell *hc;
 	struct dm_table *t;
 
-	r = dm_table_create(&t, get_mode(param));
+	r = dm_table_create(&t, get_mode(param), param->target_count);
 	if (r)
 		return r;
 
--- linux-2.4.21/drivers/md/dm-table.c	Tue Aug 19 15:43:50 2003
+++ linux/drivers/md/dm-table.c	Fri Aug 22 14:48:50 2003
@@ -148,7 +148,7 @@
 	return 0;
 }
 
-int dm_table_create(struct dm_table **result, int mode)
+int dm_table_create(struct dm_table **result, int mode, unsigned num_targets)
 {
 	struct dm_table *t = kmalloc(sizeof(*t), GFP_NOIO);
 
@@ -159,8 +159,10 @@
 	INIT_LIST_HEAD(&t->devices);
 	atomic_set(&t->holders, 1);
 
-	/* allocate a single nodes worth of targets to begin with */
-	if (alloc_targets(t, KEYS_PER_NODE)) {
+	if (!num_targets)
+		num_targets = KEYS_PER_NODE;
+
+	if (alloc_targets(t, num_targets)) {
 		kfree(t);
 		t = NULL;
 		return -ENOMEM;
--- linux-2.4.21/drivers/md/dm.h	Sat Jul 12 17:06:52 2003
+++ linux/drivers/md/dm.h	Fri Aug 22 13:50:19 2003
@@ -96,7 +96,7 @@
  * Functions for manipulating a table.  Tables are also reference
  * counted.
  *---------------------------------------------------------------*/
-int dm_table_create(struct dm_table **result, int mode);
+int dm_table_create(struct dm_table **result, int mode, unsigned num_targets);
 
 void dm_table_get(struct dm_table *t);
 void dm_table_put(struct dm_table *t);

--UoPmpPX/dBe4BELn--
