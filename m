From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199908280354.VAA27433@webber.adilger.net>
Subject: Re: [linux-lvm] LVM and devices
Date: Fri, 27 Aug 1999 21:54:09 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>

Heinz writes:
> > I may be a day late and a dollar short here, but I experienced a problem
> > this morning when I added a new scsi drive to my 2.2.10 system. I know
> > that the os scans for devices when the system boots and assigns device
> > names then. Well this screwed up my volume groups because sda1 is now
> > sdb1, you get the idea nothing new here. I know this has been discussed
> > before.
> 
> Run vgscan and VGs should be o.k. again.

Is it possible to integrate LVM with devfs in such a way that LVM actually
creates the devices in devfs with proper names, like in AIX?  It should be
able to identify PVs by UUID (if this is in 0.7, I haven't had a chance to
look yet).  For that matter, LVM shouldn't be tied to the /dev names of
anything, since you could just start traversing the available devices,
find a list of UUIDs that make up a VG, and not have to worry about the
/dev names of anything (nor even store them anywhere).

This would finally free us from the changes to device names that even long
SCSI names in devfs can't handle.  In AIX, you can move PVs around at will,
or move disks for a VG from one system to another, and it will re-assemble
itself, as it never uses the device names, except when showing user output.

Cheers, Andreas
-- 
Andreas Dilger  University of Calgary \ "If a man ate a pound of pasta and
                Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \  cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/      hungry?" -- Dogbert
