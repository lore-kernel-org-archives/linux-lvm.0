From: benr@us.ibm.com
Message-ID: <8525690D.0082015B.00@d54mta02.raleigh.ibm.com>
Date: Thu, 29 Jun 2000 18:39:51 -0500
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

Welcome to the discussion!


>> The ability to read, write, and manipulate AIX volume groups and logical
>> volumes
>>
>> The ability to read, write, and manipulate OS/2 logical volumes
>>
>> The ability to read, write, and manipulate NT logical volumes (have not
yet
>> started to research this one!)

>Can not all theese be implemented as seperate block-devices, like md and
>lvm?

My understanding is that Linux has a limited ability to stack block device
drivers.  This capability is insufficient, however, to provide the above
support, both now and in the future.  What is needed is an ability to stack
drivers on a per volume basis.  That is, each volume would have the
equivalent of its own driver stack, containing only those drivers actually
used by the volume in the order in which they are actually used.  This
means that the driver stack for each volume is independent from that of
every other volume.  Thus, volumes employing the same drivers may have
those drivers in a different order in their respective driver stacks.  I
don't see that capability in Linux right now, but I may have missed
something.

Another thing missing is conflict detection and driver based control of
driver ordering in the driver stack of a volume.  This was only briefly
mentioned in the LVMS white paper, but, in a nut shell, the LVMS defines a
series of attributes which can be associated with a plug-in module.  These
attributes are set by the creator of a plug-in module.  The attributes
allow the LVMS to detect conflicts between plug-in modules, as well as
determine where in the driver stack for a volume a plug-in module
must/may/prefers to reside.

>> The elimination of reboots after partitioning or volume changes
>Even for MS-DOS partitions?

Yes.

>> Elimination of data security holes ( This involves the automation of
error
>> prone tasks which could result in the loss of data.  An example would be
>> the shrinking of a volume.  This involves manual steps at the moment -
>> specifically - the filesystem must be resized before the volume is
shrunk.
>
>Don't LVM handle the communication with the filesystem to do this
>automaticly?

From the man page for lvreduce:

"lvreduce allows you to reduce the size of a logical volume. Be careful
when reducing a logical volume's size, because data in the reduced part is
lost!!!"

If you are using ext2, then you could use e2fsadm, but if you are using
another filesystem, then what?  Even if you are using ext2, a user could
still use lvreduce directly.  Thus, this is a data security hole.

>> If the user forgets to do this, or if the user shrinks the filesystem by
>> too little or the volume by too much, data loss can occur.  Another
example
>> of a data security hole would be if fdisk and its variants are not
volume
>> group aware, in which case a user could accidentally delete a partition
>> belonging to a volume group, thereby causing data loss.  Another example
of
>> a data security hole would be if partition identifiers can change due to
>> disk partitioning activity - ex. hda9 becomes hda8 after deleting hda7.
>And how can this be eliminated? In LVM this is not a problem, because
>name-space is different, but how can it be solved for msdos-partitions?

The way this is solved in other operating systems is that the operating
system only recognizes volumes.  Volumes are given user defined, unique
names.  Volumes are then mounted by referring to the volume's name.
Partitions are not visible to the operating system, they are only visible
to the LVMS.  If the user wishes to mount a partition, they must first make
it a volume using the LVMS.  This places the partition into the LVMS name
space and forces the user to give it a unique name.  If partitions are
created or destroyed (which must be done through the LVMS), no reboots are
required as the names of the existing volumes are not affected.  Similarly,
if a volume is created or destroyed, no reboot is required as the names of
the remaining volumes have not changed, and their associations still hold.
Of course, there are other simpler ways to handle this specific point, but
the method outlined here solves more than just the reboot problem, it
closes other data security holes as well.

One last point here is that a partition can be turned into a volume without
affecting its contents, and without affecting the ability of MS-DOS and
Windows to recognize or use it.  This is actually done by both OS/2 and NT.

>> Usability enhancements (The users complain about there being too many
>> commands required to manage volumes and disks, that managing volumes and
>> disks is too complex.  They want a single point for controlling
everything
>> concerning disks, partitions, volumes, etc.  They also want a simpler
>> storage model that is easier to understand.  It appears that volume
groups
>> confuse most users who are not UNIX savvy, as well as a surprising
number
>> of those who are. )
>
>Creating easier-to-understand user interfaces is very different from
>changing the architecture in the kernel.

Yes and no.  There are some issues which can be dealt with in the user
interface, and there are other issues which need to be dealt with
elsewhere.  As an example, consider that the users want a simple storage
model.  If the kernel supports the more complex model that the users don't
like, it would be very difficult to hide that behind a user interface.  The
code for such a user interface would tend to be complex, and complex code
is typically buggy.  Thus, a kernel change may be more appropriate in this
case.

>Basicly, what I'm asking is if the current architecture (just stackable
>block-devices) capable of all the things you want to accomplish?

No.  If it was, IBM would be working on the stackable block-devices
required to meet the needs of our customers as this would have been the
fastest and most effective path to take.  This does not mean that the
existing LVM is in any way "bad" or "inferior".  The designers of the
current LVM were trying to solve a certain set of problems, which they did.
We are trying to solve a different set of problems.  While there are many
similarities between the problem sets, there are also many significant
differences.  It is these differences that are driving us towards a
different solution.

Regards,

Ben
