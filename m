Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200106130710.f5D7AhaX005430@webber.adilger.int>
Subject: Re: [linux-lvm] expanding physical disks
In-Reply-To: <20010612212804.P1658@pc.ilinx> "from Brian J. Murrell at Jun 12,
 2001 09:28:04 pm"
Date: Wed, 13 Jun 2001 01:10:42 -0600 (MDT)
MIME-Version: 1.0
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

Brian Murrell writes:
> How does LVM deal with physical disks that can get bigger or smaller,
> such as a hardware RAID device?  What happens to a PV on a hardware
> RAID-5 device that is presented to the system as a single (say scsci)
> target when you put a few more disks in it and tell the hardware raid
> device to add them to the given (scsi) target that a PV was created
> on?  (what a mouthful).

Doesn't work at this time.  LVM will only see what was originally there
at the time pvcreate was run (or possibly vgcreate/vgextend).

It would not be impossible to fix this, however, depending on your needs.
The way the VGDA is layed out is as follows:

PV data
VG data
PV UUID list
LV data
PE map
(padding = original PV size % PE size (usually))
PE 0 = start of user data

When you increase the size of the PV itself, you are essentially adding
PEs to the end that need to be added to the PE map.  It is possible that
the PEs will fit into the padding space.  If that is the case, you don't
have many problems, and you are happy, assuming you know enough about
LVM user tools and metadata layout to write a tool to do this.

If the new PEs don't all fit into the padding space (it may happen if
your starting PV size is just a couple hundred kB over n * PE size),
then you will need to pvmove PE0 from its current location to somewhere
else in the VG, and then renumber all of the PEs on that PV as (PE# - 1).
That couble be ugly because I believe the PE number is stored in the
snapshot tables and such.

Probably not worth the effort.  Since each PE map entry is only 4 bytes
in size at this time, and you will normally have at least 4MB PEs, on
average you will be able to grow to 2MB/4*4MB=2TB (max ~4TB) without
any need for the complexity of the second option.  With 8MB PEs, you
get on average 8TB (max ~16TB).

The simple answer is don't do that.  If you write a tool to handle the
first case, then all you need to do is make the PE size sufficiently
large that you will "always" have enough padding to extend the PV to
any practical size.  You can easily hack the LVM code to ensure that
the pe_on_disk.size is always large enough to add an arbitrary number
of PEs, just by subtracting one or more PEs from the usable space at
the time it is initially set up.

> Is this really possible or can one only expand a hardware raid array
> for LVM usage by adding additional raid targets and then adding the
> raid targets as PVs to a VG?

This is the only currently available way to do it, the speculation
above notwithstanding.  Another solution (if you have the disk space)
is to pvmove all of the PEs from the PV you want to expand, vgreduce
the PV from the VG, extend the PV to the new size, pvcreate it again,
and then vgextend the VG with the "new" PV.  This requires 2xPV size
whenever you need to extend the PV, which is kind of counter productive.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
