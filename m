From: dgould@suse.com
Date: Wed, 3 May 2000 09:53:26 -0700
Subject: Re: [linux-lvm] SuSE/LVM boot problem
Message-ID: <20000503095326.A4439@archimedes.suse.com>
References: <390FD771.DB59EECB@msede.com>
Mime-Version: 1.0
In-Reply-To: <390FD771.DB59EECB@msede.com>; from mike@msede.com on Wed, May 03, 2000 at 09:38:25AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adilger@turbolabs.com
Cc: linux-lvm@msede.com

On Wed, May 03, 2000 at 09:38:25AM +0200, Michael Marxmeier wrote:
> Forwarded message from Andreas Dilger <adilger@turbolabs.com>
> 
> -------- Original Message --------
> From: Andreas Dilger <adilger@turbolabs.com>
> Subject: Re: [linux-lvm] SuSE/LVM boot problem
> To: Jan Niehusmann <list039@gondor.com>
> Date: Tue, 2 May 2000 21:09:10 -0600 (MDT)
> 
> Jan writes:
> > > On this topic, what is needed to make lvm work for both / and /boot with
> > > full lilo support? I think it somewhat limits the utility of lvm not to
> > > be able to make a fully lvm system, and might be tempted to do some of
> > > the heavy lifting if it is not too gruesome.
> > 
> > I can imagine two ways to make lilo work with lvm:
> > 
> > 1) at install time (when you run /sbin/lilo), lilo maps the logical (lvm)
> > locations to physical locations and writes these to the boot block. The boot
> > code doesn't need to be changed.
> > 
> > Option 1 is way easier to implement, but has one big disadvantage: Whenever
> > you move physical extents, you have to re-run lilo.

Yes. Would it be reasonable to have LVM tools check for this and warn
the user?

> > Both ways, you may end up with the kernel (or parts of it) moved to
> > a drive that's not accessible by lilo.  (while the 1024-cylinder-limit
> > is gone, there are still drives that are accessible by linux but not by
> > the bios, for example scsi drives on a controller without bios)
> 
> I don't think that these limitations are very serious.  You can always
> put some restrictions on how /boot is created under LVM (e.g. must be
> contiguous or on a BIOS visible disk).  I assume it is possible with
> lvcreate to force creation of an LV on a specific PV, at least.  With
> the newer LILO, there is no longer the 1024 cylinder limit either, so
> as long as the kernel is on a single disk, LILO can boot it.
> 
> It might be nice to allow LILO to boot from a mirrored /boot LV, by
> having it internally think there are two kernels involved, or by
> having it write slightly different boot sectors to the mirror drives
> used (i.e. if we are using /dev/hda1 and /dev/hdb1 to mirror /boot,
> LILO could go through /etc/lilo.conf once with root=/dev/hda and once
> with root=/dev/hdb).  However, this is not a requirement at all - get
> LILO to work with /boot in an LV, and you've won 90% of the battle.
> 
> Cheers, Andreas

Yes, this is what I was hoping for. I bring this up because I just
installed SuSE 6.4 _three_ times. Yast is happy to let you create /boot
on a LV. But Lilo isn't. Yast will also cheerfully create / on an LV.
But Lilo is still unsatisfied. So I gave up and made a partition table
and hard partitions etc. But, except for the lilo and boot/mounting
issue, I have no need of DOS partitions or partition table at all. It
would be quite nice to just let LVM manage _all_ the disks.

If I have understood this, we need the following to make this
work (some of this may already exist):

 - lvm needs to provide an way for other programs to translate logical
   blocks to physical

 - lvm needs to have a way of tracking/enforcing/satisfying the constraint
   that specified lvs need to be in the bios bootable physical area

 - lilo needs to understand about lvm and use the lvm provided ways to
   get physical mappings.

 - the kernel needs to be able to reconstruct enough of the lvm
   descriptors to mount / at boot time.

Anything I am missing?

Any of this already done/planned?

Any other thoughts?

-dg
 
-- 
David Gould                                   dgould@suse.com
If simplicity worked, the world would be overrun with insects.
