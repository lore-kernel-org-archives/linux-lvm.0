From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199908281918.NAA29020@webber.adilger.net>
Subject: Re: [linux-lvm] LVM and devices
Date: Sat, 28 Aug 1999 13:18:10 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Heinz writes:
> > I haven't had a chance to
> > look yet).  For that matter, LVM shouldn't be tied to the /dev names of
> > anything, since you could just start traversing the available devices,
> > find a list of UUIDs that make up a VG, and not have to worry about the
> > /dev names of anything (nor even store them anywhere).
> 
> Actually, it depends on /dev namespace today.
> 
> But the sole reason for this is perforrmance.
> 
> We could simply throw that dependency away, if we go devfs or
> could live with performance impacts without devfs.

It shouldn't be a big change to have LVM not STORE the device names in
the VGDA, and something like a pvscan is done at boot-time (after the LVM
module is loaded, if a module) to determine PV -> /dev mapping.  The LVM
kernel code would still use the device name/major+minor in memory to
access the devices, so there should be no performance impact outside a
small amount of scanning at boot time or when a new VG is imported.

Cheers, Andreas
-- 
Andreas Dilger  University of Calgary \ "If a man ate a pound of pasta and
                Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \  cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/      hungry?" -- Dogbert
