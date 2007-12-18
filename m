Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBIN3Fwc023581
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 18:03:15 -0500
Received: from scidubsmtp01.stercomm.com (scidubsmtp01.stercomm.com
	[209.95.244.35])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBIN2Ync031952
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 18:02:34 -0500
Subject: Re: [linux-lvm] won't dual boot: 2 disks and LVM
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <1197988092.29413.77.camel@veri.phy.umist.ac.uk>
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk>
Content-Transfer-Encoding: 7bit
Date: Tue, 18 Dec 2007 17:02:26 -0600
Message-Id: <1198018946.6460.31.camel@behemoth.csg.stercomm.com>
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

On Tue, 2007-12-18 at 14:28 +0000, michael wrote:
> I'm looking for a solution for (re-)installing WinXP on my slave disk
> when I have Fedora and LVM on the master disk. In the past I've opened
> up the box and unplugged the Fedora/LVM disk in order for WinXP to
> install okay. But this seems much too drastic. Even swapping disk order
> (in BIOS) doesn't help - WinXP installation sits there "forever" when
> checking current config.
> 
> Whilst I cannot find any definite reference stating "MS WinXP cannot
> handle LVM" it does seem to be the culprit. 
> 
> Anybody got any such definitive references or other help?

Do the "remove the Linux disk and move he XP disk" technique
you mentioned to install WinXP onto
what it believes will be the primary disk.... then...

Then switch things to put the Linux drive back as the
primary and the WinXP as the secondary.

You can try something like this inside of grub.  Notice the
map commands in particular.

title WinXP
map (hd0) (hd1)
map (hd1) (hd0)
root (hd1,0)
savedefault
makeactive
chainloader +1

Let us know if this works for you.
