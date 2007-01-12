Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0CIbwxo013012
	for <linux-lvm@redhat.com>; Fri, 12 Jan 2007 13:37:59 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.228])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0CIbwvt028678
	for <linux-lvm@redhat.com>; Fri, 12 Jan 2007 13:37:58 -0500
Received: by wx-out-0506.google.com with SMTP id s11so946089wxc
	for <linux-lvm@redhat.com>; Fri, 12 Jan 2007 10:37:57 -0800 (PST)
From: Ming Zhang <blackmagic02881@gmail.com>
In-Reply-To: <45A766F3.A9E3.000B.0@novell.com>
References: <45A766F3.A9E3.000B.0@novell.com>
Date: Fri, 12 Jan 2007 13:37:56 -0500
Message-Id: <1168627076.2805.125.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [dm-devel] [RFC] Out of order snapshot deletion
Reply-To: blackmagic02881@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: device-mapper development <dm-devel@redhat.com>
Cc: evms-devel@lists.sourceforge.net, linux-lvm@redhat.com

On Thu, 2007-01-11 at 22:19 -0700, Vijai Babu Madhavan wrote:
> Hi,
> 
> I thought I would bring this topic in a separate thread so that 
> it can be discussed independently.
> 
> As users start taking a bunch of snapshots and keep them as 
> backups, we see the following use pattern when the snapshots 
> get recycled.
> 
> Different snapshots have different life cycle. When some one 
> decides to keep 'x' snapshots, at the recycle phase, the least 
> recent does not necessarily get deleted.
> 
> As users want to keep the daily snapshots for a much longer period
> than the bi-hourly snapshots. In the same way, weekly snapshots 
> live longer than daily snapshots.
> 
> I think this is pretty much similar to the way the current backup tapes
> are managed.

make sense.

> 
> I want to know if this is the kind of use case that users are having or 
> the developers are thinking.
> 
> The reason why I am posting this is that this out of snapshot deletion
> scenario, poses some interesting challenges in the design on the solution 
> of multiple snapshots that share blocks with each other, as it is a lot easier 
> to design a solution where the least recent gets deleted always.

this does not hold true. for snapshot used as backup purpose, you 100%
can not assume the oldest or newest will be delete first. there is no
such rule.

and possibly, you create one snapshot base on policy and later mount it
and check data consistency. if it turns out to be a bad one, you want to
delete it. then you have no order to follow at all.

ps, any comment on http://sourceware.org/cluster/csnap/? this also try
to solve the current multiple snapshot issues.

thanks

Ming

> 
> Vijai
> 
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
-- 
http://blackmagic02881.wordpress.com/
