Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1K0Gki32288
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 19:16:46 -0500
Message-ID: <403551BD.2050901@cyberone.com.au>
From: Nick Piggin <piggin@cyberone.com.au>
MIME-Version: 1.0
References: <20040216133047.GA9330@suse.de> <20040217145716.GE30438@traveler.cistron.net> <20040218235243.GA30621@drinkel.cistron.nl> <20040218172622.52914567.akpm@osdl.org> <20040219021159.GE30621@drinkel.cistron.nl> <20040218182628.7eb63d57.akpm@osdl.org> <20040219101519.GG30621@drinkel.cistron.nl> <20040219101915.GJ27190@suse.de> <20040219205907.GE32263@drinkel.cistron.nl> <40353E30.6000105@cyberone.com.au> <20040219235303.GI32263@drinkel.cistron.nl>
In-Reply-To: <20040219235303.GI32263@drinkel.cistron.nl>
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
Date: Thu Feb 19 19:15:07 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Miquel van Smoorenburg <miquels@cistron.nl>
Cc: Jens Axboe <axboe@suse.de>, Andrew Morton <akpm@osdl.org>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, thornber@redhat.com


Miquel van Smoorenburg wrote:

>On Thu, 19 Feb 2004 23:52:32, Nick Piggin wrote:
>
>>
>>Miquel van Smoorenburg wrote:
>>
>
...

>>>Note that this is not an issue of '2 processes writing to 1 file', really.
>>>It's one process and pdflush writing the same dirty pages of the same file.
>>>
>>pdflush is a process though, that's all that matters.
>>
>
>I understand that when the two processes are unrelated, the patch as I
>sent it will do the wrong thing.
>
>But the thing is, you get this:
>
>- "dd" process writes requests
>- pdflush triggers to write dirty pages
>- too many pages are dirty so "dd" blocks as well to write synchronously
>- "dd" process triggers "queue full" but gets marked as "batching" so
>  can continue (get_request)
>- pdflush tries to submit one bio and gets blocked (get_request_wait)
>- "dd" continues, but that one bio from pdflush remains stuck for a while
>
>

The batching logic can probably all be ripped out with per
process limits. It's too complex anyway really.

>That's stupid, that one bio from pdflush should really be allowed on
>the queue, since "dd" is adding requests from the same source to it
>anyway.
>
>

But the whole reason it is getting blocked in the first place
is because your controller is sucking up all your requests.
The whole problem is not a problem if you use properly sized
queues.

I'm a bit surprised that it wasn't working well with a controller
queue depth of 64 and 128 nr_requests. I'll give you a per process
request limit patch to try in a minute.

>Perhaps writes from pdflush should be handled differently to prevent
>this specific case ?
>
>Say, if pdflush adds request #128, don't mark it as batching, but
>let it block. The next process will be the one marked as batching
>and can continue. If pdflush tries to add a request > 128, allow it,
>but _then_ block it.
>
>Would something like that work ? Would it be a good idea to never mark
>a pdflush process as batching, or would that have a negative impact
>for some things ?
>
>

It's hard to know. Maybe a better solution would be to allow pdflush
to be exempt from the limits entirely as long as it tries not to write
to congested queues (which is what it does)...
