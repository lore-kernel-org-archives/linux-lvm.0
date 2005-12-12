Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBC1Es114239
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 20:14:54 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBC1EkHG027077
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 20:14:46 -0500
Date: Sun, 11 Dec 2005 18:14:39 -0700
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <9CD94D4B0F3B63057B4C2BC0@dhcp-2-206.wgops.com>
In-Reply-To: <20051211221539.GA872@frodo>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
	<20051211221539.GA872@frodo>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nathan Scott <nathans@sgi.com>
Cc: linux-xfs@oss.sgi.com, linux-lvm@redhat.com



--On December 12, 2005 9:15:39 AM +1100 Nathan Scott <nathans@sgi.com> 
wrote:


>> XFS has terrible unpredictable performance in production.  Also it has
>> very
>
> What on earth does that mean?  Whatever it means, it doesn't
> sound right - can you back that up with some data please?

The worst problems we had we're likely most strongly related to running out 
of journal transaction space.  When XFS was under high transaction load 
sometimes it would just hang everything syncing meta-data.  From what I 
understand this has supposedly been dealt with, but we were still having 
these issues when we decommissioned the last XFS based server a year ago. 
Another datapoint is the fact we primarily served via NFS, which XFS 
(atleast at the time) still didn't behave great with, I never did see any 
good answers on that as I recall.

>
>> bad behavior when recovering from crashes,
>
> Details?  Are you talking about this post of yours:
> http://oss.sgi.com/archives/linux-xfs/2003-06/msg00032.html

That particular behavior happened a lot.  And it wasn't annoying that it 
happened, so much so that it happened after the system claimed it was 
clean.  Further, yes, that hardware has been fully checked out.  There's 
nothing wrong with the hardware.  I wish there was, that'd make me feel 
better honestly.  The only thing I can reason is bugs in the XFS 
fsck/repair tools, or *maybe* an interaction with XFS and the DAC960 
controller, or NFS.  The fact that XFS has weird interactions with NFS at 
all bugs me, but I don't understand the code involved well enough.  There 
might be a decent reason.

>
> There have been several fixes in this area since that post.
>
>> often times it's tools totally fail to clean the filesystem.
>
> In what way?  Did you open a bug report?
>
>> It also needs larger kernel stacks because
>> of some of the really deep call trees,
>
> Those have been long since fixed as far as we are aware.  Do you
> have an actual example where things can fail?

We pulled it out of production and replaced XFS with Reiser.  At the time 
Reiser was far more mature on Linux.  XFS Linux implementation (in 
combination with other work in the block layer as you mention later) may 
have matured to atleast a similar (possibly moreso) point now.  I've just 
personally lost more data due to XFS than Reiser.  I've also had problems 
with ext3 in the (now distant) past while it was teething still.


>> so when you use it with LVM or MD it
>> can oops unless you use the larger kernel stacks.
>
> Anything can oops in combination with enough stacked device drivers
> (although there has been block layer work to resolve this recently,
> so you should try again with a current kernel...).  If you have an
> actual example of this still happening, please open a bug or at least
> let the XFS developers know of your test case.  Thanks.

That was actually part of the problem.  There was no time, and no hardware, 
to try to reproduce the problem in the lab.  This isn't an XFS problem 
specifically, this is an Open Source problem really....If you encounter a 
bug, and you're unlucky enough to be a bit of an edge case, you better be 
prepared to pony up with hardware and mantime to diagnose and reproduce it 
or it might not get fixed.  Again though, this is common to the whole open 
source community, and not XFS, Linux, LVM, or any other project specific.

Having said that, if you can reproduce it, and get good details, the open 
source community has a far better track record of *really* fixing and 
addressing bugs than any commercial software.

>
>> We also have had
>> problems with the quota system but the details on that have faded.
>
> Seems like details of all the problems you described have faded.
> Your mail seems to me like a bit of a troll ... I guess you had a
> problem or two a couple of years ago (from searching the lists)
> and are still sore.  Can you point me to mailing list reports of
> the problems you're refering to here or bug reports you've opened
> for these issues?  I'll let you know if any of them are still
> relevent.

No, we had dozens actually.  The only ones that were really crippling were 
when XFS would suddenly unmount in the middle of the business day for no 
apparent reason.  Without details bug reports are ignored, and we couldn't 
really provide details or filesystem dumps because there was too much data, 
and we had to get it back online.  We just moved as fast as we could away 
from XFS.  It wasn't just a one day thing, or a week, there was a trail of 
crashes with XFS at the time.  Sometimes the machine was so locked up from 
XFS pulling the rug out that the console was wedged up pretty badly too.

I wanted to provide the information as a data point from the other side as 
it were not get into a pissing match with the XFS developers and community. 
XFS is still young, as is ReiserFS.  and while Reiser is a completely new 
FS and XFS has roots in IRIX and other implementations, their age is 
similar since XFS' Linux implementation is around the same age.  If the 
state has change in the last 6-12 months then so much the better.  The 
facts are that XFS during operation had many problems, and as we pulled it 
out still had many unresolved problems as we replaced it with ReiserFS. 
And Reiser has been flawless except for one problem already mentioned on 
Linux-LVM very clearly caused by an external SAN/RAID problem which EMC has 
corrected (completely as an aside -- anyone running a CX series REALLY 
needs to be on the latest code rev, you might never run into the bug, and 
i'm still not sure exactly which one we hit, there were atleast two that 
could have caused the data corruption, but if you do, it can be ugly).


The best guess that I have as to why we had such a bad time with XFS was 
the XFS+NFS interaction and possibly an old (unknown to me -- this is just 
a guess) bug that may have created some minor underlying corruption that 
the repair tools couldn't fully fix or diagnose may have caused our 
continual (seemingly random) problems.  I don't believe in really random 
problems, atleast not in computers anyway.

>
> cheers.
>
> --
> Nathan
>



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler
