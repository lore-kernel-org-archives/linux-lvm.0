Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3CCgaj03906
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2004 08:42:36 -0400
Received: from bucket.localnet (dsl-202-72-149-28.wa.westnet.com.au
	[202.72.149.28])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i3CCgXS0025439
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2004 08:42:34 -0400
Received: from [127.0.0.1] (6to4-localhost [127.0.0.1] (may be forged))
	by bucket.localnet (8.12.8/8.12.8) with ESMTP id i3CChHmn020990
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2004 20:43:18 +0800
Subject: Re: [linux-lvm] snapshots and reiserfs
From: Craig Ringer <craig@postnewspapers.com.au>
In-Reply-To: <20040410182315.GC17335@earth.solarsys.private>
References: <20040408181835.GA11818@earth.solarsys.private>
	<1081585711.22388.7.camel@rasputin.localnet>
	<20040410182315.GC17335@earth.solarsys.private>
Message-Id: <1081773743.15701.3.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Mon, 12 Apr 2004 20:42:24 +0800
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM <linux-lvm@redhat.com>

On Sun, 2004-04-11 at 02:23, Mark M. Hoffman wrote:

> What version?  I just looked at that site, and I don't see any kernel
> RPMs except the stock RedHat ones (base and updates) for RedHat 9.

I'm afraid I don't remember now. It was a while ago. Looking at my RPM
database, I appear to have kernel-smp-2.4.20-28.8 as my newest 2.4
kernel; that'll be the one. Remember, though, that I'm using RH8 not
RH9, so things will be a little different.

I just fetched the kernel image using apt, thinking "perhaps a newer
kernel will help..." - and it did.

> Or are you using FC1?  I'll upgrade, but only if I'm *sure* it will
> solve the problem.

No, definitely not FC1.

Craig Ringer
