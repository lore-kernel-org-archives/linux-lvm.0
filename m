Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4QFVQ020796
	for <linux-lvm@redhat.com>; Wed, 26 May 2004 11:31:26 -0400
Received: from mail1.smilehouse.com (mail1.smilehouse.com [193.65.59.129])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4QFVPi5030909
	for <linux-lvm@redhat.com>; Wed, 26 May 2004 11:31:25 -0400
Date: Wed, 26 May 2004 18:31:18 +0300
From: Harri Haataja <harri.haataja@smilehouse.com>
Subject: Re: [linux-lvm] /boot on lvm?
Message-ID: <20040526153118.GA31460@mail1.smilehouse.com>
References: <40A72846.5050801@mlug.missouri.edu>
	<20040516084236.GB8872@percy.comedia.it> <40A73771.2030604@osp.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40A73771.2030604@osp.nl>
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

On Sun, May 16, 2004 at 11:42:09AM +0200, Martijn Schoemaker wrote:
> Luca Berra wrote:
> >On Sun, May 16, 2004 at 01:37:26AM -0700, Michael wrote:

> >>Is it okay to put everything, including /boot and other critical
> >>Linux files on an LVM drive? How about swap space?
> >i don't have any problem with this kind of setup, but you will find
> >many people here that will say just the opposite.
> Hehehe the eternal discussion :)
> 
> Well, I just don't have the guts to put /boot in LVM so I just put it
> on a 'md' device. Do boot managers like Lilo and Grub cope with LVM ?
> I know Lilo does cope with md since it will put the boot block on both
> physical drives when installing. And how does it work when the bios
> needs to reference the boot image which is in an LVM volume ? Does
> this work at all ? I just never tried, but I am curious :)
> 
> I also put my root in LVM, and this works great. Only thing is that
> you might have some problems when migrating to newer LVM versions, but
> it is do-able. Having your root in a resizable volume has many
> advantages I think.

Especially with a "live" resizeable filesystem.


Doesn't HP-UX have a setup where you have /stand (IIRC) which will
always reside in the same place and should always boot etc and
everything else on LVM? I think there was a scheme like that. With
Linux, /boot and initrd's could be arranged like that. That is what root
raid and root fs/driver/bus as module -kernels usually do: you boot with
an initrd that has enough confs, utils and modules to get the devices,
start the raids and mount root to pivot to.

Now, for the non-DOS, could LVM have some extra features to allow making
all disks PV's and have /boot and initrd or /stand-like on a "special"
location that boot loaders etc can find and use to start the system?
There would just need to be enough to start LVM to a point where you can
mount the root LV.

(I may also be thinking Aix here. Such wonderful fs management ;)

-- 
I once waxed the floors of a nursing home, pulled off all the rubber
feet on the walkers, and yelled "FIRE!"
