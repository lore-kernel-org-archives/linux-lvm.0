Date: Fri, 8 Sep 2000 13:02:35 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM support for LILO
Message-ID: <20000908130235.C25034@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <20000908000253.A23165@srv.t-online.de> <200009072329.RAA21600@lynx.turbolabs.com>
Mime-Version: 1.0
In-Reply-To: <200009072329.RAA21600@lynx.turbolabs.com>; from adilger@turbolinux.com on Thu, Sep 07, 2000 at 05:29:17PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: mge@sistina.com, linux-lvm@msede.com

On Thu, Sep 07, 2000 at 05:29:17PM -0600, Andreas Dilger wrote:
> Heinz J. Mauelshagen, you write:
> > > Michael Kellen and I have been working to add LILO support for booting
> > > from a LV (i.e. have /boot be an LV, and then not have ANY DOS partitions).
> > 
> > THX, that's good news :-{)
> 
> Please see instead Andi Kleen's way of doing this (posted today).  It is
> much simpler.  Can you add his patch to 0.9?

Basically the approach i already started looks similar.

But it takes into account having a clean separation of the pure mapping
code _and_ the error checking/snapshot code which lives in lvm_map()
as well.

> 
> > 	int l = int lv_get_index_by_kdev_t(vg_t * vg, kdev_t dev);
> 
> This will only work if you already have the vg_t.  If you only know dev, it
> is not possible to find which VG is is a part of without doing crazy things.

Please have a look at how lvscan.c does a similar job.

> 
> > Please use  int vg_status_with_pv_and_lv(char * vg_name, vg_t ** vg);
> 
> Again, it only works if you know something about the VG in advance.  I
> think these functions may be useful even if we don't need them for LILO,
> and they only take a few lines in the kernel...

Not a big deal.

char IOCTL could be LV_STATUS_BYDEV_T.


> 
> > So if i got you right and the use of the above mentioned library functions
> > serves your needs, the only change to the existing LVM software would be
> > in the driver to support an ioctl which returns a dev_t and block on a
> > PV given the LV dev_t and the relative block number.
> 
> Andi Kleen's patch to make a fake buffer_head, and just call lvm_map() is
> even easier.

Yes.
The above solution is easy as well and cleaner.

> 
> > Question: how do you want to ensure that all kernel image blocks really
> >           are BIOS addressable? They could for eg. live on a MD or could
> >           be out of the BIOS addressable range of blocks.
> 
> LILO already handles many of these issues, or at least warns about them.
> None of them are specific to LVM, so people are aware of them already
> (although LVM may hide a few of the details).  It would be documented
> that the /boot LV can reside only on 1 disk, and that it must reside on
> a BIOS addressible disk.  Most systems create /boot on the first disk
> when they are installed, and even with the number of kernels on my system
> it is only a few MB (1 or 2 PEs is enough).

O.k.

We would need at least an additional "allocation on a single device" or
"don't pvmove" status flag for the LV to ensure that no wrong pvmove(8)
can happen.

> 
> LILO only supports RAID1 MD devices, so the kernel will only have blocks
> on 1 device in the end, or LILO will fail.  This is easily verified by
> checking that dev is the same for all of the LV mapped blocks.

Yep.

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
