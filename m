Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3MJYwp25244
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 15:34:58 -0400
Received: from imf25aec.mail.bellsouth.net (imf25aec.mail.bellsouth.net
	[205.152.59.73])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3MJYkKG015200
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 15:34:56 -0400
Received: from david.internal.NorcrossGroup.com ([68.213.19.251])
	by imf25aec.mail.bellsouth.net
	(InterMail vM.5.01.06.08 201-253-122-130-108-20031117) with ESMTP id
	<20040422193410.YLPD1818.imf25aec.mail.bellsouth.net@david.internal.NorcrossGroup.com>
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 15:34:10 -0400
Subject: Re: [linux-lvm] About Extending LVM size with Hardware Raid
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <1082652373.9271.29.camel@arthur.cbd.careercast.com>
References: <01285A15-9419-11D8-B982-000A95730E92@spamaps.org>
	<40875353.8020104@gbrmpa.gov.au>
	<1082652373.9271.29.camel@arthur.cbd.careercast.com>
Message-Id: <1082662269.18233.339.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Date: Thu, 22 Apr 2004 15:31:10 -0400
Content-Transfer-Encoding: 7bit
Reply-To: freemyer-ml@NorcrossGroup.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


> Sounds like the expensive version of my solution. ;-)
> 
> 
> Side Note: if anyone knows of a cheap way to hotswap PATA disks, I'd
> like to hear about it. Right now I stick 'em in a crappy old box with
> those $2 removable IDE tray things, and have to reboot that box whenever
> I'm done copying stuff to the disks. No big deal, but it seems kinda
> cheesy. :-P
> 
It may be a little on the expensive side, but I use 3ware controllers in
combination with ICYdock trays.

Especially if you are doing Raid 1 or 5, it works great.  The linux
kernel doesn't even know you pulled a drive.

If your just doing JBOD, then it may or may not work.  Never tried it.

Greg
-- 
Greg Freemyer
