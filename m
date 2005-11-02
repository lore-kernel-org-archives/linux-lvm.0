Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jA203rvl026378
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2005 00:03:53 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EX66b-0004M3-OY
	for linux-lvm@redhat.com; Wed, 02 Nov 2005 00:03:53 +0000
Date: Wed, 2 Nov 2005 00:03:53 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm2 snapshot BREAKS on 2nd snapshot
Message-ID: <20051102000353.GH26394@agk.surrey.redhat.com>
References: <1130861002.4970.3.camel@jgs4.ino.pvt>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1130861002.4970.3.camel@jgs4.ino.pvt>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Nov 01, 2005 at 08:03:21AM -0800, James G. Sack (jim) wrote:
> I get this kcopyd BUG (and consequent Oops)

Here's a related patch to try from Jan Blunck.
  [The fix still needs moving into bio_list_merge() not its caller.]

If things keep to schedule, there'll be new userspace activation
code around the end of this week aimed at avoiding
snapshot failures locking up machines, and I'll be back dealing
with the outstanding kernel patches (including this one) by the 
middle of next week.

Alasdair


Index: linux-2.6/drivers/md/dm-snap.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-snap.c
+++ linux-2.6/drivers/md/dm-snap.c
@@ -588,7 +588,13 @@ static struct bio *__flush_bios(struct p
 	/* This is fine as long as kcopyd is single-threaded. If kcopyd
 	 * becomes multi-threaded, we'll need some locking here.
 	 */
-	bio_list_merge(&sibling->origin_bios, &pe->origin_bios);
+	if (pe->origin_bios.head)
+		bio_list_merge(&sibling->origin_bios, &pe->origin_bios);
+	else {
+		printk(KERN_ERR "%s(%s,%d): exception with NULL origin bio\n",
+		       __FUNCTION__, current->comm, current->pid);
+		dump_stack();
+	}
 
 	return NULL;
 }
@@ -927,7 +933,7 @@ static void list_merge(struct list_head 
 
 static int __origin_write(struct list_head *snapshots, struct bio *bio)
 {
-	int r = 1, first = 1;
+	int r = 1;
 	struct dm_snapshot *snap;
 	struct exception *e;
 	struct pending_exception *pe, *last = NULL;
@@ -981,6 +987,8 @@ static int __origin_write(struct list_he
 	 * Now that we have a complete pe list we can start the copying.
 	 */
 	if (last) {
+		int first = 1;
+
 		pe = last;
 		do {
 			down_write(&pe->snap->lock);
Index: linux-2.6/drivers/md/dm-bio-list.h
===================================================================
--- linux-2.6.orig/drivers/md/dm-bio-list.h
+++ linux-2.6/drivers/md/dm-bio-list.h
@@ -21,6 +21,8 @@ static inline void bio_list_init(struct 
 
 static inline void bio_list_add(struct bio_list *bl, struct bio *bio)
 {
+	BUG_ON(!bio);
+
 	bio->bi_next = NULL;
 
 	if (bl->tail)
@@ -33,6 +35,10 @@ static inline void bio_list_add(struct b
 
 static inline void bio_list_merge(struct bio_list *bl, struct bio_list *bl2)
 {
+	BUG_ON(!bl2);
+	BUG_ON(!bl2->head);
+	BUG_ON(!bl2->tail);
+
 	if (bl->tail)
 		bl->tail->bi_next = bl2->head;
 	else


----- End forwarded message -----
