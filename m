From: mauelsha@u9etz.ez-darmstadt.telekom.de
Message-Id: <199911221628.RAA25600@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Q: active/inactive/imported/exported group ?
In-Reply-To: <3839495F.5310BE71@mchp.siemens.de> from Gerhard Fuernkranz at "Nov 22, 1999  2:47:11 pm"
Date: Mon, 22 Nov 1999 17:28:41 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Gerhard Fuernkranz <gerhard.fuernkranz@mchp.siemens.de>
Cc: mge@u9etz.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> Heinz,
> 
> thanks for the fast answer -
> just a few more questions:
> 
> Heinz Mauelshagen wrote:
> ...
> > > And one last question:
> > > When does LVM assign minor device numbers to a volume?
> > 
> > At lvcreate time _and_ at vgscan time.
> 
> Assume I have a group g1 with volume v1 and a group g2 with
> volume v2. Now I turn off the machine, remove g1's physical
> disks and power on the machine again. Does this mean, that
> vgscan may assign a *different* minor number to v2 after the
> reboot?

Yes.
But that's only a local resource for sure.

> 
> 
> Concernig my other question (imported/exported/active/inactive)
> probably I should explain, what I want to do:
> 
> I'd like to use LVM in a cluster with multihosted disks.
> Each host *can* access all disks, but I'll guarantee (howsoever),
> that only one host *does* access a disk/volume/volume-group
> at a time.
> 
> My idea was, that all hosts see all groups on the shared disks,
> but only *one* host activates a volume group at a time, while
> all other hosts don't activate the same group (but probably
> different ones). If I want to (logically) switch a volume group
> to a different host, then I deactivate it on the source host,
> re-"vgscan" on the target host and then activate the group on
> the target host.
> 
> Do you think, this strategy is ok?

Yes.

> I assume, that LVM does not write anything to a physical disk
> belonging to a deactivated group, correct?

Not till now.

> Can I just re-"vgscan" a (deactivated) group at any time in order
> to see all changes a different host has made to the group while it
> was deactivated on the local host?

Yes.

The read/write routines in the LVM library flush the buffer cache contents
of a physical volume to be sure to read actual data from disk(s) and
not to rely on cached data.
If like in your example one host changes a VG, the other one should
read actual VG data afterwards while doing a vgscan.


> 
> I did not want to export/import for two reasons:
> 
> - import does not search the disks for the group

Correct.
See my workaround proposal in my previous mail.

If you only have one exported VG you could import it for eg. with:

pvscan|grep EXPORTED|sed 's/^.*PV "//;s/".*$//'|xargs vgimport VGNAME

> - if a host with an activated group crashes, then it
>   has no chance to export the group anyway.
>   Nevertheless in this case I'd like to access the group
>   from different host in a cluster.
> 
> For operation in a cluster I'd also desire, that
> only one host can activate a group at time (-> i.e.
> the host claims ownership and e.g. writes its host name
> to all disks of the group)
> in order that no other host
> can accidently activate the same group at the same time.

I want to achive this by keeping a UUID of the VG owning sytem in the VGDA.

IMO we would need a cluster manager to take care of mastership of
shared resources.

> But there should also be a "forced" activation method to override
> this security mechanism (-> in case that the owner crashes).

But in this case a crashing host is not able to release the VG anyway.
So there must be a --force option to gain ownership of such a VG
_and_ the sure knowlegde that the crashed system is down _and_ stays down.
If not so there could be tricky races where the original 'owner' system
of our VG would try to regain ownership.

> IMHO something like this is NYI?

Not today 8*(

> 
> 
> Thanks,
> Gerhard
> 

Cheers,
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
