Message-ID: <3FF21BE1.9070603@cs.wisc.edu>
From: Mike Christie <michaelc@cs.wisc.edu>
MIME-Version: 1.0
References: <20031229130055.GA30647@cistron.nl> <20031230034239.27950054.akpm@osdl.org>
In-Reply-To: <20031230034239.27950054.akpm@osdl.org>
Content-Type: multipart/mixed;
 boundary="------------020807000803000903020304"
Subject: [linux-lvm] Re: System hangs after echo value > /sys/block/dm-0/queue/nr_requests
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
Date: Thu Jan  1 11:29:05 2004
List-Id: <linux-lvm.redhat.com>
To: Andrew Morton <akpm@osdl.org>
Cc: Miquel van Smoorenburg <miquels@cistron.nl>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, Nick Piggin <piggin@cyberone.com.au>, Jens Axboe <axboe@suse.de>

This is a multi-part message in MIME format.
--------------020807000803000903020304
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Andrew Morton wrote:

> Where queue_requests_store() does wake_up(&rl->wait[READ]);
> 
> It looks like nobody has called blk_init_queue() for this queue and the
> waitqueue head is uninitialised.
> 

DM, MD, rd and loop use blk_alloc_queue and blk_queue_make_request to 
initialize their queue, because they only use the make_request_fn. The 
attached patch prevents the queue from being registered if only 
blk_alloc_queue was called.

Mike Christie

--------------020807000803000903020304
Content-Type: text/plain;
 name="queue_attr.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="queue_attr.patch"

--- linux-2.6.0-orig/drivers/block/ll_rw_blk.c	2003-12-28 23:09:16.000000000 -0800
+++ linux-2.6.0/drivers/block/ll_rw_blk.c	2003-12-30 16:11:00.690504036 -0800
@@ -2902,7 +2902,7 @@ int blk_register_queue(struct gendisk *d
 
 	request_queue_t *q = disk->queue;
 
-	if (!q)
+	if (!q || !q->request_fn)
 		return -ENXIO;
 
 	q->kobj.parent = kobject_get(&disk->kobj);
@@ -2929,7 +2929,7 @@ void blk_unregister_queue(struct gendisk
 {
 	request_queue_t *q = disk->queue;
 
-	if (q) {
+	if (q && q->request_fn) {
 		elv_unregister_queue(q);
 
 		kobject_unregister(&q->kobj);

--------------020807000803000903020304--
