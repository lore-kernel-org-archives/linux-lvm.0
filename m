From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How to fix inconsistent LV structs?
Message-ID: <20021009132310.D23965@sistina.com>
References: <3D9F6C62.1040004@raffael.ch> <20021007104201.A17176@sistina.com> <87ptumhaj4.fsf@mail.raffael.ch> <20021007132840.A17632@sistina.com> <878z1atmqp.fsf@mail.raffael.ch>
Mime-Version: 1.0
In-Reply-To: <878z1atmqp.fsf@mail.raffael.ch>; from herzog@raffael.ch on Mon, Oct 07, 2002 at 03:14:06PM +0200
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
Date: Wed Oct  9 06:24:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 07, 2002 at 03:14:06PM +0200, Raffael Herzog wrote:
> Hi Heinz,
> 
> Heinz J . Mauelshagen wrote:
> 
> > nothing in the log directly related to LVM :(
> > But your hint WRT naming devices could help us.
> > Do you have devfs mounted on /dev and don't use the full devfs
> > names in all cases?
> 
> I don't use devfs at all (yet), but the device nodes were
> present all the time. What do you mean with "full devfs
> names"?

I meant nasty devfs names like /dev/scsi/host0/bus0/target0/lun0/part1 ;)

But as you say, you don't use it, which brings us back to the overwrite
assumption and the necessary vgcfgrestore's.

I recommend to save the metadata of all PVs belonging to the gone VG
for potential later analysis with "dd if=/dev/PV of=PV.vgda bs=1k count=4k".
Insert all your PVs (say AllPVs) in sequence for "PV"
(i.e. for PV in AllPVs; do dd if=/dev/$PV of=${PV}.vgda bs=1k count=4k;done).

The procedure to restore your metadata to all those PVs goes:

- run "pvcreate -yff AllPVs"
- run "for PV in AllPVs;do vgcfgrestore -n NameOfTheVG /dev/$PV;done"
- run "vgscan ; vgchange -ay"

Should be it...

> 
> Maybe these excerpts of the output of pvdata help (this is
> from a run after I did pvcreate -ff):
> 
> ,----[ pvdata -d /dev/hda7 ]
> | [...]
> | <1> lv_copy_from_disk -- CALLED
> | <1> lv_copy_from_disk -- LEAVING
> | <1> lv_check_consistency -- CALLED
<SNIP>
> `----
> 
> So you see, there was really a lot of garbage... :-)

Was likely if overwriten.

> 
> I also saved the outputs of pvscan -d and vgscan -d, in case
> you think they help.

Well, they should just harden the garbage ;)

> 
> 
> > If so, please retry giving the full names.
> 
> I can't try anything anymore because I decided not to use
> LVM anymore at least until I know what happened and I know
> that it won't happen again. Sure, it's probably not the
> fault of LVM, but I think, if I would have been using "plain
> ext2/3", I probably wouldn't have lost just *all* of my data
> (lucky that I had a very young backup, so I actually didn't
> loose anything).

That depends on the nature of the overwrite. Could at least kill a filesystem
if enough is written to the device.

Regards,
Heinz    -- The LVM Guy --

> 
> cu,
> 
>    Raffi
> 
> 
> -- 
> => Neu im Usenet? Fragen?    http://www.use-net.ch/usenet_intro_de.html <=
>   The difference between theory and practice is that in theory, there is
>                  no difference, but in practice, there is.
> Raffael Herzog - herzog@raffael.ch - http://www.raffael.ch - ICQ #67961355
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
