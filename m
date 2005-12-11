Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBBMHa105229
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 17:17:36 -0500
Received: from omx3.sgi.com (omx3-ext.sgi.com [192.48.171.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBBMHSpN027504
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 17:17:29 -0500
Date: Mon, 12 Dec 2005 09:15:39 +1100
From: Nathan Scott <nathans@sgi.com>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <20051211221539.GA872@frodo>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
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
To: Michael Loftis <mloftis@wgops.com>
Cc: linux-xfs@oss.sgi.com, linux-lvm@redhat.com

On Sat, Dec 10, 2005 at 03:10:05PM -0700, Michael Loftis wrote:
> 
> >Thanks for the detailled explanation!
> 
> I try not to say something without actual experience and technical details 
> to back it up. :)

Hmm, you seem to be doing a pretty good job of that here...

> >Yes, I would *love* to use a totally new file system with a new,
> >dynamic, good design, but - just as many others - had my experiences
> >with ReiserFS and it will take a *lot* of time for ReiserFS to restore
> >confidence. So for now, I'll probably stay with ext3, with which I had
> >no problems so far.
> >
> >JFS/XFS should also both be capable of growing, XFS of online-growth,
> >IIRC.
> 
> XFS has terrible unpredictable performance in production.  Also it has very 

What on earth does that mean?  Whatever it means, it doesn't
sound right - can you back that up with some data please?

> bad behavior when recovering from crashes,

Details?  Are you talking about this post of yours:
http://oss.sgi.com/archives/linux-xfs/2003-06/msg00032.html

There have been several fixes in this area since that post.

> often times it's tools totally fail to clean the filesystem.

In what way?  Did you open a bug report?

> It also needs larger kernel stacks because 
> of some of the really deep call trees,

Those have been long since fixed as far as we are aware.  Do you
have an actual example where things can fail?

> so when you use it with LVM or MD it 
> can oops unless you use the larger kernel stacks.

Anything can oops in combination with enough stacked device drivers
(although there has been block layer work to resolve this recently,
so you should try again with a current kernel...).  If you have an
actual example of this still happening, please open a bug or at least
let the XFS developers know of your test case.  Thanks.

> We also have had 
> problems with the quota system but the details on that have faded.

Seems like details of all the problems you described have faded.
Your mail seems to me like a bit of a troll ... I guess you had a
problem or two a couple of years ago (from searching the lists)
and are still sore.  Can you point me to mailing list reports of
the problems you're refering to here or bug reports you've opened
for these issues?  I'll let you know if any of them are still
relevent.

cheers.

-- 
Nathan
