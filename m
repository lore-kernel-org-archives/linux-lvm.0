From: Andreas Dilger <adilger@turbolabs.com>
Message-Id: <200006182251.QAA15919@lynx.turbolabs.com>
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Date: Sun, 18 Jun 2000 16:51:01 -0600 (MDT)
In-Reply-To: <85256900.007B81E0.00@d54mta02.raleigh.ibm.com> from "benr@us.ibm.com" at Jun 16, 2000 06:29:01 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: benr@us.ibm.com
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Ben, you write:
> As for "logical extents", volume groups, etc. - there has been much
> discussion in IBM on this topic, and the concensus is that they are of
> little benefit, and are not needed under this architecture.  Furthermore,
> usability studies found that most users found volume groups to be very
> confusing and of little value.  As a result, this architecture specifically
> avoids them.

Having used both the AIX LVM, the Linux LVM, and the good-old DOS
partitions, I would have to disagree with your statement that logical
extents are of very little benefit.  One of the worst things to do
in a DOS-partitioned world is to resize the partitions themselves.
You always have to over-estimate the partition sizes in case you need
more space in the future, or add a whole new partition if you run out
of space in the existing partition.

The joy of using the existing LVMs is that you can have many
just-big-enough partitions, adding and removing them as desired, and
if they aren't big enough, you simply resize them to be big enough.
AIX has this at its very core - the package installer will expand /usr,
/var, /etc to be big enough for newly installed packages, rather than
simply letting the install fail because it ran out of space in one
filesystem even though there is enough space in the system as a whole.

Without dividing the disk into small chunks for allocation the way the
current LVM implementations do, we are back in the stone age, the same
way Fortran 66 is to C.  With old Fortran, you had to pre-allocate all of
your memory elements to be the maximum possible size because you couldn't
dynamically allocate memory at the correct size for the current need.
Nobody wants to go back to static arrays in Fortran (I hope ;-), in the
same way I don't want to go back to statically assigned partition sizes.

Using concatenation of whole partitions/disks (ala Sun DiskSuite or Linux MD
concat) really sucks, IMHO.  People don't always have whole disks sitting
around unused, and even if they do, it is again the case that you have to
allocate way too much space for what you need.  If you only want to add a
small amount of space to a filesystem, you will end up partitioning your
spare disk into many small chunks, and you will have a poor-man's logical
extent in the end.

Cheers, Andreas
