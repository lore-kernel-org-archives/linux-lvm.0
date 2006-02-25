Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1PJCD111180
	for <linux-lvm@redhat.com>; Sat, 25 Feb 2006 14:12:13 -0500
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1PJCCqx024527
	for <linux-lvm@redhat.com>; Sat, 25 Feb 2006 14:12:12 -0500
Received: from davidb by mail.davidb.org with local (Exim 4.54 #1 (Debian))
	id 1FD4pv-0008SK-Si
	for <linux-lvm@redhat.com>; Sat, 25 Feb 2006 11:12:11 -0800
Date: Sat, 25 Feb 2006 11:12:11 -0800
From: David Brown <lvm@davidb.org>
Subject: Re: [linux-lvm] LVM drive changed from USB to Firewire
Message-ID: <20060225191211.GB31720@old.davidb.org>
References: <1d4c059f0602250659u54eeaa7bldce33e389430b1d6@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d4c059f0602250659u54eeaa7bldce33e389430b1d6@mail.gmail.com>
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

On Sat, Feb 25, 2006 at 09:59:25AM -0500, Joel Gwynn wrote:
> I have an old Dell gx300 with a Maxtor one-touch partitioned using LVM
> When I first installed Ubuntu (Breezy Badger), it was detected on usb
> and set up very nicely, thank you very much. But I decided that usb
> 1.0 is way too slow, so I bought a firewire card, which was also
> detected very nicely.
> 
> The problem is that the drive is not found at boot anymore, and an
> error is raised because it can't be mounted. But if I do a vgscan,
> then a vgchage -ay, then mount -a, all is well and my volumes are
> mounted.
> 
> How do I tell LVM to look at the firewire card instead of the usb controller?

LVM should look at all of the devices.

Most likely the firewire interface/driver takes longer to startup than the
USB does, and the drive isn't visible when the startup scripts do their
vgscan.

You might scan through their startup scripts and figure out where they do
this.  I've seen startup scripts that do wait for USB devices to settle,
and perhaps they need to be enhanced to wait for firewire to be present.

Dave
