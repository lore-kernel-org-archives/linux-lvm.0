From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009072239.QAA09511@lynx.turbolabs.com>
Subject: Re: [linux-lvm] LVM support for LILO
Date: Thu, 7 Sep 2000 16:39:39 -0600 (MDT)
In-Reply-To: <20000907234301.B21294@gruyere.muc.suse.de> from "Andi Kleen" at Sep 07, 2000 11:43:01 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@suse.de>
Cc: Linux LVM mailing list <linux-lvm@msede.com>, idsfa@visi.com

Andi Kleen, you write:
> I did some similar work. I implemented an LVM_BMAP ioctl for LVM that
> simply translates a given block to a (dev_t, blocknr in dev). lilo 
> simply does a normal FIOBMAP and then calls LVM_BMAP for every block
> it gets. When the dev_t ever changes it complains loudly. Then it does
> its normal work with the resulting blocks.

Do you have the corresponding patches to LILO?  Have you ever tried
submitting them to the LILO maintainers?

> It works ok. The only problem is that a standard PV cannot be used for
> booting, because it does leave any space for a MBR (it probably needs 
> a PV format revision that simply leaves 4K free) 

I think if you make a partition on your boot disk (even if it is the
full size of the disk), then you will have enough space for a MBR.  No
need to change LVM formats.  You can use full-disk PVs if you want for
your other disks, but it quiets the boot process down a bit if you have
a partition on the disk (or at least it complained the last time I tried
a full-disk PV).

> I'm just calling lvm_bmap from my ioctl. It is easy enough (patch against
> 2.2 appended) 

Ah, you mean lvm_map.  Very clever.  I had thought to take out the mapping
code into another function, but yours is much easier, because you don't
even need to know the LV or do any other complex work.

> +	case LV_BMAP:
> +		/* turn logical block into (dev_t, block). non privileged. */ 
                                                           ^^^^^^^^^^^^^^
This is one area that LVM needs to work on.  Doing the SUSER checks in
liblvm is not really helpful, because you might have disk admin people,
and people can always compile their code without the checks.  Being able
to at least do "pvscan" or "lvdisplay" as an unprivileged user is useful,
and other tasks should be possible if you have write access to /dev/vg/lv
and/or /dev/hdaX.

Cheers, Andreas
