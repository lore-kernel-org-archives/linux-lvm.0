Date: Sat, 9 Sep 2000 12:07:58 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] LVM support for LILO
Message-ID: <20000909120758.A11786@ns.lst.de>
References: <200009081950.NAA16934@lynx.turbolabs.com>
Mime-Version: 1.0
In-Reply-To: <200009081950.NAA16934@lynx.turbolabs.com>; from adilger@turbolinux.com on Fri, Sep 08, 2000 at 01:50:20PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

On Fri, Sep 08, 2000 at 01:50:20PM -0600, Andreas Dilger wrote:
> Yes, it would be nice to eliminate the requirement for an initrd to use
> LVM.  It may be that you could put some limits in place to make the root
> VG simple enough for the kernel to load.  You could even hard-code it to
> have only 1 LV in this VG, which is the root filesystem.  If it was all
> __init code for the LVM module, it would not bloat the kernel...  The
> tricky part would be to find the right PV for the rootvg before LVM is
> loaded...

I'm working on this. It is handled very much like md autostart.
In partitions/msdos.c a function is called for every partition with
the lvm id. This function reads the pv structure, and adds it to the
linked list of pvs for this vg (or creates it if this is the first pv).

If all pvs of a vg are found, the vg, lv and pe structures are loaded
from disk and the vg can be activated with a (modified) vgchange -a y.

Expect alpha code in a few weeks.

	Christoph

-- 
Always remember that you are unique.  Just like everyone else.
