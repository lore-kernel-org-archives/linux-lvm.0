Message-Id: <199908282250.AA10839@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] LVM and devices
Date: Sun, 29 Aug 1999 0:47:10 METDST
In-Reply-To: <199908281918.NAA29020@webber.adilger.net>; from "Andreas Dilger" at Aug 28, 99 1:18 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@enel.ucalgary.ca>
Cc: linux-lvm@msede.com, mge@ts1.ez-darmstadt.telekom.de

> 
> Heinz writes:
> > > I haven't had a chance to
> > > look yet).  For that matter, LVM shouldn't be tied to the /dev names of
> > > anything, since you could just start traversing the available devices,
> > > find a list of UUIDs that make up a VG, and not have to worry about the
> > > /dev names of anything (nor even store them anywhere).
> > 
> > Actually, it depends on /dev namespace today.
> > 
> > But the sole reason for this is perforrmance.
> > 
> > We could simply throw that dependency away, if we go devfs or
> > could live with performance impacts without devfs.
> 
> It shouldn't be a big change to have LVM not STORE the device names in
> the VGDA,

It doesn't use a stored devices name in the PV part of the VGDA today.
The device name is inserted at PV read time (see pv_read()).

> and something like a pvscan is done at boot-time (after the LVM
> module is loaded, if a module) to determine PV -> /dev mapping.  The LVM
> kernel code would still use the device name/major+minor in memory to
> access the devices, so there should be no performance impact outside a
> small amount of scanning at boot time or when a new VG is imported.
> 

What i meant with performance impact is the longer time to scan large
/dev configurations in user space (vgscan, pvscan and friends).

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
