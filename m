Date: Fri, 30 Jun 2000 22:53:56 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Message-ID: <20000630225356.C22746@vestdata.no>
References: <8525690E.00706FDC.00@d54mta02.raleigh.ibm.com>
Mime-Version: 1.0
In-Reply-To: <8525690E.00706FDC.00@d54mta02.raleigh.ibm.com>; from benr@us.ibm.com on Fri, Jun 30, 2000 at 03:28:04PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benr@us.ibm.com
Cc: linux-lvm@msede.com

On Fri, Jun 30, 2000 at 03:28:04PM -0500, benr@us.ibm.com wrote:
> >Is it not possible to make an LVM-volume on an md device, and an md
> >device on an LVM-volume? That's what you want, right?
> 
> If both volumes could exist and be used simultaneously, then this would be
> a simple example of what we want.  However, I have been told that:
> 
> "What is definitely lacking is a generic API for this case; the current way
> of letting remappers change a function pointer requires special support in
> every single remapper and it is hard to remove or insert them on the fly;"
> (Andi Kleen - from a post earlier this month on this thread)

adding and removing remappers on the fly? How is that supposed to work?
How do you add raid5 on the fly?

I don't know anything about what is needed in the remappers, and which
remappers support this and not - maybe someone more familiar with md and
lvm care to comment?

> >> >> The elimination of reboots after partitioning or volume changes
> >> >Even for MS-DOS partitions?
> >>
> >> Yes.
> >
> >There was a suggestion on L-K (or maybe it was reiserfs) that the kernel
> >should reread the partition-table, and compare it to the old one - if
> >none of the mounted partitions changed the new partition-table would be
> >accepted (and reboot avoided).
> 
> What constitutes a change to a mounted partition?  Currently, the creation
> of a new partition (or the deletion of an existing one) can cause the
> identifiers associated with existing partitions to change, even though the
> existing partitions have not been changed themselves.  Thus, unless this is
> changed, the proposed method does not eliminate reboots due to partitioning
> changes.

Yes, the suggestion didn't aim at eliminate all reboots, but it would
eliminate need for reboot when just changing the partitions at the end
of your disk.

I see two possibilities for solving the problem with changing
identifiers:
* Change the data saved about stored partitions, to reflect the new
  partition-names (and minor numbers)
* Make the minor-numbers act dynamicly - so that they never change.
  I supposed the "labels" in the partition-table can be used
  to create names that don't depenod on minor-numbers.

> >There are also utilities for resizing reiserfs - I believe they
> >communicate with LVM to do this automaticly? Is the manpage outdated, or
> >am I wrong here?
> >
> >The reason this don't work for other filesystems is of course that they
> >can't be resized at all.
> 
> Other filesystems can be resized, it is just that a resize utility has not
> be written for them yet! :-)
And once they are written, LVM will be able to use them, right?

> There is currently no true integration between the LVM and the filesystems.
> The resize utilities that are available attempt to hide this by having the
> utility communicate with both the LVM and the filesystem, but there is no
> intrinsic communication between the filesystems and the LVM as there would
> be in the LVMS.  As a result, lvreduce does not talk to the filesystems,
> and bad things can happen!

Why do bad things happed just because of this? Having the userspace
utilities change sizes of both filesystem and volume makes much sence to
me. Of course, resize-utilities have to have standardized names and
command-line options, just like mkfs. (like someone proposed in another
mail).

> >The best way to handle this (IMHO) is to provide special utilities that
> >ease the mounting, and do the checking. The operating-system shouldn't
> >prevent mounting of the partitions directly, because it is sometimes
> >desired.
> 
> Special utilities - this means more commands that a user must learn - a
> more complicated user interface.  Our customers are already saying that the
> existing user interface it too complicated and too hard to use.  Adding
> more special utilities just makes the situation worse.

No, you can write a utility that handles partitioning, creating
md-devices, setting up LVM-modules and manipulating filesystems on them.
If you really want to prevent your users to do stupid stuff, you can
even remove the regular programs (fdisk, mount, mkfs and so on) from
your installation.

> >I don't like to "force" anything.... What's the problem with just
> >modifying the utilities to check this - or give warnings?
> 
> 1.  Every utility would have to contain the appropriate set of checks.  If
> you miss a check in a utility, then you have a data security hole.  It is
> easier to have all of the checks in one place - the LVM.

It should be handled in a userspace library that knows how to
communicate with the different blockdevices and filesystems. Policy
don't belong to kernel-space.
 
> 2.  The method you outlined before does not eliminate reboots.  You need a
> major change to the way partitions are identified and accessed in order to
> eliminate reboots.  If you go to the method used by other operating
> systems, you kill several birds with one stone.  Otherwise, to eliminate
> reboots, you need to devise a new method for identifying and communicating
> with partitions that avoids the problems of the current one.

Well, I'm all for a way to be able to change partitions on the fly. But
unless it's backward compatible (that is, still accessible to all
operating-systems, and not having to make it's own partition for
metadata or anything like that), I can just use LVM.

> >You still need to store some metadata, right? So where can you store it
> >without affecting its contents?
> 
> There is a minimal amount of metadata required to do this.  This data can
> be stored in either a centralized or distributed fashion.  In the
> centralized approach, the metadata is stored in a database to which only
> the LVM has both read and write access.  In the distributed method, the
> metadata is stored on the disk itself.  Where it is stored depends upon the
> partitioning scheme in use on the drive.  As an example, a partition could
> be set aside for the use of the LVM.  In this partition, the LVM could
> store whatever it wanted, including the metadata to turn a partition into a
> volume.  Another method would be to store the metadata in an unused area of
> the disk.  This method is actually used by OS/2 since the partitioning
> scheme used by MS-DOS/Windows/OS2 always results in some unused sectors.
> There are probably other methods as well.

So how do you start using your LVM with an existing full disk? 


-- 
Ragnar Kjorstad
