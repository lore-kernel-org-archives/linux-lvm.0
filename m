Message-Id: <199908281636.AA06141@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] LVM and devices
Date: Sat, 28 Aug 1999 18:33:28 METDST
In-Reply-To: <199908280354.VAA27433@webber.adilger.net>; from "Andreas Dilger" at Aug 27, 99 9:54 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adilger@enel.ucalgary.ca
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> Heinz writes:
> > > I may be a day late and a dollar short here, but I experienced a problem
> > > this morning when I added a new scsi drive to my 2.2.10 system. I know
> > > that the os scans for devices when the system boots and assigns device
> > > names then. Well this screwed up my volume groups because sda1 is now
> > > sdb1, you get the idea nothing new here. I know this has been discussed
> > > before.
> > 
> > Run vgscan and VGs should be o.k. again.
> 
> Is it possible to integrate LVM with devfs in such a way that LVM actually
> creates the devices in devfs with proper names, like in AIX?

Sure.
That's one of the future extensions.

> It should be
> able to identify PVs by UUID (if this is in 0.7,

Today it identifies PVs by  PV number/VG name  pair.
That obviously is not unique ;*)
But it's sufficient on a single computer system.

> I haven't had a chance to
> look yet).  For that matter, LVM shouldn't be tied to the /dev names of
> anything, since you could just start traversing the available devices,
> find a list of UUIDs that make up a VG, and not have to worry about the
> /dev names of anything (nor even store them anywhere).

Actually, it depends on /dev namespace today.

But the sole reason for this is perforrmance.

We could simply throw that dependency away, if we go devfs or
could live with performance impacts without devfs.

> 
> This would finally free us from the changes to device names that even long
> SCSI names in devfs can't handle.  In AIX, you can move PVs around at will,
> or move disks for a VG from one system to another, and it will re-assemble
> itself, as it never uses the device names, except when showing user output.

If you do that in Linux (vgexport/vgimport), it works too but no UUIDs
with PVs and VGs today 8*(

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
