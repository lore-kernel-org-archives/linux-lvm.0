From: Andreas Dilger <adilger@home.com>
Message-Id: <200006261916.e5QJGJq05585@webber.adilger.net>
Subject: Re: [linux-lvm] IBM to release LVM Technology to the Linux
In-Reply-To: <85256906.006BCDB7.00@d54mta02.raleigh.ibm.com> "from benr@us.ibm.com
 at Jun 22, 2000 03:37:29 pm"
Date: Mon, 26 Jun 2000 13:16:19 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benr@us.ibm.com
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Ben writes:
> What is a partition?  By definition, a partition is a contiguous block of
> disk space.
> 
> What is an extent?  By definition, an extent is a contiguous block of disk
> space.

For the purpose of this email, I will refer to fixed-size (e.g. 4MB or 16MB)
chunks of the disk as logical blocks (LBs) and variable-sized chunks of the
disk as extents.

> What is the difference between them?  Besides the names, nothing in and of
> themselves.  What's different is how they are managed, specifically the
> structures and rules used to manage them.

I agree with this... However unless you make your LVMS infrastructure
handle many thousands of extents in an efficient manner, it will not
work well with the existing LVM implementations.  You suggest that the
Linux/AIX LVM can be abstracted by a partition plugin, but this would
could be very expensive to handle each LVM LB as an individual partition.
In practise this is not usually true, but I have seen (poorly configured,
mind you) AIX PVs that are fragmented into many tens of LVs, and each
LV is spread over 10 disks, making many hundreds of separate extents in
a single VG.

> The MacIntosh partitioning scheme was merely an example.  With the proper
> plug-ins, an LVMS based upon the architecture in the white paper would be
> able to access and manipulate logical volumes (and volume groups) created
> by AIX, for example.  Again, though, implementing support for other OS
> partitioning schemes and logical volume management schemes aids in
> migration to Linux.

I totally agree with this.  With some careful coding, the existing
Linux codebase for partition/filesystems/devices/raid can be used for
LVMS, rather than re-implementing everything and bloating the kernel.
Linux already has 90% of the functionality needed to do this - all it
requires is the framework to handle it in an abstract way like LVMS
proposes.  There will be enough people that DON'T want to use LVMS (for
whatever reason) that it should not be reworked to only work with LVMS.

> I don't understand your example.  Change the word extent to partition and
> you have:
> 
>  A 30 GB RAID5 LV could be constructed from 4 x 10 GB partitions on 4
> different
> physical disks + a 10 GB hot spare partition on a fifth disk, for instance.
> 
> This is exactly what you would have under the LVMS described in the white
> paper.  Your example shows nothing which could not be done through the LVMS
> architecture with partitions.  Am I missing something here?

The real problem is that if you want to grow your volume, you need to
create 4 new extents.  If you want to grow it again, you need 4 more
extents, etc.  What it boils down to is that you really want logical
blocks that are small enough to use disk space efficiently, and handled
efficiently enough (memory/disk maps to organize them) that you can have
many hundreds/thousands to make a single filesystem.

One of the great benefits of having small LBs, as opposed to working
with large extents, is that you can easily work with individual LBs
to move/mirror/re-sync.  If you need to do the same thing with a large
extent, it can be much more CPU/disk intensive than it needs to be, or
can lock out the user/application longer than needed.

AIX LVM has a simple bitmap which tracks stale LBs in a mirror LV (maybe
caused by the disk being unavailable for a moment).  If you resync the LV,
it only copies those parts that are stale, whereas you would need to copy
the whole partition with your monolithic LVMS.  The same could be said
for re-syncing a RAID 5 volume - you would only need to re-calculate
the parity on the LB that was stale, rather than the whole partition.
If you externally keep a bitmap of blocks for mirroring/raid/remapping
within the extent, what is the point of having extents in the first place?



This isn't to say that I don't see some benefit in using whole partitions
instead of LBs.  It could be likened to an extent-based filesystem (like XFS)
compared to a block-based filesystem like ext2.  In most cases you really
allocate the space in large chunks, so extents are good.  However, in some
cases (e.g. log files (in a filesystem), or /usr (for AIX LVM)) you tend to
allocate space in small increments, and having many separate extents.

If you can show me how an "Linux LVM" or "AIX LVM" partition plugin can
actually work in the context of LVMS, without duplicating 90% of the
LVMS functionality, and without requiring huge amounts of disk or memory
space to handle a non-contiguous LV, then I will agree that LVMS is superior
and work on its development.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
