From: benr@us.ibm.com
Message-ID: <8525690D.0007A664.00@d54mta02.raleigh.ibm.com>
Date: Wed, 28 Jun 2000 20:23:30 -0500
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Jakma <paul@clubi.ie>
Cc: linux-lvm@msede.com



Hello Paul!

>what have your customers asked for exactly?

>and are these customers AIX customers?

Here are some of the things that our customers have asked for:

The ability to read, write, and manipulate AIX volume groups and logical
volumes

The ability to read, write, and manipulate OS/2 logical volumes

The ability to read, write, and manipulate NT logical volumes (have not yet
started to research this one!)

The elimination of reboots after partitioning or volume changes

All disk utilities should be volume/volume group aware, as appropriate

Elimination of data security holes ( This involves the automation of error
prone tasks which could result in the loss of data.  An example would be
the shrinking of a volume.  This involves manual steps at the moment -
specifically - the filesystem must be resized before the volume is shrunk.
If the user forgets to do this, or if the user shrinks the filesystem by
too little or the volume by too much, data loss can occur.  Another example
of a data security hole would be if fdisk and its variants are not volume
group aware, in which case a user could accidentally delete a partition
belonging to a volume group, thereby causing data loss.  Another example of
a data security hole would be if partition identifiers can change due to
disk partitioning activity - ex. hda9 becomes hda8 after deleting hda7.
This could result in the user performing an operation on the wrong
partition.  Another example of a data security hole would be if the
partitions belonging to a volume group are still visible and available for
mounting - ex. hda5, hdb7, and hdc2 are all in a volume group, yet each is
visible apart from the volume group and each can be mounted independently
from the volume group to which they belong.  There are others, but I think
you get the idea.  Corporate users are very paranoid about losing their
"mission critical data".  They want a system which allows them to do
incredibly powerful things, but which also makes it extremely hard to
"screw up".)

Usability enhancements (The users complain about there being too many
commands required to manage volumes and disks, that managing volumes and
disks is too complex.  They want a single point for controlling everything
concerning disks, partitions, volumes, etc.  They also want a simpler
storage model that is easier to understand.  It appears that volume groups
confuse most users who are not UNIX savvy, as well as a surprising number
of those who are. )


>> it would have to be based upon a different architecture.  This
>> would require major changes to the code, the equivalent of a
>> re-write.  This does not mean, however, that the current LVM is
>> in any way bad.  It just means that our customers have needs that
>> are not being met by the current LVM, and something different is
>> required to meet those needs.

>but rather than throwing your LVM at Linux (and having 2 different
>LVM implementations - bad), why not re-examine your customers needs
>and work with current LVM using your experience/concepts from IBM LVM
>to develop an architecture that does meet those needs. An
>architecture perhaps different from current-LVM/IBM-LVM but still
>drawing on that experience.

I don't understand what you are trying to say here.  See the discussion
below.

>i take it adapting IBM's LVM to linux will not be straight forward,
>so the choices are:

>1. port IBM LVM -> 2 seperate LVM implementations.
>2. use current LVM with only slight improvements (possibly not
>meeting your customer's needs)
>3. work with Heinz and the rest of the linux community to build a new
>LVM architecture, taking the best concepts from both IBM and Heinz
>LVM to build a new LVM architecture superior to all the rest.

>whatever you do, i think option 1. is the least desirable.

Option 1 provides a short term solution.  It has certain benefits to IBM
and to Linux, but is probably not best for the long term.  As such, if we
end up using option 1, we would prefer to see the various LVM
implementations merge at some point in the future.  This means that, at
some point in the future, we end up at Option 3.

Option 2 is not good.  If we do this, then we may lose our customers, and
Linux misses a window of opportunity.

Option 3 is best, especially if we can start here instead of starting at
Option 1.  The LVMS Architecture that we have released is not set in
concrete, indeed, that is one of the reasons why we started this
discussion.  IBM currently has a way to support both OS/2 logical volumes
and AIX volume groups/logical volumes using this architecture, and the
solution is rather "clean".  However, we would also like to be able to
support Linux LVM volume groups/logical volumes and Monterey volume
groups/logical volumes.  The Linux and Monterey LVMs do not fit cleanly
into the LVMS Architecture as it now stands due to the fact that these LVMs
form volume groups from partitions as well as entire drives (see my
previous post about supporting AIX volume groups and logical volumes within
the LVMS Architecture).  While there are ways in which we could support
these LVMs, the methods employed are not architecturally "clean".  Thus, we
continue to look for the proper way in which to extend the LVMS
Architecture.  Of course, there is nothing that says we have to continue
the search by ourselves, or that we should be the only ones looking ...

Another thing to consider is that the LVMS Architecture is really a
framework.  It doesn't do much by itself.  The vast majority of the
functionality of an LVMS based on this architecture lies in the plug-in
modules that are loaded.  This is what allows this architecture to support
most volume group based LVMs (such as AIX) as well as most partition based
LVMs (OS/2, possibly NT - while NT doesn't appear to use volume groups,
there may be other obstacles which could prevent support for NT).  The
ultimate functionality of the architecture is limited by the number and
types of plug-ins it allows, as well as how those plug-ins are allowed to
interact.  I don't believe that this type of power and flexibility is
available in the LVMs of other operating systems (please correct me if I am
wrong!).  If we can find the right superset of the LVMS Architecture to use
for Linux, then we can take Linux from playing catch-up to being the
cutting edge leader in logical volume management!

Regards,

Ben
