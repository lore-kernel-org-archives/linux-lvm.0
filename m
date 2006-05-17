Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HKcDI1020224
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 16:38:13 -0400
Received: from willy.net1.nerim.net (willy.net1.nerim.net [62.212.114.60])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4HKc3Lp027270
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 16:38:05 -0400
Date: Wed, 17 May 2006 22:37:52 +0200
From: Willy Tarreau <willy@w.ods.org>
Message-ID: <20060517203752.GA28707@w.ods.org>
References: <446A36B8.1060707@cmu.edu> <20060516203917.GQ11191@w.ods.org>
	<446A418E.3070307@cmu.edu> <20060517034814.GA25818@w.ods.org>
	<446B2523.1040800@cmu.edu>
	<20060517133456.GD23933@csclub.uwaterloo.ca>
	<446B27E4.7040509@cmu.edu>
	<20060517155335.GF23933@csclub.uwaterloo.ca>
	<446B5DAA.8020004@cmu.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <446B5DAA.8020004@cmu.edu>
Subject: [linux-lvm] Re: need help booting from SATA in 2.4.32 / LVM
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
To: George Nychis <gnychis@cmu.edu>
Cc: linux-lvm@redhat.com, linux-kernel@vger.kernel.org, Lennart Sorensen <lsorense@csclub.uwaterloo.ca>

On Wed, May 17, 2006 at 01:30:18PM -0400, George Nychis wrote:
> 
> 
> Lennart Sorensen wrote:
> > On Wed, May 17, 2006 at 09:40:52AM -0400, George Nychis wrote:
> >> Because it does......
> >>
> >> on bootup the *same* exact drive in 2.4.32 shows up as /dev/hda
> >>
> >> It has the exact same volume information as my drive that shows up in
> >> 2.6.9 as /dev/sda
> > 
> > Yes I do remember a few sata controllers had some support in 2.4, which
> > was dropped from 2.6 early on when libata came in.
> > 
> > It is very unlikely you will ever see that again in the future.
> > 
> > Len Sorensen
> > 
> 
> I see... well I am finally getting it to boot, i did not have initrd
> support built into the 2.4.32 kernel, but now i'm getting LVM errors:

Cool, that's fine !

> Scanning logical volumes
>    /bin/vgscan.lvm1: execvp failed: No such file or directory
> ERROR: /bin/vgscan exited abnormally!
> Activating logical volumes
>    /bin/vgchange.lvm1: execvp failed: No such file or directory
> ERROR: /bin/vgchange exited abnormally!
> 
> I know nothing about LVM so... i'm pretty clueless for now

It's pretty clear to me that /bin/vgscan is a wrapper to either vgscan.lvm1
or vgscan.lvm2 depending on what it supported in the kernel. 2.4 only
supports LVM1 in mainline. There are patches to support LVM2 on 2.4,
but to be honnest, I'm not sure about the exhaustive list. All I know
is that you have to start with the device mapper :

   http://w.ods.org/linux/kernel/2.4/lkup/device-mapper.html

I hope it will help you
Willy
