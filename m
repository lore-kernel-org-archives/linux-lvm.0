Message-ID: <39BA3D62.E21B13E1@gnu.org>
Date: Sun, 10 Sep 2000 00:38:42 +1100
From: Andrew Clausen <clausen@gnu.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM, partitions, RAID, and the Grand Scheme of Things TM
References: <200009070053.SAA05253@lynx.turbolabs.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@turbolinux.com>
Cc: parted@gnu.org, linux-lvm@msede.com

Andreas Dilger wrote:
> 
> Andrew Clausen, you write:
> > First, we think it would be useful for the LVM tools to be able to
> > resize logical volumes, along with the file systems on it.  Perhaps
> > a --filesystem parameter to lvreduce, lvextend and lvcreate?
> 
> The existing LVM user tools ship with something called "e2fsadm" which
> does this for ext2 filesystems, first extending the LV and then the
> filesystem.  I have updated e2fsadm to also handle online filesystem
> resizing, but this is not in the official tools yet.

I'm not sure I like this idea of file system specific programs
doing LVM stuff.  What you describe here is better:

> Yesterday, a tool
> called lvmadm was announced which does this in a more generic way,
> similar to fsck, by calling a fs-specific resizer depending on the fs
> type.

It would be trivial (i.e. a bit of beaurocracy) to write a front end
to libparted, to do this (or even, a shell script wrapper of parted)

One thing: there is non-trivial interaction between the file system
and partition table handling (not with LVM), when resizing the start
of a partition.  Some resizers (including ext2resize, and reiserfs's
resizer) can't resize the start, and use the partition as the
address space.  When resizing the start, this doesn't make sense.

So, while it's rather cute to do:

	# ext2resize /dev/hda3 [new-size]

It generalizes to:

	# ext2resize /dev/hda3 [new-start] [new-end]

Doing this only makes sense if ext2resize (or whatever) updates the
partition table (as Parted does).

So, having /sbin/resize.* isn't as elegant as it looks.  Were
you suggesting have resize.* deal with partition table stuff?

> I think Heinz's stated direction is that LVM will stay layered on top
> of MD/RAID rather than incorporating this functionality itself.

OK.

> > However, it doesn't look like partition tables will disappear anytime
> > soon. Rather, it looks like LVM will have to cooperate with partition
> > tables.  And, perhaps Microsoft's new system as well (?).
> 
> Personally, I would rather get all knowledge of partition tables out of
> LVM and have the existing partition table support in the kernel handle
> everything.  Having a library to do all the partition-table parsing and
> writing would be a boon not only to parted, but also if it was added to
> fdisk, cfdisk, grub, et-al.

Yep.  OTOH, Parted already has lots of partition table parsing stuff
already.  It could be separated into a different library.

libparted's partition table API (version 1.3.x) is much cleaner than
anything else I've seen.  It supports msdos, mac and pc98 so far.

> You should read the LVM mailing list archive for June.  IBM has already
> proposed such a system, called LVMS, which would be the glue layer between
> LVM, partitions, filesystems, RAID, etc.  From the sounds of it, they will
> try and leverage as much of the existing code from the kernel as possible.

Looks like I have lots of reading to do!

Thanks,
Andrew Clausen
