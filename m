Message-Id: <199907271227.AA28175@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] RAID and LVM?
Date: Tue, 27 Jul 1999 14:23:53 METDST
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


> 
> On Mon, Jul 26, 1999 at 10:25:50PM +0200, Ingo Molnar wrote:
> > (rather flame me for it ;) The new RAID driver will likely not go into
> > 2.2.11, but into 2.2.12. Anyway, the new RAID 0723 release is much more
> > merging-friendly wrt. LVM.
> 
> ok, you asked for it ;)
> there is still some idiosyncrasye wrt HSM and it doesn't build.
> *joking*
> 2.2.11 or 2.2.12 does not seem to be a big problem to me.
> 
> > > or ideally for raid to be fully integrated into LVM, and create
> > > RAID-5 VG's. 
> > or, considering the relative complexity of the two drivers (and the
> > conceptual background), to integrate LVM into the concepts of RAID :) Or
> i dont understand your last sentence
> > let them live side by side as now.
> 
> i believe useful integrating raid and lvm
> it means a user can dcide the different raid policy
> for each type of data.
> eg. striping for /var/spool/junk
> 3 way raid1 for /very/important/stuff
> raid5 for /other/data

That's the Veritas Volume Manager concept.

> 
> Leaving things as now is still very useful, and i will be very 
> happy to have this arrangement finalized.
> we really need to fix LILO (or another boot loader, grub already
> can read ext2 filesystems) to be able to understand raid and lvm.
> 
> as a side question, how does LVM autodetect works
> (if it exists, that is)?
> 

Today, it's the initrd mechanism (partially) supported by lvmcreate_initrd
in LVM 0.7.
Basically the idea is to have a bios addressable partition (8MB is sufficient)
with initrd, vmlinuz, linuxrc, sbin/vgchange, sbin/vgscan, ... and to switch
to the real root after activating the root volume group in linuxrc.
All the rest can be under lvm control.

Basically the lvm driver can take care of reading the VGDA from the
root VG disks at init time.

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
