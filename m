Message-ID: <010c01bec6c2$1bee26e0$0102010a@adminstation.sgymsdam.nl>
From: "Lennert Buytenhek" <buytenh@dsv.nl>
Subject: [linux-lvm] Re: ext2resize
Date: Mon, 5 Jul 1999 10:40:59 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

>Lennert Buytenhek writes:
>> I mailed with Mike about this too. He said:  "First guess is that is that
it
>> would require one more field in the superblock - how many blocks are
>> reserved for group descriptors....". I replied with: "In the group
>> descriptor table there are pointers to the start of the block/inode
bitmap
>> and inode table for each group. So you don't have to put any info in the
>> superblock. You can just leave free blocks between the gd table and the
>> block bitmap. I guess. But ext2 works in mysterious ways.... :-)"
>>
>> He said: "Still, reserving extra blocks would only be a hack..."
>I agree that reserving GDT blocks would be a small hack for v0 of ext2, but
>we could add a "COMPATIBLE" extension to v1 of ext2 that gave the number of
>GDT blocks reserved.  Also, since the v1 sparse superblock filesystems
>leave a gap between the structures, there should not be a real problem.
>We just have to make sure that we agree (for example) that all the blocks
>from the start of the group to the block bitmap are reserved for the GDT.
>This is not a big strech, since this is already how v0 ext2 filesystems
are.
>
>If we really don't want to do this (I haven't seen any reason not to,
however),
>then we could always allocate the initial datablocks in each group to a
>reserved inode (7 is unused in my ext2_fs.h) so they aren't available to
any
>files.  Then we don't need to worry about moving user data around when we
>want to resize.

When I said "reserving" I meant: leave empty data blocks between the
end of the gd table and the block bitmap (just like the sparse sb flag)
leaves holes. It's easy to move a data block out of the way. But not
when mounted of course. For me it was move a data block (which
is easily made atomic) vs. move the entire bitmap/table structure
a few blocks ahead.

When you say reserving you mean: keep this block free. Okay, that's
more logical than my 'reserving' :-)

>> One extra gd block per block gives
>> you room for 32*8=256mb expansion (assuming 1kb blocks). This
>> will cost you at most 1 meg of reserved gd blocks. Seems like a fair
>> price. The max. number of gd blocks is 32. So doing this when making
>> an fs will cost you at most 32*1024 blocks, which is 32mb with 1k
>> blocks. On modern drives, you'll probably not even notice a 32mb
>> loss. Unless you have a lot of partitions, of course...."
>
>The good news is that the "reserved" GDT blocks are a constant percentage
>of the filesystem size, as you are not allocating GDT blocks in the groups
>that don't exist yet.
Ok, ok.

>> I suggested Mike putting the 'reserving extra blocks' feature in
>> mke2fs.
>I've worked on a change to mke2fs to give it a new parameter (-e) which
>will set the "expansion limit" in a new FS.  It needs a change to libext2fs
>in initialize.c to do a "set_field(desc_blocks,...)" to take the set value
or
>fill it in with the default value.  One issue I had was whether the -e
>parameter should be in blocks/GDT (easier to code) or total FS blocks
(easier
>for a user to understand)?

I think the latter (easier for the user). It's not that much math, or
is it?

>> Huh? I thought a group must _always_ have an sb, gd table,
>> block bitmap, inode bitmap and inode table. Or am I wrong here?
>
>If you look at alloc_tables.c in libext2fs, there are several parts like
>
>    start_blk = group_blk + 3 + fs->desc_blocks;
>    if (start_blk > last_blk)
>        start_blk = group_blk;
>
>I take this to mean that if there isn't enough room for the superblock,
GDT,
>inode bitmap, and block bitmap, then don't put one in the last group.  The
>last group will start directly with the inode table.  However, this is
easily
>"fixed" so that the last group will require a complete set of these tables,
>or it won't be allocated and the FS size will be reduced.
I tried to make a 8194-block filesystem with mke2fs once, and it told
me it was going to make the fs 8193 blocks. Can you give me a recipe
for making an fs which has a last group w/o sb/gdt?

>> So: add a flag that will cancel the resize if the gd table growth needs
>> to move blocks/metadata?
>
>I don't think it should be a flag.  If the FS is mounted and we need to
>move blocks, then cancel the operation automatically.  It shouldn't be
>a problem to move blocks if the filesystem is unmounted.
ext2resize doesn't even check whether the fs is mounted right
now. Lots of people try resizing their mounted fs'es. I'll implement
a -f (force) option.

Lennert Buytenhek
<buytenh@dsv.nl>
