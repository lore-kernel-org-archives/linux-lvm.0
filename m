From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009040146.TAA01313@lynx.turbolabs.com>
Subject: Re: [linux-lvm] [patch] LILO with LVM /boot
Date: Sun, 3 Sep 2000 19:46:48 -0600 (MDT)
In-Reply-To: <20000903193410.B8718@isis.visi.com> from "Michael J Kellen" at Sep 03, 2000 07:34:10 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Michael J Kellen <idsfa@visi.com>
Cc: linux-lvm@msede.com

Michael J Kellen writes:
> The following patch to lilo 21.5 using the 2.4.0-test7 kernel allows
> me to boot a machine using no non-lvm partitions in the lilo.conf.  I'd
> appreciate some feedback from other testers ...

Forgive me for being ignorant, but I don't see how this works...  It is
something that I've been wanting for a long time, but I always thought
it would be much more complicated...

> + #ifdef HAVE_LVM
> + 	case MAJOR_LVM:
> + 	    geo->device = 0x80+(MINOR(device) >> 6)+(MAJOR(device)==MAJOR_LVM ?
> + 	      0 : last_dev(MAJOR_LVM,64));
> + 	    if (ioctl(fd,HDIO_GETGEO,&hdprm) < 0)
> + 		die("geo_query_dev HDIO_GETGEO (dev 0x%04x): %s",device,
> + 		  strerror(errno));
> + 	    geo->heads = hdprm.heads;
> + 	    geo->cylinders = hdprm.cylinders;
> + 	    geo->sectors = hdprm.sectors;
> + 	    geo->start = hdprm.start;
> +             break;
> + #endif

This is the only part of the patch that really does anything, but I don't
_think_ it is enough, as bmap() on the kernel file will only return LVM
relative block numbers.  Does LILO already do recursive bmaps on blocks
for each layered device?  Am I totally out-to-lunch in how LILO works?

Also, have you thought at all about restrictions for keeping the kernel
all on the same physical device (definitely required for booting)?  It
may also be that LILO checks this, but it is currently unlikely.  I'm
not advocating that we put extensive checks on the boot LV (admins can
suffer if they do it wrong), but it should at least warn you if the
kernel is on two different physical devices, like it warns you when the
kernel is past 1024 cylinders...

Don't get me wrong - I think this is GREAT, I just want to know a bit
more about it...  I will give it a test as soon as I can find the LILO
source.

Cheers, Andreas
