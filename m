Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1NGVli29471
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2004 11:31:47 -0500
From: Miquel van Smoorenburg <miquels@cistron.nl>
Message-ID: <20040223163106.GA22231@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] dm, dm_table, request_queue
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
Date: Mon Feb 23 11:30:04 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: thornber@redhat.com

I'm implementing congestion queue management as discussed in the
"IO scheduler, queue depth, nr_requests" thread.

I've added a list of "parent queues" to the struct request_queue,
and if the queue is marked as congested, so are the "parent queues".

Now dm needs to be able to say "add this request_queue to the
list of parent" for a device.

But in dm_table, I cannot get at the request_queue of the dm device.
From a quick look at the code, it seems that tables are never changed
"on the fly", but built in advance and then __bind is used to bind
a table to a device.

If that is the case, then I could iterate over the devices in __bind
and call blk_queue_add_parent(dm_dev->bdev->queue, mapped_device->queue)
(and blk_queue_remove_parent in __unbind)

Is that correct ?

And, in general, do you feel this is the correct solution ? Now
request_queues know what their parents are, does that complicate
things like "dm" too much or is it OK ?

Mike.
