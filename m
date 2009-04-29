Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3TJ32K1012981
	for <linux-lvm@redhat.com>; Wed, 29 Apr 2009 15:03:02 -0400
Received: from eastrmmtao106.cox.net (eastrmmtao106.cox.net [68.230.240.48])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3TJ2c4a029036
	for <linux-lvm@redhat.com>; Wed, 29 Apr 2009 15:02:38 -0400
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090429190238.QWZD1731.eastrmmtao106.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Wed, 29 Apr 2009 15:02:38 -0400
Message-ID: <49F8A451.8050402@cox.net>
Date: Wed, 29 Apr 2009 15:02:41 -0400
From: "Clyde E. Kunkel" <rascal.jumper-747@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Random file system errors
References: <200904290352.XAA08424@out-of-band.media.mit.edu>
In-Reply-To: <200904290352.XAA08424@out-of-band.media.mit.edu>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 04/28/2009 11:52 PM, f-lvm@media.mit.edu wrote:
> Btw, one way to proceed on the test-your-hardware angle without
> yanking disks (or even opening the case) and possibly turning this
> into a heisenbug if it really -is- something like cabling would be
> to do something like this:
>
>     dd if=/dev/hda bs=1M count=1000 | md5sum
>
> for each of hdX and sdX or whatever describes the raw physical
> devices.  Do this with the LVM -completely deactivated- so you
> know that absolutely nothing can be writing to the disks; you
> should probably boot from a LiveCD to ensure this.
>
> Run each test at least twice for the same disk and record the results;
> I'll bet that at least one of your disks will return inconsistent
> data; perhaps all disks on one IDE channel or one SATA channel will,
> or perhaps every single disk will if you've got RAM, PSU, or
> bridge-chip troubles, etc.
>
> If you're seeing a very low frequency of bit flips, raise the count on
> the dd to something larger, like maybe 10000 instead or whatever;
> that'll slow down the test but raise your confidence in it.
>
> Either way, try it on a USB device as well.  Very different hardware
> and software paths.  Might be illuminating.
>
> Just make -damned- sure that your dd is using "if" and not "of"!
>
> If you -can't- make it fail, you might get fancier and try something
> that forces lots of head seeking (since that will consume more power
> and maybe stress your PSU), or try running all the disk tests in
> parallel (since that will chew up more CPU) or perhaps run something
> that runs your CPU flat out in one process while doing the dd in
> another.
>
> If you still can't make it fail, try activating the LVM -from a LiveCD-
> (e.g., -not- booted from it) and then repeat the tests on the LV's.
> If it fails on LV's that have no mounted filesystems and aren't being
> touched, but works on the raw devices, -then- you're starting to point
> a finger at LVM...  (And if you have to mount a FS to start getting
> failures, only then might we start thinking about write barriers or
> whatever...)
>
> If everything you do doesn't make it fail, but it fails when you're
> booted and running from that LVM, I'd start to suspect LVM and/or
> kernel issues in the actual software you're running.  But I'll bet
> that you'll see a failure before that point.
>
> And report back; it'd be good to close the loop on this if it's proven
> -not- to be an LVM issue.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>    
Excellent methodology...will give this a try.  Will take some time since 
the box is a test box maxed out with SATA drives and additional IDE 
controller.  Stay tuned...and thanks.
