From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009081939.NAA16909@lynx.turbolabs.com>
Subject: Re: [linux-lvm] LVM support for LILO
Date: Fri, 8 Sep 2000 13:39:05 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Heinz writes:
> We would need at least an additional "allocation on a single device"

The "contiguous" option to lvcreate should be enough, since the /boot LV
will be relatively small (1 or 2 PEs).  If it ever does cross two PVs,
LILO will detect this with Andi's patch, so no need to make LVM more
complicated.

Luca writes:
> beware that bios addressable might mean below cylinder 1024 if your bios
> doesn't handle lba32

LILO already checks this, since we will be passing the raw disk block numbers
to LILO, so it will be no different than a regular /boot.  The one benefit
of a full LVM system is that if you need to grow /boot, but you have a 1024
cylinder BIOS limit, you can still do this by migrating a PE of another LV
away from the end of the boot LV, and then extending the boot LV.

Heinz writes:
> ... need a "don't pvmove" status flag for the LV to ensure that no wrong
> pvmove(8) can happen.

Luca writes:
> i'd like to be able to pvmove even the boot lv (i.e. i am migrating
> to a larger disk)

As for the "don't move" status flag, this _may_ be useful, but people already
can't move their kernels out of /boot, so this is probably not that big of
an issue.  I would rather keep things simple.  It will not happen very often
that people move /boot, and with newer systems, there are fewer BIOS limits
so it may even be _more_ confusing if people can't move /boot when they want.

Cheers, Andreas
