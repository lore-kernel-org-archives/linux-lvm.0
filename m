From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199907021658.KAA22753@webber.adilger.net>
Subject: Re: [linux-lvm] Re: ext2resize
Date: Fri, 2 Jul 1999 10:58:27 -0600 (MDT)
In-Reply-To: <001701bec2dd$7a210d60$0102010a@adminstation.sgymsdam.nl> from "Admin" at Jun 30, 99 11:46:48 am
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>
Cc: Linux FS development list <linux-fsdevel@vger.rutgers.edu>

Lennert Buytenhek writes:
> I mailed with Mike about this too. He said: "First guess is that is that it
> would require one more field in the superblock - how many blocks are
> reserved for group descriptors....". I replied with: "In the group
> descriptor table there are pointers to the start of the block/inode bitmap
> and inode table for each group. So you don't have to put any info in the
> superblock. You can just leave free blocks between the gd table and the
> block bitmap. I guess. But ext2 works in mysterious ways.... :-)"
> 
> He said: "Still, reserving extra blocks would only be a hack..."

I agree that reserving GDT blocks would be a small hack for v0 of ext2, but
we could add a "COMPATIBLE" extension to v1 of ext2 that gave the number of
GDT blocks reserved.  Also, since the v1 sparse superblock filesystems
leave a gap between the structures, there should not be a real problem.
We just have to make sure that we agree (for example) that all the blocks
from the start of the group to the block bitmap are reserved for the GDT.
This is not a big strech, since this is already how v0 ext2 filesystems are.

If we really don't want to do this (I haven't seen any reason not to, however),
then we could always allocate the initial datablocks in each group to a
reserved inode (7 is unused in my ext2_fs.h) so they aren't available to any
files.  Then we don't need to worry about moving user data around when we
want to resize.

> One extra gd block per block gives
> you room for 32*8=256mb expansion (assuming 1kb blocks). This
> will cost you at most 1 meg of reserved gd blocks. Seems like a fair
> price. The max. number of gd blocks is 32. So doing this when making
> an fs will cost you at most 32*1024 blocks, which is 32mb with 1k
> blocks. On modern drives, you'll probably not even notice a 32mb
> loss. Unless you have a lot of partitions, of course...."

The good news is that the "reserved" GDT blocks are a constant percentage
of the filesystem size, as you are not allocating GDT blocks in the groups
that don't exist yet.

> I suggested Mike putting the 'reserving extra blocks' feature in
> mke2fs.

I've worked on a change to mke2fs to give it a new parameter (-e) which
will set the "expansion limit" in a new FS.  It needs a change to libext2fs
in initialize.c to do a "set_field(desc_blocks,...)" to take the set value or
fill it in with the default value.  One issue I had was whether the -e
parameter should be in blocks/GDT (easier to code) or total FS blocks (easier
for a user to understand)?

> Huh? I thought a group must _always_ have an sb, gd table,
> block bitmap, inode bitmap and inode table. Or am I wrong here?

If you look at alloc_tables.c in libext2fs, there are several parts like

        start_blk = group_blk + 3 + fs->desc_blocks;
        if (start_blk > last_blk)
                start_blk = group_blk;

I take this to mean that if there isn't enough room for the superblock, GDT,
inode bitmap, and block bitmap, then don't put one in the last group.  The
last group will start directly with the inode table.  However, this is easily
"fixed" so that the last group will require a complete set of these tables,
or it won't be allocated and the FS size will be reduced.

The savings in doing this the old way was very small anyways - for a 256MB or
smaller FS, it was the difference between maybe 3 datablocks at the most,
increasing by 1 datablock for each 256MB.

start_blk = group_blk + 3 + 1 > last_blk

We need one of the remaining 4 blocks for the inode_table, and only 3 blocks
left.  This is hardly worth the savings compared to the difficulty in moving
all of the blocks around when we want to expand a filesystem.

> So: add a flag that will cancel the resize if the gd table growth needs
> to move blocks/metadata?

I don't think it should be a flag.  If the FS is mounted and we need to
move blocks, then cancel the operation automatically.  It shouldn't be
a problem to move blocks if the filesystem is unmounted.

Cheers, Andreas
-- 
Andreas Dilger  University of Calgary \ "If a man ate a pound of pasta and
                Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \  cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/      hungry?" -- Dogbert
