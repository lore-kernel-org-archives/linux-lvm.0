Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4VB3d031580
	for <linux-lvm@redhat.com>; Mon, 31 May 2004 07:03:39 -0400
Received: from mail1.smilehouse.com (mail1.smilehouse.com [193.65.59.129])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4VB3XXn028078
	for <linux-lvm@redhat.com>; Mon, 31 May 2004 07:03:33 -0400
Date: Mon, 31 May 2004 14:03:27 +0300
From: Harri Haataja <harri.haataja@smilehouse.com>
Subject: Re: [linux-lvm] /boot on lvm?
Message-ID: <20040531110327.GB14599@mail1.smilehouse.com>
References: <40A72846.5050801@mlug.missouri.edu>
	<20040516084236.GB8872@percy.comedia.it> <40A73771.2030604@osp.nl>
	<20040526153118.GA31460@mail1.smilehouse.com>
	<20040526205315.GA24516@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040526205315.GA24516@percy.comedia.it>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, May 26, 2004 at 10:53:15PM +0200, Luca Berra wrote:
> On Wed, May 26, 2004 at 06:31:18PM +0300, Harri Haataja wrote:
> >Doesn't HP-UX have a setup where you have /stand (IIRC) which will
> >always reside in the same place and should always boot etc and
> >everything else on LVM? I think there was a scheme like that. With
> not exactly (i am not going to dive into details since i don't think
> it is relevant to the list) but hp-ux is designed for hp-9000
> hardware, while linux is designed to support a much broader range of
> hardware (including shitty hardware like the PC)

Indeed. That tends to come up. But there are ways to go around those. I
think some people are looking for neater ways that don't have to work
everywhere, but can be made to work somewhere.

I was just adding(?) to the speculation.

> >Linux, /boot and initrd's could be arranged like that. That is what root
> How is that different from what we already have now using lilo and an
> lvm aware initrd? except that we don't have any constraint on placing
> the kernel and initrd (except for hardware limitation of said shitty
> platform)

It probably isn't. Only not everyone seems to be using initrd's. The
latter paragraph was probably just stating the obvious.


If there was something I set out to say in that message, maybe it was:
Would there be a way to arrange kernel and initrd into a position where
the bootloader (including especially grub) can find it without using a
specific partition for it? Then, for example, you could raid1 two whole
disks, mark the md device as a pv and install a system on volumes there.

-- 
Eagles may soar, but weasels don't get sucked into jet engines.
