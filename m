From: benr@us.ibm.com
Message-ID: <85256901.00034BB1.00@d54mta02.raleigh.ibm.com>
Date: Fri, 16 Jun 2000 20:35:58 -0400
Subject: Re: [linux-lvm] IBM to release LVM Technology to the Linux
	 Community
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: linux-lvm@msede.com



Andi,

>I'm not sure anything can be more flexible than a simple list of
>block remappers that are called one after another. I guess your framework
>is more integrated though.

There is one more feature of our architecture which is useful here, though
the white paper mentions it only briefly.  Basically, Feature Plug-ins
(FPs) have "attributes".  These attributes convey information about an FP
to the Logical Volume Manager (LVM) so that, when a volume is being
created, the LVM can ensure that the specified FPs will work together
correctly.  Attributes let an FP specify whether or not it can be used with
other FPs on a volume, and where it must/would like to appear in the FP
stack for the volume.  Let me give you an example:

Lets say that the user is going to create a volume from a series of logical
partitions, and that the user has a software RAID 5 FP and a Drive Linking
FP available.  Furthermore, lets assume that the number of logical
partitions is such that the user can not combine them all into a single
volume using just the Drive Linking FP or the Software RAID 5 FP.  In this
case, both FPs must be used to create the volume.  At this point, there are
two ways in which the user could create the volume.  First, they could use
the Drive Linking FP to combine the logical partitions into aggregates, and
then use the software RAID 5 FP to combine the aggregates to produce the
volume.  Second, they could use the software RAID 5 FP to combine logical
partitions into aggregates and then have the Drive Linking FP combine the
aggregates into the volume.  While the first case isn't fatal, the second
case is obviously the preferred method (from the standpoint of reliability,
at least).  It is desirable, then, for the LVM to use the second case when
suggesting a default ordering for the FPs to the user.  The attributes of
the FPs allow the LVM to make this determination.

Let me give you another example.  Lets say we are creating an FP to mirror
a volume from one machine to another.  This FP is to be part of a standby
server system (i.e. - the main server has its volumes mirrored to the
backup server, and if the main server dies, the backup server automatically
comes on line and replaces the main server).  Since the FP is set up to
mirror volumes, we would like to ensure that it is always placed on the top
of the FP stack.  By setting our FP's attributes correctly, the LVM could
enforce this requirement for us.

>What is definitely lacking is a generic
>API for this case; the current way of letting remappers change a function
>pointer requires special support in every single remapper and it is hard
>to remove or insert them on the fly;

I'm not exactly sure of what you mean here.  Under the LVMS architecture,
every volume has its own FP stack, so every volume can employ a different
set of FPs, or employ the same set of FPs in a different order (or even the
same order).  While an FP can not be added to an existing volume (we are
looking at ways around this, but we haven't found one we like), it can be
added to the LVMS and be used in future volumes.

>Also a generic way to store metadata is nice (I think you're
>providing this); e.g. current crypto loopback is badly suffering ATM from
>missing metadata.

Yes, this architecture provides a generic method for storing metadata for
each FP in use on a volume.

>Also some generic way to trigger user space actions
>on volume changes would be useful; for example to automatically rerun lilo
>when you move the LV with the kernel on it (current lvm is lacking a bit
>on that front)

This could be done by the LVM Engine, which is the user space part of the
LVMS.

>Maybe the name choice is a bit unfortunate though because it sounds now
>like a direct competitor to LVM (which it is only partly, I guess the
>current LVM could also exist in your framework)

While I can see an element of competition between them, I don't think this
is an either/or proposition.  One thing we have learned from our usability
studies is that people are more comfortable using something they already
know how to use. <grin> What I mean by this is that, over time, I think a
lot of people will be coming to Linux from the Unix world.  These people
will probably be more at home using the current LVM because it is based
upon concepts which are familiar to them.  Similarly, over time there will
be many people coming to Linux from the Windows/OS/2 world, and these
people will be more comfortable using something based upon the LVMS
architecture as that employs concepts that are more familiar to them.
While there is something to be said for standardization, we must be careful
not to standardize the flexibility out of the system. :)

Regards,

Ben
