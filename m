From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199907041856.MAA26525@webber.adilger.net>
Subject: [linux-lvm] Re: ext2resize
Date: Sun, 4 Jul 1999 12:56:22 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>, Linux FS development list <linux-fsdevel@vger.rutgers.edu>

Lennert Buytenhek writes:
> I replied: "Depending on who you talk to of course. :-) The max. number
> of groups for ext2 is 1024 I believe. One extra gd block per block gives
> you room for 32*8=256mb expansion (assuming 1kb blocks). This
> will cost you at most 1 meg of reserved gd blocks. Seems like a fair
> price. The max. number of gd blocks is 32. So doing this when making
> an fs will cost you at most 32*1024 blocks, which is 32mb with 1k
> blocks. On modern drives, you'll probably not even notice a 32mb
> loss. Unless you have a lot of partitions, of course...."

Are you sure that the max number of GDT blocks is 32?  For a 1kB block
size, this would give a limit of 32 GDT blocks * 32 GD/GDT block * 8k
blocks/GD = 8GB max FS size.  With 4kB blocks we grow 4x for larger data
blocks, 4x for more GD/GDT block, and 4x for more blocks/GD, so 512 GB
max, not the expected 4TB limit.  If we wanted to reach 4TB with 1kB
blocks (possible since block numbers are 32-bit unsigned), then we would
need 512*32 GDT blocks, or 200% !!!  of all FS space, while with 4kB
blocks we need 256 GDT blocks, or 1/32 of FS space.

> I suggested Mike putting the 'reserving extra blocks' feature in
> mke2fs.

I started on this, and initially I thought I would have the parameter (-e)
take the maximum FS size in blocks, however this makes mke2fs much more
complicated as it replicates code in libext2fs which sets default values
for block size, blocks per group, etc.  It is much easier just supplying
a GDT block count and passing this to libext2fs.

> >Mike had also suggested that when we are doing a major FS (offline)
> >reorg, we could start removing blocks from the inode table instead of
> >data blocks as there are usually free inodes in each group, but not
> >always data blocks...
> I think it's not worth the complexity. First of all all your inodes will be
> renumbered. You'll need a full directory scan-and-replace for inodes
> which is very crash-sensitive. On the other hand, relocating a block
> is atomic.

There are two other possibilities:
1) "#define EXT2_EXPAND_INO 7" and put it in include/linux/ext2_fs.h and allocate
   the first few data blocks in each group to this inode to reserve them.
2) Have the "reserved" blocks blocks be the first few data blocks in each group,
   rather than all in a single group.  This way the blocks can be used by root when
   the FS is very full, or they can be used for expanding the filesystem.  The one
   problem is that you may not have your extra blocks when you need them (ie when the
   FS is full) if it is root that is filling the FS.  The plus is that you don't keep
   more spare blocks that normally nobody uses in the FS.

Cheers, Andreas
-- 
Andreas Dilger  University of Calgary \ "If a man ate a pound of pasta and
                Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \  cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/      hungry?" -- Dogbert
