Date: Fri, 30 Jun 2000 17:28:06 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Message-ID: <20000630172806.A22117@vestdata.no>
References: <8525690D.0082015B.00@d54mta02.raleigh.ibm.com>
Mime-Version: 1.0
In-Reply-To: <8525690D.0082015B.00@d54mta02.raleigh.ibm.com>; from benr@us.ibm.com on Thu, Jun 29, 2000 at 06:39:51PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benr@us.ibm.com
Cc: linux-lvm@msede.com

On Thu, Jun 29, 2000 at 06:39:51PM -0500, benr@us.ibm.com wrote:
> >Can not all theese be implemented as seperate block-devices, like md and
> >lvm?
> 
> My understanding is that Linux has a limited ability to stack block device
> drivers.  This capability is insufficient, however, to provide the above
> support, both now and in the future.  What is needed is an ability to stack
> drivers on a per volume basis.  That is, each volume would have the
> equivalent of its own driver stack, containing only those drivers actually
> used by the volume in the order in which they are actually used.  This
> means that the driver stack for each volume is independent from that of
> every other volume.  Thus, volumes employing the same drivers may have
> those drivers in a different order in their respective driver stacks.  I
> don't see that capability in Linux right now, but I may have missed
> something.

Is it not possible to make an LVM-volume on an md device, and an md
device on an LVM-volume? That's what you want, right?

> Another thing missing is conflict detection and driver based control of
> driver ordering in the driver stack of a volume.  This was only briefly
> mentioned in the LVMS white paper, but, in a nut shell, the LVMS defines a
> series of attributes which can be associated with a plug-in module.  These
> attributes are set by the creator of a plug-in module.  The attributes
> allow the LVMS to detect conflicts between plug-in modules, as well as
> determine where in the driver stack for a volume a plug-in module
> must/may/prefers to reside.

This may be implemented within the current architecture by having the
block-device drivers export some data (e.g. in proc), and have the
userspace utilities check that data before they perform any actions.

The data in proc should be standarized, so the userspace-utilities
don't have to know every block-device specificly.

> >> The elimination of reboots after partitioning or volume changes
> >Even for MS-DOS partitions?
> 
> Yes.

There was a suggestion on L-K (or maybe it was reiserfs) that the kernel
should reread the partition-table, and compare it to the old one - if
none of the mounted partitions changed the new partition-table would be
accepted (and reboot avoided). 

> >From the man page for lvreduce:
> 
> "lvreduce allows you to reduce the size of a logical volume. Be careful
> when reducing a logical volume's size, because data in the reduced part is
> lost!!!"
> 
> If you are using ext2, then you could use e2fsadm, but if you are using
> another filesystem, then what?  Even if you are using ext2, a user could
> still use lvreduce directly.  Thus, this is a data security hole.

There are also utilities for resizing reiserfs - I believe they
communicate with LVM to do this automaticly? Is the manpage outdated, or
am I wrong here? 

The reason this don't work for other filesystems is of course that they
can't be resized at all.

> >And how can this be eliminated? In LVM this is not a problem, because
> >name-space is different, but how can it be solved for msdos-partitions?
> 
> The way this is solved in other operating systems is that the operating
> system only recognizes volumes.  Volumes are given user defined, unique
> names.  Volumes are then mounted by referring to the volume's name.

The best way to handle this (IMHO) is to provide special utilities that
ease the mounting, and do the checking. The operating-system shouldn't
prevent mounting of the partitions directly, because it is sometimes
desired.

> Partitions are not visible to the operating system, they are only visible
> to the LVMS.  If the user wishes to mount a partition, they must first make
> it a volume using the LVMS.  This places the partition into the LVMS name
> space and forces the user to give it a unique name.  If partitions are
> created or destroyed (which must be done through the LVMS), no reboots are
> required as the names of the existing volumes are not affected.  Similarly,
> if a volume is created or destroyed, no reboot is required as the names of
> the remaining volumes have not changed, and their associations still hold.

I don't like to "force" anything.... What's the problem with just
modifying the utilities to check this - or give warnings?

> One last point here is that a partition can be turned into a volume without
> affecting its contents, and without affecting the ability of MS-DOS and
> Windows to recognize or use it.  This is actually done by both OS/2 and NT.

You still need to store some metadata, right? So where can you store it
without affecting its contents? 

> >Creating easier-to-understand user interfaces is very different from
> >changing the architecture in the kernel.
> 
> Yes and no.  There are some issues which can be dealt with in the user
> interface, and there are other issues which need to be dealt with
> elsewhere.  As an example, consider that the users want a simple storage
> model.  If the kernel supports the more complex model that the users don't
> like, it would be very difficult to hide that behind a user interface.  The
> code for such a user interface would tend to be complex, and complex code
> is typically buggy.  Thus, a kernel change may be more appropriate in this
> case.

I disagree with this. The "not allow mounting partitions" issue for
instance, can easily be handled in user interfaces with _no_ complexity.

However, I'm sure some changes are needed in kernelspace to accomplish
some of the other features outlined in the paper. 



-- 
Ragnar Kjorstad
