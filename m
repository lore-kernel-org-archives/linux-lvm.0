Return-Path: <root@srv.sistina.com>
Date: Wed, 18 Jul 2001 17:25:07 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Newbie question
Message-ID: <20010718172507.E24438@sistina.com>
References: <FDEJIMPDHJAAPNLFKBMGAECACEAA.tgs@iafrica.com> <20010712094638.B418@btconnect.com> <200107121612.MAA13656@burns.luca.2y.net> <20010713131200.C32198@sistina.com> <200107131652.MAA15766@burns.luca.2y.net> <20010716133321.E11625@sistina.com> <235800000.995296082@dizzy> <20010717013610.G29657@colombina.comedia.it> <20010717103159.A8557@gatekeeper.osp.nl> <20010717215811.A2427@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20010717215811.A2427@colombina.comedia.it>; from bluca@comedia.it on Tue, Jul 17, 2001 at 09:58:11PM +0200
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

On Tue, Jul 17, 2001 at 09:58:11PM +0200, Luca Berra wrote:
> sorry if i am getting way offtopic here but reply is a must
> 
> On Tue, Jul 17, 2001 at 10:31:59AM +0200, josv@osp.nl wrote:
> > Hi all,
> > 
> > Just for the record, HP-UX's vg layout is not in /stand. Information about
> > essential logical volumes (boot (/stand), root (/), primary swap and dump) 
> > is stored in a LIF file (LABEL) in the boot area's of the disk (use the lifls 
> > command to display the structure of the boot area). The lvlnboot command is used
> i was referring to:
> (from the lvlnboot manpage)
>  FILES
>       /stand/rootconf          Contains the location of the root volume.
>                                Used during maintenance-mode boots (see
>                                hpux(1M)) to locate the root volume for
>                                volume groups with separate boot and root
>                                volumes.
> 
> ok, i was not exactly correct but if you follow me you will maybe
> pardon me.

:)

> Steven stated that hpux -lm worked because HP9000 were able to
> understand LVM in firmware.
> i stated that hpux -lm works because lvm info is stored in a file in
> stand.

Luca is right: PDC (Processor Dependant Code; that's their kind of BIOS) doesn't
know anything about LVM. It understands LIF (Logical Interchange Format; kind
of a very simple filesystem)

> 
> The real truth:
> /stand/rootconf does not contain LVM info
> it just contains info about the location on disk of the root lv
> meening starting offset and lenght (it is used only on split
> boot/root configurations when booting in LVM mainteinance mode)
> 
> on my workstation
> # od -x /stand/rootconf
> 0000000 dead beef 000d 5b60 0004 0000
>        | magic   | offset  | size
> 
> /stand/rootconf is created/updated using lvlnboot -c
> 
> 
> lvlnboot updates both the LABEL file and the BRDA on the PV
> the kernel during normal boot reads the BRDA, not the LABEL file
> the LABEL file is used by the hpux utility, it is also used
> by offline diagnostics.

Sorry for sounding picky:

rootconf contains that information *but* the info is used to
switch to the real *root* filsystem which is necessary in HP-UX in order
to have root journaled (supported since HP-UX 10.20 IIRC).

The offset and length above is for sure the one of the root LV, because the
root LV needs to be contiguous with its LEs in sequential ascending order.
*But* as stated below, the LVM driver is deactivated in LVM maintenance
mode. Therefore the kernel mainly reads the offset info from /stand/rootconf
(BTW: stand is mounted as root at that point in time) in order to switch
to the 'real' root filesystem.

BTW: as briefly said above, seperate stand/root filesystem are
     necessary in HP-UX in order to have root journaled.
     If you need to recreate such a stand/root configuration after a crash
     and you don't do that with *exactly the same* VG parameters for the root
     VG, this leads to a different root LV offset. An unconditional restore to
     /stand will cause an unbootable system, because the restored offset in
     /stand/rootconf is incorrect then :-(
     In this case only a nice echo trick to recreate /stand/rootconf
     (knowing HP VGDA size params) can bring your system back to life again ;-)

> 
> > to query and change the LABEL file. The mapping between VG and PV's is stored
> > in the /etc/lvmtab file. This file is used by the vgchange command to activate
> > volume groups. At boot time, /etc/lvmrc is run from the inittab, and it
> > executes a 'vgchange -a y' for all volume groups.
> this is not strictly correct (lvmrc is a script anc can/must be customized
> not to activate all VGs in a clustered environment)
> 
> > The "-lm" boot option in HP-UX disables the lv driver (major 64), so only the
> > /stand, /, pri swap and dump "volumes" are available. Not as logical volumes,
> > but directly from the disk because these volumes must be contiguous. This
> this is just plain wrong
> only root is available to the system in lvm maint mode (via /stand/rootconf)
> /stand and pri swap are not, let alone dump.
> /stand must be contiguous at the beginning of the boot disk so the
> hpux utility can read a kernel off it
> / must also be contiguous on the boot disk so the kernel can map it
> swap and dump can be on any disk (the latter only if IODC is able to
> map it) and must be both contiguous. (yes primary swap does not need
> to be on lvol2 and on the first disk, altough this is the default)
> 
> > option is necessary in HP-UX since it basically only supports LVM disk setups
> > (whole disk layout is also supported, but almost never used...). If Linux
> AFAIRC whole disk works only on disks < 1GB or so
> 
> > would ever get to the point that LVM (or its successor) is *the* choice for
> > partitioning all disks (even the boot disk), we would need such an option as
> > well because otherwise there would be no path to recovery in case of LVM
> > data corruption.
> 
> honestly i believe having a resizable root volume is better than being able to
> mount root without using lvm. since i can stick enough tools to recover lvm in
> an initrd or on a emergency cd-rom.

Agreed.

> 
> ....
> > ++Jos
> > "Who could not resist commenting on this, sorry..."
> 
> me neither, sorry again....

:)

> 
> L.
> -- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
