Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1J2REi25637
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 21:27:14 -0500
From: Andrew Morton <akpm@osdl.org>
Message-Id: <20040218182628.7eb63d57.akpm@osdl.org>
In-Reply-To: <20040219021159.GE30621@drinkel.cistron.nl>
References: <20040216131609.GA21974@cistron.nl>
	<20040216133047.GA9330@suse.de>
	<20040217145716.GE30438@traveler.cistron.net>
	<20040218235243.GA30621@drinkel.cistron.nl>
	<20040218172622.52914567.akpm@osdl.org>
	<20040219021159.GE30621@drinkel.cistron.nl>
Mime-Version: 1.0
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
Date: Thu Feb 19 09:08:51 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Miquel van Smoorenburg <miquels@cistron.nl>
Cc: axboe@suse.de, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, thornber@redhat.com

Miquel van Smoorenburg <miquels@cistron.nl> wrote:
>
> The thing is, the bio's are submitted perfectly sequentially. It's just that
>  every so often a request (with just its initial bio) gets stuck for a while.
>  Because the bio's after it are merged and sent to the device, it's not
>  possible to merge that stuck request later on when it gets unstuck, because
>  the other bio's have already left the building so to speak.

Oh.  So the raid controller's queue depth is larger than the kernel's.  So
everything gets immediately shovelled into the device and the kernel is
left with nothing to merge the little request against.

Shouldn't the controller itself be performing the insertion?
