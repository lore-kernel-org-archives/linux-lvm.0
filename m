From: benr@us.ibm.com
Message-ID: <8525690E.00706FDC.00@d54mta02.raleigh.ibm.com>
Date: Fri, 30 Jun 2000 15:28:04 -0500
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ragnar =?iso-8859-1?Q?Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Cc: linux-lvm@msede.com



Ragnar,


>Is it not possible to make an LVM-volume on an md device, and an md
>device on an LVM-volume? That's what you want, right?

If both volumes could exist and be used simultaneously, then this would be
a simple example of what we want.  However, I have been told that:

"What is definitely lacking is a generic API for this case; the current way
of letting remappers change a function pointer requires special support in
every single remapper and it is hard to remove or insert them on the fly;"
(Andi Kleen - from a post earlier this month on this thread)

This tells me that the current mechanism can not handle what we desire.

>This may be implemented within the current architecture by having the
>block-device drivers export some data (e.g. in proc), and have the
>userspace utilities check that data before they perform any actions.

>The data in proc should be standarized, so the userspace-utilities
>don't have to know every block-device specificly.

What you suggest could be made to work, but the way it is handled by the
LVMS is cleaner and more efficient, and requires much less code.

>> >> The elimination of reboots after partitioning or volume changes
>> >Even for MS-DOS partitions?
>>
>> Yes.
>
>There was a suggestion on L-K (or maybe it was reiserfs) that the kernel
>should reread the partition-table, and compare it to the old one - if
>none of the mounted partitions changed the new partition-table would be
>accepted (and reboot avoided).

What constitutes a change to a mounted partition?  Currently, the creation
of a new partition (or the deletion of an existing one) can cause the
identifiers associated with existing partitions to change, even though the
existing partitions have not been changed themselves.  Thus, unless this is
changed, the proposed method does not eliminate reboots due to partitioning
changes.

>> >From the man page for lvreduce:
>>
>> "lvreduce allows you to reduce the size of a logical volume. Be careful
>> when reducing a logical volume's size, because data in the reduced part
is
>> lost!!!"
>>
>> If you are using ext2, then you could use e2fsadm, but if you are using
>> another filesystem, then what?  Even if you are using ext2, a user could
>> still use lvreduce directly.  Thus, this is a data security hole.
>
>There are also utilities for resizing reiserfs - I believe they
>communicate with LVM to do this automaticly? Is the manpage outdated, or
>am I wrong here?
>
>The reason this don't work for other filesystems is of course that they
>can't be resized at all.

Other filesystems can be resized, it is just that a resize utility has not
be written for them yet! :-)

There is currently no true integration between the LVM and the filesystems.
The resize utilities that are available attempt to hide this by having the
utility communicate with both the LVM and the filesystem, but there is no
intrinsic communication between the filesystems and the LVM as there would
be in the LVMS.  As a result, lvreduce does not talk to the filesystems,
and bad things can happen!

>> >And how can this be eliminated? In LVM this is not a problem, because
>> >name-space is different, but how can it be solved for msdos-partitions?
>>
>> The way this is solved in other operating systems is that the operating
>> system only recognizes volumes.  Volumes are given user defined, unique
>> names.  Volumes are then mounted by referring to the volume's name.
>
>The best way to handle this (IMHO) is to provide special utilities that
>ease the mounting, and do the checking. The operating-system shouldn't
>prevent mounting of the partitions directly, because it is sometimes
>desired.

Special utilities - this means more commands that a user must learn - a
more complicated user interface.  Our customers are already saying that the
existing user interface it too complicated and too hard to use.  Adding
more special utilities just makes the situation worse.

What we are talking about here is making the user go through the LVM to
mount a partition.  This gives the LVM the opportunity to examine what the
user is doing and ensure that it does not violate the integrity of any
volumes/volume groups.  This in no way prevents the user from mounting a
partition, it just allows the LVM to be involved.  It also gives the user a
single place to go to manipulate his volumes/volume
groups/partitions/disks.

>> Partitions are not visible to the operating system, they are only
visible
>> to the LVMS.  If the user wishes to mount a partition, they must first
make
>> it a volume using the LVMS.  This places the partition into the LVMS
name
>> space and forces the user to give it a unique name.  If partitions are
>> created or destroyed (which must be done through the LVMS), no reboots
are
>> required as the names of the existing volumes are not affected.
Similarly,
>> if a volume is created or destroyed, no reboot is required as the names
of
>> the remaining volumes have not changed, and their associations still
hold.
>
>I don't like to "force" anything.... What's the problem with just
>modifying the utilities to check this - or give warnings?

1.  Every utility would have to contain the appropriate set of checks.  If
you miss a check in a utility, then you have a data security hole.  It is
easier to have all of the checks in one place - the LVM.

2.  The method you outlined before does not eliminate reboots.  You need a
major change to the way partitions are identified and accessed in order to
eliminate reboots.  If you go to the method used by other operating
systems, you kill several birds with one stone.  Otherwise, to eliminate
reboots, you need to devise a new method for identifying and communicating
with partitions that avoids the problems of the current one.

>> One last point here is that a partition can be turned into a volume
without
>> affecting its contents, and without affecting the ability of MS-DOS and
>> Windows to recognize or use it.  This is actually done by both OS/2 and
NT.
>
>You still need to store some metadata, right? So where can you store it
>without affecting its contents?

There is a minimal amount of metadata required to do this.  This data can
be stored in either a centralized or distributed fashion.  In the
centralized approach, the metadata is stored in a database to which only
the LVM has both read and write access.  In the distributed method, the
metadata is stored on the disk itself.  Where it is stored depends upon the
partitioning scheme in use on the drive.  As an example, a partition could
be set aside for the use of the LVM.  In this partition, the LVM could
store whatever it wanted, including the metadata to turn a partition into a
volume.  Another method would be to store the metadata in an unused area of
the disk.  This method is actually used by OS/2 since the partitioning
scheme used by MS-DOS/Windows/OS2 always results in some unused sectors.
There are probably other methods as well.

Regards,

Ben
