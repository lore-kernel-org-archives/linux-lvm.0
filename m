Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9U1mf4j026224
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 21:48:41 -0400
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9U1mUQ6016768
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 21:48:31 -0400
Subject: Re: [linux-lvm] Removing a very old physical drive - revisited
From: Nicholas Robinson <npr@bottlehall.co.uk>
In-Reply-To: <20091029190426.GA4284@us.ibm.com>
References: <1256664432.6383.15.camel@elm.bottlehall.co.uk>
	<20091028012931.GA27808@us.ibm.com>
	<1256714228.2246.15.camel@elm.bottlehall.co.uk>
	<20091028160747.GB11257@us.ibm.com>
	<1256772119.8660.2.camel@elm.bottlehall.co.uk>
	<1256788889.2394.6.camel@elm.bottlehall.co.uk>
	<20091029190426.GA4284@us.ibm.com>
Date: Fri, 30 Oct 2009 01:48:29 +0000
Message-Id: <1256867309.4231.16.camel@elm.bottlehall.co.uk>
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

On Thu, 2009-10-29 at 12:04 -0700, malahal@us.ibm.com wrote:
> Nicholas Robinson [npr@bottlehall.co.uk] wrote:
> > The pvmove worked, I've moved the boot to the new disc, so my old disc
> > is now effectively redundant. The problem is that, as I suspected, I
> > can't pvmove off my usb drive!
> > 
> > I spotted these messages in /var/log/messages
> > 
> > Oct 29 03:44:06 oak kernel: device-mapper: table: device 8:2 too small
> > for target
> > Oct 29 03:44:06 oak kernel: device-mapper: table: 253:0: linear:
> > dm-linear: Device lookup failed
> > Oct 29 03:44:06 oak kernel: device-mapper: ioctl: error adding target to
> > table
> 
> device 8:2 is /dev/sda2. Some one is trying to use /dev/sda2 with
> incorrect values (start sector or length). This looks odd and this
> happens only when you try 'pvmove' on the USB disk. What does the
> pvdisplay on /dev/sda2 report its size (PV Size and is that accurate).
> It maybe incorrect....
> 
> Thanks, Malahal.
> 

Hi Malahal

In the absence of fixing the underlying problem, I've renamed the
volgroup and removed the 30GB disc that was the original aim of the
exercise! I thought I was getting somewhere, but now the server won't
boot by itself, I have to use a rescue disc and then chroot and start
the critical services manually. It is something to do with the change in
device name from /dev/sda to /dev/sdc, but I can't see why. It gets to
the point where it should be trying to mount the volgroup and then hangs
without any diagnostic. Everything looks okay in /etc/fstab.

I am confused about grub.conf as the (hd0,0) is wrong, given that
device.map lists /dev/sdc as hd1, but swapping grub.conf to specify
hd1,0 to match device.map fails with invalid disc or similar and using
map (...) statements to swap them over or changing device.map don't work
either.

I always used to think the biggest advantage of linux over windows was
that when it failed it told you why. It hasn't been too helpful in
recent days.

I think I will copy everything off the disc tomorrow, reinstall fedora
11 on it from scratch (having removed the usb drive!!!) and then
restore. Life's too short.

The total PE multiplied by the pe size looks right.

Thanks

Nick

[root@oak ~]# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdc2
  VG Name               vg_oak
  PV Size               315.00 GB / not usable 31.81 MB
  Allocatable           yes 
  PE Size (KByte)       32768
  Total PE              10079
  Free PE               987
  Allocated PE          9092
  PV UUID               tXBnAO-0D0U-yLvg-XhaA-vEw3-Niz7-p23dAt
