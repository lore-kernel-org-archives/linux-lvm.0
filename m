From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009072329.RAA21600@lynx.turbolabs.com>
Subject: Re: [linux-lvm] LVM support for LILO
Date: Thu, 7 Sep 2000 17:29:17 -0600 (MDT)
In-Reply-To: <20000908000253.A23165@srv.t-online.de> from "Heinz J. Mauelshagen" at Sep 08, 2000 12:02:53 AM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mauelshagen@sistina.com
Cc: mge@sistina.com, linux-lvm@msede.com

Heinz J. Mauelshagen, you write:
> > Michael Kellen and I have been working to add LILO support for booting
> > from a LV (i.e. have /boot be an LV, and then not have ANY DOS partitions).
> 
> THX, that's good news :-{)

Please see instead Andi Kleen's way of doing this (posted today).  It is
much simpler.  Can you add his patch to 0.9?

> 	int l = int lv_get_index_by_kdev_t(vg_t * vg, kdev_t dev);

This will only work if you already have the vg_t.  If you only know dev, it
is not possible to find which VG is is a part of without doing crazy things.

> Please use  int vg_status_with_pv_and_lv(char * vg_name, vg_t ** vg);

Again, it only works if you know something about the VG in advance.  I
think these functions may be useful even if we don't need them for LILO,
and they only take a few lines in the kernel...

> So if i got you right and the use of the above mentioned library functions
> serves your needs, the only change to the existing LVM software would be
> in the driver to support an ioctl which returns a dev_t and block on a
> PV given the LV dev_t and the relative block number.

Andi Kleen's patch to make a fake buffer_head, and just call lvm_map() is
even easier.

> Question: how do you want to ensure that all kernel image blocks really
>           are BIOS addressable? They could for eg. live on a MD or could
>           be out of the BIOS addressable range of blocks.

LILO already handles many of these issues, or at least warns about them.
None of them are specific to LVM, so people are aware of them already
(although LVM may hide a few of the details).  It would be documented
that the /boot LV can reside only on 1 disk, and that it must reside on
a BIOS addressible disk.  Most systems create /boot on the first disk
when they are installed, and even with the number of kernels on my system
it is only a few MB (1 or 2 PEs is enough).

LILO only supports RAID1 MD devices, so the kernel will only have blocks
on 1 device in the end, or LILO will fail.  This is easily verified by
checking that dev is the same for all of the LV mapped blocks.

Cheers, Andreas
