Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB3L71gu012320
	for <linux-lvm@redhat.com>; Sun, 3 Dec 2006 16:07:01 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kB3L6vHn013003
	for <linux-lvm@redhat.com>; Sun, 3 Dec 2006 16:06:58 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 7ACDCE70E
	for <linux-lvm@redhat.com>; Sun,  3 Dec 2006 21:06:57 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id grlIajLIxts4 for <linux-lvm@redhat.com>;
	Sun,  3 Dec 2006 21:06:53 +0000 (UTC)
Received: from dsl081-113-044.dfw1.dsl.speakeasy.net
	(dsl081-113-044.dfw1.dsl.speakeasy.net [64.81.113.44])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id E1F98D348
	for <linux-lvm@redhat.com>; Sun,  3 Dec 2006 21:06:52 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] Stability of pvresize
Date: Sun, 3 Dec 2006 15:06:50 -0600
References: <4571B56F.9050506@berklee.edu>
In-Reply-To: <4571B56F.9050506@berklee.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200612031506.50985.krakrjak@volumehost.net>
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

On Saturday 02 December 2006 11:18, Louis Guillaume wrote:
> Hi,
>
> I've seen a couple messages recently about pvresize. Since I'm about to
> implement a system that might depend on this functionality, I'd like to
> know whether it works well!!!
Works pretty damn well here.  I've used this functionality a lot and I'm 
really happy with how it's turned out.

> Here's the scenario:
>
>   . Using an San.
>   . A meta-LUN is created consisting of 2 `real' LUNs.
>   . Meta-LUN is incorporated as a PV on the Linux Host.
>   . We add a third LUN to the meta-LUN on the SAN.
>
> This is where pvresize is supposed to come in. Once the PV is resized,
> is the VG automatically aware of the new PEs? Are there any pitfalls in
> this scheme?
Perhaps if you are shrinking there might be a pitfall in making sure you are 
using a filesystem that supports shrinking as well.  However, if you are just 
growing the size there shouldn't really be any drawbacks here.  It does just 
what it advertises, gets the new size of the PV and makes adjustments to the 
PVDA and the VGDA to make the new space available to the system.

> The alternative is to not use meta-LUNs and just add a new PV as needed
> and vgextend. But this puts more work on the server's CPU. Opinions?
This is a more traditional tried and true method that will work, but you are 
correct, there will be a tradeoff in CPU usage for LE lookups during access 
across PVs.
-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
