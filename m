Date: Wed, 31 May 2000 10:40:12 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] SuSE/LVM boot problem
Message-ID: <20000531104012.A22383@gruyere.muc.suse.de>
References: <20000502052139.AAA12301@quartz.nbnet.nb.ca@Lxxxx.nbtel.nb.ca> <200005020951.LAA07870@e35.marxmeier.com> <20000502114113.C1608@archimedes.suse.com> <20000502232221.A20803@gondor.com>
Mime-Version: 1.0
In-Reply-To: <20000502232221.A20803@gondor.com>; from list039@gondor.com on Tue, May 02, 2000 at 11:22:21PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <list039@gondor.com>
Cc: dgould@suse.com, linux-lvm@msede.com

On Tue, May 02, 2000 at 11:22:21PM +0200, Jan Niehusmann wrote:
> > On this topic, what is needed to make lvm work for both / and /boot with
> > full lilo support? I think it somewhat limits the utility of lvm not to
> > be able to make a fully lvm system, and might be tempted to do some of
> > the heavy lifting if it is not too gruesome.
> 
> As lilo doesn't parse filesystems, it has to know the sector numbers of
> the disk blocks that contain the kernel (and the second stage boot loader).
> 
> I can imagine two ways to make lilo work with lvm:
> 
> 1) at install time (when you run /sbin/lilo), lilo maps the logical (lvm)
> locations to physical locations and writes these to the boot block. The boot
> code doesn't need to be changed.

That's not very hard to do. You just need a FIPHYSBMAP ioctl. 

> 
> 2) lilo writes logical locations to the boot block (trivial). The boot
> code needs to understand lvm. 
> 
> Option 2 is probably very difficult to do, as it requires to implement 
> lvm handling in 16 bit code. Only read-only access is needed, but still,
> it's probably a major project.
> 
> Option 1 is way easier to implement, but has one big disadvantage: Whenever
> you move physical extents, you have to re-run lilo.
> 
> 
> Both ways, you may end up with the kernel (or parts of it) moved to
> a drive that's not accessible by lilo.  (while the 1024-cylinder-limit
> is gone, there are still drives that are accessible by linux but not by
> the bios, for example scsi drives on a controller without bios)

I would just add a ``bootable''/``non bootable'' attribute to a PV and a LV. 
When lilo runs it sets a ``bootable'' attribute on the LV, and when you try
to move a bootable LV onto a non bootable PV it complains. Not 100% bulletproof,
because it requires some user action to tag the PVs correctly, but better
than nothing.


-Andi
