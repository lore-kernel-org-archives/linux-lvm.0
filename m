Message-ID: <39355918.C2B6A94B@msede.com>
Date: Wed, 31 May 2000 20:25:28 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] SuSE/LVM boot problem
References: <390FD771.DB59EECB@msede.com> <20000503095326.A4439@archimedes.suse.com> <20000531110128.A22796@gruyere.muc.suse.de> <12xB7E-0izhAGC@fwd05.sul.t-online.de> <20000531181803.A30169@gruyere.muc.suse.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@suse.de>
Cc: Christoph Hellwig <chhellwig@t-online.de>, adilger@turbolabs.com, linux-lvm@msede.com

Andi Kleen wrote:
> 
> On Wed, May 31, 2000 at 06:13:08PM +0200, Christoph Hellwig wrote:
> > Andi Kleen schrieb:
> > > >
> > > >  - lilo needs to understand about lvm and use the lvm provided ways to
> > > >    get physical mappings.
> > >
> > > That's complicated. Someone did a similar hack for RAID0, but LVM is more
> > > complicated than MD RAID0. Better just supply the real block numbers to lilo
> > > and rerun it as needed (LVM could warn about it)
> >
> > Don't use lilo, use grub. I'm trying to implement lvm support in grub. The idea
> > is that grub should read the first lvm on each pv. This first lv must be only on
> > this pv. (and have a special name, eg lv_root, so grub can find it)
> 
> Limiting to the ``first LV'' sounds ugly. When you read the first, is it
> that hard to read the second (and allow arbitary names)  ?

You need to distinguish 'bootable' LV from others. This could either
be 
by LV name or a 'bootable' flag.  However if we need a flag anyway and 
could accept the restriction to have to root fs contigous on a single
PV
and non striped we could simply save the starting block and size as
well.
This is not that different from a partition.

For example HP-UX has a simple hack in the boot area which holds
the start and size of the /stand fs such that the boot loader
and the kernel could simply handle this as a partition equivalent
during boot.

It should be possible to detect this 'bootable' flag and the
start/size
in the LVM init code without causing much kernel bloat and create the 
equivalent of a partition using a fixed major/minor. vgscan could then 
in user space create the device files accordingly such that the 
major/minor of the LV holding the root fs is mapped accordingly.

AFAIR someone already did something similar by hacking the partition
table  and creating an overlapping partition which just happened to
map to the root LV.


Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
