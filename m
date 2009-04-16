Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GDL8Z8012177
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 09:21:10 -0400
Received: from buexe.b-5.de (buexe.b-5.de [84.19.0.30])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3GDKp1d002865
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 09:20:55 -0400
Received: from alanya.lupe-christoph.de (alanya.lupe-christoph.de
	[172.17.0.19])
	by buexe.b-5.de (8.13.8/8.13.8/b-5/buexe-3.6.3) with ESMTP id
	n3GDKnVG030192
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 15:20:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by alanya.lupe-christoph.de (Postfix) with ESMTP id A70582C1ED
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 15:19:37 +0200 (CEST)
Received: from alanya.lupe-christoph.de ([127.0.0.1])
	by localhost (alanya.lupe-christoph.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 8xqNbobnbCCW for <linux-lvm@redhat.com>;
	Thu, 16 Apr 2009 15:19:37 +0200 (CEST)
Date: Thu, 16 Apr 2009 15:19:37 +0200
From: Lupe Christoph <lupe@lupe-christoph.de>
Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
Message-ID: <20090416131936.GA12070@lupe-christoph.de>
References: <29070.706.qm@web94806.mail.in2.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29070.706.qm@web94806.mail.in2.yahoo.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thursday, 2009-04-16 at 15:47:07 +0530, yogeen honnavar wrote:

> dd if=/dev/zero of=/dev/vg1/lv1 count=10

> as per the redhat guide this should result in mirror leg failure and any subsequent write activity to the mirror should convert the mirror into linear volume. but the output of lvs command still shows copy % as 100%. also data in filesystem of lv1 is erased and it is converted into read only filesystem.

Apart from the problem with the of= parameter that was already pointed
out - why do you assume writing *anything* *anywhere* would simulate a
mirror failure? The most you do simulate with that is mirror
*corruption*.

To simulate a failure, you have to somehow disable a drive. Unplug a
cable, force it to spin down (assuming that it is not automatically spun
up again, I dunno), change the zoning, whatever is needed to prevent
access to the device.

> can anyone please let us know the correct way to simulate lvm mirror failure and recovery.

Depends a lot on your hardware. E.g. the system I use for testing are
about 400 km away, so I'd rather not unplug anything...

HTH,
Lupe Christoph
-- 
| There is no substitute for bad design except worse design.                   |
| /me                                                                          |
