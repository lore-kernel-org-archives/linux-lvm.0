From: Miquel van Smoorenburg <miquels@cistron.nl>
Message-ID: <20040226162952.GA14231@cistron.nl>
References: <1qJVx-75K-15@gated-at.bofh.it> <1r6fH-3L8-11@gated-at.bofh.it> <1r6S4-6cv-1@gated-at.bofh.it> <403D02E3.4070208@tmr.com> <c1j4mb$gmd$1@news.cistron.nl> <20040225162431.1f08365d.akpm@osdl.org> <20040226103704.GA13717@traveler.cistron.net> <20040226024714.768e3c71.akpm@osdl.org> <20040226105120.GC7580@suse.de> <20040226162810.GA13985@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040226162810.GA13985@cistron.nl>
Subject: [linux-lvm] PATCH: bdi_congested-dm.patch (was: Re: IO scheduler, queue depth, nr_requests)
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 26 11:28:06 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thornber@redhat.com
Cc: Jens Axboe <axboe@suse.de>, Andrew Morton <akpm@osdl.org>, piggin@cyberone.com.au, linux-lvm@redhat.com

According to Miquel van Smoorenburg:
> Okay here you go.
> bdi_congested-core.patch

Here's the dm part:

bdi_congested-dm.patch

--- linux-2.6.3.orig/drivers/md/dm.h	2004-02-04 04:43:45.000000000 +0100
+++ linux-2.6.3-congested_fn/drivers/md/dm.h	2004-02-26 14:22:41.000000000 +0100
@@ -115,6 +115,7 @@ struct list_head *dm_table_get_devices(s
 int dm_table_get_mode(struct dm_table *t);
 void dm_table_suspend_targets(struct dm_table *t);
 void dm_table_resume_targets(struct dm_table *t);
+int dm_table_any_congested(struct dm_table *t, int bdi_bits);
 
 /*-----------------------------------------------------------------
  * A registry of target types.
--- linux-2.6.3.orig/drivers/md/dm-table.c	2004-02-04 04:44:59.000000000 +0100
+++ linux-2.6.3-congested_fn/drivers/md/dm-table.c	2004-02-26 14:22:30.000000000 +0100
@@ -857,6 +857,20 @@ void dm_table_resume_targets(struct dm_t
 	}
 }
 
+int dm_table_any_congested(struct dm_table *t, int bdi_bits)
+{
+	struct list_head *d, *devices;
+	int r = 0;
+ 
+	devices = dm_table_get_devices(t);
+	for (d = devices->next; d != devices; d = d->next) {
+		struct dm_dev *dd = list_entry(d, struct dm_dev, list);
+		request_queue_t *q = bdev_get_queue(dd->bdev);
+		r |= bdi_congested(&q->backing_dev_info, bdi_bits);
+	}
+ 
+	return r;
+}
 
 EXPORT_SYMBOL(dm_get_device);
 EXPORT_SYMBOL(dm_put_device);
--- linux-2.6.3.orig/drivers/md/dm.c	2004-02-22 13:52:15.000000000 +0100
+++ linux-2.6.3-congested_fn/drivers/md/dm.c	2004-02-26 14:26:57.000000000 +0100
@@ -526,6 +526,18 @@ static int dm_request(request_queue_t *q
 	return 0;
 }
 
+static int dm_any_congested(void *congested_data, int bdi_bits)
+{
+	int r;
+	struct mapped_device *md = congested_data;
+ 
+	down_read(&md->lock);
+	r = dm_table_any_congested(md->map, bdi_bits);
+	up_read(&md->lock);
+ 
+	return r;
+}
+
 /*-----------------------------------------------------------------
  * A bitset is used to keep track of allocated minor numbers.
  *---------------------------------------------------------------*/
@@ -608,6 +620,8 @@ static struct mapped_device *alloc_dev(u
 	}
 
 	md->queue->queuedata = md;
+	md->queue->backing_dev_info.congested_fn = dm_any_congested;
+	md->queue->backing_dev_info.congested_data = md;
 	blk_queue_make_request(md->queue, dm_request);
 
 	md->io_pool = mempool_create(MIN_IOS, mempool_alloc_slab,
