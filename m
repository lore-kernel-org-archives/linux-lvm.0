Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7SJpttD012744
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2006 15:51:55 -0400
Received: from wirenth.dragonhold.org (wirenth.dragonhold.org [217.147.94.178])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7SJpp9Y004482
	for <linux-lvm@redhat.com>; Mon, 28 Aug 2006 15:51:54 -0400
Received: from gwood by wirenth.dragonhold.org with local (Exim 4.50)
	id 1GHn98-0002Qf-3l
	for linux-lvm@redhat.com; Mon, 28 Aug 2006 20:51:46 +0100
Date: Mon, 28 Aug 2006 20:51:46 +0100
From: Graham Wood <clvm@spam.dragonhold.org>
Subject: Re: [linux-lvm] Best way to image devices in an LVM environment
Message-ID: <20060828195146.GD16612@dragonhold.org>
References: <20060827044208.GL1011@strugglers.net>
	<7.0.1.0.2.20060827131640.00fdf818@myrealbox.com>
	<20060827061642.GN1011@strugglers.net>
	<44F1872D.9030408@mattgillen.net>
	<20060828194843.GS1011@strugglers.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060828194843.GS1011@strugglers.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
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

On Mon, Aug 28, 2006 at 07:48:43PM +0000, Andy Smith wrote:
> that lvm2 has had pvresize since 2.02.00 so if I upgrade userland
> tools (my kernel is 2.6.16.19) then would I just need to do a
> pvresize after expanding the block device that my single pv/vg is
> on?
Would it not be easier to just replace with a larger disk - mirror to the same size, and 
have another partition afterwards.

You end up with 2pvs (both mirrored, I would expect), rather than the "nicer" answer of a 
single pv, but as long as the whole thing is then controlled through LVM is there really any 
loss as a result?

Graham
