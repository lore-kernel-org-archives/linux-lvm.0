Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBJ9vu4J010364
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 04:57:56 -0500
Received: from anchor-post-35.mail.demon.net (anchor-post-35.mail.demon.net
	[194.217.242.85])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBJ9vZYZ014759
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 04:57:35 -0500
Received: from dyn-62-56-118-152.dslaccess.co.uk ([62.56.118.152]
	helo=amd64.lan)
	by anchor-post-35.mail.demon.net with esmtpa (AUTH miasmic)
	(Exim 4.67) id 1J4vgE-0006eo-JD
	for linux-lvm@redhat.com; Wed, 19 Dec 2007 09:57:35 +0000
Subject: Re: [linux-lvm] won't dual boot: 2 disks and LVM
From: cs <cs@networkingnewsletter.org.uk>
In-Reply-To: <1198018946.6460.31.camel@behemoth.csg.stercomm.com>
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk>
	<1198018946.6460.31.camel@behemoth.csg.stercomm.com>
Date: Wed, 19 Dec 2007 09:57:14 +0000
Message-Id: <1198058234.3859.7.camel@amd64.local>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2007-12-18 at 17:02 -0600, Chris Cox wrote:
> On Tue, 2007-12-18 at 14:28 +0000, michael wrote:
> > I'm looking for a solution for (re-)installing WinXP on my slave disk
> > when I have Fedora and LVM on the master disk. In the past I've opened
> > up the box and unplugged the Fedora/LVM disk in order for WinXP to
> > install okay. But this seems much too drastic. Even swapping disk order
> > (in BIOS) doesn't help - WinXP installation sits there "forever" when
> > checking current config.
> > 
> > Whilst I cannot find any definite reference stating "MS WinXP cannot
> > handle LVM" it does seem to be the culprit. 
> > 
> > Anybody got any such definitive references or other help?
> 
> Do the "remove the Linux disk and move he XP disk" technique
> you mentioned to install WinXP onto
> what it believes will be the primary disk.... then...
> 
> Then switch things to put the Linux drive back as the
> primary and the WinXP as the secondary.
> 
> You can try something like this inside of grub.  Notice the
> map commands in particular.
> 
> title WinXP
> map (hd0) (hd1)
> map (hd1) (hd0)
> root (hd1,0)
> savedefault
> makeactive
> chainloader +1
> 
> Let us know if this works for you.

It doesn't! This is exactly what I tried and it just hangs...
