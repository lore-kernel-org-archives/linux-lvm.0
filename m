Date: Sat, 9 Sep 2000 00:32:15 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM support for LILO]
Message-ID: <20000909003215.A26749@srv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Fri, Sep 08, 2000 at 01:50:20PM -0600, Andreas Dilger wrote:
> Michael Kellen writes:
> > I actually already have code for a check (in lilo.c) to insure that the
> > files are contiguous and on the first physical disk.  With the lv to pv
> > ioctl, that would be easy to extend to any bootable device.
> 
> Actually, there is no need for an image to be contiguous, because even
> the filesystem does not guarantee a file is contiguous.  The only
> requirement is the image be on a single device that the BIOS can see
> when it is first booting.
> 
> > In implementing this, we need to remember that not just the kernel needs
> > to be mapped.  The boot loader any ramdisks need to be known as well.
> 
> Yes, once the LVM block mapping works, it will work for all of these.
> 
> > What I'd *really* like to see is kernel code for autostarting of LVM
> > similar to the autostart of md (side note: 2.4.0-test7 seems to break
> > that, though). One step at a time, though.
> 
> Yes, it would be nice to eliminate the requirement for an initrd to use
> LVM.  It may be that you could put some limits in place to make the root
> VG simple enough for the kernel to load.  You could even hard-code it to
> have only 1 LV in this VG, which is the root filesystem.  If it was all
> __init code for the LVM module, it would not bloat the kernel...  The
> tricky part would be to find the right PV for the rootvg before LVM is
> loaded...

The kernel needs to be told where to find the root filesystem to use...

Why not tell it where to find one PV belonging to the rootvg?

That PV has a list of all UUIDs of all other PVs belonging to the rootvg
anyway. With that knowledge you can walk the genhd chain to find them all
(presumed that all necessary disk drivers are available).

> 
> Cheers, Andreas

-- 

Regards,
Heinz      -- The LVM guy --

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
