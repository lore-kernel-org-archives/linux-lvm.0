Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1J22Hi19964
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 21:02:17 -0500
Message-ID: <403418FA.2070202@cyberone.com.au>
From: Nick Piggin <piggin@cyberone.com.au>
MIME-Version: 1.0
References: <20040216131609.GA21974@cistron.nl> <20040216133047.GA9330@suse.de> <20040217145716.GE30438@traveler.cistron.net> <20040218235243.GA30621@drinkel.cistron.nl> <4034104F.5040002@cyberone.com.au> <20040219015207.GC30621@drinkel.cistron.nl>
In-Reply-To: <20040219015207.GC30621@drinkel.cistron.nl>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: IO scheduler, queue depth, nr_requests
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
Date: Thu Feb 19 09:00:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Miquel van Smoorenburg <miquels@cistron.nl>
Cc: Jens Axboe <axboe@suse.de>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, Joe Thornber <thornber@redhat.com>


Miquel van Smoorenburg wrote:

>On Thu, 19 Feb 2004 02:24:31, Nick Piggin wrote:
>
>>Miquel van Smoorenburg wrote:
>>
>>
>>>I found out what causes this. It's get_request_wait().
>>>
>>>When the request queue is full, and a new request needs to be created,
>>>__make_request() blocks in get_request_wait().
>>>
>>>Another process wakes up first (pdflush / process submitting I/O itself /
>>>xfsdatad / etc) and sends the next bio's to __make_request().
>>>In the mean time some free requests have become available, and the bios
>>>are merged into a new request. Those requests are submitted to the device.
>>>
>>>Then, get_request_wait() returns but the bio is not mergeable anymore -
>>>and that results in a backwards seek, severely limiting the I/O rate.
>>>
>>>
>>The "batching" logic there should allow a process to submit
>>a number of requests even above the nr_requests limit to
>>prevent this interleave and context switching.
>>
>>Are you using tagged command queueing? What depth?
>>
>
>No, I'm not using tagged command queueing. The 3ware controller is not a
>real scsi controller, the driver just emulates one. It's a raid5 controller
>that drives SATA disks. It has an internal request queue ("can_queu")
>of 254 outstanding commands.
>

This is what I mean by tagged command queueing.

> Because that is way bigger than nr_requests
>this happens - if I set nr_requests to 512, the problem goes away. But
>that shouldn't happen ;)
>
>

What shouldn't happen?

>I'm preparing a proof-of-concept patch now, if it works and I don't wedge
>the remote machine I'm testing this on I'll post it in a few minutes.
>
>

I'm not very happy with forcing a process to sleep _after_ it
has submitted a request... but I'd be interested to see exactly
what your patch does.

By far the best option is to use appropriately sized queues.
The below patch is a start, but it unfortunately doesn't help
drivers which use private queueing implementations.

http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.3/2.6.3-mm1/broken-out/scale-nr_requests.patch
