From: Andreas Dilger <adilger@home.com>
Message-Id: <200004041551.e34Fpju06920@webber.adilger.net>
Subject: [linux-lvm] Re: LVM 256 logical volume limit
In-Reply-To: <000801bf9deb$f7f3f920$2bcb1b3f@dell01> "from Michael Roever at
 Apr 3, 2000 11:12:19 pm"
Date: Tue, 4 Apr 2000 09:51:45 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Roever <mroever@earthlink.net>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Michael Roever writes:
> I am wondering what it would to take change the LVM code to support more
> volume groups and logical volumes.

I think the 255 LV limit is imposed by having only 16-bit device node numbers.
LVM has 1 major device assigned, which has 255 minor devices possible.  In
order to have more LVs, you would need to have one or more additional major
block numbers assigned to LVM, or you can wait until 2.6 when there will
probably be 32-bit device numbers.

As there are lots of block device numbers free, I'm sure that Heinz can get
some more major numbers allocated from H. Peter Anvin for LVM.  I'm not sure
what kind of code rework is necessary for the lvm kernel support to handle
multiple major numbers, but it probably isn't too bad.

> I would like to see the Logical
> Volume Manager support something along the lines of the following:
> 
>      Volume Groups:  1024
>    Logical Volumes:  2048 per volume group

Actually, having a fixed number of LVs per VG is counter productive,
as you will not optimally use the (limited) device numberss.  You are
better off with the current "pool" of LV minor numbers.  I doubt you
will need 2 million 1GB LVs?  The largest SP system I ever worked on
(500GB OPS) only had about 1200 LVs of differnet sizes for the DB.

[Re IBM VSDs (shared disks)]]
> In order to accomplish this, a LVM is a prerequisite.  In a large
> cluster, you have the potential to have a large number of volume groups
> and a very large number of logical volumes.

This is not necessarily true that you need LVM for VSDs.  You could always
just share the raw disk partitions instead of LVs...  LVM just makes it
a lot easier to mirror, migrate, and manage the disks.  In any case,
Linux already has such a thing - it's called "network block device",
and it is available in 2.2 and 2.3 kernels already.

What you really want is RVSD (recoverable VSD) in order to improve the
availability of the system, which needs twin-tail SCSI/SSA/FC and I
don't think Linux can handle that yet, and I severly doubt that the NBD
support has any idea about device takeover, which requires a lock manager
and other fun recovery tools.

However, I don't think Oracle Parallel Server is available for Linux (or
will be in the near future), so you couldn't use any of this anyways.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
