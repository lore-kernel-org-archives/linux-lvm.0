Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBAMAH116646
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 17:10:17 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBAMA9is029916
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 17:10:09 -0500
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id 815E224FAD
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 15:10:05 -0700 (MST)
Date: Sat, 10 Dec 2005 15:10:05 -0700
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
In-Reply-To: <20051210202232.GG3103@mjk.myfqdn.de>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



--On December 10, 2005 9:22:32 PM +0100 Marc-Jano Knopp=20
<pub_ml_lvm@marc-jano.de> wrote:


> Thanks for the detailled explanation!

I try not to say something without actual experience and technical details =

to back it up. :)

>
> Yes, I would *love* to use a totally new file system with a new,
> dynamic, good design, but - just as many others - had my experiences
> with ReiserFS and it will take a *lot* of time for ReiserFS to restore
> confidence. So for now, I'll probably stay with ext3, with which I had
> no problems so far.
>
> JFS/XFS should also both be capable of growing, XFS of online-growth,
> IIRC.

XFS has terrible unpredictable performance in production.  Also it has very=
=20
bad behavior when recovering from crashes, often times it's tools totally=20
fail to clean the filesystem.  It also needs larger kernel stacks because=20
of some of the really deep call trees, so when you use it with LVM or MD it=
=20
can oops unless you use the larger kernel stacks.  We also have had=20
problems with the quota system but the details on that have faded.

I've had far better reliability and performance out of ReiserFS in=20
production (late 2.4 series... 2.4.20+, currently 2.4.25, with some patches=
=20
on most of our larger systems) than XFS.  I've not had any close experience=
=20
with JFS.

XFS is also very biased towards streaming rather than random I/O=20
performance in our experience.

XFS may be a proven filesystem, but it has not yet been proven in Linux'=20
implementation.  That said, all of the filesystems have their own quirks=20
and shortcomings.  We had a corruption problem with our CX200 that caused=20
our ReiserFS to lose most of it's tails.  Really it was the CX200 (EMC=20
Clariion) fault, but it felt (And still does) at the time that ReiserFS=20
could've or atleast should've been able to save more of the tail data that =

it lost.  It didn't lose any files, just a the tails.

>
>
> Gru=C3=9F
>
>   Marc-Jano
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler
