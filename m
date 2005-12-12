Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBC2SX124296
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 21:28:33 -0500
Received: from omx3.sgi.com (omx3-ext.sgi.com [192.48.171.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBC2SWI1031659
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 21:28:32 -0500
Date: Mon, 12 Dec 2005 13:28:30 +1100
From: Nathan Scott <nathans@sgi.com>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <20051212132830.A7432365@wobbly.melbourne.sgi.com>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
	<20051211221539.GA872@frodo>
	<9CD94D4B0F3B63057B4C2BC0@dhcp-2-206.wgops.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9CD94D4B0F3B63057B4C2BC0@dhcp-2-206.wgops.com>;
	from mloftis@wgops.com on Sun, Dec 11, 2005 at 06:14:39PM -0700
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

On Sun, Dec 11, 2005 at 06:14:39PM -0700, Michael Loftis wrote:
> --On December 12, 2005 9:15:39 AM +1100 Nathan Scott <nathans@sgi.com> 
> The worst problems we had we're likely most strongly related to running out 
> of journal transaction space.  When XFS was under high transaction load 

Can you define "high load" for your scenario?

> sometimes it would just hang everything syncing meta-data.  From what I 

There is no situation in which XFS will "hang everything".  A process
that is modifying the filesystem may be paused briefly waiting for space
to become available in the log, and that involves flushing the in-core
log buffers.  But only processes that need log space will be paused
waiting for that (relatively small) write to complete.  This is also not
a behaviour peculiar to XFS, and with suitable tuning in terms of mkfs/
mount/sysctl parameters, it can be completely controlled.

> understand this has supposedly been dealt with, but we were still having 
> these issues when we decommissioned the last XFS based server a year ago. 

I'd like some more information describing your workload there if
you could provide it.  Thanks.

> Another datapoint is the fact we primarily served via NFS, which XFS 
> (atleast at the time) still didn't behave great with, I never did see any 
> good answers on that as I recall.

Indeed.  Early 2.6 kernels did have XFS/NFS interaction problems,
with NFS using generation number zero as "magic", and XFS using
that as a valid gen number.  That was fixed a long time ago.

> controller, or NFS.  The fact that XFS has weird interactions with NFS at 
> all bugs me, but I don't understand the code involved well enough.  There 
> might be a decent reason.

No, there's no reason, and XFS does not have "wierd interactions"
with NFS.

> >> It also needs larger kernel stacks because
> >> of some of the really deep call trees,
> >
> > Those have been long since fixed as far as we are aware.  Do you
> > have an actual example where things can fail?
> 
> We pulled it out of production and replaced XFS with Reiser.  At the time 
> Reiser was far more mature on Linux.  XFS Linux implementation (in 

Not because of 4K stacks though surely?  That kernel option wasn't around
then I think, and the reiserfs folks have also had a bunch of work to do
in that area too.

> > Seems like details of all the problems you described have faded.
> > Your mail seems to me like a bit of a troll ... I guess you had a
> > problem or two a couple of years ago (from searching the lists)
> > and are still sore.  Can you point me to mailing list reports of
> > the problems you're refering to here or bug reports you've opened
> > for these issues?  I'll let you know if any of them are still
> > relevent.
> 
> No, we had dozens actually.  The only ones that were really crippling were 
> when XFS would suddenly unmount in the middle of the business day for no 
> apparent reason.  Without details bug reports are ignored, and we couldn't 

The NFS issue had the unfortunate side effect of causing filesystem
corruption and hence forced filesystem shutdowns would result.  There
were also bugs on that error handling path, so probably you hit two
independent XFS bugs on a pretty old kernel version.

> I wanted to provide the information as a data point from the other side as 
> it were not get into a pissing match with the XFS developers and community. 

You were claiming long-resolved issues that existed in an XFS version
from an early 2.6 kernel as still relevent.  That is quite misleading,
and doesn't provide useful information to anyone.

cheers.

-- 
Nathan
