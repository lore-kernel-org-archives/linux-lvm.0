Message-Id: <199907271540.AA07793@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] RAID and LVM?
Date: Tue, 27 Jul 1999 17:37:19 METDST
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

> 
> On Tue, Jul 27, 1999 at 02:23:53PM +0000, Heinz Mauelshagen wrote:
> > > i believe useful integrating raid and lvm
> > > it means a user can dcide the different raid policy
> ...
> > That's the Veritas Volume Manager concept.
> that is what i am accustomed to.
> i usually work on hp servers.
> are you suggesting there are better ways to do things?

Only different ways 8*)

I like HPs ease of use and concept. It avoids lots of work to
learn LVM administration and to use it in day by day business.
That's the reason why the Linux LVM is similar to HPs.

> 
> > > as a side question, how does LVM autodetect works
> > > (if it exists, that is)?
> 
> > Today, it's the initrd mechanism (partially) supported by lvmcreate_initrd
> > in LVM 0.7.
> that is what i tought, see my previous msg
> but the scan is done in user space, i was asking if some
> kernel space solution existed/was planned/has any sense

If we want to get rid of the initrd constraints there must be a driver
init time solution in the LVM, which is able to autodetect a 'boot' VG 
or at least a LILO parameter telling the LVM driver, which VG to use for boot.

This means on the other hand, that the driver code will be bigger
and therefore more complex than it is today. It's no kernel size issue,
because the code can be thrown away after init.

> 
> what i want to do is have both raid and LVM work and be autodetected
> at boot even if both are compiled as modules.
> why would i want to do this?
> Distributions, i would like both raid and lvm to become
> a standard part of all linux distributions.

I like your opinion ;*)

> 
> i hope that there will be some improvements in
> boot loaders, so we can avoid the small bios addressable
> partition, and completely avoid the idiotic pc partitioning
> cheme.
>

This means LILO^2.

But if you don't keep up with partitions/slices or whatever, you
you should have a kind of header anyway, which carries basic identifying
information about the disks contents/usage.
The information presented by disk firmware today is not sufficient
to avoid accidential misuse of the disk contents.

IMO it's not a big issue to have a small (~8-16m) bios addressable
partition (which could be MD mirrored) to store the kernel and some
neccessary stuff to fire the machine up including MD and LVM.

Regards,
Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
