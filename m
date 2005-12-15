Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBGGC0130188
	for <linux-lvm@redhat.com>; Fri, 16 Dec 2005 11:12:00 -0500
Received: from host1.appws.com (host1.appws.com [216.136.72.3])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBGGBdhD008498
	for <linux-lvm@redhat.com>; Fri, 16 Dec 2005 11:11:43 -0500
Received: from grandmother.littlebald.com (localhost.localdomain [127.0.0.1])
	by grandmother.littlebald.com (8.13.1/8.13.1) with ESMTP id
	jBGGIuO8027898
	for <linux-lvm@redhat.com>; Fri, 16 Dec 2005 11:18:56 -0500
Received: (from david@localhost)
	by grandmother.littlebald.com (8.13.1/8.13.1/Submit) id jBGGIuQ7027897
	for linux-lvm@redhat.com; Fri, 16 Dec 2005 11:18:56 -0500
Subject: Re: [linux-lvm] LVM onFly features
From: David Johnston <david@littlebald.com>
In-Reply-To: <1cbd6f830512110732h3e5a666du881f6c4fad593924@mail.gmail.com>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
	<20051210223139.GI3103@mjk.myfqdn.de>
	<B3E2561C8D66866DCF5FD2D8@dhcp-2-206.wgops.com>
	<208D3DC6840704A034151D63@dhcp-2-206.wgops.com>
	<20051210230341.GJ3103@mjk.myfqdn.de>
	<1cbd6f830512101938g4ec7d36dq4fd9a081658edf47@mail.gmail.com>
	<1134310136.26999.4.camel@pc7.dolda2000.com>
	<1cbd6f830512110732h3e5a666du881f6c4fad593924@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Date: Thu, 15 Dec 2005 15:44:15 -0500
Message-Id: <1134679455.24282.18.camel@grandmother.littlebald.com>
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

On Sun, 2005-12-11 at 10:32 -0500, Mag Gam wrote:
> I know AIX LVM and FS act usually as one. Thats where I was going at....
> 
> But, thats everyone for their replies!

Not really.  The AIX configuration tools simplify things for you to the
point that you might think that they are acting as one, but they work
exactly the same way under AIX and Linux.  Look at the config tool's
logs, and you will see that to expand a filesystem, it first calls lvm
to expand the logical volume, then calls the jfs utility to expand the
filesystem.  There are internal differences in the two implementations,
but the division between logical block devices and filesystems is there
under both AIX and Linux.

-David
