Message-ID: <3861DC7B.7ECF442C@twc.de>
Date: Thu, 23 Dec 1999 09:25:31 +0100
From: Ulf Bartelt <ulf@twc.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] booting w/o initrd
References: <199912221602.JAA22165@webber.adilger.net>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi!

Andreas Dilger wrote:
> This is what IBM also needs for its "boot LV".  It is required that the
> BLV is contiguous on one disk.  Normally, it only needs to be 1 PP in size,
> but it can sometimes grow to 2 PPs in size.  I think Linux should have
> enough space in 4/8 MB for a boot partition considering Tom's root/boot
> disk has a whole system on 1.8MB floppy...

Right! A 4M partition for /boot should be enough to hold enough kernels
even for those who love experimenting with serveral versions...

...and if not, just give /boot 8M...

> > But what if ... you want to resize the root?
> 
> > Even when booting via initrd, you cannot resize the root while it is
> > mounted.
> 
> Actually, it IS possible to resize mounted ext2 filesystems with my
> online resize tools (LVM is required, of course).  Have a look at:
> http://www-mddsp.enel.ucalgary.ca/People/adilger/online-ext2/
> for more information.

Ok - I knew that page but I donnow how stable this is, so I didn't
include it in my argumentation.

> Good luck on your project.  I think this is a much better solution than
> using initrd, since it is more like a normal system.

It is tested for some weeks on two systems @myhome and Peter has two
systems up this way since last weekend (Peter: correct me if I'm wrong
with that date...).

I think the idea has proven to be handable and reliable now I'd like to
find an easy way to install such a system.

And even if it is not needed today, somewhen LVM might be changed in a
way that stopping it cleanly on shutdown will become a must. So I feel
better having an init.d script starting and stopping LVM and I have no
idea on doing this with an initrd based system...

...and if all else fails, I can access /boot and / with standard rescue
disks...

Bye for now!

	Ulf.
