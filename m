From: Christoph Hellwig <chhellwig@t-online.de>
References: <390FD771.DB59EECB@msede.com>
	 <20000503095326.A4439@archimedes.suse.com> <20000531110128.A22796@gruyere.muc.suse.de>
Subject: Re:  [linux-lvm] SuSE/LVM boot problem
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Date: Wed, 31 May 2000 18:13:08 +0200
Message-ID: <12xB7E-0izhAGC@fwd05.sul.t-online.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: ak@suse.de
Cc: adilger@turbolabs.com, linux-lvm@msede.com

Andi Kleen schrieb:
> > 
> >  - lilo needs to understand about lvm and use the lvm provided ways to
> >    get physical mappings.
>
> That's complicated. Someone did a similar hack for RAID0, but LVM is more
> complicated than MD RAID0. Better just supply the real block numbers to lilo
> and rerun it as needed (LVM could warn about it) 

Don't use lilo, use grub. I'm trying to implement lvm support in grub. The idea 
is that grub should read the first lvm on each pv. This first lv must be only on 
this pv. (and have a special name, eg lv_root, so grub can find it)

> > 
> >  - the kernel needs to be able to reconstruct enough of the lvm
> >    descriptors to mount / at boot time.

The kernel should know about all lvm descriptor and the /etc/lvm* should only be 
used for pvcreate an similar programs. 

	Christoph
