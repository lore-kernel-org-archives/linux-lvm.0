From: Andreas Dilger <adilger@home.com>
Message-Id: <200004070517.e375HH015945@webber.adilger.net>
Subject: Re: [linux-lvm] converting a filesystem to a logical volume
In-Reply-To: <20000407012804.B2301@home.ds9a.nl> "from bert hubert at Apr 7,
 2000 01:28:04 am"
Date: Thu, 6 Apr 2000 23:17:17 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bert hubert <ahu@ds9a.nl>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Bert Hubert writes:
> I was wondering.. I think it should be fairly easy to convert a filesystem
> into a logical volume - 'in place'.
> 
> Do people think that this is possible? If shifting a filesystem a bit is
> enough, I'll start writing it.

Lennert Buytenhek and I were discussing this a bit, and it shouldn't be
_too_ hard to do with the existing ext2resize code (although ext2resize
isn't currently designed to move the start of a filesystem, only the end).
This would be useful not only for LVM, but also for partition modification,
which the parted folks are working on.  It may be that they even have
some of this working already, but I haven't looked at their code yet.

What needs to be done is:

0) figure out the number of disk blocks, N, needed at the start of a
   partition for the LVM data structures (N should be an even multiple
   of 8 filesystem blocks to make this easy, as the block bitmaps are
   packed into bytes and it would be extra work to re-map the block
   bitmaps, although not impossible).

   if N < 3+num_inode_blocks+num_group_desc_blocks
      this would be a lot of work, maybe you should backup/restore instead?
      exit 1

1) shrink existing filesystem by N blocks (easily done with existing code)

2) mark data blocks, n, where n < N, for relocation
   for each group in the ext2 filesystem
      for each metadata block, m..num_metadata_blocks, in group
         mark data block (m+N) for relocation
   relocate all marked blocks (easily done with existing code)

Now for the new part for moving the start of the filesystem:

3) for each group, g, in the ext2 filesystem
      if group has superblock
         copy superblock, s, to s+N
	 for each group descriptor in desc block d..d+num_group_desc_blocks
	    copy descriptor to block d+s and subtract N from
	       inode/block bitmap and inode table pointers
      copy inode bitmap, i, to i+N
      copy block bitmap g bytes [N/8,end) to new bitmap g [0,end-N/8)
      copy block bitmap g+1 bytes* [0,N/8) to new bitmap g [end-N/8,end)
         mark old metadata blocks from group g+1 as free in block bitmap g
      mark new metadata blocks from group g as used in block bitmap g

* when g+1 is past the last group, copy zeros to the block bitmap, since you
  freed N blocks@the end of the filesystem in step (1).

      for each inode in inode block i..i+num_inode_blocks
         copy inode to block (i+N), subtract N from data block numbers
	 for each (single/double/triple) indirect block in old inode
	    allocate new free** block as indirect block, store in new inode
	    copy old indirect block to new indirect block and
	       subtract N from each data block number
	    mark old indirect block free in new block bitmap g

** make sure the new indirect block is not one of the old metadata blocks

Basically, you have created a full new set of filesystem metadata while
leaving the old metadata untouched.  You probably need less than 5% free
space in the filesystem (enough for a copy of the metadata, which is fixed
for a given filesystem, plus any indirect blocks, which depend on the size
of the files in the filesystem, but usually there are not a huge number).

By making new copies of the indirect blocks, there is never a time when
the old filesystem is not valid - this is a very good thing so you don't
have problems if the program crashed, the machine crashed, you change your
mind, etc.  You could always use the old filesystem until the time you
overwrite the start of the old filesystem with LVM metadata.

If you are really interested in working on this, the ext2resize code is
available via FTP or anonymous CVS from ext2resize.sourceforge.net.  Please
feel free to ask me any questions, etc.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
