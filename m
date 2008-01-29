Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0TGGQYK030195
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 11:16:26 -0500
Received: from scidubsmtp03.stercomm.com (scidubsmtp03.stercomm.com
	[209.95.244.153])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0TGG5h5012452
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 11:16:05 -0500
Received: from IWDUBCORMSG002.sci.local (iwdubcormsg002.sci.local
	[10.105.142.32])
	by boamail2.stercomm.com (Postfix) with ESMTP id 20BD333BE7
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 11:16:54 -0500 (EST)
Subject: Re: [linux-lvm] LVM limits?
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <200801291004.m0TA4Zrm030681@beta.mvs.co.il>
References: <479DAD35.1080209@cesca.es> <479E2BEF.1090703@cesca.es>
	<1201541894.30560.24.camel@behemoth.csg.stercomm.com>
	<200801281801.m0SI10Xi010185@beta.mvs.co.il>
	<1C8CF1EA1A5B5940B81B0710B2A4C9385030AC683C@an-ex.ActiveNetwerx.int>
	<200801282338.m0SNcjbP024435@beta.mvs.co.il>
	<1201566433.30560.65.camel@behemoth.csg.stercomm.com>
	<200801291004.m0TA4Zrm030681@beta.mvs.co.il>
Content-Transfer-Encoding: 7bit
Date: Tue, 29 Jan 2008 10:16:03 -0600
Message-Id: <1201623363.30560.69.camel@behemoth.csg.stercomm.com>
Mime-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2008-01-29 at 12:04 +0200, Ehud Karni wrote:
> I think this is quiet off topic, so this is my last reply.
> 
> On Mon, 28 Jan 2008 18:27:13 Chris Cox wrote:
> >
> > Let's say you want to make a copy of your 5TB filesystem... how long
> > does that take?
> >
> > My point (washed away in silly talk) is that operations on large
> > filesytems can take a VERY long time.  Just looking at the (very)
> > trivial examples and not looking that the problem at a whole doesn't
> > solve the problem (as much as we'd like to think that it does).
> 
> I agree to your basic point, but what is your solution ?
> Even if you have distributed FSs, you still have to back it all,
> keep its integrity and manage it somehow. I don't see how it is
> a lesser problem.

The solution... create and use multiple filesystems rather than
one big  one.

> 
> The basic problem is that the data we hold grows faster than the
> software/hardware capabilities (or they are unreasonably priced).

It's growing much, much faster.

Can you imagine if every machine at a 10,000 person shop had
one of those inexpensive terabyte drives... AND somehow they
manage to fill the space up... let's say 50% ... AND then you
have to back it all up?

It's not just a large filesystem problem...

:)
