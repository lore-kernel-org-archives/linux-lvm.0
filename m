Date: Sat, 9 Sep 2000 09:44:25 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM support for LILO
Message-ID: <20000909094425.C21946@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <200009081950.NAA16934@lynx.turbolabs.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200009081950.NAA16934@lynx.turbolabs.com>; from adilger@turbolinux.com on Fri, Sep 08, 2000 at 01:50:20PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

On Fri, Sep 08, 2000 at 01:50:20PM -0600, Andreas Dilger wrote:
> Yes, it would be nice to eliminate the requirement for an initrd to use
> LVM.  It may be that you could put some limits in place to make the root
> VG simple enough for the kernel to load.  You could even hard-code it to
HP-UX puts info about the boot vg on disk, actually it writes there info
about the posistion of boot, root, swap and dump LVs. These LV are required
to be contiguous, so the info is simple enough.

> have only 1 LV in this VG, which is the root filesystem.  If it was all

uhm, if we want to kill partition tables, we have to cope with the limit
that you cannot put a PV in two different VGs, so this might not work for some
people.

> __init code for the LVM module, it would not bloat the kernel...  The
> tricky part would be to find the right PV for the rootvg before LVM is
> loaded...
would it be simplier if we assume it is the same PV from which we are booting?

L.


-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
