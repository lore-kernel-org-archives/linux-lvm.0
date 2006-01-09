Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k09I56106585
	for <linux-lvm@redhat.com>; Mon, 9 Jan 2006 13:05:06 -0500
Received: from sccrmhc11.comcast.net (sccrmhc11.comcast.net [63.240.77.81])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k09I4xRH029948
	for <linux-lvm@redhat.com>; Mon, 9 Jan 2006 13:04:59 -0500
Subject: Re: [linux-lvm] Re: more info on the hang with 2.6.15-rc5 
In-reply-to: <17346.40174.865171.160466@dobie.ylee.org> 
References: <E1EpIfb-0001e2-GR@highlab.com> <43C1580B.9020609@tmr.com>
	<E1Evmqw-0001pO-Ng@highlab.com> <43C28E52.8080104@mattgillen.net>
	<43C290D4.5030209@projecthugo.co.uk>
	<17346.40174.865171.160466@dobie.ylee.org>
Date: Mon, 09 Jan 2006 11:05:20 -0700
From: Sebastian Kuzminsky <seb@highlab.com>
Message-Id: <E1Ew1OS-00034G-Ss@highlab.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yeechang Lee <ylee@pobox.com>
Cc: linux-raid@vger.kernel.org, kernel-lists@projecthugo.co.uk, LVM general discussion and development <linux-lvm@redhat.com>

Yeechang Lee <ylee@pobox.com> wrote:
> Matt Darcy <kernel-lists@projecthugo.co.uk> says:
> > Judging from the ammount of problems with this driver it is %90 the
> > driver and %10 raid interaction with the dirver
> >
> > I don't believe this is an LVM issue, more a case of the driver's
> > just not ready for use, so if you use it with raid and lvm you speed
> > up the crash.
> 
> I'm coming into this late, but could your issue be related to
> <URL:https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=167173>?

That problem was fixed or worked around by using 8K kernel stacks instead
of 4K.  Both my kernels (debug & production) use 8K stacks, so I dont
think that's it.

What I get isn't crashes with stack traces & kernel messages like that
bug, I get hard lockups with no output.


-- 
Sebastian Kuzminsky
