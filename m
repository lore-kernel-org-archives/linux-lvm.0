Return-Path: <root@srv.sistina.com>
Date: Tue, 17 Jul 2001 13:39:13 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Newbie question
Message-ID: <20010717133913.G17345@sistina.com>
References: <FDEJIMPDHJAAPNLFKBMGAECACEAA.tgs@iafrica.com> <20010712094638.B418@btconnect.com> <200107121612.MAA13656@burns.luca.2y.net> <20010713131200.C32198@sistina.com> <200107131652.MAA15766@burns.luca.2y.net> <20010716133321.E11625@sistina.com> <235800000.995296082@dizzy> <20010717013610.G29657@colombina.comedia.it> <20010717103159.A8557@gatekeeper.osp.nl>
Mime-Version: 1.0
In-Reply-To: <20010717103159.A8557@gatekeeper.osp.nl>; from josv@osp.nl on Tue, Jul 17, 2001 at 10:31:59AM +0200
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jul 17, 2001 at 10:31:59AM +0200, josv@osp.nl wrote:
> Hi all,
> 
> Just for the record, HP-UX's vg layout is not in /stand. Information about
> essential logical volumes (boot (/stand), root (/), primary swap and dump) 
> is stored in a LIF file (LABEL) in the boot area's of the disk (use the lifls 
> command to display the structure of the boot area). The lvlnboot command is used
> to query and change the LABEL file. The mapping between VG and PV's is stored
> in the /etc/lvmtab file. This file is used by the vgchange command to activate
> volume groups. At boot time, /etc/lvmrc is run from the inittab, and it
> executes a 'vgchange -a y' for all volume groups.
> 
> The "-lm" boot option in HP-UX disables the lv driver (major 64), so only the
> /stand, /, pri swap and dump "volumes" are available. Not as logical volumes,
> but directly from the disk because these volumes must be contiguous.

IOW: they encapsulate root, dump and primary swap (pretty often dump
     and swap are the same) as LVs, which therfore never can take full
     advantage of LV features like extension, data relocation etc.

> This
> option is necessary in HP-UX since it basically only supports LVM disk setups
> (whole disk layout is also supported, but almost never used...). If Linux
> would ever get to the point that LVM (or its successor) is *the* choice for
> partitioning all disks (even the boot disk), we would need such an option as
> well because otherwise there would be no path to recovery in case of LVM
> data corruption.

That's a reason why future post 1.0 Linux LVM versions will have enhanced
redundancy in the metadata *and* checksums on every structure there to have
better and faster consistency checks on them.
Another one is that we nead enhanced metadata reliability anyway to activate
essential LVs (like the one containing the root filesystem and such).

> 
> With Veritas Volume Manager you have the option to encapsulate the boot disk.
> The encapsulation process turns the boot disk in a PV (terminology: VM disk)
> with a bunch of (logical) volumes laid out at exactly the same disk blocks as
> the root, swap, usr and other partitions. I have very bad experiences with
> encapsulated boot disks in Solaris, and never use them if I can help it.
> For that reason I do not really favour converting my entire Linux boot disk
> to LVM. But that's just a personal opinion......
> 
> ++Jos
> "Who could not resist commenting on this, sorry..."

That prevented me from doing it ;-))
Oops, did it anyway.

Heinz

> 
> And thus it came to pass that Luca Berra wrote:
> (on Tue, Jul 17, 2001 at 01:36:10AM +0200 to be exact)
> 
> > On Mon, Jul 16, 2001 at 10:08:02AM -0500, Steven Lembark wrote:
> > > 
> > > >> Now I have a question. I read the HOWTO migrate the old root partition to a
> > > >> LV
> > > 
> > > Think really, really hard before trying this.  Linux on an X86 doesn't have
> > > an LVM aware bios and you cannot boot w/o LVM (e.g., HP's "-lm").  This
> > > means that if you have any error at all in LVM you cannot boot.
> > 
> > and HP9000 haven't either!
> > -lm works because the vg layout is saved in a file in /stand
> > they have LVM activation in the kernel tough (sorta, they still need a contiguous root, placed
> > on the same PV as the kernel is)
> > 
> > > A safer approach -- especially if you havn't used LVM before -- is to use
> > > the first 2-3 partitions for /, swap and /var.  This allows you to boot even if
> > maybe / if linux had a sane use for /sbin, but swap and var are unneeded.
> > 
> > (btw i have lvm root and i am happy)
> > 
> > L.
> > 
> > -- 
> > Luca Berra -- bluca@comedia.it
> >         Communication Media & Services S.r.l.
> >  /"\
> >  \ /     ASCII RIBBON CAMPAIGN
> >   X        AGAINST HTML MAIL
> >  / \
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> -- 
> With all the things you are losing,
> You might as well resign yourself,
> And try and make a change...
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
