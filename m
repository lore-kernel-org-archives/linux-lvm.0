Date: Thu, 29 Jun 2000 16:37:38 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Message-ID: <20000629163737.B30920@vestdata.no>
References: <8525690D.0007A664.00@d54mta02.raleigh.ibm.com>
Mime-Version: 1.0
In-Reply-To: <8525690D.0007A664.00@d54mta02.raleigh.ibm.com>; from benr@us.ibm.com on Wed, Jun 28, 2000 at 08:23:30PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benr@us.ibm.com
Cc: Paul Jakma <paul@clubi.ie>, linux-lvm@msede.com

On Wed, Jun 28, 2000 at 08:23:30PM -0500, benr@us.ibm.com wrote:
> Hello Paul!
> 
> >what have your customers asked for exactly?
> 
> Here are some of the things that our customers have asked for:
> 
> The ability to read, write, and manipulate AIX volume groups and logical
> volumes
> 
> The ability to read, write, and manipulate OS/2 logical volumes
> 
> The ability to read, write, and manipulate NT logical volumes (have not yet
> started to research this one!)

Can not all theese be implemented as seperate block-devices, like md and
lvm?


> The elimination of reboots after partitioning or volume changes
Even for MS-DOS partitions?
 
> Elimination of data security holes ( This involves the automation of error
> prone tasks which could result in the loss of data.  An example would be
> the shrinking of a volume.  This involves manual steps at the moment -
> specifically - the filesystem must be resized before the volume is shrunk.

Don't LVM handle the communication with the filesystem to do this
automaticly?

> If the user forgets to do this, or if the user shrinks the filesystem by
> too little or the volume by too much, data loss can occur.  Another example
> of a data security hole would be if fdisk and its variants are not volume
> group aware, in which case a user could accidentally delete a partition
> belonging to a volume group, thereby causing data loss.  Another example of
> a data security hole would be if partition identifiers can change due to
> disk partitioning activity - ex. hda9 becomes hda8 after deleting hda7.
And how can this be eliminated? In LVM this is not a problem, because
name-space is different, but how can it be solved for msdos-partitions?

> Usability enhancements (The users complain about there being too many
> commands required to manage volumes and disks, that managing volumes and
> disks is too complex.  They want a single point for controlling everything
> concerning disks, partitions, volumes, etc.  They also want a simpler
> storage model that is easier to understand.  It appears that volume groups
> confuse most users who are not UNIX savvy, as well as a surprising number
> of those who are. )

Creating easier-to-understand user interfaces is very different from
changing the architecture in the kernel.
 

Basicly, what I'm asking is if the current architecture (just stackable
block-devices) capable of all the things you want to accomplish?



-- 
Ragnar Kjorstad
