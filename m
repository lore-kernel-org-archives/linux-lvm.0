From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199906300734.BAA18362@webber.adilger.net>
Subject: [linux-lvm] Re: ext2resize
Date: Wed, 30 Jun 1999 01:34:34 -0600 (MDT)
In-Reply-To: <009c01bebee1$aa81b9a0$0102010a@adminstation.sgymsdam.nl> from "Admin" at Jun 25, 99 10:06:42 am
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: buytenh@dsv.nl
Cc: Linux LVM mailing list <linux-lvm@msede.com>, Linux FS development list <linux-fsdevel@vger.rutgers.edu>

Lennert Buytenhek writes:
> Correct. ext2 is divided into block groups, which are 8mb
> big when using 1k blocks. A block group looks like this:
> 
> 1 block        superblock
> ? blocks      group descriptor table
> 1 block        block bitmap
> 1 block        inode bitmap
> ? blocks      inode table
> ? blocks      data blocks (the bulk of the group)

I was emailing with Mike Field about this, and according to the
definition of ext2_super_block in ext2_fs.h, it should be possible to
set the location of the block bitmap, inode bitmap, and inode table
anywhere in the group, and have the datablocks follow.  If you set the
pointers to these structures to start, say, 33 blocks into the group,
this would allow you to grow the GDT to handle an 8GB filesystem before
a reorg (block moving) is necessary.

[time passes]
I looked into the code in e2fsprogs/lib/ext2fs (openfs.c, initialize.c)
and the kernel (fs/ext2/balloc.c).  It looks like, while an ext2 reader
will only (currently) calculate desc_blocks based on the number of group
descriptors and the block size, it will gladly use the values supplied
in the superblock for the location of the block bitmap, inode bitmap,
inode table, and the number of data blocks - leaving a "gap" after the
GDT for future growth (NB - need to check e2fsck for what it does).  If
you "fix" initialize.c to have a larger number of desc_blocks than the
minimum needed, existing kernels and e2fsck should work OK with this,
which is a big plus.  Your ext2_resize could also do this without
actually "growing" the filesystem - just get it ready to do so if
needed.

When it comes time to grow the filesystem, all you need to
do is:

0) expand LV/partition/md/loopback file/etc to be larger.
1) userland - write into new groups the new FS data (superblock,
   GDT, inode bitmaps, inode blocks, etc).  This is what
   mke2fs + ext2extend from ext2-volume does to a new disk. It
   should be relatively straight forward, maybe a new flag to
   mke2fs which says "start writing X groups into the FS".  The
   only real issue is the last group, which appears to be able to
   NOT have a superblock or GDT, which is a BIG problem...
2) userland - write into the "spare" GDT for each existing group
   any needed values.  Since this is likely constant, it could
   even be done long in advance (eg FS creation, or
   ext2_offline_resize).  There should be no worry about this
   space being overwritten by the kernel, since it will never
   read or write these blocks.
3) userland - write into all "extra" superblocks the new FS
   configuration, updating blocks_count, free_blocks, r_blocks_count,
   inodes_count, free_inodes_count, groups_count.  Again, hopefully
   no worries about overwriting this on a running system because the
   kernel shouldn't touch these on an open filesystem.
4) lock FS in kernel
5) kernel - update kernel superblock data with new FS config as in (3).
   May need to "realloc" the GDT tables in memory, as the kernel
   will only have allocated enough based on old GDT size (or so it looks
   in my 2.0.36 balloc.c).
6) kernel - write primary superblock to disk.  This is the "real"
   copy, and the other superblocks are only estimates that will be
   overwritten when the FS is unmounted, I believe.  If system
   crashes without FS unmount, then primary superblock should be
   used on remount anyways, and e2fsck will fix others?
7) unlock FS in kernel
8) userland - proceed to use new space in FS ;-)

> This is what ext2resize basically does (when enlarging).
> But you'll need a way to get this through to the kernel (it
> has it's own superblock copy). I haven't really looked at
> the volume patch very well.

As I suggested to Mike, it may be desirable to have two different
implementations - an online resize which will not do much (if any) block
moving, and can only resize up to the next 256MB boundary (or
pre-allocated GDT size), and an offline resize which will do things like
renumber inode and data blocks, remove inodes, add GDT blocks, etc.

Mike had also suggested that when we are doing a major FS (offline)
reorg, we could start removing blocks from the inode table instead of
data blocks as there are usually free inodes in each group, but not
always data blocks...

> You can remount an fs RO, ext2resize it, and remount it RW methinks.

This would likely break many programs, as they would fail for the time
it is in RO mode.  A more pleasant solution is to only allow growth to a
pre-determined limit online (with a kernel lock), and then force the
user to unmount the FS to do block shuffling.

> About shrinking an existing fs: this would be even
> messier. (Involves moving inodes around, and those
> inodes might be in core. Et cetera. Hell on earth :-)
> But growing an fs might be messy too, because of
> the growing group descriptor table.

I don't think shrinking a FS online is as big a need as growing it, and
this can be left for a utility that works when the FS is unmounted.

Cheers, Andreas
-- 
Andreas Dilger  University of Calgary \ "If a man ate a pound of pasta and
                Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \  cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/      hungry?" -- Dogbert
