Received: from localhost (unknown [10.33.36.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B5C4692AF
	for <linux-lvm@redhat.com>; Mon, 18 Dec 2017 17:49:16 +0000 (UTC)
Date: Mon, 18 Dec 2017 17:49:15 +0000
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20171218174915.snuf5ctm4ud5naye@reti>
References: <CAM2wQBvP-h9GSTYLk_69rYVL=WEsPyvL0KsH+gqBBPJ_10J75A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM2wQBvP-h9GSTYLk_69rYVL=WEsPyvL0KsH+gqBBPJ_10J75A@mail.gmail.com>
Subject: Re: [linux-lvm] lvm filter regex format
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Dec 18, 2017 at 05:16:14PM +0000, Thanos Makatos wrote:
> I'm trying to be very specific in the global_filter of lvm.conf and
> ignore devices under /dev/mapper of the format
> '^/dev/mapper/[a-z0-9]{14}$', however the repetition count '{14}' does
> not seem to be honored?
> 
> Currently I have to repeat '[a-z0-9]' fourteen times, which works but
> it's a bit ugly.
> 
> Does the filter use some standarized regex format?

It's a custom engine that I wrote which matches all the regexs in the
filters at the same time (so is pretty fast).  Looking at the header here:

   https://github.com/jthornber/lvm2-ejt/blob/master/libdm/regex/parse_rx.h

It seems to support just catenation, |, *, +, ?, [<charset>], ^ and $

Out of interest why are you using the length of the device name as a discriminator?

- Joe
