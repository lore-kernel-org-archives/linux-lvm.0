Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9TJ4gMm022870
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 15:04:42 -0400
Received: from e6.ny.us.ibm.com (e6.ny.us.ibm.com [32.97.182.146])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9TJ4TXj021934
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 15:04:29 -0400
Received: from d01relay07.pok.ibm.com (d01relay07.pok.ibm.com [9.56.227.147])
	by e6.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id n9TJ9kGf006320
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 15:09:46 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay07.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n9TJ4R3u1540118
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 15:04:27 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	n9T94fS8018475
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 05:04:41 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av03.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	n9T94f2i018418
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 05:04:41 -0400
Date: Thu, 29 Oct 2009 12:04:26 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Removing a very old physical drive - revisited
Message-ID: <20091029190426.GA4284@us.ibm.com>
References: <1256664432.6383.15.camel@elm.bottlehall.co.uk>
	<20091028012931.GA27808@us.ibm.com>
	<1256714228.2246.15.camel@elm.bottlehall.co.uk>
	<20091028160747.GB11257@us.ibm.com>
	<1256772119.8660.2.camel@elm.bottlehall.co.uk>
	<1256788889.2394.6.camel@elm.bottlehall.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1256788889.2394.6.camel@elm.bottlehall.co.uk>
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

Nicholas Robinson [npr@bottlehall.co.uk] wrote:
> The pvmove worked, I've moved the boot to the new disc, so my old disc
> is now effectively redundant. The problem is that, as I suspected, I
> can't pvmove off my usb drive!
> 
> I spotted these messages in /var/log/messages
> 
> Oct 29 03:44:06 oak kernel: device-mapper: table: device 8:2 too small
> for target
> Oct 29 03:44:06 oak kernel: device-mapper: table: 253:0: linear:
> dm-linear: Device lookup failed
> Oct 29 03:44:06 oak kernel: device-mapper: ioctl: error adding target to
> table

device 8:2 is /dev/sda2. Some one is trying to use /dev/sda2 with
incorrect values (start sector or length). This looks odd and this
happens only when you try 'pvmove' on the USB disk. What does the
pvdisplay on /dev/sda2 report its size (PV Size and is that accurate).
It maybe incorrect....

Thanks, Malahal.
