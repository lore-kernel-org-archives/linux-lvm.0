From: benr@us.ibm.com
Message-ID: <85256905.007B5CAB.00@d54mta02.raleigh.ibm.com>
Date: Wed, 21 Jun 2000 18:27:24 -0400
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@msede.com



Andreas,

>Ben, you write:
>> As for "logical extents", volume groups, etc. - there has been much
>> discussion in IBM on this topic, and the concensus is that they are of
>> little benefit, and are not needed under this architecture.
Furthermore,
>> usability studies found that most users found volume groups to be very
>> confusing and of little value.  As a result, this architecture
specifically
>> avoids them.

>Having used both the AIX LVM, the Linux LVM, and the good-old DOS
>partitions, I would have to disagree with your statement that logical
>extents are of very little benefit.  One of the worst things to do
>in a DOS-partitioned world is to resize the partitions themselves.
>You always have to over-estimate the partition sizes in case you need
>more space in the future, or add a whole new partition if you run out
>of space in the existing partition.

>The joy of using the existing LVMs is that you can have many
>just-big-enough partitions, adding and removing them as desired, and
>if they aren't big enough, you simply resize them to be big enough.
>AIX has this at its very core - the package installer will expand /usr,
>/var, /etc to be big enough for newly installed packages, rather than
>simply letting the install fail because it ran out of space in one
>filesystem even though there is enough space in the system as a whole.

>Without dividing the disk into small chunks for allocation the way the
>current LVM implementations do, we are back in the stone age, the same
>way Fortran 66 is to C.  With old Fortran, you had to pre-allocate all of
>your memory elements to be the maximum possible size because you couldn't
>dynamically allocate memory at the correct size for the current need.
>Nobody wants to go back to static arrays in Fortran (I hope ;-), in the
>same way I don't want to go back to statically assigned partition sizes.

>Using concatenation of whole partitions/disks (ala Sun DiskSuite or Linux
MD
>concat) really sucks, IMHO.  People don't always have whole disks sitting
>around unused, and even if they do, it is again the case that you have to
>allocate way too much space for what you need.  If you only want to add a
>small amount of space to a filesystem, you will end up partitioning your
>spare disk into many small chunks, and you will have a poor-man's logical
>extent in the end.

>Cheers, Andreas

I think the issue here is not the partitions on the disks themselves but
the resizing of volumes.  Under the LVMS outlined in the white paper,
resizing a volume is not as clear cut as it is in the existing LVMs.  Under
the LVMS, a volume consists of one or more logical partitions.  These
logical partitions are joined together to form the volume by "Features".
It is the "Features" in use on a volume which determine if the volume can
be expanded or contracted, and the method by which the expansion or
contraction will be performed.  There are two basic methods by which a
volume can be expanded: add logical partitions to the volume or expand one
or more of the logical partitions which are already part of the volume.
Similarly, there are two methods to shrink a volume: remove logical
partitions from the volume, or shrink one or more of the logical partitions
which are already a part of the volume.  Which method is used (if not both)
is determined by the "Features" used to form the volume.  Thus, under the
LVMS, it is possible to create volumes which can be resized, as well as
volumes which can NOT be resized.  Whether or not a volume can be resized
is under the control of the user, who selects which "Features" to use on a
volume when that volume is created.  Therefore, if a user wants
just-big-enough volumes that can be resized as desired, they can do so by
choosing "features" which allow volumes to be resized when they create the
volumes.

Of course, this brings us to the question of: "Are there times when a user
may want to create a volume which can NOT be resized?"  The answer to this
question is yes.  There are several applications of this which mainly come
to play in high security environments, such as are found in the military
and most governments. ;-)  I am limited as to what I can say in this
regard, but the basic idea is that, on a high security system, classified
information is restricted to approved devices.  Volumes created on these
devices to hold classified information are normally set up to be
non-resizeable in order to prevent a volume from being expanded
(accidentally or otherwise) to use a non-approved device.  Cases like this
are easily handled by the LVMS through the use of a "feature" plug-in.

One other interesting aspect of the elimination of volume groups is that
quorum support is not needed.  Under the LVMS, when a drive fails, only the
volumes which actually had partitions on the failed drive are affected, not
an entire volume group.  Quorum support is an attempt to address this
shortcoming in volume groups, but since the LVMS does not use volume
groups, it is not needed by the LVMS.

Regards,

Ben
