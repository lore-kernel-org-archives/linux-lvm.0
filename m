From: benr@us.ibm.com
Message-ID: <85256906.006BCDB7.00@d54mta02.raleigh.ibm.com>
Date: Thu, 22 Jun 2000 15:37:29 -0400
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <mkp@linuxcare.com>
Cc: linux-lvm@msede.com



Martin,

Welcome to the discussion, and thanks for sharing your opinion.

>>>>> "Andreas" == Andreas Dilger <adilger@turbolabs.com> writes:

Andreas> Having used both the AIX LVM, the Linux LVM, and the good-old
Andreas> DOS partitions, I would have to disagree with your statement
Andreas> that logical extents are of very little benefit.  One of the
Andreas> worst things to do in a DOS-partitioned world is to resize
Andreas> the partitions themselves.  You always have to over-estimate
Andreas> the partition sizes in case you need more space in the
Andreas> future, or add a whole new partition if you run out of space
Andreas> in the existing partition.

Martin>Andreas, you are preaching to the choir.  Partitions don't belong in
Martin>an LVM architecture at all.  They are a legacy thing which needs to
go
Martin>away.

What is a partition?  By definition, a partition is a contiguous block of
disk space.

What is an extent?  By definition, an extent is a contiguous block of disk
space.

What is the difference between them?  Besides the names, nothing in and of
themselves.  What's different is how they are managed, specifically the
structures and rules used to manage them.

Martin>Also, I don't tend to agree with most of the infrastructure proposed
Martin>in the IBM whitepaper.  If IBM's intention is that this will be a
Martin>cross-OS LVM architecture, well then fine -- lots of abstractions
are
Martin>obviously needed.

Our customers have asked for a migration path to Linux from their existing
platforms.  Migration is made much easier and much less expensive when the
new platform can read and write to the volumes/partitions/etc. used by the
old platform.  Furthermore, most of our customers will require a testing
period where the new platform and the old platform are compared on the same
hardware using the same datasets.  Again, the ability of the new platform
to use the volumes/partitions/etc. of the old platform can greatly speed
the testing process while reducing costs.  Finally, an LVMS based upon the
architecture in the white paper would, with the proper plug-in modules,
ease migration from several platforms (both IBM and non-IBM) to Linux by
allowing Linux to use the volumes/partitions/etc. of these platforms.

As far as being a cross-OS LVM architecture, this is true.  This
architecture was designed with the idea of being OS neutral where possible,
and is being considered for implementation on other IBM platforms.

Martin>If it is supposed to be Linux specific, however, I don't see why one
Martin>would waste engineering resources implementing plug-ins for reading
Martin>Macintosh partitions types etc.  We already have an adequate
framework
Martin>for that in the kernel.

The MacIntosh partitioning scheme was merely an example.  With the proper
plug-ins, an LVMS based upon the architecture in the white paper would be
able to access and manipulate logical volumes (and volume groups) created
by AIX, for example.  Again, though, implementing support for other OS
partitioning schemes and logical volume management schemes aids in
migration to Linux.

Another thing to remember is that users want power without risk.  This is
especially true in the corporate world.  To make it there, Linux needs a
very powerful, flexible logical volume management system which minimizes
the risk of losing data.  This calls for an architecture which integrates
all aspects of volume/disk management into a single, easy to use entity.
All processes which could be automated should be automated to prevent
"accidents", such as the improper shrinking of a volume containing data.
Right now it is rather easy to accidentally shrink a volume before
shrinking the filesystem on the volume, or to shrink the filesystem on the
volume by the wrong amount.  Is fdisk volume group aware (have not tried
this yet)?  If it isn't, a user could make a mistake and delete a partition
which belongs to a volume group.  The current system has holes in it, and
these holes need to be plugged before Linux can be a major player in the
corporate world.  These holes can be plugged in a patch work fashion, or
they can be eliminated by adopting an architecture (not necessarily the one
in the white paper) in which they don't exist or can't occur.

Martin>The scheme I've been toying with over the past months:
Martin>
Martin> - Logical Disk = Either partition or whole disk.
Martin>
Martin> - The Logical Disk provides allocation space for extents.
Martin>
Martin> - Extents are allocated on the available logical disks based upon
Martin>   heuristics in the feature set/system administrator preferences.
Martin>
Martin> - Logical Volume consists of one or more extents accessed through
one
Martin>   or more feature sets (RAID0, RAID1, RAID5, encryption, whatever).
Martin>
Martin>The extents can be of varying size depending on the application.  A
30
Martin>GB RAID5 LV could be constructed from 4 x 10 GB extents on 4
different
Martin>physical disks + a 10 GB hot spare extent on a fifth disk, for
Martin>instance.

I don't understand your example.  Change the word extent to partition and
you have:

 A 30 GB RAID5 LV could be constructed from 4 x 10 GB partitions on 4
different
physical disks + a 10 GB hot spare partition on a fifth disk, for instance.

This is exactly what you would have under the LVMS described in the white
paper.  Your example shows nothing which could not be done through the LVMS
architecture with partitions.  Am I missing something here?


Regards,

Ben
