Message-ID: <001701bec2dd$7a210d60$0102010a@adminstation.sgymsdam.nl>
From: "Admin" <sgymsdam@kabelfoon.nl>
Subject: [linux-lvm] Re: ext2resize
Date: Wed, 30 Jun 1999 11:46:48 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@enel.ucalgary.ca>
Cc: linux-lvm@msede.com, linux-fsdevel@vger.rutgers.edu

>Lennert Buytenhek writes:
>> Correct. ext2 is divided into block groups, which are 8mb
>> big when using 1k blocks. A block group looks like this:
>>
>> 1 block        superblock
>> ? blocks      group descriptor table
>> 1 block        block bitmap
>> 1 block        inode bitmap
>> ? blocks      inode table
>> ? blocks      data blocks (the bulk of the group)
>
>I was emailing with Mike Field about this, and according to the
>definition of ext2_super_block in ext2_fs.h, it should be possible to
>set the location of the block bitmap, inode bitmap, and inode table
>anywhere in the group, and have the datablocks follow.  If you set the
>pointers to these structures to start, say, 33 blocks into the group,
>this would allow you to grow the GDT to handle an 8GB filesystem before
>a reorg (block moving) is necessary.

I mailed with Mike about this too. He said: "First guess is that is that it
would require one more field in the superblock - how many blocks are
reserved for group descriptors....". I replied with: "In the group
descriptor
table there are pointers to the start of the block/inode bitmap and inode
table for each group. So you don't have to put any info in the superblock.
You can just leave free blocks between the gd table and the block bitmap.
I guess. But ext2 works in mysterious ways.... :-)"

He said: "Still, reserving extra blocks would only be a hack..."

I replied: "Depending on who you talk to of course. :-) The max. number
of groups for ext2 is 1024 I believe. One extra gd block per block gives
you room for 32*8=256mb expansion (assuming 1kb blocks). This
will cost you at most 1 meg of reserved gd blocks. Seems like a fair
price. The max. number of gd blocks is 32. So doing this when making
an fs will cost you at most 32*1024 blocks, which is 32mb with 1k
blocks. On modern drives, you'll probably not even notice a 32mb
loss. Unless you have a lot of partitions, of course...."

Then I said: "You could always throw the fs down, free the soon-to-
be-needed gs blocks, do some moves, and mount it again, all very
quickly. Then you could do the add-another-group thingy. You don't
need to do the whole operation while unmounted. (Hey, resizing
mounted fs'es is tricky anyway, so why not be extra tricky.... :-)"

>[time passes]
>I looked into the code in e2fsprogs/lib/ext2fs (openfs.c, initialize.c)
>and the kernel (fs/ext2/balloc.c).  It looks like, while an ext2 reader
>will only (currently) calculate desc_blocks based on the number of group
>descriptors and the block size, it will gladly use the values supplied
>in the superblock for the location of the block bitmap, inode bitmap,
>inode table, and the number of data blocks - leaving a "gap" after the
>GDT for future growth (NB - need to check e2fsck for what it does).  If

e2fsck prolly does the same. Make a small (~64mb) filesystem and mkfs
it with the sparse superblocks flag on. Then run dumpe2fs on it. This
will bring enlightenment w.r.t. metadata pointers.

>you "fix" initialize.c to have a larger number of desc_blocks than the
>minimum needed, existing kernels and e2fsck should work OK with this,
>which is a big plus.  Your ext2_resize could also do this without
>actually "growing" the filesystem - just get it ready to do so if
>needed.

I suggested Mike putting the 'reserving extra blocks' feature in
mke2fs.

>   mke2fs which says "start writing X groups into the FS".  The
>   only real issue is the last group, which appears to be able to
>   NOT have a superblock or GDT, which is a BIG problem...
Huh? I thought a group must _always_ have an sb, gd table,
block bitmap, inode bitmap and inode table. Or am I wrong here?

>> This is what ext2resize basically does (when enlarging).
>> But you'll need a way to get this through to the kernel (it
>> has it's own superblock copy). I haven't really looked at
>> the volume patch very well.
>
>As I suggested to Mike, it may be desirable to have two different
>implementations - an online resize which will not do much (if any) block
>moving, and can only resize up to the next 256MB boundary (or
>pre-allocated GDT size), and an offline resize which will do things like
>renumber inode and data blocks, remove inodes, add GDT blocks, etc.

So: add a flag that will cancel the resize if the gd table growth needs
to move blocks/metadata?

>Mike had also suggested that when we are doing a major FS (offline)
>reorg, we could start removing blocks from the inode table instead of
>data blocks as there are usually free inodes in each group, but not
>always data blocks...
I think it's not worth the complexity. First of all all your inodes will be
renumbered. You'll need a full directory scan-and-replace for inodes
which is very crash-sensitive. On the other hand, relocating a block
is atomic.

>> You can remount an fs RO, ext2resize it, and remount it RW methinks.
>
>This would likely break many programs, as they would fail for the time
>it is in RO mode.  A more pleasant solution is to only allow growth to a
>pre-determined limit online (with a kernel lock), and then force the
>user to unmount the FS to do block shuffling.

Yes, well, the remounting it RO and then remounting it RW will probably
not work, since (as Rolf has already mentioned) the kernel will not
reread metadata upon a remount.

>> About shrinking an existing fs: this would be even
>> messier. (Involves moving inodes around, and those
>> inodes might be in core. Et cetera. Hell on earth :-)
>> But growing an fs might be messy too, because of
>> the growing group descriptor table.
>
>I don't think shrinking a FS online is as big a need as growing it, and
>this can be left for a utility that works when the FS is unmounted.

Yep.

>Cheers, Andreas


Lennert Buytenhek
<buytenh@dsv.nl>
