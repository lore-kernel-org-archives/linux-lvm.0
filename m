Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1K1fRi26085
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 20:41:27 -0500
Message-ID: <40356599.3080001@cyberone.com.au>
From: Nick Piggin <piggin@cyberone.com.au>
MIME-Version: 1.0
References: <20040216133047.GA9330@suse.de>	<20040217145716.GE30438@traveler.cistron.net>	<20040218235243.GA30621@drinkel.cistron.nl>	<20040218172622.52914567.akpm@osdl.org>	<20040219021159.GE30621@drinkel.cistron.nl>	<20040218182628.7eb63d57.akpm@osdl.org>	<20040219101519.GG30621@drinkel.cistron.nl>	<20040219101915.GJ27190@suse.de>	<20040219205907.GE32263@drinkel.cistron.nl>	<40353E30.6000105@cyberone.com.au>	<20040219235303.GI32263@drinkel.cistron.nl>	<40355F03.9030207@cyberone.com.au> <20040219172656.77c887cf.akpm@osdl.org>
In-Reply-To: <20040219172656.77c887cf.akpm@osdl.org>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [PATCH] per process request limits (was Re: IO scheduler, queue
 depth, nr_requests)
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
Date: Thu Feb 19 20:40:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@osdl.org>
Cc: miquels@cistron.nl, axboe@suse.de, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, thornber@redhat.com


Andrew Morton wrote:

>Nick Piggin <piggin@cyberone.com.au> wrote:
>
>>Even with this patch, it might still be a good idea to allow
>>pdflush to disregard the limits...
>>
>
>Has it been confirmed that pdflush is blocking in get_request_wait()?  I
>guess that can happen very occasionally because we don't bother with any
>locking around there but if it's happening a lot then something is bust.
>
>

Miquel's analysis is pretty plausible, but I'm not sure if
he's confirmed it or not, Miquel? Even if it isn't happening
a lot, and something isn't bust it might be a good idea to
do this.
