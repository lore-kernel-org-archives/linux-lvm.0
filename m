Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1MJtNi24357
	for <linux-lvm@redhat.com>; Sun, 22 Feb 2004 14:55:23 -0500
From: Andrew Morton <akpm@osdl.org>
Message-Id: <20040222115504.001384d1.akpm@osdl.org>
In-Reply-To: <20040222140232.GE1375@drinkel.cistron.nl>
References: <20040219205907.GE32263@drinkel.cistron.nl>
	<40353E30.6000105@cyberone.com.au>
	<20040219235303.GI32263@drinkel.cistron.nl>
	<40355F03.9030207@cyberone.com.au>
	<20040219172656.77c887cf.akpm@osdl.org>
	<40356599.3080001@cyberone.com.au>
	<20040219183218.2b3c4706.akpm@osdl.org>
	<20040220144042.GC20917@traveler.cistron.net>
	<20040220145944.GM27549@reti>
	<20040220150013.GY27190@suse.de>
	<20040222140232.GE1375@drinkel.cistron.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [PATCH] bdi_congestion_funp (was: Re: [PATCH] per process
 request limits (was Re: IO scheduler, queue depth, nr_requests))
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
Date: Sun Feb 22 14:55:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Miquel van Smoorenburg <miquels@cistron.net>
Cc: axboe@suse.de, thornber@redhat.com, piggin@cyberone.com.au, miquels@cistron.nl, linux-lvm@sistina.com, linux-kernel@vger.kernel.org

Miquel van Smoorenburg <miquels@cistron.net> wrote:
>
> The pdflush-is-running-on-this-queue bit can probably remain as-is. It's
>  mostly meant to prevent 2 pdflush daemons from running the same queue.
>  I don't see much harm in pdflush #1 running on /dev/md0 which consists
>  of /dev/sda1 and /dev/sdb1 and pdflush #2 running on /dev/sdb2, right ?

Yes, having two pdflushes working the same spindle is a bit pointless but
is presumably fairly harmless.

The most important thing here is to prevent pdflush from blocking on
request exhaustion.  Because while pdflush sleeps on a particular disk, all
the others remain unserviced.
