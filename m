Date: Wed, 31 May 2000 18:18:03 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] SuSE/LVM boot problem
Message-ID: <20000531181803.A30169@gruyere.muc.suse.de>
References: <390FD771.DB59EECB@msede.com> <20000503095326.A4439@archimedes.suse.com> <20000531110128.A22796@gruyere.muc.suse.de> <12xB7E-0izhAGC@fwd05.sul.t-online.de>
Mime-Version: 1.0
In-Reply-To: <12xB7E-0izhAGC@fwd05.sul.t-online.de>; from chhellwig@t-online.de on Wed, May 31, 2000 at 06:13:08PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <chhellwig@t-online.de>
Cc: ak@suse.de, adilger@turbolabs.com, linux-lvm@msede.com

On Wed, May 31, 2000 at 06:13:08PM +0200, Christoph Hellwig wrote:
> Andi Kleen schrieb:
> > > 
> > >  - lilo needs to understand about lvm and use the lvm provided ways to
> > >    get physical mappings.
> >
> > That's complicated. Someone did a similar hack for RAID0, but LVM is more
> > complicated than MD RAID0. Better just supply the real block numbers to lilo
> > and rerun it as needed (LVM could warn about it) 
> 
> Don't use lilo, use grub. I'm trying to implement lvm support in grub. The idea 
> is that grub should read the first lvm on each pv. This first lv must be only on 
> this pv. (and have a special name, eg lv_root, so grub can find it)

Limiting to the ``first LV'' sounds ugly. When you read the first, is it
that hard to read the second (and allow arbitary names)  ?

> 
> > > 
> > >  - the kernel needs to be able to reconstruct enough of the lvm
> > >    descriptors to mount / at boot time.
> 
> The kernel should know about all lvm descriptor and the /etc/lvm* should only be 
> used for pvcreate an similar programs. 

And who maintains that ? Using linuxrc and the normal LVM tools makes much
more sense IMHO. Just say no to kernel bloat.


-Andi
