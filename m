Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0FA5IW9026842
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 05:05:18 -0500
Received: from buexe.b-5.de (buexe.b-5.de [84.19.0.30])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0FA3Ban028861
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 05:03:12 -0500
Received: from alanya.lupe-christoph.de (alanya.lupe-christoph.de
	[172.17.0.19])
	by buexe.b-5.de (8.13.8/8.13.8/b-5/buexe-3.6.3) with ESMTP id
	n0FA3Bst000679
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 11:03:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by alanya.lupe-christoph.de (Postfix) with ESMTP id 054D42C0B7
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 11:03:06 +0100 (CET)
Received: from alanya.lupe-christoph.de ([127.0.0.1])
	by localhost (alanya.lupe-christoph.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Ew+krmjC+Axd for <linux-lvm@redhat.com>;
	Thu, 15 Jan 2009 11:03:05 +0100 (CET)
Date: Thu, 15 Jan 2009 11:03:05 +0100
From: Lupe Christoph <lupe@lupe-christoph.de>
Subject: Re: [linux-lvm] Allocation maps of a mirrored LV?
Message-ID: <20090115100305.GM21131@lupe-christoph.de>
References: <20090113100902.GJ21131@lupe-christoph.de>
	<b072968d0901141258n12aaea7nbccf0700bdda4512@mail.gmail.com>
	<20090115083656.GL21131@lupe-christoph.de>
	<496F0233.7040101@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <496F0233.7040101@redhat.com>
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
To: linux-lvm@redhat.com

On Thursday, 2009-01-15 at 10:30:27 +0100, Jaroslav Stava wrote:
> Lupe Christoph wrote:
>> I can't find an option for pvs that prints the allocation map, nor for
>> vgs. Any suggestions?

> Try
> lvs VG -a --segments -o +devices
> that should print all the information you need.

<hug>Jaroslav, you're right!</hug>

Actually, I don't need segment information, so I can omit --segment. The
command that gives me what I can use is

lvs testvg --separator : --noheadings --all -o +devices

The "-a" or "--all" option is the key. Thanks a lot for this! Now that I
know what to look for, I find it in lvs --help. But not in the manpages.
Guess where I looked :-(

Lupe Christoph
-- 
| There is no substitute for bad design except worse design.                   |
| /me                                                                          |
