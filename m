From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010241847.e9OIlNE31990@webber.adilger.net>
Subject: Re: [linux-lvm] Re: more LVM 0.8 patches
In-Reply-To: <20001024182502.A17195@caldera.de> "from Christoph Hellwig at Oct
 24, 2000 06:25:02 pm"
Date: Tue, 24 Oct 2000 12:47:23 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@ns.caldera.de>
Cc: Andreas Dilger <adilger@turbolinux.com>, bluca@comedia.it, linux-lvm@msede.com

Christoph writes:
> > Actually, this is a bit of a problem.  In my 2.2 kernel patch, I include an
> > lvm.h that can be used for both user and kernel compiles, so that you are
> > sure you have the same IOP version, struct sizes, etc.  However, this lvm.h
> > doesn't exist on 2.4.
> 
> IMHO this is the wrong thing. Userlevel tools should not include kernel
> headers. IOP version mismatches are detected at run time.
> In my RPMs I keep including the userlevel header and it works fine for
> Linux 2.2 and 2.4.

Actually, there IS a problem that isn't addressed by the IOP version,
probably because someone changed the lvm.h file after Heinz added it
to the kernel.  In the lv_v2 struct (in the 2.4 kernel sources) the
"uint8 __unused" field was added after lv_block_exception_t, and this
was not reflected in a IOP version change.  This field is NOT in the
lvm.h lv_v2 included in the 0.8final user tools.

That is why I chose to have a single lvm.h between user and kernel
space.  I know that it is bad to include linux/*.h headers in user
tools, but I wanted the tools to compile properly with the header
in the current kernel.

*** If we at least make the header include/linux/lvm.h and tools/lib/lvm.h
    exactly the same, it will make tracking changes a lot easier.
    Better would be to have per-struct version numbers, or make the ioctl
    numbers reflect the struct sizes (which is already part of the ioctl
    definitions) we can track changes a lot easier, and allow backwards
    compatibility when struct sizes change because they will get unique
    ioctl numbers for the old and new interface.

Note that the user tools tarball that I have also includes the lvm.h
under tools/lib, I just don't use it.  At most, you will need to change
#include <linux/lvm.h> to #include <lib/lvm.h> in lvm_user.h and liblvm.h.

If people agree that we should keep kernel and user headers totally
separate, I will change this for my next release.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
