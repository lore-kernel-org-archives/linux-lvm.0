Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1J311i01622
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 22:01:01 -0500
Message-ID: <403424A4.3090007@cyberone.com.au>
From: Nick Piggin <piggin@cyberone.com.au>
MIME-Version: 1.0
References: <20040216131609.GA21974@cistron.nl> <20040216133047.GA9330@suse.de> <20040217145716.GE30438@traveler.cistron.net> <20040218235243.GA30621@drinkel.cistron.nl> <20040218172622.52914567.akpm@osdl.org> <20040219021159.GE30621@drinkel.cistron.nl>
In-Reply-To: <20040219021159.GE30621@drinkel.cistron.nl>
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
Date: Thu Feb 19 09:11:55 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Miquel van Smoorenburg <miquels@cistron.nl>
Cc: Andrew Morton <akpm@osdl.org>, axboe@suse.de, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, thornber@redhat.com


Miquel van Smoorenburg wrote:

>
>No, I'm actually referring to a struct request. I'm logging this in the
>SCSI layer, in scsi_request_fn(), just after elv_next_request(). I have
>in fact logged all the bio's submitted to __make_request, and the output
>of the elevator from elv_next_request(). The bio's are submitted sequentially,
>the resulting requests aren't. But this is because nr_requests is 128, while
>the 3ware device has a queue of 254 entries (no tagging though). Upping
>nr_requests to 512 makes this go away ..
>
>That shouldn't be necessary though. I only see this with LVM over 3ware-raid5,
>not on the 3ware-raid5 array directly (/dev/sda1). And it gets less troublesome
>with a lot of debugging (unless I set nr_requests lower again), which points
>to a timing issue.
>
>

So the problem you are seeing is due to "unlucky" timing between
two processes submitting IO. And the very efficient mechanisms
(merging, sorting) we have to improve situations exactly like this
is effectively disabled. And to make it worse, it appears that your
controller shits itself on this trivially simple pattern.

Your hack makes a baby step in the direction of per *process*
request limits, which I happen to be an advocate of. As it stands
though, I don't like it.

Jens has the final say when it comes to the block layer though.
