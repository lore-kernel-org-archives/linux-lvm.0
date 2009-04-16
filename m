Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GFmrkn014157
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 11:48:54 -0400
Received: from e4.ny.us.ibm.com (e4.ny.us.ibm.com [32.97.182.144])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3GFmbfH020934
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 11:48:37 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e4.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n3GFj3Kl020567
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 11:45:03 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n3GFmamJ197560
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 11:48:36 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n3GFmZkA031405
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 11:48:35 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n3GFmZna031394
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 11:48:35 -0400
Date: Thu, 16 Apr 2009 08:48:34 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
Message-ID: <20090416154834.GA22781@us.ibm.com>
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
To: linux-lvm@redhat.com

Lupe Christoph [lupe@lupe-christoph.de] wrote:
> On Thursday, 2009-04-16 at 15:47:07 +0530, yogeen honnavar wrote:
>
> > dd if=/dev/zero of=/dev/vg1/lv1 count=10
>
> > as per the redhat guide this should result in mirror leg failure and any
subsequent write activity to the mirror should convert the mirror into linear
volume. but the output of lvs command still shows copy % as 100%. also data in
filesystem of lv1 is erased and it is converted into read only filesystem.
>
> Apart from the problem with the of= parameter that was already pointed
> out - why do you assume writing *anything* *anywhere* would simulate a
> mirror failure? The most you do simulate with that is mirror
> *corruption*.

You are absolutely right.

>> can anyone please let us know the correct way to simulate lvm mirror failure
>> and recovery.
>
> Depends a lot on your hardware. E.g. the system I use for testing are
> about 400 km away, so I'd rather not unplug anything...

I usually run "echo 1 > /sys/block/sda/device/delete" to make /dev/sda
disappear and fail for LVM tests. You can fail the disk in a lot of ways
depending on your hardware, but this trick works with almost every
device!
