From: benr@us.ibm.com
Message-ID: <8525690C.00058DDB.00@d54mta02.raleigh.ibm.com>
Date: Tue, 27 Jun 2000 21:00:37 -0400
Subject: Re: [linux-lvm] IBM to release LVM Technology to the Linux
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@home.com>
Cc: linux-lvm@msede.com



Andreas,

>For the purpose of this email, I will refer to fixed-size (e.g. 4MB or
16MB)
>chunks of the disk as logical blocks (LBs) and variable-sized chunks of
the
>disk as extents.

Agreed.

>With some careful coding, the existing
>Linux codebase for partition/filesystems/devices/raid can be used for
>LVMS, rather than re-implementing everything and bloating the kernel.

Yes - there is a great deal of existing code which could be
reused/repackaged.

>There will be enough people that DON'T want to use LVMS (for
>whatever reason) that it should not be reworked to only work with LVMS.

Agreed.

>One of the great benefits of having small LBs, as opposed to working
>with large extents, is that you can easily work with individual LBs
>to move/mirror/re-sync.  If you need to do the same thing with a large
>extent, it can be much more CPU/disk intensive than it needs to be, or
>can lock out the user/application longer than needed.

Small LBs are indeed easier to move, especially when compared to large
extents.  However, when it comes to mirroring and re-sync, it depends upon
your mirroring implementation.  It is rather easy for a mirroring
implementation to divide the address space being mirrored into the
equivalent of LBs, which can then be tracked as you describe with a bitmap.
True LBs are not needed for mirroring or similar items.

>AIX LVM has a simple bitmap which tracks stale LBs in a mirror LV (maybe
>caused by the disk being unavailable for a moment).  If you resync the LV,
>it only copies those parts that are stale, whereas you would need to copy
>the whole partition with your monolithic LVMS.  The same could be said
>for re-syncing a RAID 5 volume - you would only need to re-calculate
>the parity on the LB that was stale, rather than the whole partition.
>If you externally keep a bitmap of blocks for mirroring/raid/remapping
>within the extent, what is the point of having extents in the first place?

As I mentioned before, LBs can be simulated for most of those cases where
they are useful.  However, your question about why have extents at all is a
good one.  The answer, basically, is co-existence, compatibility, and
usability.  Using extents (partitions) allows us to co-exist with other
operating systems on the same machine, to share a disk with another
operating system, and to access the extents (partitions) used by other
operating systems.  The question then, is why bother with extents in
volumes?  Why not have volume groups made from extents, which are then
divided into LBs, and then the volumes constructed from the LBs?  The
answer to this is usability.  Before developing the LVMS Architecture, IBM
spent some time performing usability studies with our users.  The results
were not what we expected.  We found that users from the UNIX world were
reasonably comfortable with the standard LVM model employing volume groups.
However, there were a surprising number of users who were not.  Moving
outside of the UNIX world and into the Windoze/DOS/OS2 world, we found that
users rejected the concept of volume groups altogether.  Many never
understood what benefits volume groups were supposed to provide, and many
of those who did felt that the extra complexity of volume groups was not
worth the supposed benefits.  As a result of what we learned from these
studies, the LVMS Architecture was developed with the idea of eliminating
volume groups but providing as many of their advantages as possible, among
other things.

>If you can show me how an "Linux LVM" or "AIX LVM" partition plugin can
>actually work in the context of LVMS, without duplicating 90% of the
>LVMS functionality, and without requiring huge amounts of disk or memory
>space to handle a non-contiguous LV, then I will agree that LVMS is
superior
>and work on its development.

Well, I believe that I have only claimed that the LVMS has advantages.  I
make no claims as to it being superior.  The LVMS, like any LVM, makes
certain trade-offs.  The trade-offs made were based upon a certain set of
priorities, and not everyone has those same priorities.  Thus, beauty (and
superiority) is in the eye of the beholder.

As for how we plan to handle AIX volume groups and logical volumes, our
basic approach involves creating a set of plug-in modules.  We would have
an AIX Device Manager, an AIX Partition Manager, and one or more AIX
Feature plug-ins.

The AIX Device Manager would claim physical disks which are part of AIX
volume groups.  It would reconstruct the AIX volume groups and make each
volume group appear as a logical disk to the LVMS.  Thus, a volume group is
treated as if it was a single address space.  Each logical disk is given a
handle (32 bit) for use in identifying it.

The AIX Partition Manager would claim all logical disks that it recognizes
as AIX volume groups.  It would make each LB in the volume group appear to
the LVMS as a logical partition.  The logical partitions
created are each given a handle for use in identifying them.

The AIX Feature Plug-in would reconstruct the AIX logical volumes from the
LBs which appear as logical partitions.  At this point, each AIX logical
volume would appear as an aggregate, the topmost aggregate of an LVMS
volume.  Each logical volume has an LB table with one entry for each of the
LBs which are a part of the logical volume.  The order of entries in this
table corresponds to the order in which the LBs are used to back the
address space of the logical volume.  (I am assuming the simple, linked
case.  The LBs could be joined via software RAID as well, in which case a
different mechanism would be used with a different amount of overhead.)
Only the handle of the LB is stored in the table.  Thus, the size of the
table is (assuming 32 bit entries) 4 bytes per LB in the logical volume.
This table is then used as a hash table when converting the starting
address of an I/O request from being volume relative to being partition
(LB) relative.

The process of address translation which occurs for an I/O request against
an AIX logical volume can be summarized as follows:

The AIX Feature Plug-in translates the address from being logical volume
relative to being logical partition relative.
The AIX Partition Manager translates the address from being logical
partition relative to being logical disk relative.
The AIX Device Manager translates the address from being logical disk
relative to being device relative.

Of course, this follows the theoretical model put forth in the white paper
and does not take into account any possible optimizations.  It also assumes
the simple linked case as opposed to the software RAID case, which would be
more difficult to calculate.

How much memory does this take?  Well, the kernel component of the LVMS is
designed to be small.  As such, it only stores the data needed for
accessing the logical volumes, logical partitions, logical disks, and
devices.  Thus,  for a logical volume, it needs 4 bytes for each logical
partition it contains.  The AIX Partition Manager would need four bytes per
logical partition to store the starting address of the logical partition,
which is needed in translating the logical partition relative address into
the logical disk relative address.  How much memory the AIX Device Manager
would need to translate the logical disk relative address into the physical
disk relative address is minimal, and grows according to the number of
disks in the volume group being represented as a logical volume.  This
memory is small in comparison to the memory required by AIX Feature and AIX
Partition Manager plug-ins.  Thus, the ratio of LBs to memory that can be
managed by this system should approach 131000 LBs per MB,
unless my math is off.  At 4MB per LB, this would yield approx. 500 GB of
filesystem space per MB of memory expended to manage the LBs corresponding
to the volume underlying the filesystem.  Of course, the method presented
here is the simplest, not to avoid anything, but because it is the easiest
to explain and calculate results for.  YMMV ;-)

I hope the above description is adequate to give you an idea of what we are
thinking of when it comes to accessing and using AIX volume groups and
logical volumes.  As for avoiding duplicate functionality, I doubt that is
possible.  However, as the LVMS uses plug-in modules to do its work, kernel
bloat could be reduced by simply loading only those plug-in modules that
are actually going to be used.  In fact, it should be possible to program
the LVMS to identify and discard unused plug-in modules, unless there are
some limitations in the kernel that I am not currently aware of.

Regards,

Ben
