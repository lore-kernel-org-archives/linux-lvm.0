From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010041931.e94JVH118168@webber.adilger.net>
Subject: Re: [linux-lvm] Intresting notes on LVM in 2.4.0-test9
In-Reply-To: <39DB7362.A28FBB77@fil.org> "from Myers W. Carpenter at Oct 4, 2000
 02:13:54 pm"
Date: Wed, 4 Oct 2000 13:31:17 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Myers W. Carpenter" <myers@fil.org>
Cc: linux-lvm@msede.com

Myers Carpenter writes:
> 	The hard part was getting the userspace tools to work.    Heinz, 
> *pretty please with sugar on top* put out a new version.  Crawling
> through all those patches to figure out what would be the best
> combination wasn't really all that fun.  To me it would be a lot easier
> just to come out with a 0.8final2 and prevent this.

Yes, that would be nice, but it doesn't look like it will happen.  Did
you look at the patches in my SRPM (ftp://ftp.stelias.com/pub/adilger/)?
AFAIK, it is up-to-date with all of the patches against 2.2 LVM-0.8final.

> 	One weird thing:  /proc/lvm reports:
> 
>  Global: 61650 bytes malloced   IOP version: 6   2:24:42 active
> 
> 	but in in the 0.8final source lvm.h has this:
> 
> #define LVM_DRIVER_IOP_VERSION          7

This confused me for a long time as well.  As it was explained to me
eventually by Jan Niehusmann that the library uses LVM_LIB_IOP_VERSION
from liblvm.h to match to LVM_DRIVER_IOP_VERSION in the kernel.

In my user-tools RPM, I simply get rid of tools/lib/lvm.h and use the
kernel header, so that everything is sure to match...  Note that there
appear to be structure changes between 0.8final lvm.h and the 2.4 kernel
lvm.h, so it is important you only use one header.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
