From: Andreas Dilger <adilger@turbolabs.com>
Message-Id: <200006150619.AAA24808@lynx.turbolabs.com>
Subject: [linux-lvm] Re: IBM to release LVM Technology to the Linux Community
Date: Thu, 15 Jun 2000 00:19:37 -0600 (MDT)
In-Reply-To: <852568FE.00750CE1.00@d54mta02.raleigh.ibm.com> from "benr@us.ibm.com" at Jun 14, 2000 05:18:26 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: benr@us.ibm.com
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Ben Rafanello writes:
> IBM is releasing one of its most advanced architectures for a Logical
> Volume Management System.  This architecture is quite interesting as it
> completely integrates all disk and volume management into a single, highly
> extensible, easy to use entity.  We hope that the release of this
> technology will lead to a world class logical volume management system for
> Linux, one which satisfies the requirements of our customers as well as
> those of the Linux Community.

It isn't clear from the white paper how the LVMS you describe relates
to the existing Linux LVM and/or IBM's AIX/OS2 LVM developments.
Is the LVMS described going to allow breaking up of "logical partitions"
(which appear to be the same as DOS or BSD partitions) into "logical
extents (LE)" of a fixed size (e.g. 4MB)?  Having smaller fixed-size LEs
are very important in terms of being able to manage the space properly.
Unfortunately, in IBM's LVM there is already something called a "logical
partition" which doesn't appear to be the same thing you refer to in
the white paper, so this is a bit confusing.

From looking at the separate LVMS components, it appears that the Linux
kernel already has a majority of the functionality for this (e.g. RAID 0,
RAID 1 (mirroring, drive linking), RAID 5, partition managers, many device
managers).  Having it implemented in the LVMS framework would still be
(IMHO) a very good thing, as it makes things considerably more modular.

One thing that I'm not too sure about is why the filesystem interface
modules (FIMs) need to be able to do things like fsck and mkfs?  I
can understand that resizing the filesystem needs co-operation between
the LVM and the filesystem.  However, it also sounds like you would
incorporate fsck and mkfs to be functions that the kernel could call -
why is this?

One thing that is not very clear is if IBM will be leveraging its AIX/OS2
code for the LVM, or will this essentially be a new implementation?
It would be good to hear that IBM is making its LVM available, as it is a
very stable, mature code base.  It does sound like the LVMS described
has more functionality than the existing AIX LVM, because it has to deal
with the morass of partition formats and filesystems that exist under
Linux.  Also, the plug-in support sounds like a good improvement over
the existing LVM implementations, since it brings the various disk
"drivers" like LVM/RAID/encryption/partition into a cohesive framework.

Cheers, Andreas
