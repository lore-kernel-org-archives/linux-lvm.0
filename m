Message-Id: <199911221239.AA12854@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Q: active/inactive/imported/exported group ?
Date: Mon, 22 Nov 1999 13:36:13 MET
In-Reply-To: <383928ED.A75F5144@mchp.siemens.de>; from "Gerhard Fuernkranz" at Nov 22, 99 12:28 (noon)
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gerhard Fuernkranz <gerhard.fuernkranz@mchp.siemens.de>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> 
> Recently I've made my first steps with LVM and
> I think I really like it. I've just a few questions:
> 
> I'm wondering, what's the actual difference betweent
> an inactive, imported and an exported group?

Inactive - LVM driver doesn't have table information about a VG
           ("vgchange -ay" activates VG(s))
Imported - Metadata on PV(s) is set up for activation
           ("vgscan" can find these VG(s) and can build
            /etc/lvmtab + /etc/lvmtab.d/*)
Exported - Metadata on PV(s) is set up to move PV(s) to a different system

> 
> My impression was, that exported groups are ignored
> by "vgscan" and therefore cannot be activated later.
> Is this merely the only difference?

Yes.

> 
> Furthermore I tried to move an inactive but *imported*
> group to another host:
> 
>    on host A:
>    vgchange -an <group>
> 
>    move disks to host B
>    on host B:
>    vgscan
>    vgchange -ay <group>
> 
> ... and it seemed to work.

Yes it does.
But only in case that there's no VG with the same name on this system before.
Then you will not be able to scan and activate any of these VGs because
the VG name is not unique.

> 
> Is there anything wrong, if I transport disks
> in this way?

If you don't have a VG with the same name on the other system, it's o.k.
for now.
One of my TODO items for the future still is to have UUIDs
(Uniform Unique Identifiers) for VGs and for system ownership of a VG.

Until this will be implemented, you don't run into trouble.
So far it's a good possiblity to multiply installations 8*)


> Can there be any bad side effects,
> if I do *not* export on host A and then import on host B,
> but only deactivate on host A and then scan and activate
> the group on host B?

See above (VG name collision).

> 
> Is there a reason why I have to specify phys. disks for
> the "vgimport" command? Would'nt it also be possible to
> scan all disks for the group that is to be imported?

Yes, that's possible.
But this is an enhancement which has to be implemented.

A simple sh+grep+sed workaround for today is to do a pvscan, figure out
all PVs belonging to the exported VG, parse the PV name out
of this information and set up a corresponding vgimport command line.

> 
> And one last question:
> When does LVM assign minor device numbers to a volume?

At lvcreate time _and_ at vgscan time.

> Will the minor number of a volume remain constant as long
> as the volume exists in the group or does LVM assign new
> minor numbers each time a group or volume gets activated?

See my previous statement.

> 
> 
> Thank you very much in advance,
> Gerhard
> 

You're welcome.

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
