From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009070053.SAA05253@lynx.turbolabs.com>
Subject: Re: [linux-lvm] LVM, partitions, RAID, and the Grand Scheme of Things TM
Date: Wed, 6 Sep 2000 18:53:07 -0600 (MDT)
In-Reply-To: <39B5DF5E.BBF2A80B@gnu.org> from "Andrew Clausen" at Sep 06, 2000 05:08:30 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Clausen <clausen@gnu.org>
Cc: parted@gnu.org, linux-lvm@msede.com

Andrew Clausen, you write:
> First, we think it would be useful for the LVM tools to be able to
> resize logical volumes, along with the file systems on it.  Perhaps
> a --filesystem parameter to lvreduce, lvextend and lvcreate?

The existing LVM user tools ship with something called "e2fsadm" which
does this for ext2 filesystems, first extending the LV and then the
filesystem.  I have updated e2fsadm to also handle online filesystem
resizing, but this is not in the official tools yet.  Yesterday, a tool
called lvmadm was announced which does this in a more generic way,
similar to fsck, by calling a fs-specific resizer depending on the fs
type.

> BTW: we are aware of Ted Tso's resizer.  We like our's better :-P

On a tangent, how different has your ext2 resizer become from the
ext2resize code?  You may want to reply in a separate note.

> We are interested in the future of partitions, LVM, RAID and Microsoft's
> new system, which seems similar to LVM - although we haven't seen it
> yet.  Also, AIX's and HPUX's LVM have some features that Linux LVM
> doesn't have - you're working in that direction?
> 
> It seems, on the face of it, that LVM offers a strict superset of
> functionality of partition tables and RAID (well, RAID-linear/0, anyway
> - RAID-1/4/5 coming soon?).

I think Heinz's stated direction is that LVM will stay layered on top
of MD/RAID rather than incorporating this functionality itself.

> However, it doesn't look like partition tables will disappear anytime
> soon. Rather, it looks like LVM will have to cooperate with partition
> tables.  And, perhaps Microsoft's new system as well (?).

Personally, I would rather get all knowledge of partition tables out of
LVM and have the existing partition table support in the kernel handle
everything.  Having a library to do all the partition-table parsing and
writing would be a boon not only to parted, but also if it was added to
fdisk, cfdisk, grub, et-al.

> * a lot of the complexity, WRT interaction between filesystems and
> partition tables/LVM/* is similar.  Eg: making a partition/LV usually
> happens at the same time as creating a file system on that partition.
> Likewise for resizing.  This occurs right from the low-level (IO -
> "which part of which disk do I read/write?") to the high-level (how
> big can/should I make this partition?)
>
> * users will love it :-)
> 
> * it's "philosophically" Right.
> 
> * may simplify automatic partitioning, since everything is in one place.

You should read the LVM mailing list archive for June.  IBM has already
proposed such a system, called LVMS, which would be the glue layer between
LVM, partitions, filesystems, RAID, etc.  From the sounds of it, they will
try and leverage as much of the existing code from the kernel as possible.

Cheers, Andreas
