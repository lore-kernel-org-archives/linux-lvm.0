Message-ID: <39B5DF5E.BBF2A80B@gnu.org>
Date: Wed, 06 Sep 2000 17:08:30 +1100
From: Andrew Clausen <clausen@gnu.org>
MIME-Version: 1.0
Subject: [linux-lvm] LVM, partitions, RAID, and the Grand Scheme of Things TM
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: parted@gnu.org, linux-lvm@msede.com

Greetings, LVM people :-)

I am the GNU Parted maintainer (www.gnu.org/software/parted), and I
work for Conectiva (www.conectiva.com).

First, we think it would be useful for the LVM tools to be able to
resize logical volumes, along with the file systems on it.  Perhaps
a --filesystem parameter to lvreduce, lvextend and lvcreate?  This
functionality should be fairly easy to add with the existing
libparted.  Although, we'd need to abstract out device I/O a bit
more... but this is trivial.

BTW: we are aware of Ted Tso's resizer.
(1) we like our's better :-P
(2) libparted can resize other file systems.  We can do ext2,
fat[16|32], linux-swap at the moment, and we're planning to do
others.  libparted provides an abstract interface, so you get new
features supported without any work :-)

More importantly:

We are interested in the future of partitions, LVM, RAID and Microsoft's
new system, which seems similar to LVM - although we haven't seen it
yet.  Also, AIX's and HPUX's LVM have some features that Linux LVM
doesn't have - you're working in that direction?

It seems, on the face of it, that LVM offers a strict superset of
functionality of partition tables and RAID (well, RAID-linear/0, anyway
- RAID-1/4/5 coming soon?).

However, it doesn't look like partition tables will disappear anytime
soon. Rather, it looks like LVM will have to cooperate with partition
tables.  And, perhaps Microsoft's new system as well (?).

Since LVM, partition tables, RAID, and M$'s thing are similar, we think
it might make sense to make a single tool (in addition to the LVM tools)
that can manipulate them all.  And in fact, a library (that wraps
libparted, liblvm, etc) to provide this abstracted functionality to
other programs.

Arguments for such a move:
* a lot of the complexity, WRT interaction between filesystems and
partition tables/LVM/* is similar.  Eg: making a partition/LV usually
happens at the same time as creating a file system on that partition.
Likewise for resizing.  This occurs right from the low-level (IO -
"which part of which disk do I read/write?") to the high-level (how
big can/should I make this partition?)

* may make life easier for boot-loader installers.  There has been a bit
of discussion between as and GRUB people about making a libbootload.
This is still a distant plan.  Basic idea: allow communication between
partition programs (or whatever) and boot loaders about information
like, where to find kernels, etc.

* users will love it :-)

* it's "philosophically" Right.

* may simplify automatic partitioning, since everything is in one place.

It may turn out that squeezing everything into a single interface will
complicate things too much, but we don't think this will happen.


Anyway, onto the NEXT part:  HOW.

First, I think it's desirable that we be independent of Linux, and
assume that there is no support for anything much in the kernel.  Is
this OK?  We can break this assumption, but we'd rather not...

Anyway, we are thinking about some rough correspondence like this:
* volume groups - equivalent to partition tables
* logical volumes - equivalent to partitions, RAID sets and raw devices.
* physical volumes - equivalent to a logical volume on the parent's
volume group.

Note: this "parent's volume group" thing.  Basically, partition tables
are nested.  So, LVM is like a partition table, nested inside, perhaps,
many MSDOS partition tables.

So, we'd provide some sort of API for manipulating these objects.

Comments...?

Thanks,
Andrew Clausen
